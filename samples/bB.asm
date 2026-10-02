game
.L00 ;;line 1;;  rem --- Bitwise Macro Test ---

.L01 ;;line 2;;  dim playerflags = a

.L02 ;;line 3;;  dim debouncestate = b

.
 ;;line 4;; 

.L03 ;;line 5;;  dim scoreHI = score

.L04 ;;line 6;;  dim scoreMED = score + 1

.L05 ;;line 7;;  dim scoreLO = score + 2

.
 ;;line 8;; 

.L06 ;;line 9;;  score = 0

	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L07 ;;line 10;;  playerflags = 0

	LDA #0
	STA playerflags
.L08 ;;line 11;;  debouncestate = 0

	LDA #0
	STA debouncestate
.
 ;;line 12;; 

.main
 ;;line 13;; main

.L09 ;;line 14;;  COLUBK = $00

	LDA #$00
	STA COLUBK
.L010 ;;line 15;;  COLUP0 = $18

	LDA #$18
	STA COLUP0
.L011 ;;line 16;;  COLUP1 = $18

	LDA #$18
	STA COLUP1
.L012 ;;line 17;;  COLUPF = $88

	LDA #$88
	STA COLUPF
.L013 ;;line 18;;  scorecolor = $0E

	LDA #$0E
	STA scorecolor
.
 ;;line 19;; 

.L014 ;;line 20;;  rem Put playerflags into the bottom byte of the score

.L015 ;;line 21;;  scoreLO = playerflags

	LDA playerflags
	STA scoreLO
.
 ;;line 22;; 

.L016 ;;line 23;;  rem Push UP to turn bit 0 ON (+1)

.L017 ;;line 24;;  if joy0up then setbit playerflags 0

 lda #$10
 bit SWCHA
	BNE .skipL017
.condpart0
	LDA playerflags
	ORA #1
	STA playerflags
.skipL017
.
 ;;line 25;; 

.L018 ;;line 26;;  rem Push DOWN to turn bit 0 OFF (-1)

.L019 ;;line 27;;  if joy0down then clearbit playerflags 0

 lda #$20
 bit SWCHA
	BNE .skipL019
.condpart1
	LDA playerflags
	AND #254
	STA playerflags
.skipL019
.
 ;;line 28;; 

.L020 ;;line 29;;  rem Push LEFT to turn bit 4 ON (+16 in hex = $10)

.L021 ;;line 30;;  if joy0left then setbit playerflags 4

 bit SWCHA
	BVS .skipL021
.condpart2
	LDA playerflags
	ORA #16
	STA playerflags
.skipL021
.
 ;;line 31;; 

.L022 ;;line 32;;  rem Push RIGHT to turn bit 4 OFF

.L023 ;;line 33;;  if joy0right then clearbit playerflags 4

 bit SWCHA
	BMI .skipL023
.condpart3
	LDA playerflags
	AND #239
	STA playerflags
.skipL023
.
 ;;line 34;; 

.L024 ;;line 35;;  rem Tap FIRE to toggle bit 1 (+2 / -2) with simple button debounce

.L025 ;;line 36;;  if joy0fire  &&  debouncestate = 0 then togglebit playerflags 1  :  debouncestate = 1

 bit INPT4
	BMI .skipL025
.condpart4
	LDA debouncestate
	CMP #0
     BNE .skip4then
.condpart5
	LDA playerflags
	EOR #2
	STA playerflags
	LDA #1
	STA debouncestate
.skip4then
.skipL025
.L026 ;;line 37;;  if !joy0fire then debouncestate = 0

 bit INPT4
	BPL .skipL026
.condpart6
	LDA #0
	STA debouncestate
.skipL026
.
 ;;line 38;; 

.L027 ;;line 39;;  drawscreen

 jsr drawscreen
.L028 ;;line 40;;  goto main

 jmp .main
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
