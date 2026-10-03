game
.L00 ;;line 1;;  rem --- Clamp Demo ---

.
 ;;line 2;; 

.L01 ;;line 3;;  player0x = 80

	LDA #80
	STA player0x
.L02 ;;line 4;;  player0y = 50

	LDA #50
	STA player0y
.
 ;;line 5;; 

.main
 ;;line 6;; main

.
 ;;line 7;; 

.L03 ;;line 8;;  COLUP0 = $1C

	LDA #$1C
	STA COLUP0
.
 ;;line 9;; 

.L04 ;;line 10;;  player0:

	LDX #<playerL04_0
	STX player0pointerlo
	LDA #>playerL04_0
	STA player0pointerhi
	LDA #3
	STA player0height
.
 ;;line 16;; 

.L05 ;;line 17;;  rem Joystick movement

.L06 ;;line 18;;  if joy0left then player0x = player0x  -  2

 bit SWCHA
	BVS .skipL06
.condpart0
	LDA player0x
	SEC
	SBC #2
	STA player0x
.skipL06
.L07 ;;line 19;;  if joy0right then player0x = player0x  +  2

 bit SWCHA
	BMI .skipL07
.condpart1
	LDA player0x
	CLC
	ADC #2
	STA player0x
.skipL07
.
 ;;line 20;; 

.L08 ;;line 21;;  rem Clamp the X coordinate so the player cannot leave the screen

.L09 ;;line 22;;  player0x = clamp ( player0x ,  16 ,  140 ) 

	LDA player0x
	CMP #16
	BCS .clamp_max_0
	LDA #16
	JMP .clamp_done_0
.clamp_max_0
	CMP #140
	BCC .clamp_done_0
	BEQ .clamp_done_0
	LDA #140
.clamp_done_0
	STA player0x
.
 ;;line 23;; 

.L010 ;;line 24;;  drawscreen

 jsr drawscreen
.
 ;;line 25;; 

.L011 ;;line 26;;  goto main

 jmp .main
 if (<*) > (<(*+3))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL04_0
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
