; Provided under the CC0 license. See the included LICENSE.txt for details.

 processor 6502
 include "vcs.h"
 include "macro.h"
 include "2600basic.h"
 include "2600basic_variable_redefs.h"
 ifconst bankswitch
  if bankswitch == 8
     ORG $1000
     RORG $D000
  endif
  if bankswitch == 16
     ORG $1000
     RORG $9000
  endif
  if bankswitch == 32
     ORG $1000
     RORG $1000
  endif
  if bankswitch == 64
     ORG $1000
     RORG $1000
  endif
 else
   ORG $F000
 endif
 repeat 256
 .byte $ff
 repend
game
.L00 ;;line 1;;  rem ** The 64kSC test program

.L01 ;;line 2;;  rem **

.L02 ;;line 3;;  rem ** This runs through bank changes and does a memory test in each bank. 

.L03 ;;line 4;;  rem ** The score is adjusted to reflect the last successful bank # changed 

.L04 ;;line 5;;  rem ** to. The background color register changes according to the bank # 

.L05 ;;line 6;;  rem ** that was tested, whether it was successful or not.

.L06 ;;line 7;;  rem ** If the memory test fails from any bank, the score turns dark red and

.L07 ;;line 8;;  rem ** the first score digit turns to "99"

.
 ;;line 9;; 

.L08 ;;line 10;;  set romsize 64kSC

.
 ;;line 11;; 

.L09 ;;line 12;;  dim frame = a

.L010 ;;line 13;;  dim bchoice = b

.L011 ;;line 14;;  dim memloc = c

.
 ;;line 15;; 

.L012 ;;line 16;;  dim sc0 = score

.
 ;;line 17;; 

.L013 ;;line 18;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L013formemloc
.L014 ;;line 19;;  w000[memloc] = $aa

	LDA #$aa
	LDX memloc
	STA w000,x
.L015 ;;line 20;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L013formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L013formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L013formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 1 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 21;; 

.L016 ;;line 22;;  score = 1

	LDA #$01
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L017 ;;line 23;;  bchoice = 0

	LDA #0
	STA bchoice
.
 ;;line 24;; 

.main
 ;;line 25;; main

.L018 ;;line 26;;  scorecolor = $0f

	LDA #$0f
	STA scorecolor
.L019 ;;line 27;;  COLUBK = bchoice * 4 * 4 + 2

; complex statement detected
	LDA bchoice
	asl
	asl
	asl
	asl
	CLC
	ADC #2
	STA COLUBK
.
 ;;line 28;; 

.L020 ;;line 29;;  if bchoice = 0 then score = 1

	LDA bchoice
	CMP #0
     BNE .skipL020
.condpart0
	LDA #$01
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.skipL020
.L021 ;;line 30;;  if bchoice = 1 then goto bsub2 bank2

	LDA bchoice
	CMP #1
     BNE .skipL021
.condpart1
 sta temp7
 lda #>(.bsub2-1)
 pha
 lda #<(.bsub2-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
.skipL021
.L022 ;;line 31;;  if bchoice = 2 then goto bsub3 bank3

	LDA bchoice
	CMP #2
     BNE .skipL022
.condpart2
 sta temp7
 lda #>(.bsub3-1)
 pha
 lda #<(.bsub3-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
.skipL022
.L023 ;;line 32;;  if bchoice = 3 then goto bsub4 bank4

	LDA bchoice
	CMP #3
     BNE .skipL023
.condpart3
 sta temp7
 lda #>(.bsub4-1)
 pha
 lda #<(.bsub4-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
.skipL023
.L024 ;;line 33;;  if bchoice = 4 then goto bsub5 bank5

	LDA bchoice
	CMP #4
     BNE .skipL024
.condpart4
 sta temp7
 lda #>(.bsub5-1)
 pha
 lda #<(.bsub5-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #5
 jmp BS_jsr
.skipL024
.L025 ;;line 34;;  if bchoice = 5 then goto bsub6 bank6

	LDA bchoice
	CMP #5
     BNE .skipL025
.condpart5
 sta temp7
 lda #>(.bsub6-1)
 pha
 lda #<(.bsub6-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #6
 jmp BS_jsr
.skipL025
.L026 ;;line 35;;  if bchoice = 6 then goto bsub7 bank7

	LDA bchoice
	CMP #6
     BNE .skipL026
.condpart6
 sta temp7
 lda #>(.bsub7-1)
 pha
 lda #<(.bsub7-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #7
 jmp BS_jsr
.skipL026
.L027 ;;line 36;;  if bchoice = 7 then goto bsub8 bank8

	LDA bchoice
	CMP #7
     BNE .skipL027
.condpart7
 sta temp7
 lda #>(.bsub8-1)
 pha
 lda #<(.bsub8-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #8
 jmp BS_jsr
.skipL027
.L028 ;;line 37;;  if bchoice = 8 then goto bsub9 bank9

	LDA bchoice
	CMP #8
     BNE .skipL028
.condpart8
 sta temp7
 lda #>(.bsub9-1)
 pha
 lda #<(.bsub9-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #9
 jmp BS_jsr
.skipL028
.L029 ;;line 38;;  if bchoice = 9 then goto bsub10 bank10

	LDA bchoice
	CMP #9
     BNE .skipL029
.condpart9
 sta temp7
 lda #>(.bsub10-1)
 pha
 lda #<(.bsub10-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #10
 jmp BS_jsr
.skipL029
.L030 ;;line 39;;  if bchoice = 10 then goto bsub11 bank11

	LDA bchoice
	CMP #10
     BNE .skipL030
.condpart10
 sta temp7
 lda #>(.bsub11-1)
 pha
 lda #<(.bsub11-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #11
 jmp BS_jsr
.skipL030
.L031 ;;line 40;;  if bchoice = 11 then goto bsub12 bank12

	LDA bchoice
	CMP #11
     BNE .skipL031
.condpart11
 sta temp7
 lda #>(.bsub12-1)
 pha
 lda #<(.bsub12-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #12
 jmp BS_jsr
.skipL031
.L032 ;;line 41;;  if bchoice = 12 then goto bsub13 bank13

	LDA bchoice
	CMP #12
     BNE .skipL032
.condpart12
 sta temp7
 lda #>(.bsub13-1)
 pha
 lda #<(.bsub13-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #13
 jmp BS_jsr
.skipL032
.L033 ;;line 42;;  if bchoice = 13 then goto bsub14 bank14

	LDA bchoice
	CMP #13
     BNE .skipL033
.condpart13
 sta temp7
 lda #>(.bsub14-1)
 pha
 lda #<(.bsub14-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #14
 jmp BS_jsr
.skipL033
.L034 ;;line 43;;  if bchoice = 14 then goto bsub15 bank15

	LDA bchoice
	CMP #14
     BNE .skipL034
.condpart14
 sta temp7
 lda #>(.bsub15-1)
 pha
 lda #<(.bsub15-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #15
 jmp BS_jsr
.skipL034
.L035 ;;line 44;;  if bchoice = 15 then goto bsub16 bank16

	LDA bchoice
	CMP #15
     BNE .skipL035
.condpart15
 sta temp7
 lda #>(.bsub16-1)
 pha
 lda #<(.bsub16-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
.skipL035
.
 ;;line 45;; 

.
 ;;line 46;; 

.L036 ;;line 47;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L036formemloc
.L037 ;;line 48;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L038 ;;line 49;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L039 ;;line 50;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L040 ;;line 51;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL040
.condpart16
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL040
.L041 ;;line 52;;  drawscreen

 sta temp7
 lda #(((>(ret_point1-1)) & $0F) | $00) 
 pha
 lda #<(ret_point1-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point1
.L042 ;;line 53;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L036formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L036formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L036formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 1 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 54;; 

.goback
 ;;line 55;; goback

.
 ;;line 56;; 

.L043 ;;line 57;;  bchoice = bchoice + 1 : if bchoice > 15 then bchoice = 0

	INC bchoice
	LDA #15
	CMP bchoice
     BCS .skipL043
.condpart17
	LDA #0
	STA bchoice
.skipL043
.L044 ;;line 58;;  goto main

 jmp .main
.
 ;;line 59;; 

.L045 ;;line 60;;  bank 2

 if ECHO1
 echo "    ",[(start_bank1 - *)]d , "bytes of ROM space left in bank 1")
 endif
ECHO1 = 1
 ORG $1FE0-bscode_length
 RORG $1FE0-bscode_length
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
 RORG $1FFC
 .word (start_bank1 & $ffff)
 .word (start_bank1 & $ffff)
 ORG $2000
 RORG $3000
 repeat 256
 .byte $ff
 repend
.bsub2
 ;;line 61;; bsub2

.L046 ;;line 62;;  score = 2

	LDA #$02
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L047 ;;line 63;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L047formemloc
.L048 ;;line 64;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L049 ;;line 65;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L050 ;;line 66;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L051 ;;line 67;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL051
.condpart18
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL051
.L052 ;;line 68;;  drawscreen

 sta temp7
 lda #(((>(ret_point2-1)) & $0F) | $10) 
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
 ldx #16
 jmp BS_jsr
ret_point2
.L053 ;;line 69;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L047formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L047formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L047formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 2 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 70;; 

.L054 ;;line 71;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 72;; 

.L055 ;;line 73;;  bank 3

 if ECHO2
 echo "    ",[(start_bank2 - *)]d , "bytes of ROM space left in bank 2")
 endif
ECHO2 = 1
 ORG $2FE0-bscode_length
 RORG $3FE0-bscode_length
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
 RORG $3FFC
 .word (start_bank2 & $ffff)
 .word (start_bank2 & $ffff)
 ORG $3000
 RORG $5000
 repeat 256
 .byte $ff
 repend
.bsub3
 ;;line 74;; bsub3

.L056 ;;line 75;;  score = 3

	LDA #$03
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L057 ;;line 76;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L057formemloc
.L058 ;;line 77;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L059 ;;line 78;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L060 ;;line 79;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L061 ;;line 80;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL061
.condpart19
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL061
.L062 ;;line 81;;  drawscreen

 sta temp7
 lda #(((>(ret_point3-1)) & $0F) | $20) 
 pha
 lda #<(ret_point3-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point3
.L063 ;;line 82;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L057formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L057formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L057formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 3 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 83;; 

.L064 ;;line 84;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 85;; 

.L065 ;;line 86;;  bank 4

 if ECHO3
 echo "    ",[(start_bank3 - *)]d , "bytes of ROM space left in bank 3")
 endif
ECHO3 = 1
 ORG $3FE0-bscode_length
 RORG $5FE0-bscode_length
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
 RORG $5FFC
 .word (start_bank3 & $ffff)
 .word (start_bank3 & $ffff)
 ORG $4000
 RORG $7000
 repeat 256
 .byte $ff
 repend
.bsub4
 ;;line 87;; bsub4

.L066 ;;line 88;;  score = 4

	LDA #$04
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L067 ;;line 89;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L067formemloc
.L068 ;;line 90;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L069 ;;line 91;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L070 ;;line 92;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L071 ;;line 93;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL071
.condpart20
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL071
.L072 ;;line 94;;  drawscreen

 sta temp7
 lda #(((>(ret_point4-1)) & $0F) | $30) 
 pha
 lda #<(ret_point4-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point4
.L073 ;;line 95;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L067formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L067formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L067formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 4 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 96;; 

.L074 ;;line 97;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 98;; 

.L075 ;;line 99;;  bank 5

 if ECHO4
 echo "    ",[(start_bank4 - *)]d , "bytes of ROM space left in bank 4")
 endif
ECHO4 = 1
 ORG $4FE0-bscode_length
 RORG $7FE0-bscode_length
start_bank4 ldx #$ff
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
 ORG $4FFC
 RORG $7FFC
 .word (start_bank4 & $ffff)
 .word (start_bank4 & $ffff)
 ORG $5000
 RORG $9000
 repeat 256
 .byte $ff
 repend
.bsub5
 ;;line 100;; bsub5

.L076 ;;line 101;;  score = 5

	LDA #$05
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L077 ;;line 102;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L077formemloc
.L078 ;;line 103;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L079 ;;line 104;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L080 ;;line 105;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L081 ;;line 106;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL081
.condpart21
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL081
.L082 ;;line 107;;  drawscreen

 sta temp7
 lda #(((>(ret_point5-1)) & $0F) | $40) 
 pha
 lda #<(ret_point5-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point5
.L083 ;;line 108;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L077formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L077formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L077formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 5 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 109;; 

.L084 ;;line 110;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 111;; 

.L085 ;;line 112;;  bank 6

 if ECHO5
 echo "    ",[(start_bank5 - *)]d , "bytes of ROM space left in bank 5")
 endif
ECHO5 = 1
 ORG $5FE0-bscode_length
 RORG $9FE0-bscode_length
start_bank5 ldx #$ff
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
 ORG $5FFC
 RORG $9FFC
 .word (start_bank5 & $ffff)
 .word (start_bank5 & $ffff)
 ORG $6000
 RORG $B000
 repeat 256
 .byte $ff
 repend
.bsub6
 ;;line 113;; bsub6

.L086 ;;line 114;;  score = 6

	LDA #$06
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L087 ;;line 115;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L087formemloc
.L088 ;;line 116;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L089 ;;line 117;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L090 ;;line 118;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L091 ;;line 119;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL091
.condpart22
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL091
.L092 ;;line 120;;  drawscreen

 sta temp7
 lda #(((>(ret_point6-1)) & $0F) | $50) 
 pha
 lda #<(ret_point6-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point6
.L093 ;;line 121;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L087formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L087formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L087formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 6 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 122;; 

.L094 ;;line 123;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 124;; 

.L095 ;;line 125;;  bank 7

 if ECHO6
 echo "    ",[(start_bank6 - *)]d , "bytes of ROM space left in bank 6")
 endif
ECHO6 = 1
 ORG $6FE0-bscode_length
 RORG $BFE0-bscode_length
start_bank6 ldx #$ff
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
 ORG $6FFC
 RORG $BFFC
 .word (start_bank6 & $ffff)
 .word (start_bank6 & $ffff)
 ORG $7000
 RORG $D000
 repeat 256
 .byte $ff
 repend
.bsub7
 ;;line 126;; bsub7

.L096 ;;line 127;;  score = 7

	LDA #$07
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L097 ;;line 128;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L097formemloc
.L098 ;;line 129;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L099 ;;line 130;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0100 ;;line 131;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0101 ;;line 132;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0101
.condpart23
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0101
.L0102 ;;line 133;;  drawscreen

 sta temp7
 lda #(((>(ret_point7-1)) & $0F) | $60) 
 pha
 lda #<(ret_point7-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point7
.L0103 ;;line 134;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L097formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L097formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L097formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 7 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 135;; 

.L0104 ;;line 136;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 137;; 

.L0105 ;;line 138;;  bank 8

 if ECHO7
 echo "    ",[(start_bank7 - *)]d , "bytes of ROM space left in bank 7")
 endif
ECHO7 = 1
 ORG $7FE0-bscode_length
 RORG $DFE0-bscode_length
start_bank7 ldx #$ff
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
 ORG $7FFC
 RORG $DFFC
 .word (start_bank7 & $ffff)
 .word (start_bank7 & $ffff)
 ORG $8000
 RORG $F000
 repeat 256
 .byte $ff
 repend
.bsub8
 ;;line 139;; bsub8

.L0106 ;;line 140;;  score = 8

	LDA #$08
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0107 ;;line 141;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0107formemloc
.L0108 ;;line 142;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0109 ;;line 143;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0110 ;;line 144;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0111 ;;line 145;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0111
.condpart24
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0111
.L0112 ;;line 146;;  drawscreen

 sta temp7
 lda #(((>(ret_point8-1)) & $0F) | $70) 
 pha
 lda #<(ret_point8-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point8
.L0113 ;;line 147;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0107formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0107formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0107formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 8 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 148;; 

.L0114 ;;line 149;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 150;; 

.L0115 ;;line 151;;  bank 9

 if ECHO8
 echo "    ",[(start_bank8 - *)]d , "bytes of ROM space left in bank 8")
 endif
ECHO8 = 1
 ORG $8FE0-bscode_length
 RORG $FFE0-bscode_length
start_bank8 ldx #$ff
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
 ORG $8FFC
 RORG $FFFC
 .word (start_bank8 & $ffff)
 .word (start_bank8 & $ffff)
 ORG $9000
 RORG $11000
 repeat 256
 .byte $ff
 repend
.bsub9
 ;;line 152;; bsub9

.L0116 ;;line 153;;  score = 9

	LDA #$09
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0117 ;;line 154;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0117formemloc
.L0118 ;;line 155;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0119 ;;line 156;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0120 ;;line 157;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0121 ;;line 158;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0121
.condpart25
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0121
.L0122 ;;line 159;;  drawscreen

 sta temp7
 lda #(((>(ret_point9-1)) & $0F) | $80) 
 pha
 lda #<(ret_point9-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point9
.L0123 ;;line 160;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0117formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0117formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0117formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 9 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 161;; 

.L0124 ;;line 162;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 163;; 

.L0125 ;;line 164;;  bank 10

 if ECHO9
 echo "    ",[(start_bank9 - *)]d , "bytes of ROM space left in bank 9")
 endif
ECHO9 = 1
 ORG $9FE0-bscode_length
 RORG $11FE0-bscode_length
start_bank9 ldx #$ff
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
 ORG $9FFC
 RORG $11FFC
 .word (start_bank9 & $ffff)
 .word (start_bank9 & $ffff)
 ORG $A000
 RORG $13000
 repeat 256
 .byte $ff
 repend
.bsub10
 ;;line 165;; bsub10

.L0126 ;;line 166;;  score = 10

	LDA #$10
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0127 ;;line 167;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0127formemloc
.L0128 ;;line 168;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0129 ;;line 169;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0130 ;;line 170;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0131 ;;line 171;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0131
.condpart26
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0131
.L0132 ;;line 172;;  drawscreen

 sta temp7
 lda #(((>(ret_point10-1)) & $0F) | $90) 
 pha
 lda #<(ret_point10-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point10
.L0133 ;;line 173;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0127formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0127formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0127formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 10 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 174;; 

.L0134 ;;line 175;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 176;; 

.L0135 ;;line 177;;  bank 11

 if ECHO10
 echo "    ",[(start_bank10 - *)]d , "bytes of ROM space left in bank 10")
 endif
ECHO10 = 1
 ORG $AFE0-bscode_length
 RORG $13FE0-bscode_length
start_bank10 ldx #$ff
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
 ORG $AFFC
 RORG $13FFC
 .word (start_bank10 & $ffff)
 .word (start_bank10 & $ffff)
 ORG $B000
 RORG $15000
 repeat 256
 .byte $ff
 repend
.bsub11
 ;;line 178;; bsub11

.L0136 ;;line 179;;  score = 11

	LDA #$11
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0137 ;;line 180;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0137formemloc
.L0138 ;;line 181;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0139 ;;line 182;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0140 ;;line 183;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0141 ;;line 184;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0141
.condpart27
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0141
.L0142 ;;line 185;;  drawscreen

 sta temp7
 lda #(((>(ret_point11-1)) & $0F) | $a0) 
 pha
 lda #<(ret_point11-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point11
.L0143 ;;line 186;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0137formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0137formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0137formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 11 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 187;; 

.L0144 ;;line 188;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 189;; 

.L0145 ;;line 190;;  bank 12

 if ECHO11
 echo "    ",[(start_bank11 - *)]d , "bytes of ROM space left in bank 11")
 endif
ECHO11 = 1
 ORG $BFE0-bscode_length
 RORG $15FE0-bscode_length
start_bank11 ldx #$ff
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
 ORG $BFFC
 RORG $15FFC
 .word (start_bank11 & $ffff)
 .word (start_bank11 & $ffff)
 ORG $C000
 RORG $17000
 repeat 256
 .byte $ff
 repend
.bsub12
 ;;line 191;; bsub12

.L0146 ;;line 192;;  score = 12

	LDA #$12
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0147 ;;line 193;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0147formemloc
.L0148 ;;line 194;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0149 ;;line 195;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0150 ;;line 196;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0151 ;;line 197;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0151
.condpart28
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0151
.L0152 ;;line 198;;  drawscreen

 sta temp7
 lda #(((>(ret_point12-1)) & $0F) | $b0) 
 pha
 lda #<(ret_point12-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point12
.L0153 ;;line 199;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0147formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0147formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0147formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 12 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 200;; 

.L0154 ;;line 201;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 202;; 

.L0155 ;;line 203;;  bank 13

 if ECHO12
 echo "    ",[(start_bank12 - *)]d , "bytes of ROM space left in bank 12")
 endif
ECHO12 = 1
 ORG $CFE0-bscode_length
 RORG $17FE0-bscode_length
start_bank12 ldx #$ff
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
 ORG $CFFC
 RORG $17FFC
 .word (start_bank12 & $ffff)
 .word (start_bank12 & $ffff)
 ORG $D000
 RORG $19000
 repeat 256
 .byte $ff
 repend
.bsub13
 ;;line 204;; bsub13

.L0156 ;;line 205;;  score = 13

	LDA #$13
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0157 ;;line 206;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0157formemloc
.L0158 ;;line 207;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0159 ;;line 208;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0160 ;;line 209;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0161 ;;line 210;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0161
.condpart29
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0161
.L0162 ;;line 211;;  drawscreen

 sta temp7
 lda #(((>(ret_point13-1)) & $0F) | $c0) 
 pha
 lda #<(ret_point13-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point13
.L0163 ;;line 212;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0157formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0157formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0157formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 13 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 213;; 

.L0164 ;;line 214;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 215;; 

.L0165 ;;line 216;;  bank 14

 if ECHO13
 echo "    ",[(start_bank13 - *)]d , "bytes of ROM space left in bank 13")
 endif
ECHO13 = 1
 ORG $DFE0-bscode_length
 RORG $19FE0-bscode_length
start_bank13 ldx #$ff
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
 ORG $DFFC
 RORG $19FFC
 .word (start_bank13 & $ffff)
 .word (start_bank13 & $ffff)
 ORG $E000
 RORG $1B000
 repeat 256
 .byte $ff
 repend
.bsub14
 ;;line 217;; bsub14

.L0166 ;;line 218;;  score = 14

	LDA #$14
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0167 ;;line 219;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0167formemloc
.L0168 ;;line 220;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0169 ;;line 221;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0170 ;;line 222;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0171 ;;line 223;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0171
.condpart30
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0171
.L0172 ;;line 224;;  drawscreen

 sta temp7
 lda #(((>(ret_point14-1)) & $0F) | $d0) 
 pha
 lda #<(ret_point14-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point14
.L0173 ;;line 225;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0167formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0167formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0167formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 14 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.
 ;;line 226;; 

.L0174 ;;line 227;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 228;; 

.L0175 ;;line 229;;  bank 15

 if ECHO14
 echo "    ",[(start_bank14 - *)]d , "bytes of ROM space left in bank 14")
 endif
ECHO14 = 1
 ORG $EFE0-bscode_length
 RORG $1BFE0-bscode_length
start_bank14 ldx #$ff
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
 ORG $EFFC
 RORG $1BFFC
 .word (start_bank14 & $ffff)
 .word (start_bank14 & $ffff)
 ORG $F000
 RORG $1D000
 repeat 256
 .byte $ff
 repend
.bsub15
 ;;line 230;; bsub15

.L0176 ;;line 231;;  score = 15

	LDA #$15
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0177 ;;line 232;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0177formemloc
.L0178 ;;line 233;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0179 ;;line 234;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0180 ;;line 235;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0181 ;;line 236;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0181
.condpart31
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0181
.L0182 ;;line 237;;  drawscreen

 sta temp7
 lda #(((>(ret_point15-1)) & $0F) | $e0) 
 pha
 lda #<(ret_point15-1)
 pha
 lda #>(drawscreen-1)
 pha
 lda #<(drawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #16
 jmp BS_jsr
ret_point15
.L0183 ;;line 238;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0177formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0177formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0177formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 15 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.L0184 ;;line 239;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 240;; 

.L0185 ;;line 241;;  bank 16

 if ECHO15
 echo "    ",[(start_bank15 - *)]d , "bytes of ROM space left in bank 15")
 endif
ECHO15 = 1
 ORG $FFE0-bscode_length
 RORG $1DFE0-bscode_length
start_bank15 ldx #$ff
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
 ORG $FFFC
 RORG $1DFFC
 .word (start_bank15 & $ffff)
 .word (start_bank15 & $ffff)
 ORG $10000
 RORG $1F000
 repeat 256
 .byte $ff
 repend
; Provided under the CC0 license. See the included LICENSE.txt for details.

     ; This is a 2-line kernel!
     ifnconst vertical_reflect
kernel
     endif
     sta WSYNC
     lda #255
     sta TIM64T

     lda #1
     sta VDELBL
     sta VDELP0
     ldx ballheight
     inx
     inx
     stx temp4
     lda player1y
     sta temp3

     ifconst shakescreen
         jsr doshakescreen
     else
         ldx missile0height
         inx
     endif

     inx
     stx stack1

     lda bally
     sta stack2

     lda player0y
     ldx #0
     sta WSYNC
     stx GRP0
     stx GRP1
     stx PF1L
     stx PF2
     stx CXCLR
     ifconst readpaddle
         stx paddle
     else
         sleep 3
     endif

     sta temp2,x

     ;store these so they can be retrieved later
     ifnconst pfres
         ldx #128-44+(4-pfwidth)*12
     else
         ldx #132-pfres*pfwidth
     endif

     dec player0y

     lda missile0y
     sta temp5
     lda missile1y
     sta temp6

     lda playfieldpos
     sta temp1
     
     ifconst pfrowheight
         lda #pfrowheight+2
     else
         ifnconst pfres
             lda #10
         else
             lda #(96/pfres)+2 ; try to come close to the real size
         endif
     endif
     clc
     sbc playfieldpos
     sta playfieldpos
     jmp .startkernel

.skipDrawP0
     lda #0
     tay
     jmp .continueP0

.skipDrawP1
     lda #0
     tay
     jmp .continueP1

.kerloop     ; enter at cycle 59??

continuekernel
     sleep 2
continuekernel2
     lda ballheight
     
     ifconst pfres
         ldy playfield+pfres*pfwidth-132,x
         sty PF1L ;3
         ldy playfield+pfres*pfwidth-131-pfadjust,x
         sty PF2L ;3
         ldy playfield+pfres*pfwidth-129,x
         sty PF1R ; 3 too early?
         ldy playfield+pfres*pfwidth-130-pfadjust,x
         sty PF2R ;3
     else
         ldy playfield-48+pfwidth*12+44-128,x
         sty PF1L ;3
         ldy playfield-48+pfwidth*12+45-128-pfadjust,x ;4
         sty PF2L ;3
         ldy playfield-48+pfwidth*12+47-128,x ;4
         sty PF1R ; 3 too early?
         ldy playfield-48+pfwidth*12+46-128-pfadjust,x;4
         sty PF2R ;3
     endif

     ; should be playfield+$38 for width=2

     dcp bally
     rol
     rol
     ; rol
     ; rol
goback
     sta ENABL 
.startkernel
     lda player1height ;3
     dcp player1y ;5
     bcc .skipDrawP1 ;2
     ldy player1y ;3
     lda (player1pointer),y ;5; player0pointer must be selected carefully by the compiler
     ; so it doesn't cross a page boundary!

.continueP1
     sta GRP1 ;3

     ifnconst player1colors
         lda missile1height ;3
         dcp missile1y ;5
         rol;2
         rol;2
         sta ENAM1 ;3
     else
         lda (player1color),y
         sta COLUP1
         ifnconst playercolors
             sleep 7
         else
             lda.w player0colorstore
             sta COLUP0
         endif
     endif

     ifconst pfres
         lda playfield+pfres*pfwidth-132,x 
         sta PF1L ;3
         lda playfield+pfres*pfwidth-131-pfadjust,x 
         sta PF2L ;3
         lda playfield+pfres*pfwidth-129,x 
         sta PF1R ; 3 too early?
         lda playfield+pfres*pfwidth-130-pfadjust,x 
         sta PF2R ;3
     else
         lda playfield-48+pfwidth*12+44-128,x ;4
         sta PF1L ;3
         lda playfield-48+pfwidth*12+45-128-pfadjust,x ;4
         sta PF2L ;3
         lda playfield-48+pfwidth*12+47-128,x ;4
         sta PF1R ; 3 too early?
         lda playfield-48+pfwidth*12+46-128-pfadjust,x;4
         sta PF2R ;3
     endif 
     ; sleep 3

     lda player0height
     dcp player0y
     bcc .skipDrawP0
     ldy player0y
     lda (player0pointer),y
.continueP0
     sta GRP0

     ifnconst no_blank_lines
         ifnconst playercolors
             lda missile0height ;3
             dcp missile0y ;5
             sbc stack1
             sta ENAM0 ;3
         else
             lda (player0color),y
             sta player0colorstore
             sleep 6
         endif
         dec temp1
         bne continuekernel
     else
         dec temp1
         beq altkernel2
         ifconst readpaddle
             ldy currentpaddle
             lda INPT0,y
             bpl noreadpaddle
             inc paddle
             jmp continuekernel2
noreadpaddle
             sleep 2
             jmp continuekernel
         else
             ifnconst playercolors 
                 ifconst PFcolors
                     txa
                     tay
                     lda (pfcolortable),y
                     ifnconst backgroundchange
                         sta COLUPF
                     else
                         sta COLUBK
                     endif
                     jmp continuekernel
                 else
                     ifconst kernelmacrodef
                         kernelmacro
                     else
                         sleep 12
                     endif
                 endif
             else
                 lda (player0color),y
                 sta player0colorstore
                 sleep 4
             endif
             jmp continuekernel
         endif
altkernel2
         txa
         ifnconst vertical_reflect
             sbx #256-pfwidth
         else
             sbx #256-pfwidth/2
         endif
         bmi lastkernelline
         ifconst pfrowheight
             lda #pfrowheight
         else
             ifnconst pfres
                 lda #8
             else
                 lda #(96/pfres) ; try to come close to the real size
             endif
         endif
         sta temp1
         jmp continuekernel
     endif

altkernel

     ifconst PFmaskvalue
         lda #PFmaskvalue
     else
         lda #0
     endif
     sta PF1L
     sta PF2


     ;sleep 3

     ;28 cycles to fix things
     ;minus 11=17

     ; lax temp4
     ; clc
     txa
     ifnconst vertical_reflect
         sbx #256-pfwidth
     else
         sbx #256-pfwidth/2
     endif

     bmi lastkernelline

     ifconst PFcolorandheight
         ifconst pfres
             ldy playfieldcolorandheight-131+pfres*pfwidth,x
         else
             ldy playfieldcolorandheight-87,x
         endif
         ifnconst backgroundchange
             sty COLUPF
         else
             sty COLUBK
         endif
         ifconst pfres
             lda playfieldcolorandheight-132+pfres*pfwidth,x
         else
             lda playfieldcolorandheight-88,x
         endif
         sta.w temp1
     endif
     ifconst PFheights
         lsr
         lsr
         tay
         lda (pfheighttable),y
         sta.w temp1
     endif
     ifconst PFcolors
         tay
         lda (pfcolortable),y
         ifnconst backgroundchange
             sta COLUPF
         else
             sta COLUBK
         endif
         ifconst pfrowheight
             lda #pfrowheight
         else
             ifnconst pfres
                 lda #8
             else
                 lda #(96/pfres) ; try to come close to the real size
             endif
         endif
         sta temp1
     endif
     ifnconst PFcolorandheight
         ifnconst PFcolors
             ifnconst PFheights
                 ifnconst no_blank_lines
                     ; read paddle 0
                     ; lo-res paddle read
                     ; bit INPT0
                     ; bmi paddleskipread
                     ; inc paddle0
                     ;donepaddleskip
                     sleep 10
                     ifconst pfrowheight
                         lda #pfrowheight
                     else
                         ifnconst pfres
                             lda #8
                         else
                             lda #(96/pfres) ; try to come close to the real size
                         endif
                     endif
                     sta temp1
                 endif
             endif
         endif
     endif
     

     lda ballheight
     dcp bally
     sbc temp4


     jmp goback


     ifnconst no_blank_lines
lastkernelline
         ifnconst PFcolors
             sleep 10
         else
             ldy #124
             lda (pfcolortable),y
             sta COLUPF
         endif

         ifconst PFheights
             ldx #1
             ;sleep 4
             sleep 3 ; this was over 1 cycle
         else
             ldx playfieldpos
             ;sleep 3
             sleep 2 ; this was over 1 cycle
         endif

         jmp enterlastkernel

     else
lastkernelline
         
         ifconst PFheights
             ldx #1
             ;sleep 5
             sleep 4 ; this was over 1 cycle
         else
             ldx playfieldpos
             ;sleep 4
             sleep 3 ; this was over 1 cycle
         endif

         cpx #0
         bne .enterfromNBL
         jmp no_blank_lines_bailout
     endif

     if ((<*)>$d5)
         align 256
     endif
     ; this is a kludge to prevent page wrapping - fix!!!

.skipDrawlastP1
     lda #0
     tay ; added so we don't cross a page
     jmp .continuelastP1

.endkerloop     ; enter at cycle 59??
     
     nop

.enterfromNBL
     ifconst pfres
         ldy.w playfield+pfres*pfwidth-4
         sty PF1L ;3
         ldy.w playfield+pfres*pfwidth-3-pfadjust
         sty PF2L ;3
         ldy.w playfield+pfres*pfwidth-1
         sty PF1R ; possibly too early?
         ldy.w playfield+pfres*pfwidth-2-pfadjust
         sty PF2R ;3
     else
         ldy.w playfield-48+pfwidth*12+44
         sty PF1L ;3
         ldy.w playfield-48+pfwidth*12+45-pfadjust
         sty PF2L ;3
         ldy.w playfield-48+pfwidth*12+47
         sty PF1R ; possibly too early?
         ldy.w playfield-48+pfwidth*12+46-pfadjust
         sty PF2R ;3
     endif

enterlastkernel
     lda ballheight

     ; tya
     dcp bally
     ; sleep 4

     ; sbc stack3
     rol
     rol
     sta ENABL 

     lda player1height ;3
     dcp player1y ;5
     bcc .skipDrawlastP1
     ldy player1y ;3
     lda (player1pointer),y ;5; player0pointer must be selected carefully by the compiler
     ; so it doesn't cross a page boundary!

.continuelastP1
     sta GRP1 ;3

     ifnconst player1colors
         lda missile1height ;3
         dcp missile1y ;5
     else
         lda (player1color),y
         sta COLUP1
     endif

     dex
     ;dec temp4 ; might try putting this above PF writes
     beq endkernel


     ifconst pfres
         ldy.w playfield+pfres*pfwidth-4
         sty PF1L ;3
         ldy.w playfield+pfres*pfwidth-3-pfadjust
         sty PF2L ;3
         ldy.w playfield+pfres*pfwidth-1
         sty PF1R ; possibly too early?
         ldy.w playfield+pfres*pfwidth-2-pfadjust
         sty PF2R ;3
     else
         ldy.w playfield-48+pfwidth*12+44
         sty PF1L ;3
         ldy.w playfield-48+pfwidth*12+45-pfadjust
         sty PF2L ;3
         ldy.w playfield-48+pfwidth*12+47
         sty PF1R ; possibly too early?
         ldy.w playfield-48+pfwidth*12+46-pfadjust
         sty PF2R ;3
     endif

     ifnconst player1colors
         rol;2
         rol;2
         sta ENAM1 ;3
     else
         ifnconst playercolors
             sleep 7
         else
             lda.w player0colorstore
             sta COLUP0
         endif
     endif
     
     lda.w player0height
     dcp player0y
     bcc .skipDrawlastP0
     ldy player0y
     lda (player0pointer),y
.continuelastP0
     sta GRP0



     ifnconst no_blank_lines
         lda missile0height ;3
         dcp missile0y ;5
         sbc stack1
         sta ENAM0 ;3
         jmp .endkerloop
     else
         ifconst readpaddle
             ldy currentpaddle
             lda INPT0,y
             bpl noreadpaddle2
             inc paddle
             jmp .endkerloop
noreadpaddle2
             sleep 4
             jmp .endkerloop
         else ; no_blank_lines and no paddle reading
             pla
             pha ; 14 cycles in 4 bytes
             pla
             pha
             ; sleep 14
             jmp .endkerloop
         endif
     endif


     ; ifconst donepaddleskip
         ;paddleskipread
         ; this is kind of lame, since it requires 4 cycles from a page boundary crossing
         ; plus we get a lo-res paddle read
         ; bmi donepaddleskip
     ; endif

.skipDrawlastP0
     lda #0
     tay
     jmp .continuelastP0

     ifconst no_blank_lines
no_blank_lines_bailout
         ldx #0
     endif

endkernel
     ; 6 digit score routine
     stx PF1
     stx PF2
     stx PF0
     clc

     ifconst pfrowheight
         lda #pfrowheight+2
     else
         ifnconst pfres
             lda #10
         else
             lda #(96/pfres)+2 ; try to come close to the real size
         endif
     endif

     sbc playfieldpos
     sta playfieldpos
     txa

     ifconst shakescreen
         bit shakescreen
         bmi noshakescreen2
         ldx #$3D
noshakescreen2
     endif

     sta WSYNC,x

     ; STA WSYNC ;first one, need one more
     sta REFP0
     sta REFP1
     STA GRP0
     STA GRP1
     ; STA PF1
     ; STA PF2
     sta HMCLR
     sta ENAM0
     sta ENAM1
     sta ENABL

     lda temp2 ;restore variables that were obliterated by kernel
     sta player0y
     lda temp3
     sta player1y
     ifnconst player1colors
         lda temp6
         sta missile1y
     endif
     ifnconst playercolors
         ifnconst readpaddle
             lda temp5
             sta missile0y
         endif
     endif
     lda stack2
     sta bally

     ; strangely, this isn't required any more. might have
     ; resulted from the no_blank_lines score bounce fix
     ;ifconst no_blank_lines
         ;sta WSYNC
     ;endif

     lda INTIM
     clc
     ifnconst vblank_time
         adc #43+12+87
     else
         adc #vblank_time+12+87

     endif
     ; sta WSYNC
     sta TIM64T

     ifconst minikernel
         jsr minikernel
     endif

     ; now reassign temp vars for score pointers

     ; score pointers contain:
     ; score1-5: lo1,lo2,lo3,lo4,lo5,lo6
     ; swap lo2->temp1
     ; swap lo4->temp3
     ; swap lo6->temp5
     ifnconst noscore
         lda scorepointers+1
         ; ldy temp1
         sta temp1
         ; sty scorepointers+1

         lda scorepointers+3
         ; ldy temp3
         sta temp3
         ; sty scorepointers+3


         sta HMCLR
         tsx
         stx stack1 
         ldx #$E0
         stx HMP0

         LDA scorecolor 
         STA COLUP0
         STA COLUP1
         ifconst scorefade
             STA stack2
         endif
         ifconst pfscore
             lda pfscorecolor
             sta COLUPF
         endif
         sta WSYNC
         ldx #0
         STx GRP0
         STx GRP1 ; seems to be needed because of vdel

         lda scorepointers+5
         ; ldy temp5
         sta temp5,x
         ; sty scorepointers+5
         lda #>scoretable
         sta scorepointers+1
         sta scorepointers+3
         sta scorepointers+5
         sta temp2
         sta temp4
         sta temp6
         LDY #7
         STY VDELP0
         STA RESP0
         STA RESP1


         LDA #$03
         STA NUSIZ0
         STA NUSIZ1
         STA VDELP1
         LDA #$F0
         STA HMP1
         lda (scorepointers),y
         sta GRP0
         STA HMOVE ; cycle 73 ?
         jmp beginscore


         if ((<*)>$d4)
             align 256 ; kludge that potentially wastes space! should be fixed!
         endif

loop2
         lda (scorepointers),y ;+5 68 204
         sta GRP0 ;+3 71 213 D1 -- -- --
         ifconst pfscore
             lda.w pfscore1
             sta PF1
         else
             ifconst scorefade
                 sleep 2
                 dec stack2 ; decrement the temporary scorecolor
             else
                 sleep 7
             endif
         endif
         ; cycle 0
beginscore
         lda (scorepointers+$8),y ;+5 5 15
         sta GRP1 ;+3 8 24 D1 D1 D2 --
         lda (scorepointers+$6),y ;+5 13 39
         sta GRP0 ;+3 16 48 D3 D1 D2 D2
         lax (scorepointers+$2),y ;+5 29 87
         txs
         lax (scorepointers+$4),y ;+5 36 108
         ifconst scorefade
             lda stack2
         else
             sleep 3
         endif

         ifconst pfscore
             lda pfscore2
             sta PF1
         else
             ifconst scorefade
                 sta COLUP0
                 sta COLUP1
             else
                 sleep 6
             endif
         endif

         lda (scorepointers+$A),y ;+5 21 63
         stx GRP1 ;+3 44 132 D3 D3 D4 D2!
         tsx
         stx GRP0 ;+3 47 141 D5 D3! D4 D4
         sta GRP1 ;+3 50 150 D5 D5 D6 D4!
         sty GRP0 ;+3 53 159 D4* D5! D6 D6
         dey
         bpl loop2 ;+2 60 180

         ldx stack1 
         txs
         ; lda scorepointers+1
         ldy temp1
         ; sta temp1
         sty scorepointers+1

         LDA #0 
         sta PF1
         STA GRP0
         STA GRP1
         STA VDELP0
         STA VDELP1;do we need these
         STA NUSIZ0
         STA NUSIZ1

         ; lda scorepointers+3
         ldy temp3
         ; sta temp3
         sty scorepointers+3

         ; lda scorepointers+5
         ldy temp5
         ; sta temp5
         sty scorepointers+5
     endif ;noscore
    ifconst readpaddle
        lda #%11000010
    else
        ifconst qtcontroller
            lda qtcontroller
            lsr    ; bit 0 in carry
            lda #4
            ror    ; carry into top of A
        else
            lda #2
        endif ; qtcontroller
    endif ; readpaddle
 sta WSYNC
 sta VBLANK
 RETURN
     ifconst shakescreen
doshakescreen
         bit shakescreen
         bmi noshakescreen
         sta WSYNC
noshakescreen
         ldx missile0height
         inx
         rts
     endif

; Provided under the CC0 license. See the included LICENSE.txt for details.

start
 sei
 cld
 ldy #0
 lda $D0
 cmp #$2C               ;check RAM location #1
 bne MachineIs2600
 lda $D1
 cmp #$A9               ;check RAM location #2
 bne MachineIs2600
 dey
MachineIs2600
 ldx #0
 txa
clearmem
 inx
 txs
 pha
 bne clearmem
 sty temp1
 ifnconst multisprite
 ifconst pfrowheight
 lda #pfrowheight
 else
 ifconst pfres
 lda #(96/pfres)
 else
 lda #8
 endif
 endif
 sta playfieldpos
 endif
 ldx #5
initscore
 lda #<scoretable
 sta scorepointers,x 
 dex
 bpl initscore
 lda #1
 sta CTRLPF
 ora INTIM
 sta rand

 ifconst multisprite
   jsr multisprite_setup
 endif

 ifnconst bankswitch
   jmp game
 else
   lda #>(game-1)
   pha
   lda #<(game-1)
   pha
   pha
   pha
   ldx #1
   jmp BS_jsr
 endif
; Provided under the CC0 license. See the included LICENSE.txt for details.

; playfield drawing routines
; you get a 32x12 bitmapped display in a single color :)
; 0-31 and 0-11

pfclear ; clears playfield - or fill with pattern
 ifconst pfres
 ldx #pfres*pfwidth-1
 else
 ldx #47-(4-pfwidth)*12 ; will this work?
 endif
pfclear_loop
 ifnconst superchip
 sta playfield,x
 else
 sta playfield-128,x
 endif
 dex
 bpl pfclear_loop
 RETURN
 
setuppointers
 stx temp2 ; store on.off.flip value
 tax ; put x-value in x 
 lsr
 lsr
 lsr ; divide x pos by 8 
 sta temp1
 tya
 asl
 if pfwidth=4
  asl ; multiply y pos by 4
 endif ; else multiply by 2
 clc
 adc temp1 ; add them together to get actual memory location offset
 tay ; put the value in y
 lda temp2 ; restore on.off.flip value
 rts

pfread
;x=xvalue, y=yvalue
 jsr setuppointers
 lda setbyte,x
 and playfield,y
 eor setbyte,x
; beq readzero
; lda #1
; readzero
 RETURN

pfpixel
;x=xvalue, y=yvalue, a=0,1,2
 jsr setuppointers

 ifconst bankswitch
 lda temp2 ; load on.off.flip value (0,1, or 2)
 beq pixelon_r  ; if "on" go to on
 lsr
 bcs pixeloff_r ; value is 1 if true
 lda playfield,y ; if here, it's "flip"
 eor setbyte,x
 ifconst superchip
 sta playfield-128,y
 else
 sta playfield,y
 endif
 RETURN
pixelon_r
 lda playfield,y
 ora setbyte,x
 ifconst superchip
 sta playfield-128,y
 else
 sta playfield,y
 endif
 RETURN
pixeloff_r
 lda setbyte,x
 eor #$ff
 and playfield,y
 ifconst superchip
 sta playfield-128,y
 else
 sta playfield,y
 endif
 RETURN

 else
 jmp plotpoint
 endif

pfhline
;x=xvalue, y=yvalue, a=0,1,2, temp3=endx
 jsr setuppointers
 jmp noinc
keepgoing
 inx
 txa
 and #7
 bne noinc
 iny
noinc
 jsr plotpoint
 cpx temp3
 bmi keepgoing
 RETURN

pfvline
;x=xvalue, y=yvalue, a=0,1,2, temp3=endx
 jsr setuppointers
 sty temp1 ; store memory location offset
 inc temp3 ; increase final x by 1 
 lda temp3
 asl
 if pfwidth=4
   asl ; multiply by 4
 endif ; else multiply by 2
 sta temp3 ; store it
 ; Thanks to Michael Rideout for fixing a bug in this code
 ; right now, temp1=y=starting memory location, temp3=final
 ; x should equal original x value
keepgoingy
 jsr plotpoint
 iny
 iny
 if pfwidth=4
   iny
   iny
 endif
 cpy temp3
 bmi keepgoingy
 RETURN

plotpoint
 lda temp2 ; load on.off.flip value (0,1, or 2)
 beq pixelon  ; if "on" go to on
 lsr
 bcs pixeloff ; value is 1 if true
 lda playfield,y ; if here, it's "flip"
 eor setbyte,x
  ifconst superchip
 sta playfield-128,y
 else
 sta playfield,y
 endif
 rts
pixelon
 lda playfield,y
 ora setbyte,x
 ifconst superchip
 sta playfield-128,y
 else
 sta playfield,y
 endif
 rts
pixeloff
 lda setbyte,x
 eor #$ff
 and playfield,y
 ifconst superchip
 sta playfield-128,y
 else
 sta playfield,y
 endif
 rts

setbyte
 ifnconst pfcenter
 .byte $80
 .byte $40
 .byte $20
 .byte $10
 .byte $08
 .byte $04
 .byte $02
 .byte $01
 endif
 .byte $01
 .byte $02
 .byte $04
 .byte $08
 .byte $10
 .byte $20
 .byte $40
 .byte $80
 .byte $80
 .byte $40
 .byte $20
 .byte $10
 .byte $08
 .byte $04
 .byte $02
 .byte $01
 .byte $01
 .byte $02
 .byte $04
 .byte $08
 .byte $10
 .byte $20
 .byte $40
 .byte $80
; Provided under the CC0 license. See the included LICENSE.txt for details.

pfscroll ;(a=0 left, 1 right, 2 up, 4 down, 6=upup, 12=downdown)
 bne notleft
;left
 ifconst pfres
 ldx #pfres*4
 else
 ldx #48
 endif
leftloop
 lda playfield-1,x
 lsr

 ifconst superchip
 lda playfield-2,x
 rol
 sta playfield-130,x
 lda playfield-3,x
 ror
 sta playfield-131,x
 lda playfield-4,x
 rol
 sta playfield-132,x
 lda playfield-1,x
 ror
 sta playfield-129,x
 else
 rol playfield-2,x
 ror playfield-3,x
 rol playfield-4,x
 ror playfield-1,x
 endif

 txa
 sbx #4
 bne leftloop
 RETURN

notleft
 lsr
 bcc notright
;right

 ifconst pfres
 ldx #pfres*4
 else
 ldx #48
 endif
rightloop
 lda playfield-4,x
 lsr
 ifconst superchip
 lda playfield-3,x
 rol
 sta playfield-131,x
 lda playfield-2,x
 ror
 sta playfield-130,x
 lda playfield-1,x
 rol
 sta playfield-129,x
 lda playfield-4,x
 ror
 sta playfield-132,x
 else
 rol playfield-3,x
 ror playfield-2,x
 rol playfield-1,x
 ror playfield-4,x
 endif
 txa
 sbx #4
 bne rightloop
  RETURN

notright
 lsr
 bcc notup
;up
 lsr
 bcc onedecup
 dec playfieldpos
onedecup
 dec playfieldpos
 beq shiftdown 
 bpl noshiftdown2 
shiftdown
  ifconst pfrowheight
 lda #pfrowheight
 else
 ifnconst pfres
   lda #8
 else
   lda #(96/pfres) ; try to come close to the real size
 endif
 endif

 sta playfieldpos
 lda playfield+3
 sta temp4
 lda playfield+2
 sta temp3
 lda playfield+1
 sta temp2
 lda playfield
 sta temp1
 ldx #0
up2
 lda playfield+4,x
 ifconst superchip
 sta playfield-128,x
 lda playfield+5,x
 sta playfield-127,x
 lda playfield+6,x
 sta playfield-126,x
 lda playfield+7,x
 sta playfield-125,x
 else
 sta playfield,x
 lda playfield+5,x
 sta playfield+1,x
 lda playfield+6,x
 sta playfield+2,x
 lda playfield+7,x
 sta playfield+3,x
 endif
 txa
 sbx #252
 ifconst pfres
 cpx #(pfres-1)*4
 else
 cpx #44
 endif
 bne up2

 lda temp4
 
 ifconst superchip
 ifconst pfres
 sta playfield+pfres*4-129
 lda temp3
 sta playfield+pfres*4-130
 lda temp2
 sta playfield+pfres*4-131
 lda temp1
 sta playfield+pfres*4-132
 else
 sta playfield+47-128
 lda temp3
 sta playfield+46-128
 lda temp2
 sta playfield+45-128
 lda temp1
 sta playfield+44-128
 endif
 else
 ifconst pfres
 sta playfield+pfres*4-1
 lda temp3
 sta playfield+pfres*4-2
 lda temp2
 sta playfield+pfres*4-3
 lda temp1
 sta playfield+pfres*4-4
 else
 sta playfield+47
 lda temp3
 sta playfield+46
 lda temp2
 sta playfield+45
 lda temp1
 sta playfield+44
 endif
 endif
noshiftdown2
 RETURN


notup
;down
 lsr
 bcs oneincup
 inc playfieldpos
oneincup
 inc playfieldpos
 lda playfieldpos

  ifconst pfrowheight
 cmp #pfrowheight+1
 else
 ifnconst pfres
   cmp #9
 else
   cmp #(96/pfres)+1 ; try to come close to the real size
 endif
 endif

 bcc noshiftdown 
 lda #1
 sta playfieldpos

 ifconst pfres
 lda playfield+pfres*4-1
 sta temp4
 lda playfield+pfres*4-2
 sta temp3
 lda playfield+pfres*4-3
 sta temp2
 lda playfield+pfres*4-4
 else
 lda playfield+47
 sta temp4
 lda playfield+46
 sta temp3
 lda playfield+45
 sta temp2
 lda playfield+44
 endif

 sta temp1

 ifconst pfres
 ldx #(pfres-1)*4
 else
 ldx #44
 endif
down2
 lda playfield-1,x
 ifconst superchip
 sta playfield-125,x
 lda playfield-2,x
 sta playfield-126,x
 lda playfield-3,x
 sta playfield-127,x
 lda playfield-4,x
 sta playfield-128,x
 else
 sta playfield+3,x
 lda playfield-2,x
 sta playfield+2,x
 lda playfield-3,x
 sta playfield+1,x
 lda playfield-4,x
 sta playfield,x
 endif
 txa
 sbx #4
 bne down2

 lda temp4
 ifconst superchip
 sta playfield-125
 lda temp3
 sta playfield-126
 lda temp2
 sta playfield-127
 lda temp1
 sta playfield-128
 else
 sta playfield+3
 lda temp3
 sta playfield+2
 lda temp2
 sta playfield+1
 lda temp1
 sta playfield
 endif
noshiftdown
 RETURN
; Provided under the CC0 license. See the included LICENSE.txt for details.

;standard routines needed for pretty much all games
; just the random number generator is left - maybe we should remove this asm file altogether?
; repositioning code and score pointer setup moved to overscan
; read switches, joysticks now compiler generated (more efficient)

randomize
	lda rand
	lsr
 ifconst rand16
	rol rand16
 endif
	bcc noeor
	eor #$B4
noeor
	sta rand
 ifconst rand16
	eor rand16
 endif
	RETURN
; Provided under the CC0 license. See the included LICENSE.txt for details.

drawscreen
     ifconst debugscore
         ldx #14
         lda INTIM ; display # cycles left in the score

         ifconst mincycles
             lda mincycles 
             cmp INTIM
             lda mincycles
             bcc nochange
             lda INTIM
             sta mincycles
nochange
         endif

         ; cmp #$2B
         ; bcs no_cycles_left
         bmi cycles_left
         ldx #64
         eor #$ff ;make negative
cycles_left
         stx scorecolor
         and #$7f ; clear sign bit
         tax
         lda scorebcd,x
         sta score+2
         lda scorebcd1,x
         sta score+1
         jmp done_debugscore 
scorebcd
         .byte $00, $64, $28, $92, $56, $20, $84, $48, $12, $76, $40
         .byte $04, $68, $32, $96, $60, $24, $88, $52, $16, $80, $44
         .byte $08, $72, $36, $00, $64, $28, $92, $56, $20, $84, $48
         .byte $12, $76, $40, $04, $68, $32, $96, $60, $24, $88
scorebcd1
         .byte 0, 0, 1, 1, 2, 3, 3, 4, 5, 5, 6
         .byte 7, 7, 8, 8, 9, $10, $10, $11, $12, $12, $13
         .byte $14, $14, $15, $16, $16, $17, $17, $18, $19, $19, $20
         .byte $21, $21, $22, $23, $23, $24, $24, $25, $26, $26
done_debugscore
     endif

     ifconst debugcycles
         lda INTIM ; if we go over, it mucks up the background color
         ; cmp #$2B
         ; BCC overscan
         bmi overscan
         sta COLUBK
         bcs doneoverscan
     endif

overscan
     ifconst interlaced
         PHP
         PLA 
         EOR #4 ; flip interrupt bit
         PHA
         PLP
         AND #4 ; isolate the interrupt bit
         TAX ; save it for later
     endif

overscanloop
     lda INTIM ;wait for sync
     bmi overscanloop
doneoverscan

     ;do VSYNC

     ifconst interlaced
         CPX #4
         BNE oddframevsync
     endif

     lda #2
     sta WSYNC
     sta VSYNC
     STA WSYNC
     STA WSYNC
     lsr
     STA WSYNC
     STA VSYNC
     sta VBLANK
     ifnconst overscan_time
         lda #37+128
     else
         lda #overscan_time+128
     endif
     sta TIM64T

     ifconst interlaced
         jmp postsync 

oddframevsync
         sta WSYNC

         LDA ($80,X) ; 11 waste
         LDA ($80,X) ; 11 waste
         LDA ($80,X) ; 11 waste

         lda #2
         sta VSYNC
         sta WSYNC
         sta WSYNC
         sta WSYNC

         LDA ($80,X) ; 11 waste
         LDA ($80,X) ; 11 waste
         LDA ($80,X) ; 11 waste

         lda #0
         sta VSYNC
         sta VBLANK
         ifnconst overscan_time
             lda #37+128
         else
             lda #overscan_time+128
         endif
         sta TIM64T

postsync
     endif

     ifconst legacy
         if legacy < 100
             ldx #4
adjustloop
             lda player0x,x
             sec
             sbc #14 ;?
             sta player0x,x
             dex
             bpl adjustloop
         endif
     endif
     if ((<*)>$e9)&&((<*)<$fa)
         repeat ($fa-(<*))
         nop
         repend
     endif
     sta WSYNC
     ldx #4
     SLEEP 3
HorPosLoop     ; 5
     lda player0x,X ;+4 9
     sec ;+2 11
DivideLoop
     sbc #15
     bcs DivideLoop;+4 15
     sta temp1,X ;+4 19
     sta RESP0,X ;+4 23
     sta WSYNC
     dex
     bpl HorPosLoop;+5 5
     ; 4

     ldx #4
     ldy temp1,X
     lda repostable-256,Y
     sta HMP0,X ;+14 18

     dex
     ldy temp1,X
     lda repostable-256,Y
     sta HMP0,X ;+14 32

     dex
     ldy temp1,X
     lda repostable-256,Y
     sta HMP0,X ;+14 46

     dex
     ldy temp1,X
     lda repostable-256,Y
     sta HMP0,X ;+14 60

     dex
     ldy temp1,X
     lda repostable-256,Y
     sta HMP0,X ;+14 74

     sta WSYNC
     
     sta HMOVE ;+3 3


     ifconst legacy
         if legacy < 100
             ldx #4
adjustloop2
             lda player0x,x
             clc
             adc #14 ;?
             sta player0x,x
             dex
             bpl adjustloop2
         endif
     endif




     ;set score pointers
     lax score+2
     jsr scorepointerset
     sty scorepointers+5
     stx scorepointers+2
     lax score+1
     jsr scorepointerset
     sty scorepointers+4
     stx scorepointers+1
     lax score
     jsr scorepointerset
     sty scorepointers+3
     stx scorepointers

vblk
     ; run possible vblank bB code
     ifconst vblank_bB_code
         jsr vblank_bB_code
     endif
vblk2
     LDA INTIM
     bmi vblk2
     jmp kernel
     

     .byte $80,$70,$60,$50,$40,$30,$20,$10,$00
     .byte $F0,$E0,$D0,$C0,$B0,$A0,$90
repostable

scorepointerset
     and #$0F
     asl
     asl
     asl
     adc #<scoretable
     tay 
     txa
     ; and #$F0
     ; lsr
     asr #$F0
     adc #<scoretable
     tax
     rts
;bB.asm
; bB.asm file is split here
.bsub16
 ;;line 242;; bsub16

.L0186 ;;line 243;;  score = 16

	LDA #$16
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L0187 ;;line 244;;  for memloc = 0 to 127

	LDA #0
	STA memloc
.L0187formemloc
.L0188 ;;line 245;;  temp1 = r000[memloc]

	LDX memloc
	LDA r000,x
	STA temp1
.L0189 ;;line 246;;  w000[memloc] = r000[memloc] ^ $ff

	LDX memloc
	LDA r000,x
	EOR #$ff
	LDX memloc
	STA w000,x
.L0190 ;;line 247;;  temp1 = temp1 ^ $ff

	LDA temp1
	EOR #$ff
	STA temp1
.L0191 ;;line 248;;  if r000[memloc] <> temp1 then sc0 = $99 : scorecolor = $42

	LDX memloc
	LDA r000,x
	CMP temp1
     BEQ .skipL0191
.condpart32
	LDA #$99
	STA sc0
	LDA #$42
	STA scorecolor
.skipL0191
.L0192 ;;line 249;;  drawscreen

 jsr drawscreen
.L0193 ;;line 250;;  next

	LDA memloc
	CMP #127
	INC memloc
	bcc .L0187formemloc
 if ( (((((#>*)&$1f)*256)|(#<.L0187formemloc))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0187formemloc))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 16 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.L0194 ;;line 251;;  goto goback bank1

 sta temp7
 lda #>(.goback-1)
 pha
 lda #<(.goback-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 252;; 

 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left in bank 16")
 endif 
ECHOFIRST = 1
 
 
; Provided under the CC0 license. See the included LICENSE.txt for details.
; font equates
.21stcentury = 1
alarmclock = 2     
handwritten = 3    
interrupted = 4    
retroputer = 5    
whimsey = 6
tiny = 7
hex = 8

; feel free to modify the score graphics - just keep each digit 8 high
; and keep the conditional compilation stuff intact
 ifnconst PXE
 ifconst ROM2k
   ORG $F7AC-8
 else
   ifconst bankswitch
     if bankswitch == 8
       ORG $2F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 16
       ORG $4F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 32
       ORG $8F94-bscode_length
       RORG $FF94-bscode_length
     endif
     if bankswitch == 64
       ORG  $10F80-bscode_length
       RORG $1FF80-bscode_length
     endif
   else
     ORG $FF9C
   endif
 endif


 ifconst font
   if font == hex
     ORG . - 48
   endif
 endif
 endif

scoretable

 ifconst font
  if font == .21stcentury
    include "score_graphics.asm.21stcentury"
  endif
  if font == alarmclock
    include "score_graphics.asm.alarmclock"
  endif
  if font == handwritten
    include "score_graphics.asm.handwritten"
  endif
  if font == interrupted
    include "score_graphics.asm.interrupted"
  endif
  if font == retroputer
    include "score_graphics.asm.retroputer"
  endif
  if font == whimsey
    include "score_graphics.asm.whimsey"
  endif
  if font == tiny
    include "score_graphics.asm.tiny"
  endif
  if font == hex
    include "score_graphics.asm.hex"
  endif
 else ; default font

       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %00111100

       .byte %01111110
       .byte %00011000
       .byte %00011000
       .byte %00011000
       .byte %00011000
       .byte %00111000
       .byte %00011000
       .byte %00001000

       .byte %01111110
       .byte %01100000
       .byte %01100000
       .byte %00111100
       .byte %00000110
       .byte %00000110
       .byte %01000110
       .byte %00111100

       .byte %00111100
       .byte %01000110
       .byte %00000110
       .byte %00000110
       .byte %00011100
       .byte %00000110
       .byte %01000110
       .byte %00111100

       .byte %00001100
       .byte %00001100
       .byte %01111110
       .byte %01001100
       .byte %01001100
       .byte %00101100
       .byte %00011100
       .byte %00001100

       .byte %00111100
       .byte %01000110
       .byte %00000110
       .byte %00000110
       .byte %00111100
       .byte %01100000
       .byte %01100000
       .byte %01111110

       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %01111100
       .byte %01100000
       .byte %01100010
       .byte %00111100

       .byte %00110000
       .byte %00110000
       .byte %00110000
       .byte %00011000
       .byte %00001100
       .byte %00000110
       .byte %01000010
       .byte %00111110

       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %00111100
       .byte %01100110
       .byte %01100110
       .byte %00111100

       .byte %00111100
       .byte %01000110
       .byte %00000110
       .byte %00111110
       .byte %01100110
       .byte %01100110
       .byte %01100110
       .byte %00111100 

       ifnconst DPC_kernel_options
 
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000
         .byte %00000000 

       endif

 endif

 ifnconst PXE
 ifconst ROM2k
   ORG $F7FC
 else
   ifconst bankswitch
     if bankswitch == 8
       ORG $2FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 16
       ORG $4FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 32
       ORG $8FF4-bscode_length
       RORG $FFF4-bscode_length
     endif
     if bankswitch == 64
       ORG  $10FE0-bscode_length
       RORG $1FFE0-bscode_length
     endif
   else
     ORG $FFFC
   endif
 endif
 endif
; Provided under the CC0 license. See the included LICENSE.txt for details.

; every bank has this stuff at the same place
; this code can switch to/from any bank at any entry point
; and can preserve register values
; note: lines not starting with a space are not placed in all banks
;
; line below tells the compiler how long this is - do not remove
;size=32

begin_bscode
 ldx #$ff
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

BS_return
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

BS_jsr
 lda bankswitch_hotspot-1,x
 pla
 tax
 pla
 rts
 if ((* & $1FFF) > ((bankswitch_hotspot & $1FFF) - 1))
   echo "WARNING: size parameter in banksw.asm too small - the program probably will not work."
   echo "Change to",[(*-begin_bscode+1)&$FF]d,"and try again."
 endif
; Provided under the CC0 license. See the included LICENSE.txt for details.

 ifconst bankswitch
   if bankswitch == 8
     ORG $2FFC
     RORG $FFFC
   endif
   if bankswitch == 16
     ORG $4FFC
     RORG $FFFC
   endif
   if bankswitch == 32
     ORG $8FFC
     RORG $FFFC
   endif
   if bankswitch == 64
     ORG  $10FF0
     RORG $1FFF0
     lda $ffe0 ; we use wasted space to assist stella with EF format auto-detection
     ORG  $10FF8
     RORG $1FFF8
     ifconst superchip 
       .byte "E","F","S","C"
     else
       .byte "E","F","E","F"
     endif
     ORG  $10FFC
     RORG $1FFFC
   endif
 else
   ifconst ROM2k
     ORG $F7FC
   else
     ORG $FFFC
   endif
 endif
 .word (start & $ffff)
 .word (start & $ffff)
