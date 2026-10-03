game
.L00 ;;line 1;;  rem --- Switch/Case Statement Demo ---

.
 ;;line 2;; 

.L01 ;;line 3;;  dim player_state = a

.
 ;;line 4;; 

.L02 ;;line 5;;  player0x = 75

	LDA #75
	STA player0x
.L03 ;;line 6;;  player0y = 45

	LDA #45
	STA player0y
.L04 ;;line 7;;  score = 0

	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.
 ;;line 8;; 

.L05 ;;line 9;;  player0:

	LDX #<playerL05_0
	STX player0pointerlo
	LDA #>playerL05_0
	STA player0pointerhi
	LDA #7
	STA player0height
.
 ;;line 19;; 

.main
 ;;line 20;; main

.L06 ;;line 21;;  COLUP0 = $1C

	LDA #$1C
	STA COLUP0
.L07 ;;line 22;;  scorecolor = $0E

	LDA #$0E
	STA scorecolor
.
 ;;line 23;; 

.L08 ;;line 24;;  rem Define state based on joystick input

.L09 ;;line 25;;  player_state = 0

	LDA #0
	STA player_state
.L010 ;;line 26;;  if joy0up then player_state = 1

 lda #$10
 bit SWCHA
	BNE .skipL010
.condpart0
	LDA #1
	STA player_state
.skipL010
.L011 ;;line 27;;  if joy0down then player_state = 2

 lda #$20
 bit SWCHA
	BNE .skipL011
.condpart1
	LDA #2
	STA player_state
.skipL011
.L012 ;;line 28;;  if joy0left then player_state = 3

 bit SWCHA
	BVS .skipL012
.condpart2
	LDA #3
	STA player_state
.skipL012
.L013 ;;line 29;;  if joy0right then player_state = 4

 bit SWCHA
	BMI .skipL013
.condpart3
	LDA #4
	STA player_state
.skipL013
.L014 ;;line 30;;  if joy0fire then player_state = 5

 bit INPT4
	BMI .skipL014
.condpart4
	LDA #5
	STA player_state
.skipL014
.
 ;;line 31;; 

.L015 ;;line 32;;  rem Route the logic using the new switch block

.L016 ;;line 33;;  switch player_state

.L017 ;;line 34;;  case 1

	LDA player_state
	CMP #1
	bne .skipcase0
.L018 ;;line 35;;  player0y = player0y  -  1

	DEC player0y
.L019 ;;line 36;;  score = score  +  1

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
.L020 ;;line 37;;  case 2

	jmp .endswitch0
.skipcase0
	LDA player_state
	CMP #2
	bne .skipcase1
.L021 ;;line 38;;  player0y = player0y  +  1

	INC player0y
.L022 ;;line 39;;  score = score  +  2

	SED
	CLC
	LDA score+2
	ADC #$02
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.L023 ;;line 40;;  case 3

	jmp .endswitch0
.skipcase1
	LDA player_state
	CMP #3
	bne .skipcase2
.L024 ;;line 41;;  player0x = player0x  -  1

	DEC player0x
.L025 ;;line 42;;  score = score  +  3

	SED
	CLC
	LDA score+2
	ADC #$03
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.L026 ;;line 43;;  case 4

	jmp .endswitch0
.skipcase2
	LDA player_state
	CMP #4
	bne .skipcase3
.L027 ;;line 44;;  player0x = player0x  +  1

	INC player0x
.L028 ;;line 45;;  score = score  +  4

	SED
	CLC
	LDA score+2
	ADC #$04
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.L029 ;;line 46;;  case 5

	jmp .endswitch0
.skipcase3
	LDA player_state
	CMP #5
	bne .skipcase4
.L030 ;;line 47;;  COLUBK = $44

	LDA #$44
	STA COLUBK
.L031 ;;line 48;;  score = score  +  10

	SED
	CLC
	LDA score+2
	ADC #$10
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.L032 ;;line 49;;  default

	jmp .endswitch0
.skipcase4
.L033 ;;line 50;;  rem Idle state fallback

.L034 ;;line 51;;  COLUBK = $00

	LDA #$00
	STA COLUBK
.L035 ;;line 52;;  endswitch

.endswitch0
.
 ;;line 53;; 

.L036 ;;line 54;;  drawscreen

 jsr drawscreen
.L037 ;;line 55;;  goto main

 jmp .main
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL05_0
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
 
 
 
