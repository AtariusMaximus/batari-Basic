game
.L00 ;;line 1;;  rem Nybble Test Program

.
 ;;line 2;; 

.L01 ;;line 3;;  rem Reserve the master byte

.L02 ;;line 4;;  dim shared_byte = a

.
 ;;line 5;; 

;PARSED_DEFINE: .p1_lives. = .shared_byte{lo}.
.L03 ;;line 6;;  def p1_lives = shared_byte{lo}

;PARSED_DEFINE: .p2_lives. = .shared_byte{hi}.
.L04 ;;line 7;;  def p2_lives = shared_byte{hi}

.
 ;;line 8;; 

.L05 ;;line 9;;  p1_lives = 3

	LDA #3
	STA temp1
	LDA temp1
	AND #$0F
	STA temp1
	LDA shared_byte
	AND #$F0
	ORA temp1
	STA shared_byte
.L06 ;;line 10;;  p2_lives = 9

	LDA #9
	STA temp1
	LDA temp1
	ASL
	ASL
	ASL
	ASL
	STA temp1
	LDA shared_byte
	AND #$0F
	ORA temp1
	STA shared_byte
.
 ;;line 11;; 

.L07 ;;line 12;;  playfield:

  ifconst pfres
	  ldx #(11>pfres)*(pfres*pfwidth-1)+(11<=pfres)*43
  else
	  ldx #((11*pfwidth-1)*((11*pfwidth-1)<47))+(47*((11*pfwidth-1)>=47))
  endif
	jmp pflabel0
PF_data0
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel0
	lda PF_data0,x
	sta playfield,x
	dex
	bpl pflabel0
.
 ;;line 25;; 

.main_loop
 ;;line 26;; main_loop

.
 ;;line 27;; 

.L08 ;;line 28;;  if joy0up pressed then p1_lives = p1_lives  +  1

 lda #$10
 bit SWCHA
	BNE .skipL08
	BIT _last_SWCHA
	BEQ .skipL08
.condpart0
	LDA shared_byte
	AND #$0F
	STA temp5
	LDA temp5
	CLC
	ADC #1
	STA temp1
	LDA temp1
	AND #$0F
	STA temp1
	LDA shared_byte
	AND #$F0
	ORA temp1
	STA shared_byte
.skipL08
.L09 ;;line 29;;  if joy0down pressed then p1_lives = p1_lives  -  1

 lda #$20
 bit SWCHA
	BNE .skipL09
	BIT _last_SWCHA
	BEQ .skipL09
.condpart1
	LDA shared_byte
	AND #$0F
	STA temp5
	LDA temp5
	SEC
	SBC #1
	STA temp1
	LDA temp1
	AND #$0F
	STA temp1
	LDA shared_byte
	AND #$F0
	ORA temp1
	STA shared_byte
.skipL09
.
 ;;line 30;; 

.L010 ;;line 31;;  if joy0fire pressed then p2_lives = p2_lives  +  1

 bit INPT4
	BMI .skipL010
	BIT _last_INPT4
	BPL .skipL010
.condpart2
	LDA shared_byte
	LSR
	LSR
	LSR
	LSR
	STA temp5
	LDA temp5
	CLC
	ADC #1
	STA temp1
	LDA temp1
	ASL
	ASL
	ASL
	ASL
	STA temp1
	LDA shared_byte
	AND #$0F
	ORA temp1
	STA shared_byte
.skipL010
.L011 ;;line 32;;  if switchreset pressed then p2_lives = p2_lives  -  1

 lda #1
 bit SWCHB
	BNE .skipL011
	BIT _last_SWCHB
	BEQ .skipL011
.condpart3
	LDA shared_byte
	LSR
	LSR
	LSR
	LSR
	STA temp5
	LDA temp5
	SEC
	SBC #1
	STA temp1
	LDA temp1
	ASL
	ASL
	ASL
	ASL
	STA temp1
	LDA shared_byte
	AND #$0F
	ORA temp1
	STA shared_byte
.skipL011
.
 ;;line 33;; 

.
 ;;line 34;; 

.
 ;;line 35;; 

.
 ;;line 36;; 

.L012 ;;line 37;;  COLUBK = p1_lives  *  4

	LDA shared_byte
	AND #$0F
	STA temp5
	LDA temp5
	asl
	asl
	STA COLUBK
.L013 ;;line 38;;  COLUPF = p2_lives  *  8

	LDA shared_byte
	LSR
	LSR
	LSR
	LSR
	STA temp5
	LDA temp5
	asl
	asl
	asl
	STA COLUPF
.L014 ;;line 39;;  drawscreen

	LDA SWCHA
	STA _last_SWCHA
	LDA SWCHB
	STA _last_SWCHB
	LDA INPT4
	STA _last_INPT4
 jsr drawscreen
.L015 ;;line 40;;  goto main_loop

 jmp .main_loop
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
