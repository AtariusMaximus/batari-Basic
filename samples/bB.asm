game
.L00 ;;line 1;;  rem --- Debounce Demo ---

.
 ;;line 2;; 

.L01 ;;line 3;;  score = 0

	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L02 ;;line 4;;  player0x = 75

	LDA #75
	STA player0x
.L03 ;;line 5;;  player0y = 45

	LDA #45
	STA player0y
.L04 ;;line 6;;  COLUP0 = $1C

	LDA #$1C
	STA COLUP0
.L05 ;;line 7;;  COLUBK = $00

	LDA #$00
	STA COLUBK
.
 ;;line 8;; 

.L06 ;;line 9;;  player0:

	LDX #<playerL06_0
	STX player0pointerlo
	LDA #>playerL06_0
	STA player0pointerhi
	LDA #7
	STA player0height
.
 ;;line 19;; 

.main
 ;;line 20;; main

.
 ;;line 21;; 

.L07 ;;line 22;;  rem Tap fire to increment score by exactly 1 (no machine-gunning)

.L08 ;;line 23;;  if joy0fire pressed then score = score  +  1

 bit INPT4
	BMI .skipL08
	BIT _last_INPT4
	BPL .skipL08
.condpart0
	SED
	CLC
	LDA score+2
	ADC #$01
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.skipL08
.
 ;;line 24;; 

.L09 ;;line 25;;  rem Release fire to flash the background red

.L010 ;;line 26;;  if joy0fire released then COLUBK = $44

 bit INPT4
	BPL .skipL010
	BIT _last_INPT4
	BMI .skipL010
.condpart1
	LDA #$44
	STA COLUBK
.skipL010
.
 ;;line 27;; 

.L011 ;;line 28;;  rem Background decays back to black normally every frame

.L012 ;;line 29;;  if COLUBK  >  0 then COLUBK = COLUBK  -  2

	LDA #0
	CMP COLUBK
     BCS .skipL012
.condpart2
	LDA COLUBK
	SEC
	SBC #2
	STA COLUBK
.skipL012
.
 ;;line 30;; 

.L013 ;;line 31;;  rem Tap right to warp 8 pixels (won't slide continuously if held)

.L014 ;;line 32;;  if joy0right pressed then player0x = player0x  +  8

 bit SWCHA
	BMI .skipL014
	BIT _last_SWCHA
	BPL .skipL014
.condpart3
	LDA player0x
	CLC
	ADC #8
	STA player0x
.skipL014
.
 ;;line 33;; 

.L015 ;;line 34;;  rem Standard movement on the left D-pad (slides continuously while held)

.L016 ;;line 35;;  if joy0left then player0x = player0x  -  1

 bit SWCHA
	BVS .skipL016
.condpart4
	DEC player0x
.skipL016
.
 ;;line 36;; 

.L017 ;;line 37;;  drawscreen

_last_SWCHA = $F0
_last_INPT4 = $F2
	LDA SWCHA
	STA _last_SWCHA
	LDA INPT4
	STA _last_INPT4
 jsr drawscreen
.L018 ;;line 38;;  goto main

 jmp .main
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL06_0
	.byte   %00111100
	.byte   %01111110
	.byte   %11011011
	.byte   %11111111
	.byte   %11111111
	.byte   %01111110
	.byte   %00111100
	.byte   %00011000
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
