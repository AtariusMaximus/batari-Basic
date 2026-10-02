#!/bin/bash
SDK="United-Carts-of-Atari"
INC="$INC -I$SDK/source/STM32firmware/PlusCart/Inc"
INC="$INC -I$SDK/source/STM32firmware/PlusCart/Drivers/STM32F4xx_HAL_Driver/Inc"
INC="$INC -I$SDK/source/STM32firmware/PlusCart/Drivers/CMSIS/Device/ST/STM32F4xx/Include/"
INC="$INC -I$SDK/source/STM32firmware/PlusCart/Drivers/CMSIS/Include/"

WARNINGS="-Wall -Wswitch-default -Wswitch-enum -Wconversion"
FLGS="-mcpu=cortex-m4 -mthumb -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -DVERSION="2.3.17" -DUNOCART=1 -DPLUSCART=2 -DHARDWARE_TYPE=PLUSCART -DMENU_TYPE=PLUSCART -DUSE_WIFI=1 -DUSE_SD_CARD=0 -ffunction-sections -fdata-sections -fPIC -MMD -MP -mfpu=fpv4-sp-d16 -mfloat-abi=hard" 

DWARF="-g3 -gdwarf-4 -gstrict-dwarf"
OPT="-O3"

LNKFLGS="-mcpu=cortex-m4 -mthumb -static -specs=nano.specs -fpic -mfpu=fpv4-sp-d16 -mfloat-abi=hard -lc -lm -nostartfiles" 

compile() {
BINDIR=bin
ADDITIONALFLAGS=$1

	if [ ! -z $2 ]; then
		BINDIR=$BINDIR/$2
	fi

	if [ ! -d $BINDIR ]; then
		mkdir $BINDIR
	fi

	arm-none-eabi-gcc $FLGS $ADDITIONALFLAGS $INC $OPT $DWARF -c src/driver.c -o $BINDIR/driver.o

	# first compile contains DWARF data
	arm-none-eabi-gcc $LNKFLGS -Tsrc/driver.ld -Wl,-Map=$BINDIR/debugging.map $BINDIR/*.o -o $BINDIR/debugging.elf
	arm-none-eabi-objdump -S $BINDIR/debugging.elf > $BINDIR/debugging.obj

	# second compile without DWARF data (for some reason objcopy does not strip 
	# out our DWARF data)

	arm-none-eabi-gcc -s $LNKFLGS -Tsrc/driver.ld -Wl,-Map=$BINDIR/driver.map $BINDIR/*.o -o $BINDIR/driver.elf
	arm-none-eabi-objcopy -O binary $BINDIR/driver.elf $BINDIR/driver.bin

DASM_DEFINES="-DALT=0"
	if [ ! -z $2 ]; then
		DASM_DEFINES="-DALT=1"
	fi

	dasm src/ace.asm $DASM_DEFINES -I$BINDIR -d -l$BINDIR/driver.lst -s$BINDIR/driver.sym -f3 -v5 -o$BINDIR/driver.ace
	md5sum $BINDIR/driver.ace
}

compile
compile '-DALT' 'alt'
