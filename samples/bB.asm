game
.L00 ;;line 1;;  rem --- Swap & Debounce Demo ---

.
 ;;line 2;; 

.L01 ;;line 3;;  rem Set initial starting positions

.
 ;;line 4;; 

.L02 ;;line 5;;  a = 40 : b = 50 : c = 100 : d = 50

	LDA #40
	STA a
	LDA #50
	STA b
	LDA #100
	STA c
	LDA #50
	STA d
.
 ;;line 6;; 

.main
 ;;line 7;; main

.
 ;;line 8;; 

.L03 ;;line 9;;  player0x = a

	LDA a
	STA player0x
.L04 ;;line 10;;  player0y = b

	LDA b
	STA player0y
.L05 ;;line 11;;  player1x = c

	LDA c
	STA player1x
.L06 ;;line 12;;  player1y = d

	LDA d
	STA player1y
.
 ;;line 13;; 

.L07 ;;line 14;;  rem Colors and graphics defined in the main loop

.L08 ;;line 15;;  COLUP0 = $1C

	LDA #$1C
	STA COLUP0
.L09 ;;line 16;;  COLUP1 = $84

	LDA #$84
	STA COLUP1
.
 ;;line 17;; 

.L010 ;;line 18;;  player0:

	LDX #<playerL010_0
	STX player0pointerlo
	LDA #>playerL010_0
	STA player0pointerhi
	LDA #3
	STA player0height
.
 ;;line 24;; 

.L011 ;;line 25;;  player1:

	LDX #<playerL011_1
	STX player1pointerlo
	LDA #>playerL011_1
	STA player1pointerhi
	LDA #3
	STA player1height
.
 ;;line 31;; 

.
 ;;line 32;; 

.L012 ;;line 33;;  rem Tap the fire button to instantly exchange sprite coordinates!

.L013 ;;line 34;;  if joy0fire pressed then swap a , c : swap b , d

 bit INPT4
	BMI .skipL013
	BIT _last_INPT4
	BPL .skipL013
.condpart0
	LDA a
	LDX c
	STA c
	STX a
	LDA b
	LDX d
	STA d
	STX b
.skipL013
.
 ;;line 35;; 

.L014 ;;line 36;;  drawscreen

	LDA INPT4
	STA _last_INPT4
 jsr drawscreen
.
 ;;line 37;; 

.L015 ;;line 38;;  goto main

 jmp .main
 if (<*) > (<(*+3))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL010_0
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
 if (<*) > (<(*+3))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL011_1
	.byte  %10000001
	.byte  %11000011
	.byte  %11100111
	.byte  %11111111
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
