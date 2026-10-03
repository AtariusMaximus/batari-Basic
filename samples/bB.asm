game
.L00 ;;line 1;;  rem --- Zero/Clear Demo ---

.
 ;;line 2;; 

.L01 ;;line 3;;  score = 999999

	LDA #$99
	STA score+2
	LDA #$99
	STA score+1
	LDA #$99
	STA score
.L02 ;;line 4;;  a = 55

	LDA #55
	STA a
.L03 ;;line 5;;  b = 60

	LDA #60
	STA b
.
 ;;line 6;; 

.main
 ;;line 7;; main

.
 ;;line 8;; 

.L04 ;;line 9;;  player0x = a

	LDA a
	STA player0x
.L05 ;;line 10;;  player0y = b

	LDA b
	STA player0y
.
 ;;line 11;; 

.L06 ;;line 12;;  scorecolor = $08

	LDA #$08
	STA scorecolor
.
 ;;line 13;; 

.L07 ;;line 14;;  COLUP0 = $1C

	LDA #$1C
	STA COLUP0
.
 ;;line 15;; 

.L08 ;;line 16;;  player0:

	LDX #<playerL08_0
	STX player0pointerlo
	LDA #>playerL08_0
	STA player0pointerhi
	LDA #3
	STA player0height
.
 ;;line 22;; 

.L09 ;;line 23;;  rem Press FIRE to batch zero all the variables!

.L010 ;;line 24;;  if joy0fire pressed then zero a ,  b ,  score

 bit INPT4
	BMI .skipL010
	BIT _last_INPT4
	BPL .skipL010
.condpart0
	LDA #0
	STA a
	STA b
	STA score
	STA score+1
	STA score+2
.skipL010
.
 ;;line 25;; 

.L011 ;;line 26;;  drawscreen

	LDA INPT4
	STA _last_INPT4
 jsr drawscreen
.
 ;;line 27;; 

.L012 ;;line 28;;  goto main

 jmp .main
 if (<*) > (<(*+3))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL08_0
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
