game
.
 ;;line 1;; 

.L00 ;;line 2;;  set kernel split

.L01 ;;line 3;;  set romsize 16kSC

.
 ;;line 4;; 

.
 ;;line 5;; 

.
 ;;line 6;; 

.
 ;;line 7;; 

.
 ;;line 8;; 

.
 ;;line 9;; 

.
 ;;line 10;; 

.L02 ;;line 11;;  dim p2_player0y = a

.L03 ;;line 12;;  dim p2_player1y = b

.L04 ;;line 13;;  dim p2_player0x = c

.L05 ;;line 14;;  dim p2_player1x = d

.L06 ;;line 15;;  dim p2_player0pointerlo = e

.L07 ;;line 16;;  dim p2_player0pointerhi = f

.L08 ;;line 17;;  dim p2_player1pointerlo = g

.L09 ;;line 18;;  dim p2_player1pointerhi = h

.L010 ;;line 19;;  dim p2_colupf = i

.L011 ;;line 20;;  const pfres = 32

.
 ;;line 21;; 

.
 ;;line 22;; 

.L012 ;;line 23;;  player0:

	LDX #<playerL012_0
	STX player0pointerlo
	LDA #>playerL012_0
	STA player0pointerhi
	LDA #3
	STA player0height
.
 ;;line 29;; 

.L013 ;;line 30;;  player1:

	LDX #<playerL013_1
	STX player1pointerlo
	LDA #>playerL013_1
	STA player1pointerhi
	LDA #3
	STA player1height
.
 ;;line 36;; 

.
 ;;line 37;; 

.
 ;;line 38;; 

.L014 ;;line 39;;  player0x = 40

	LDA #40
	STA player0x
.L015 ;;line 40;;  player0y = 40

	LDA #40
	STA player0y
.
 ;;line 41;; 

.L016 ;;line 42;;  p2_player0x = 40

	LDA #40
	STA p2_player0x
.L017 ;;line 43;;  p2_player0y = 58

	LDA #58
	STA p2_player0y
.
 ;;line 44;; 

.
 ;;line 45;; 

.L018 ;;line 46;;  playfield:

  ifconst pfres
	  ldx #(32>pfres)*(pfres*pfwidth-1)+(32<=pfres)*127
  else
	  ldx #((32*pfwidth-1)*((32*pfwidth-1)<47))+(47*((32*pfwidth-1)>=47))
  endif
	jmp pflabel0
PF_data0
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10011110, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10010010, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10010010, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10010010, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10010010, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10011110, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10011000, %11111111
	if (pfwidth>2)
	.byte %10011111, %11111111
 endif
	.byte %10010000, %00000000
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010011, %00000011
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010010, %00000010
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010010, %00000000
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010010, %00000000
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010010, %00000000
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010010, %00000010
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010011, %00000011
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10010000, %00000000
	if (pfwidth>2)
	.byte %10010000, %00000000
 endif
	.byte %10011111, %11111111
	if (pfwidth>2)
	.byte %10011111, %11000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel0
	lda PF_data0,x
	sta playfield-128,x
	dex
	bpl pflabel0
.
 ;;line 80;; 

.main
 ;;line 81;; main

.
 ;;line 82;; 

.L019 ;;line 83;;  ballx = 30 : bally = 30

	LDA #30
	STA ballx
	STA bally
.L020 ;;line 84;;  scorecolor = $08

	LDA #$08
	STA scorecolor
.L021 ;;line 85;;  score = 999999

	LDA #$99
	STA score+2
	LDA #$99
	STA score+1
	LDA #$99
	STA score
.L022 ;;line 86;;  CTRLPF = $21

	LDA #$21
	STA CTRLPF
.L023 ;;line 87;;  COLUPF = $84

	LDA #$84
	STA COLUPF
.L024 ;;line 88;;  p2_colupf = rand

 sta temp7
 lda #>(ret_point1-1)
 pha
 lda #<(ret_point1-1)
 pha
 lda #>(randomize-1)
 pha
 lda #<(randomize-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point1
	STA p2_colupf
.
 ;;line 89;; 

.
 ;;line 90;; 

.L025 ;;line 91;;  COLUBK = $00

	LDA #$00
	STA COLUBK
.L026 ;;line 92;;  COLUP0 = $1E

	LDA #$1E
	STA COLUP0
.L027 ;;line 93;;  COLUP1 = $2F

	LDA #$2F
	STA COLUP1
.
 ;;line 94;; 

.
 ;;line 95;; 

.L028 ;;line 96;;  if joy0up then player0y = player0y  -  1

 lda #$10
 bit SWCHA
	BNE .skipL028
.condpart0
	DEC player0y
.skipL028
.L029 ;;line 97;;  if joy0down then player0y = player0y  +  1

 lda #$20
 bit SWCHA
	BNE .skipL029
.condpart1
	INC player0y
.skipL029
.L030 ;;line 98;;  if joy0left then player0x = player0x  -  1

 bit SWCHA
	BVS .skipL030
.condpart2
	DEC player0x
.skipL030
.L031 ;;line 99;;  if joy0right then player0x = player0x  +  1

 bit SWCHA
	BMI .skipL031
.condpart3
	INC player0x
.skipL031
.
 ;;line 100;; 

.
 ;;line 101;; 

.L032 ;;line 102;;  if player0y  >  42 then player0y = 42

	LDA #42
	CMP player0y
     BCS .skipL032
.condpart4
	LDA #42
	STA player0y
.skipL032
.L033 ;;line 103;;  if player0y  <  8 then player0y = 8

	LDA player0y
	CMP #8
     BCS .skipL033
.condpart5
	LDA #8
	STA player0y
.skipL033
.
 ;;line 104;; 

.
 ;;line 105;; 

.L034 ;;line 106;;  if p2_player0y  >  42 then p2_player0y = 42

	LDA #42
	CMP p2_player0y
     BCS .skipL034
.condpart6
	LDA #42
	STA p2_player0y
.skipL034
.L035 ;;line 107;;  if p2_player0y  <  8 then p2_player0y = 8

	LDA p2_player0y
	CMP #8
     BCS .skipL035
.condpart7
	LDA #8
	STA p2_player0y
.skipL035
.
 ;;line 108;; 

.
 ;;line 109;; 

.L036 ;;line 110;;  if joy0left then p2_player0x = p2_player0x  -  1

 bit SWCHA
	BVS .skipL036
.condpart8
	DEC p2_player0x
.skipL036
.L037 ;;line 111;;  if joy0right then p2_player0x = p2_player0x  +  1

 bit SWCHA
	BMI .skipL037
.condpart9
	INC p2_player0x
.skipL037
.L038 ;;line 112;;  if joy0up then p2_player0y = p2_player0y  -  1

 lda #$10
 bit SWCHA
	BNE .skipL038
.condpart10
	DEC p2_player0y
.skipL038
.L039 ;;line 113;;  if joy0down then p2_player0y = p2_player0y  +  1

 lda #$20
 bit SWCHA
	BNE .skipL039
.condpart11
	INC p2_player0y
.skipL039
.
 ;;line 114;; 

.L040 ;;line 115;;  drawscreen

 sta temp7
 lda #>(ret_point2-1)
 pha
 lda #<(ret_point2-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point2
.L041 ;;line 116;;  goto main
 jmp .main
 if ECHO1
 echo "    ",[(start_bank1 - *)]d , "bytes of ROM space left in bank 1")
 endif
ECHO1 = 1
 ORG $1FF4-bscode_length
 RORG $9FF4-bscode_length
start_bank1 ldx #$ff
 ifconst FASTFETCH ; using DPC+
 stx FASTFETCH
 endif 
 txs
 if bankswitch == 64
   lda #(((>(start-1)) & $0F) | $F0)
 else
   lda #>(start-1)
 endif
 pha
 lda #<(start-1)
 pha
 pha
 txa
 pha
 tsx
 if bankswitch != 64
   lda 4,x ; get high byte of return address
   rol
   rol
   rol
   rol
   and #bs_mask ;1 3 or 7 for F8/F6/F4
   tax
   inx
 else
   lda 4,x ; get high byte of return address
   tay
   ora #$10 ; change our bank nibble into a valid rom mirror
   sta 4,x
   tya
   lsr 
   lsr 
   lsr 
   lsr 
   tax
   inx
 endif
 lda bankswitch_hotspot-1,x
 pla
 tax
 pla
 rts
 if ((* & $1FFF) > ((bankswitch_hotspot & $1FFF) - 1))
   echo "WARNING: size parameter in banksw.asm too small - the program probably will not work."
   echo "Change to",[(*-begin_bscode+1)&$FF]d,"and try again."
 endif
 ORG $1FFC
 RORG $9FFC
 .word (start_bank1 & $ffff)
 .word (start_bank1 & $ffff)
 ORG $2000
 RORG $B000
 repeat 256
 .byte $ff
 repend
 if ECHO2
 echo "    ",[(start_bank2 - *)]d , "bytes of ROM space left in bank 2")
 endif
ECHO2 = 1
 ORG $2FF4-bscode_length
 RORG $BFF4-bscode_length
start_bank2 ldx #$ff
 ifconst FASTFETCH ; using DPC+
 stx FASTFETCH
 endif 
 txs
 if bankswitch == 64
   lda #(((>(start-1)) & $0F) | $F0)
 else
   lda #>(start-1)
 endif
 pha
 lda #<(start-1)
 pha
 pha
 txa
 pha
 tsx
 if bankswitch != 64
   lda 4,x ; get high byte of return address
   rol
   rol
   rol
   rol
   and #bs_mask ;1 3 or 7 for F8/F6/F4
   tax
   inx
 else
   lda 4,x ; get high byte of return address
   tay
   ora #$10 ; change our bank nibble into a valid rom mirror
   sta 4,x
   tya
   lsr 
   lsr 
   lsr 
   lsr 
   tax
   inx
 endif
 lda bankswitch_hotspot-1,x
 pla
 tax
 pla
 rts
 if ((* & $1FFF) > ((bankswitch_hotspot & $1FFF) - 1))
   echo "WARNING: size parameter in banksw.asm too small - the program probably will not work."
   echo "Change to",[(*-begin_bscode+1)&$FF]d,"and try again."
 endif
 ORG $2FFC
 RORG $BFFC
 .word (start_bank2 & $ffff)
 .word (start_bank2 & $ffff)
 ORG $3000
 RORG $D000
 repeat 256
 .byte $ff
 repend
 if ECHO3
 echo "    ",[(start_bank3 - *)]d , "bytes of ROM space left in bank 3")
 endif
ECHO3 = 1
 ORG $3FF4-bscode_length
 RORG $DFF4-bscode_length
start_bank3 ldx #$ff
 ifconst FASTFETCH ; using DPC+
 stx FASTFETCH
 endif 
 txs
 if bankswitch == 64
   lda #(((>(start-1)) & $0F) | $F0)
 else
   lda #>(start-1)
 endif
 pha
 lda #<(start-1)
 pha
 pha
 txa
 pha
 tsx
 if bankswitch != 64
   lda 4,x ; get high byte of return address
   rol
   rol
   rol
   rol
   and #bs_mask ;1 3 or 7 for F8/F6/F4
   tax
   inx
 else
   lda 4,x ; get high byte of return address
   tay
   ora #$10 ; change our bank nibble into a valid rom mirror
   sta 4,x
   tya
   lsr 
   lsr 
   lsr 
   lsr 
   tax
   inx
 endif
 lda bankswitch_hotspot-1,x
 pla
 tax
 pla
 rts
 if ((* & $1FFF) > ((bankswitch_hotspot & $1FFF) - 1))
   echo "WARNING: size parameter in banksw.asm too small - the program probably will not work."
   echo "Change to",[(*-begin_bscode+1)&$FF]d,"and try again."
 endif
 ORG $3FFC
 RORG $DFFC
 .word (start_bank3 & $ffff)
 .word (start_bank3 & $ffff)
 ORG $4000
 RORG $F000
 repeat 256
 .byte $ff
 repend
; bB.asm file is split here
 if (<*) > (<(*+3))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL012_0
	.byte  %11110000
	.byte  %11110000
	.byte  %11110000
	.byte  %11110000
 if (<*) > (<(*+3))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL013_1
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left in bank 4")
 endif 
ECHOFIRST = 1
 
 
 
