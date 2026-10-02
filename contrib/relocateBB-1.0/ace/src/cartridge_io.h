#ifndef CARTRIDGE_IO_H
#define CARTRIDGE_IO_H

#include <stdint.h>

#define SWCHA          0x280
#define SWCHB          0x282

volatile uint16_t** const ADDR_IDR = (volatile uint16_t**)0x2000001cUL;
volatile uint8_t** const DATA_IDR = (volatile uint8_t**)0x20000020UL;
volatile uint8_t** const DATA_ODR = (volatile uint8_t**)0x20000024UL;
volatile uint16_t** const DATA_MODER = (volatile uint16_t**)0x20000028UL;

#define ADDR_IN (**ADDR_IDR)
#define DATA_IN (**DATA_IDR)
#define DATA_OUT **DATA_ODR
#define SET_DATA_MODE_IN **DATA_MODER = 0x0000;
#define SET_DATA_MODE_OUT **DATA_MODER = 0x5555;
#define SET_DATA_MODE(m) **DATA_MODER = (m);

// Used to control exit function
extern uint16_t EXIT_SWCHB_ADDR;

#endif // CARTRIDGE_IO_H
