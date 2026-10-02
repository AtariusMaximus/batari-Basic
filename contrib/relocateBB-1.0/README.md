# RelocateBB

RelocateBB is a tool to be used with [Batari Basic](https://github.com/batari-Basic/batari-Basic) ROM files. It allows games that use the DPC+ kernel to be run on the PlusCart or the UnoCart. It will do nothing for bB games that that don't use the DPC+ kernel - those games will already run on the PlusCart and UnoCart.

## Usage

Run RelocateBB from the command line. The `-help` argument shows the usage and the available options

```
Usage: relocateBB_linux_amd64 (options) [list of rom files]
  -ace
    	add ACE header to converted binary (default true)
  -check
    	checks for valid PlusROM DPC+ and displays version information
```

The `-ace` option should almost always be left at the default value of true.

The `-check` option provides information about a file, indicating whether its a DPC+ file or a converted DPC+ file. In the case of a converted file the output will include version number information about hashes of the driver and custom code sections.

#### Unconverted DPC+ file

```
relocateBB -check Unholy_demo_2020_07_06.bin 
original DPC+ file
driver md5: 5f80b5a5adbe483addc3f6e6f1b472f8
```

#### Converted DPC+ file

```
relocateBB -check Unholy_demo_2020_07_06.ace 
driver md5: ef12c0d0d6b985c5147b9deba63d68b6
driver version: v1.07a
bb md5: 5d3f5788a71fb24a678cb6622702c3dd
```


## Developer Detail

### ACE driver

#### Compilation

The ACE driver is built with the GNU Arm Embedded Toolchain version of GCC. Full version banner of the compiler below.

```
arm-none-eabi-gcc (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

Reference the `build.sh` file in the `ace/` directory for which compile time options were used.

The build process requires access to the [United Carts of Atari](https://github.com/Al-Nafuur/United-Carts-of-Atari) SDK. Download or `git clone` the repository into the `ace/` directory.

#### ACE Driver Versions

The ACE driver is versioned and any substantial change to the driver code *must* be accompanied by a change in the version number. The version number is in the driver asm file located at `ace/src/ace.asm`

The relevant section of the ace.asm file is. Please follow the directives in the commentary.

```
; driver name should always begin with the string "DPCp " (including the space)
;
; it should also include a version string of the form "vX.YY" where X and YY are
; integers. for the 'alt' driver the suffix 'a' should be included
;
; nothing else should be included in the driver name apart from whitespace
;
; finally, the driver name should be exactly string 16 chars wide exactly 
;		     "                "
	IF ALT == 1
		dc.b "DPCp v1.07a     "
	ELSE
		dc.b "DPCp v1.07      "
	ENDIf
```

**NOTE**: The version string is `DPCp` and not `DPC+` in order to distinguish it from DPC+ binaries compiled for the Harmony type cartridges. Failure to distinguish the two types of binary would likely result in confusion. 

#### The 'ALT' driver

The 'ALT' driver is a small variation of the standard DPCp driver which is required when converting some DPC+ ROMs. Whether the 'ALT' type is required depends on the version of the Harmony driver being replaced.

| MD5 of Harmony Driver            | Replace |
|----------------------------------|---------|
| 17884ec14f9b1d06fe8d617a1fbdcf47 | NORMAL  |
| 5f80b5a5adbe483addc3f6e6f1b472f8 | ALT     |
| 8dd73b44fd11c488326ce507cbeb19d1 | ALT     |
| b328dbdf787400c0f0e2b88b425872a5 | NORMAL  |

Technical detail: The 'ALT' driver differs from the 'NORMAL' driver in that the counter bits of the fraction fetcher are reset when the 'low' byte of the fetcher is set. It's such a small difference and yet using the wrong driver can sometimes be noticed in the form of playfield shimmer. 

As indicated in the `ACE Driver Versions` section above, the 'ALT' driver is distinguished with an 'a' appended to the version number.

### bB Custom Code

#### Compilation

The bB custom code is built with the same version of the GNU Arm Embedded Toolchain. Use the `make` command
to build.

#### Changes from the Original

The driver code is mostly the same as found in the Batari Basic [include/custom](https://github.com/batari-Basic/batari-Basic/tree/d0b12c1b257156645df5371da48bcbbab7682580/includes/custom) directory. However, there are some significant changes.

The most significant change is to the address space the program operates with. The first group of addresses are found in the `custom.S` and `custom.boot.S` files. The table below summarises how address ranges are changed.

| Old Origin   | Old Memtop   | New Origin   | New Memtop   |
|--------------|--------------|--------------|--------------|
| `0x00000000` | `0x0fffffff` | `0x20000000` | `0x2000ffff` |
| `0x40000000` | `0x4fffffff` | `0x20010000` | `0x20017fff` |

Addresses are also found in the `main.c` file. These are changed in the same way.

There are also changes to the ordering of code in the `main.c` file. The logic is the same but some rearrangement of code was required in order to produce a small enough binary (2196 bytes or fewer). A good diff tool will show all the changes.

Finally, there are changes to the `Makefile`. The target architecture has been changed to `armv6-m` and the optimisation has been set to `-Oz`. This is a relatively new flag to GCC and requests more aggressive size optimisation that `-Os`. Indeed, the principle reason for the GCC v12.0 requirement is access to the `-Oz` flag.

The GCC debugging flags have also been ammended. The singular `-g` flag has been replaced with `-g3 -gdwarf-4` `-gstrict-dwarf`. The debugging information isn't included in the final custom binary but it is included in the interim elf file. Also for debugging purposes the Makefile now also produces a `objdump` file.
