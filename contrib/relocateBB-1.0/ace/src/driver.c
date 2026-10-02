#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>
#include <stdlib.h>

#include "cartridge_io.h"
#include "flash.h"
#include "cartridge_firmware.h"

#define DELAY_tADS      {__asm__ __volatile__("nop");} //Delay to work stably on *some* consoles.

/* 
  PlusCart/Unocart Unified ACE Driver for DPC+
  v1.06 2024-06-21 
  
  This source is compiled and included in bB games compiled for PlusCart/Unocart.
  Based off cartridge_emulation_dpcp.c Created on: 07.07.2020 Author: stubig, adaption to ACE by Marco Johannes and JetSetIlly
*/

int emulate_ACEROM_cartridge()
{
	// Setup the function pointers out of memory
	uint32_t* buffer32 = (uint32_t*)0x20000000; //Base for 32 bit passed parameters
	
	uint8_t* cart_rom = (uint8_t*)*buffer32; //Base for flash where ACE ROM is mounted (varies) 
	buffer32++;
//	uint8_t* CCMram = (uint8_t*)*buffer32; //Position of CCM used by PlusCart; not used in this instance.
	buffer32++;
	bool (*reboot_into_cartridge_ptr)() =(bool(*)())(uint32_t)*buffer32; //Pointer to library function for removing loading screen and enterring game.
	buffer32++;
	void (*ReturnToMenu)() = (void(*)())(uint32_t)*buffer32; //Pointer to library function for exiting game and returning to menu.
	buffer32++;
	uint32_t PassedSystemCoreClock = (uint32_t)*buffer32; //SystemCoreClock definition that is passed to game (for timer related calculations).
//	buffer32++;
//	uint32_t ACEVersion = (uint32_t)*buffer32; //Parameter not used.
//	buffer32++;
//	uint32_t PluscartVersion = (uint32_t)*buffer32; //Parameter not used.

// The following hardware pointers are for allowing game to work on UnoCart as well as PlusCart. The pointers live at below addresses. 
//	volatile uint16_t** ADDR_IDR = (volatile uint16_t**)0x2000001cUL;
//	volatile uint8_t** DATA_IDR = (volatile uint8_t**)0x20000020UL;
//	volatile uint8_t** DATA_ODR = (volatile uint8_t**)0x20000024UL;
//	volatile uint16_t** DATA_MODER = (volatile uint16_t**)0x20000028UL;

/*	//Set up Exit Function
	buffer32+=7;
	uint16_t EXIT_ADDR= (uint16_t)(*buffer32); //Obtain passed parameter - whether exit function is enabled or disabled
	EXIT_ADDR++; //Efficient way to turn into bool - wraps around to 0 if EXIT_ADDR=0xFFFF (disabled).
	bool exit_enabled=(bool) EXIT_ADDR; //Turn EXIT function enabled parameter into boolean flag
*/	
//END OF ACE PARAMETERS//


	
	uint8_t* buffer = (uint8_t*)0x20000000; //Set up pointer to 128kB RAM - Used for copying game image to RAM, first 32kB.
    uint8_t* dpcram = (uint8_t*)0x20010000; //Set up pointer for 8kB dpcram RAM.
	


	//DPC+ variables
	uint8_t prev_rom = 0;
	bool joy_status = 0;
    uint16_t addr, addr_prev ,addr_joy = 0;
    uint8_t data = 0, data_prev = 0, data_joy = 0; 
	uint8_t *myProgramImage = buffer + 3*1024, *bankPtr = buffer + 23*1024;
	uint8_t *myDisplayImage = dpcram + 0xc00, *myFrequencyImage = dpcram + 0x1c00;
	uint32_t myFractionalCounters[8] = {0,0,0,0,0,0,0,0};
	uint32_t myMusicCounters[3] = {0,0,0}, myMusicFrequencies[3] = {0,0,0};
	uint8_t  myTops[8] = {0,0,0,0,0,0,0,0}, myBottoms[8] = {0,0,0,0,0,0,0,0};
	uint8_t  myFractionalIncrements[8] = {0,0,0,0,0,0,0,0}, myParameter[8] = {0,0,0,0,0,0,0,0};
	uint16_t myMusicWaveforms[3] = {0,0,0}, myCounters[8] = {0,0,0,0,0,0,0,0};
	bool myFastFetch = false;
    uint8_t myParameterPointer = 0;
    unsigned char index, function;

	uint32_t thumb_code_entry_point = 0x20000c09;

    // Older DPC+ driver code had different behaviour wrt the mask used
    // to retrieve 'DFxFRACLOW' (fractional data pointer low byte)
    // ROMs built with an old DPC+ driver and using the newer mask can
    // result in 'jittering' in the playfield display
    // For current versions, this is 0x0F00FF; older versions need 0x0F0000

	// this equates to clearing the fractional counter when the low byte of the
	// fractional fetcher is set
#ifdef ALT
	uint32_t myFractionalLowMask = 0x0F0000;
#else
	uint32_t myFractionalLowMask = 0x0F00FF;
#endif

	// Initialise the DPC's random number generator register
	uint32_t myRandomNumber = 0x70435044; // "DPCp";
	uint32_t systick_lastval=0;

	DMA2_Stream0->CR=0; //Disable any DMA transfer in progress
	RCC->AHB1ENR |= RCC_AHB1ENR_DMA2EN; //Initialise DMA Transfer Clock

//Set up the TIM2 counter for 20,000 Hz DPC+ frequency.
	__HAL_RCC_TIM2_CLK_ENABLE(); //Start up Timer 2
	TIM2->PSC=(((PassedSystemCoreClock/2))/20000)-1; //Prescaler is based on the "20000" magic number used by DPC+. Value Should be 5399 with STM32 at 216 MHz.
	TIM2->EGR = TIM_EGR_UG; //Load prescaler
	TIM2->CR1=0; //Reset Timer Options - Count up, no divisions.
	TIM2->ARR=0xFFFFFFFF; //Reload value
	TIM2->CNT=TIM2->ARR; //Set Timer to wrap around
	TIM2->CR1 |= TIM_CR1_CEN; //Enable Timer

	memcpy(buffer+0x8000, buffer, 0x40); //Copy ACE parameters to safety.
	memcpy(buffer, cart_rom, 0x8000); //Copy game image into RAM.
	memcpy(buffer,buffer+0x8000, 0x40); //Copy the ACE parameters back into the right spot
	memset(dpcram, 0x00, 0x2000); //Clear the dpcram before running the ROM.
	memcpy(dpcram + 0xc00, buffer + 0x6c00, 0x1400); // Copy DPC+ Display and Frequency Data 5k data into dpcram.

	

   if (!((bool (*)())reboot_into_cartridge_ptr)()) return 1; //Remove menu and start game

    __disable_irq();	// Disable interrupts

	
	while (1)
	{ 
        while (((addr = ADDR_IN) != addr_prev)) 
        {
            DELAY_tADS; //Provide small delay before re-reading address
            addr_prev = addr;
        }
		
		// got a stable address
		if (addr & 0x1000)
		{ // A12 high

//			tmp_addr = addr; // save addr, because of possible fast fetch (removed for optimisation of data edge)

			if(myFastFetch && prev_rom == 0xA9 && addr > 0x107f){
				data = (uint16_t) bankPtr[addr&0xFFF];
			    if(data < 0x28)
			    	addr = data; // dont't need to add 0x1000, because: if addr < 0x28 it is also < 0x1028 :-)
			}
			prev_rom = 0;

			if ( addr < 0x1028)
			{	// DPC read
				data  = 0;
				index = addr & 0x07;
				function = (addr >> 3) & 0x07;

				switch (function)
				{
					case 0x00:
					{
						switch(index)
						{
							case 0x00:
							{	// RANDOM0NEXT - advance and return byte 0 of random
								myRandomNumber = (((myRandomNumber & (1<<10)) ? 0x10adab1e : 0x00)
											     ^ ((myRandomNumber >> 11) | (myRandomNumber << 21)));
								data = (uint8_t)myRandomNumber;
								break;
							}
							case 0x01:
							{	  // RANDOM0PRIOR - return to prior and return byte 0 of random
								myRandomNumber = ((myRandomNumber & (1U<<31)) ?
											((0x10adab1e^myRandomNumber) << 11) | ((0x10adab1e^myRandomNumber) >> 21) :
											(myRandomNumber << 11) | (myRandomNumber >> 21));
								data = (uint8_t)myRandomNumber;
								break;
							}
							case 0x02:
							{	// RANDOM1
								data = (uint8_t)((myRandomNumber>>8) & 0xFF);
								break;
							}
							case 0x03:
							{	// RANDOM2
								data = (uint8_t)((myRandomNumber>>16) & 0xFF);
								break;
							}
							case 0x04:
							{	// RANDOM3
								data = (uint8_t)((myRandomNumber>>24) & 0xFF);
								break;
							}

							case 0x05:
							{	// AMPLITUDE
								// Update the music data fetchers (counter & flag)
//								updateMusicModeDataFetchers();

								// using myDisplayImage[] instead of myProgramImage[] because waveforms
								// can be modified during runtime.
								data=0;
								for (int i=0;i<3;i++) {
								data += (uint8_t)
										( (uint32_t)myDisplayImage[(uint32_t)myMusicWaveforms[i] + (myMusicCounters[i] >> 27)]); 
								}
								break;
							}

							default:
								break;
						}
						break;
					}
					// DFxDATA - display data read
					case 0x01:
					{
						data = myDisplayImage[myCounters[index]];
						myCounters[index] = (myCounters[index] + 0x1) & 0x0fff;
						break;
					}

					// DFxDATAW - display data read AND'd w/flag ("windowed")
					case 0x02:
					{
						data = (uint8_t)(myDisplayImage[myCounters[index]] & ( (((myTops[index]-(myCounters[index] & 0x00ff)) & 0xFF) > ((myTops[index]-myBottoms[index]) & 0xFF)) ? 0xFF : 0));
						myCounters[index] = (myCounters[index] + 0x1) & 0x0fff;
						break;
					}

					// DFxFRACDATA - display data read w/fractional increment
					case 0x03:
					{
						data = myDisplayImage[ myFractionalCounters[index] >> 8];
						myFractionalCounters[index] = (myFractionalCounters[index] + myFractionalIncrements[index]) & 0x0fffff;
						break;
					}

					case 0x04:
					{
						if(index < 4)
							data = (((myTops[index]-(myCounters[index] & 0x00ff)) & 0xFF) > ((myTops[index]-myBottoms[index]) & 0xFF)) ? 0xFF : 0;
						break;
					}
					default:
                    {
						break;
                    }
			    }


				DATA_OUT = data;
				SET_DATA_MODE_OUT

				addr = ADDR_IN;
				// wait for address bus to change
				while (ADDR_IN == addr) ;
				SET_DATA_MODE_IN;
			}
			else if ( addr < 0x1080)
			{	// DPC write

				index = addr & 0x07;
				function = ((addr - 0x1028) >> 3) & 0x0f;

				switch (function)
				{
			      // DFxFRACLOW - fractional data pointer low byte
			      case 0x00:
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myFractionalCounters[index] = (uint32_t)((myFractionalCounters[index] & myFractionalLowMask) | (uint32_t) (data_prev << 8));
			        break;

			      // DFxFRACHI - fractional data pointer high byte
			      case 0x01:
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myFractionalCounters[index] = (((uint32_t)(data_prev & 0x0F)) << 16) | (myFractionalCounters[index] & 0x00ffff);
			        break;

			      //DFxFRACINC - Fractional Increment amount
			      case 0x02:
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myFractionalIncrements[index] = (uint8_t) data_prev;
			        myFractionalCounters[index] = myFractionalCounters[index] & 0x0FFF00;
			        break;

			      // DFxTOP - set top of window (for reads of DFxDATAW)
			      case 0x03:
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myTops[index] = (uint8_t)data_prev;
			        break;

			      // DFxBOT - set bottom of window (for reads of DFxDATAW)
			      case 0x04:
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myBottoms[index] = (uint8_t)data_prev;
			        break;

			      // DFxLOW - data pointer low byte (trap $1057   )
			      case 0x05:
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myCounters[index] = (uint16_t)((myCounters[index] & 0x0F00) | data_prev);
			        break;

			      // Control registers
			      case 0x06:
			        switch (index)
			        {
			          case 0x00:  // FASTFETCH - turns on LDA #<DFxDATA mode if value is 0
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			            myFastFetch = ( data_prev == 0);
			            break;

			          case 0x01:  // PARAMETER - set parameter used by CALLFUNCTION (not all functions use the parameter)
			            if(myParameterPointer < 8){
			            	while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			            	myParameter[myParameterPointer++] = (uint8_t)data_prev;
			            }
			            break;

			          case 0x02:  // CALLFUNCTION
			        	// callFunction(value);
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
						  uint32_t Source_Pointer_Mode=0; //Do not increment Source Pointer
						// Datafetcher copy stuff for CALLFUNCTION PARAMETER
						  uint8_t *source = NULL, *destination = NULL;
			        	  switch (data_prev)
			        	  {
			        	    case 0: // Parameter Pointer reset
			        	      myParameterPointer = 0;
			        	      break;
			        	    case 1: // Copy ROM to fetcher
							case 2: // Copy value to fetcher
					
								if (data_prev==1) {
									source = &myProgramImage[ ((((uint16_t)myParameter[1]) << 8) | myParameter[0]) ];  //Set ROM source as per parameters
									destination = &myDisplayImage[myCounters[myParameter[2] & 0x7]]; //Set RAM desintation as per parameters
									Source_Pointer_Mode=1<<9; //Increment Source Pointer
								} else {
									source = &myParameter[0]; //Set source to be static copy value.
									destination = &myDisplayImage[myCounters[myParameter[2]]]; //Set desintation as per parameters
//									Source_Pointer_Mode=0; //Do not increment Source Pointer
								}									

								if ((DMA2_Stream0->CR&DMA_SxCR_EN)==0) { //Only proceed if DMA Transfer is complete
									
									//Initialise DMA Transfer parameters	

									DMA2->LIFCR= 0x0000003D; //Clear all the interrupt status bits
									DMA2_Stream0->CR |= (0b10 << DMA_SxCR_DIR_Pos) // Memory-to-memory Mode
											| (0b00 << DMA_SxCR_PSIZE_Pos) // Source: 8-bit
											| (0b00 << DMA_SxCR_MSIZE_Pos) // Destination: 8-bit
											| Source_Pointer_Mode // Setup source pointer
											| DMA_SxCR_MINC; // Increment destination pointer
									DMA2_Stream0->PAR = (uint32_t) (source); //Set DMA source pointer
									DMA2_Stream0->M0AR = (uint32_t) (destination); //Set DMA destination pointer
									DMA2_Stream0->NDTR = (uint16_t) (myParameter[3]); //Set length of DMA transfer in bytes
									DMA2_Stream0->CR |= DMA_SxCR_EN; // Start DMA transfer

								}

							  myParameterPointer = 0;
			        	      break;
			        	      // Call user written ARM code (most likely be C compiled for ARM)
			        	    case 254: // call with IRQ driven audio, special handling needed at this
			        	              // __enable_irq();
			        	    		  // set_irq_timer(every scanline  70x 6507 CPU cycles);
			        	    		  // Not Implemented
			        	    case 255: // call without IRQ driven audio
			        	    	// wait for the next address (which is the address we send PC back later)
		//						if ((DMA2_Stream0->CR&DMA_SxCR_EN)==0) { //Only proceed if DMA Transfer is complete
									while ((addr = ADDR_IN) != addr_prev) addr_prev = addr;
									DATA_OUT = 0xEA;				// (NOP)
									SET_DATA_MODE_OUT;
	//								while ((DMA2_Stream0->CR&DMA_SxCR_EN)!=0);
									((int (*)())thumb_code_entry_point)(); //Only proceed if DMA Transfer is complete

									// now send the VCS Program Counter to last address
									addr = ADDR_IN;
									while (ADDR_IN == addr);

									DELAY_tADS;						//Provide short delay for some consoles to separate address reads.
									addr = ADDR_IN;
									DATA_OUT = 0x4C;				// (JMP)

									while (ADDR_IN == addr);								

									DELAY_tADS;						//Provide short delay for some consoles to separate address reads.
									addr = ADDR_IN;
									DATA_OUT = (uint8_t)(addr_prev & 0xff);	// (Low Byte of new addr)

									while (ADDR_IN == addr);

									DELAY_tADS;						//Provide short delay for some consoles to separate address reads.
									addr = ADDR_IN;
									DATA_OUT = (uint8_t)(addr_prev >> 8);	// (High Byte of new addr)

									
									addr_prev = addr;				// set addr_prev for next loop
									while (ADDR_IN == addr);
									SET_DATA_MODE_IN;
	//							}
				        	  break;
			        	    default:  // reserved
			        	      break;
			        	  }
			            // END OF CALLFUNCTION
			            break;

			          case 0x03:  // reserved
			          case 0x04:  // reserved
			            break;

			          case 0x05:  // WAVEFORM0
					  case 0x06:  // WAVEFORM1
					  case 0x07:  // WAVEFORM2
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
				        myMusicWaveforms[(index-5)] = (data_prev & 0x007f) << 5;
				        break;
			          default:
			            break;
			        }
			        break;

			      // DFxPUSH - Push value into data bank
			      case 0x07:
			        myCounters[index] = (myCounters[index] - 0x1) & 0x0fff;
			        while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myDisplayImage[myCounters[index]] = (uint8_t)data_prev;
			        break;

			      // DFxHI - data pointer high byte
			      case 0x08:
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myCounters[index] = (uint16_t)(((data_prev & 0x0F) << 8) | (myCounters[index] & 0x00ff));
			        break;

			      case 0x09:
			      {
			        switch (index)
			        {
			          case 0x00:  // RRESET - Random Number Generator Reset
			            myRandomNumber = 0x2B435044; // "DPC+"
			            break;
			          case 0x01:  // RWRITE0 - update byte 0 of random number
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			            myRandomNumber = (myRandomNumber & 0xFFFFFF00) | data_prev;
			            break;
			          case 0x02:  // RWRITE1 - update byte 1 of random number
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			            myRandomNumber = (myRandomNumber & 0xFFFF00FF) | (uint32_t)(data_prev<<8);
			            break;
			          case 0x03:  // RWRITE2 - update byte 2 of random number
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			            myRandomNumber = (myRandomNumber & 0xFF00FFFF) | (((uint32_t)data_prev)<<16);
			            break;
			          case 0x04:  // RWRITE3 - update byte 3 of random number
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			            myRandomNumber = (myRandomNumber & 0x00FFFFFF) | (((uint32_t)data_prev)<<24);
			            break;
			          case 0x05:  // NOTE0
			          case 0x06:  // NOTE1
			          case 0x07:  // NOTE2					  
			        	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
				        myMusicFrequencies[(index-5)] = (*((uint32_t*)&myFrequencyImage[data_prev<<2]));
				        break;
			          default:
			            break;
			        }
			        break;
			      }

			      // DFxWRITE - write into data bank
			      case 0x0a:
			      {
			    	  while (ADDR_IN == addr) { data_prev = data & 0xff; data = DATA_IN; }
			        myDisplayImage[myCounters[index]] = (uint8_t)data_prev;
			        myCounters[index] = (myCounters[index] + 0x1) & 0x0fff;
			        break;
			      }

			      default:
			        break;

				}
				//while (ADDR_IN == addr);
			} else {
			// check bank-switch
				if (addr >= 0x1FF6 && addr <= 0x1FFB)	// bank-switch
					bankPtr = &myProgramImage[(addr - 0x1FF6 ) * 4*1024 ];

				// normal rom access
				prev_rom = bankPtr[addr&0xFFF];
				DATA_OUT = prev_rom;
				SET_DATA_MODE_OUT;

				//Update Music
				uint32_t clocks = TIM2->CNT-systick_lastval; //Calculate how many times the timer has incrememented since last check
				systick_lastval=TIM2->CNT; // Log the curent value of the Timer 	
				for (int i=0; i<3; i++) {
					myMusicCounters[i] += (myMusicFrequencies[i])*clocks; //Multiply music frequency incremental value by how many clocks have passed and add to counter for first waveform.
				}	
				
				
				while (ADDR_IN == addr) { } 
				SET_DATA_MODE_IN;
			}
			 
		} /*else {
			addr_joy=addr; //Collect Address for Exit Detection
			data_joy=DATA_IN; //Collect Data for Exit Detection

				// Exit Function Detection				
				if(addr_joy == SWCHB){ 
					if( !(data_joy & 0x1) && (joy_status)) break; //True if RESET if pressed, Gamepad 0 has right pressed, AND exit function is enabled.
				} else if(addr_joy == SWCHA){
					joy_status = ((!(data_joy & 0x80)))&exit_enabled; //True if Gamepad 0 has right pressed, AND exit function is enabled.
				} 				

		}	*/		
	}

	DATA_OUT = 0xEA;                  // (NOP) or data for SWCHB
	SET_DATA_MODE_OUT;
	while (ADDR_IN == addr);

	addr = ADDR_IN;
	DATA_OUT = 0x00;                  // (BRK)
	while (ADDR_IN == addr);

	((void (*)())ReturnToMenu)();

	return 0;
}


