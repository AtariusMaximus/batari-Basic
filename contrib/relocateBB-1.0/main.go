package main

import (
	"bytes"
	"crypto/md5"
	_ "embed"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
)

//go:embed "ace/bin/driver.ace"
var newDriver []byte

//go:embed "ace/bin/alt/driver.ace"
var newDriverAlt []byte

//go:embed "custom/bin/custom.bin"
var newCustom []byte

// original custom code block is assumed to have these exact properties.
// detection of other block properties (for custom or recompiled kernels will be
// added in the future)
const (
	customOrigin = 0x0c00
	customMemtop = 0x1494
	customLength = customMemtop - customOrigin
	customMD5    = "6314863c98ea59ffb99442ef80e19008"
)

// sanity checks before continuing with main program
func init() {
	if len(newDriver) != customOrigin {
		panic(fmt.Sprintf("driver header is incorrect length. Must be exactly %0x bytes", customOrigin))
	}

	if len(newDriverAlt) != customOrigin {
		panic(fmt.Sprintf("alt driver header is incorrect length. Must be exactly %0x bytes", customOrigin))
	}

	if len(newCustom) > customLength {
		panic(fmt.Sprintf("replacement custom program cannot be larger than %dbytes", customLength))
	}

	_, err := aceDriverVersion(newDriver)
	if err != nil {
		panic(fmt.Sprintf("refusing to work with replacement ACE driver: %v", err))
	}
}

const programName = "relocateBB"

func main() {
	// remove timestamp from log messages
	log.SetFlags(0)

	// command line arguments
	flgs := flag.NewFlagSet(programName, flag.ExitOnError)
	flgs.Usage = func() {
		fmt.Printf("Usage: %s (options) [list of rom files]\n", filepath.Base(os.Args[0]))
		flgs.PrintDefaults()
	}

	var check bool
	var ace bool
	flgs.BoolVar(&check, "check", false, "checks for valid DPC+ and displays version information")
	flgs.BoolVar(&ace, "ace", true, "add ACE header to converted binary")

	err := flgs.Parse(os.Args[1:])
	if err != nil {
		log.Print(err)
	}
	args := flgs.Args()
	if len(args) == 0 {
		log.Print("invalid arguments (use --help for usage)")
		return
	}

	// process all files listed on the command line
	for i, fn := range args {
		if check {
			// display simplified file name depending on the number of files in
			// the argument list
			if len(args) > 1 {
				fmt.Println(filepath.Base(fn))
			}
			err = doCheck(fn)
		} else {
			err = doRelocate(fn, ace)
		}

		if err != nil {
			log.Print(err)
		}

		if check && i < len(args)-1 {
			fmt.Println("")
		}
	}
}

func doCheck(fn string) error {
	original, err := os.ReadFile(fn)
	if err != nil {
		return err
	}

	// length check
	if len(original) != 32768 {
		return fmt.Errorf("not a DPC+ file")
	}

	// check for DPCp in the first customOrigin bytes
	dpcpCount := bytes.Count(original[:customOrigin], []byte("DPCp"))
	if dpcpCount < 2 {
		dpcpCount = bytes.Count(original[:customOrigin], []byte("DPC+"))
		if dpcpCount >= 2 {
			fmt.Println("original DPC+ file")
			sum := md5.Sum(original[:customOrigin])
			if _, ok := harmonyDriverCheck(original[:customOrigin]); ok {
				fmt.Printf("driver md5: %x\n", sum)
			} else {
				fmt.Printf("unrecognised driver md5: %x\n", sum)
			}
			return nil
		}

		return fmt.Errorf("not a DPC+ file")
	}

	// information about the ACE driver
	if dpcpCount >= 3 && bytes.Compare(original[:3], []byte("ACE")) == 0 {
		driver := original[:customOrigin]
		driverMD5 := md5.Sum(driver)
		fmt.Printf("driver md5: %x\n", driverMD5)

		version, err := aceDriverVersion(driver)
		if err != nil {
			// any driver version error causes the checking of this ROM to end
			return err
		}
		fmt.Printf("driver version: %s\n", version)

		if driverMD5 != md5.Sum(newDriver) && driverMD5 != md5.Sum(newDriverAlt) {
			// if the driver is not recognised we don't want to continue with
			// the information about the custom code
			return fmt.Errorf("not added by this version of %s\n", programName)
		}
	} else {
		fmt.Println("driverless STM32 DPC+ file")
	}

	// information about the BB custom section
	custom := original[customOrigin : customOrigin+len(newCustom)]
	customMD5 := md5.Sum(custom)
	fmt.Printf("bb md5: %x\n", customMD5)

	if customMD5 != md5.Sum(newCustom) {
		return fmt.Errorf("not added by this version of %s\n", programName)
	}

	return nil
}

func doRelocate(fn string, ace bool) error {
	original, err := os.ReadFile(fn)
	if err != nil {
		return err
	}

	// check for DPC+ file
	if bytes.Count(original, []byte("DPC+")) < 2 || len(original) != 32768 {
		return fmt.Errorf("relocateBB skipped. %s is not a DPC+ file", fn)
	}

	// check harmony version and whether it should use the alt driver
	alt, ok := harmonyDriverCheck(original[:customOrigin])
	if !ok {
		return fmt.Errorf("%s contains an unrecognised harmony driver", fn)
	}

	// slice off custom code
	custom := original[customOrigin:customMemtop]

	// check that the custom section is expected
	if fmt.Sprintf("%x", md5.Sum(custom)) != customMD5 {
		return fmt.Errorf("%s is not a recognised bB file", fn)
	}

	// there may be a difference in the size of the custom sections
	sizeDiff := len(custom) - len(newCustom)
	if sizeDiff < 0 {
		// this error shouldn't ever trigger because we've already chedk the
		// size in the init() function
		return fmt.Errorf("replacement custom code is too large")
	}

	// build new output data, taking size difference into account by adding
	// empty bytes of length sizeDiff
	//
	// if it is larger then the data following the custom code will be
	// overwritten. in the batari basic DPC+ kernel this is font data for the
	// scoreline. the ROM should still work but the scoreline, if it is used by
	// the game, will be corrupted
	var o []byte

	if ace {
		// replace Harmony DPC+ driver with ACE DPC+ driver
		if alt {
			o = newDriverAlt[:customOrigin]
		} else {
			o = newDriver[:customOrigin]
		}

		// add new custom section and use remainder of original file untouched
		o = append(o, newCustom...)
		o = append(o, make([]byte, sizeDiff)...)
		o = append(o, original[customMemtop:]...)
	} else {
		// when the ace flag is false we don't replace the Harmony DPC+ driver
		// with the ACE driver. instead we replace it with zero bytes and two
		// "DPCp" strings to aid with fingerprinting. we place the "DPCp"
		// strings at the same offsets as the "DPC+" strings in the original file

		// split original into three parts using "DPC+" as the split point
		splt := bytes.SplitN(original, []byte("DPC+"), 3)

		// we've already checked that there are at least two instances of the
		// "DPC+" string but we check again to make sure
		if len(splt) < 3 {
			return fmt.Errorf("relocateBB skipped. %s is not a DPC+ file", fn)
		}

		// instead of appending the newDriver array we add a mostly empty driver
		// section with the "DPCp" string inserting at the same points the
		// "DPC+" string appeared in the original file
		o = append(o, make([]byte, len(splt[0]))...)
		o = append(o, []byte("DPCp")...)
		o = append(o, make([]byte, len(splt[1]))...)
		o = append(o, []byte("DPCp")...)
		o = append(o, make([]byte, customOrigin-len(o))...)

		// check we've assembled the driver section correctly
		if len(o) != customOrigin {
			return fmt.Errorf("%s error constructing file: driver section is incorrect length", fn)
		}

		// add new custom section and use remainder of original file untouched
		o = append(o, newCustom...)
		o = append(o, make([]byte, sizeDiff)...)
		o = append(o, original[customMemtop:]...)
	}

	// new filename is created from the original filename. taking the
	// opportunity to tidy up the name
	sfn, _, _ := strings.Cut(fn, filepath.Ext(fn))
	sfn = strings.Replace(sfn, ".bas", "", 1)
	if ace {
		sfn = fmt.Sprintf("%s.ace", sfn)
	} else {
		sfn = fmt.Sprintf("%s_stm32.bin", sfn)
	}

	// write new file
	err = os.WriteFile(sfn, o, 0644)
	if err != nil {
		return err
	}

	// log success
	log.Printf("%s converted to %s\n", fn, sfn)

	return nil
}

// aceDriverVersion returns the embedded version string of an ACE driver or an
// error if the version is not recognised or supported
func aceDriverVersion(driver []byte) (string, error) {
	// ace driver name is 16 chars wide exactly
	const (
		aceDriveNameOrigin = 0x08
		aceDriveNameMemtop = 0x18
	)

	name := string(driver[aceDriveNameOrigin:aceDriveNameMemtop])

	// early versions of the ACE driver were unversioned
	if name == "DPCpPLUSCARTGAME" {
		return "", fmt.Errorf("early unversioned ACE driver")
	}

	// all ACE driver names should start with the 'DPCp' string
	if name[:4] != "DPCp" {
		return "", fmt.Errorf("unsupported ACE driver")
	}

	// extract version number
	version := name[4:]
	version = strings.TrimSpace(version)

	return version, nil
}

// checks whether harmony driver is known. returns whether to use the alt driver
// and whether the driver is in the list of known drivers
func harmonyDriverCheck(b []byte) (bool, bool) {
	// map of known drivers and whether they should be replaced with the alt
	// driver or not
	var knownDriverMD5 = map[string]bool{
		"17884ec14f9b1d06fe8d617a1fbdcf47": false,
		"5f80b5a5adbe483addc3f6e6f1b472f8": true,
		"8dd73b44fd11c488326ce507cbeb19d1": true,
		"b328dbdf787400c0f0e2b88b425872a5": false,
	}

	md5sum := fmt.Sprintf("%x", md5.Sum(b))
	if v, ok := knownDriverMD5[md5sum]; ok {
		return v, true
	}

	return false, false
}
