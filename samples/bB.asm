game
.L00 ;;line 1;;  set kernel split

.L01 ;;line 2;;  set romsize 16kSC

.
 ;;line 3;; 

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

.L02 ;;line 9;;  const pfres = 32

.
 ;;line 10;; 

.L03 ;;line 11;;  dim p2_player0y = a

.L04 ;;line 12;;  dim p2_player0x = b

.L05 ;;line 13;;  dim p2_colupf = c

.
 ;;line 14;; 

.L06 ;;line 15;;  dim p0_room = d

.L07 ;;line 16;;  dim p1_room = e

.
 ;;line 17;; 

.L08 ;;line 18;;  dim p0_oldx = f

.L09 ;;line 19;;  dim p0_oldy = g

.
 ;;line 20;; 

.L010 ;;line 21;;  dim p1_oldx = h

.L011 ;;line 22;;  dim p1_oldy = i

.
 ;;line 23;; 

.L012 ;;line 24;;  dim p2_player1y = j

.L013 ;;line 25;;  dim p2_player1x = k

.
 ;;line 26;; 

.L014 ;;line 27;;  dim p2_player0pointerlo = l

.L015 ;;line 28;;  dim p2_player0pointerhi = m

.
 ;;line 29;; 

.L016 ;;line 30;;  dim p2_player1pointerlo = n

.L017 ;;line 31;;  dim p2_player1pointerhi = o

.
 ;;line 32;; 

.L018 ;;line 33;;  dim p2_colup0 = p

.L019 ;;line 34;;  dim p2_colup1 = q

.
 ;;line 35;; 

.
 ;;line 36;; 

.L020 ;;line 37;;  player0x = 92  :  player0y = 25

	LDA #92
	STA player0x
	LDA #25
	STA player0y
.L021 ;;line 38;;  p2_player0x = 92  :  p2_player0y = 25

	LDA #92
	STA p2_player0x
	LDA #25
	STA p2_player0y
.L022 ;;line 39;;  player1x = 70  :  player1y = 25

	LDA #70
	STA player1x
	LDA #25
	STA player1y
.L023 ;;line 40;;  p2_player1x = 70  :  p2_player1y = 25

	LDA #70
	STA p2_player1x
	LDA #25
	STA p2_player1y
.L024 ;;line 41;;  p0_room = 19  :  p1_room = 18

	LDA #19
	STA p0_room
	LDA #18
	STA p1_room
.
 ;;line 42;; 

.
 ;;line 43;; 

.L025 ;;line 44;;  gosub load_p0_room

 jsr .load_p0_room
.L026 ;;line 45;;  gosub load_p1_room

 jsr .load_p1_room
.
 ;;line 46;; 

.
 ;;line 47;; 

.
 ;;line 48;; 

.L027 ;;line 49;;  player0:

	LDX #<playerL027_0
	STX player0pointerlo
	LDA #>playerL027_0
	STA player0pointerhi
	LDA #5
	STA player0height
.
 ;;line 57;; 

.
 ;;line 58;; 

.L028 ;;line 59;;  p2_player0pointerlo = player0pointerlo

	LDA player0pointerlo
	STA p2_player0pointerlo
.L029 ;;line 60;;  p2_player0pointerhi = player0pointerhi

	LDA player0pointerhi
	STA p2_player0pointerhi
.
 ;;line 61;; 

.L030 ;;line 62;;  player1:

	LDX #<playerL030_1
	STX player1pointerlo
	LDA #>playerL030_1
	STA player1pointerhi
	LDA #5
	STA player1height
.
 ;;line 70;; 

.
 ;;line 71;; 

.L031 ;;line 72;;  p2_player1pointerlo = player1pointerlo

	LDA player1pointerlo
	STA p2_player1pointerlo
.L032 ;;line 73;;  p2_player1pointerhi = player1pointerhi

	LDA player1pointerhi
	STA p2_player1pointerhi
.
 ;;line 74;; 

.
 ;;line 75;; 

.main_loop
 ;;line 76;; main_loop

.
 ;;line 77;; 

.
 ;;line 78;; 

.
 ;;line 79;; 

.L033 ;;line 80;;  player0:

	LDX #<playerL033_0
	STX player0pointerlo
	LDA #>playerL033_0
	STA player0pointerhi
	LDA #5
	STA player0height
.
 ;;line 88;; 

.L034 ;;line 89;;  player1:

	LDX #<playerL034_1
	STX player1pointerlo
	LDA #>playerL034_1
	STA player1pointerhi
	LDA #5
	STA player1height
.
 ;;line 97;; 

.L035 ;;line 98;;  COLUBK = $00

	LDA #$00
	STA COLUBK
.L036 ;;line 99;;  CTRLPF = $21

	LDA #$21
	STA CTRLPF
.
 ;;line 100;; 

.L037 ;;line 101;;  COLUP0 = $1E

	LDA #$1E
	STA COLUP0
.L038 ;;line 102;;  p2_colup0 = $44

	LDA #$44
	STA p2_colup0
.L039 ;;line 103;;  COLUP1 = $2F

	LDA #$2F
	STA COLUP1
.L040 ;;line 104;;  p2_colup1 = $84

	LDA #$84
	STA p2_colup1
.
 ;;line 105;; 

.
 ;;line 106;; 

.L041 ;;line 107;;  p0_oldx = player0x  :  p0_oldy = player0y

	LDA player0x
	STA p0_oldx
	LDA player0y
	STA p0_oldy
.L042 ;;line 108;;  p1_oldx = p2_player0x  :  p1_oldy = p2_player0y

	LDA p2_player0x
	STA p1_oldx
	LDA p2_player0y
	STA p1_oldy
.
 ;;line 109;; 

.
 ;;line 110;; 

.L043 ;;line 111;;  if joy0up then player0y = player0y  -  1

 lda #$10
 bit SWCHA
	BNE .skipL043
.condpart0
	DEC player0y
.skipL043
.L044 ;;line 112;;  if joy0down then player0y = player0y  +  1

 lda #$20
 bit SWCHA
	BNE .skipL044
.condpart1
	INC player0y
.skipL044
.L045 ;;line 113;;  if joy0left then player0x = player0x  -  1

 bit SWCHA
	BVS .skipL045
.condpart2
	DEC player0x
.skipL045
.L046 ;;line 114;;  if joy0right then player0x = player0x  +  1

 bit SWCHA
	BMI .skipL046
.condpart3
	INC player0x
.skipL046
.
 ;;line 115;; 

.
 ;;line 116;; 

.L047 ;;line 117;;  if joy1up then p2_player0y = p2_player0y  -  1

 lda #1
 bit SWCHA
	BNE .skipL047
.condpart4
	DEC p2_player0y
.skipL047
.L048 ;;line 118;;  if joy1down then p2_player0y = p2_player0y  +  1

 lda #2
 bit SWCHA
	BNE .skipL048
.condpart5
	INC p2_player0y
.skipL048
.L049 ;;line 119;;  if joy1left then p2_player0x = p2_player0x  -  1

 lda #4
 bit SWCHA
	BNE .skipL049
.condpart6
	DEC p2_player0x
.skipL049
.L050 ;;line 120;;  if joy1right then p2_player0x = p2_player0x  +  1

 lda #8
 bit SWCHA
	BNE .skipL050
.condpart7
	INC p2_player0x
.skipL050
.
 ;;line 121;; 

.
 ;;line 122;; 

.L051 ;;line 123;;  if player0y  <  8 then player0y = 42  :  p0_room = move_north[p0_room]  :  gosub load_p0_room

	LDA player0y
	CMP #8
     BCS .skipL051
.condpart8
	LDA #42
	STA player0y
	LDX p0_room
	LDA move_north,x
	STA p0_room
 jsr .load_p0_room
.skipL051
.L052 ;;line 124;;  if player0y  >  44 then player0y = 8  :  p0_room = move_south[p0_room]  :  gosub load_p0_room

	LDA #44
	CMP player0y
     BCS .skipL052
.condpart9
	LDA #8
	STA player0y
	LDX p0_room
	LDA move_south,x
	STA p0_room
 jsr .load_p0_room
.skipL052
.L053 ;;line 125;;  if player0x  <  16 then player0x = 136  :  p0_room = move_west[p0_room]  :  gosub load_p0_room

	LDA player0x
	CMP #16
     BCS .skipL053
.condpart10
	LDA #136
	STA player0x
	LDX p0_room
	LDA move_west,x
	STA p0_room
 jsr .load_p0_room
.skipL053
.L054 ;;line 126;;  if player0x  >  138 then player0x = 24  :  p0_room = move_east[p0_room]  :  gosub load_p0_room

	LDA #138
	CMP player0x
     BCS .skipL054
.condpart11
	LDA #24
	STA player0x
	LDX p0_room
	LDA move_east,x
	STA p0_room
 jsr .load_p0_room
.skipL054
.
 ;;line 127;; 

.
 ;;line 128;; 

.L055 ;;line 129;;  if p2_player0y  <  6 then p2_player0y = 42  :  p1_room = move_north[p1_room]  :  gosub load_p1_room

	LDA p2_player0y
	CMP #6
     BCS .skipL055
.condpart12
	LDA #42
	STA p2_player0y
	LDX p1_room
	LDA move_north,x
	STA p1_room
 jsr .load_p1_room
.skipL055
.L056 ;;line 130;;  if p2_player0y  >  44 then p2_player0y = 8  :  p1_room = move_south[p1_room]  :  gosub load_p1_room

	LDA #44
	CMP p2_player0y
     BCS .skipL056
.condpart13
	LDA #8
	STA p2_player0y
	LDX p1_room
	LDA move_south,x
	STA p1_room
 jsr .load_p1_room
.skipL056
.L057 ;;line 131;;  if p2_player0x  <  16 then p2_player0x = 142  :  p1_room = move_west[p1_room]  :  gosub load_p1_room

	LDA p2_player0x
	CMP #16
     BCS .skipL057
.condpart14
	LDA #142
	STA p2_player0x
	LDX p1_room
	LDA move_west,x
	STA p1_room
 jsr .load_p1_room
.skipL057
.L058 ;;line 132;;  if p2_player0x  >  142 then p2_player0x = 24  :  p1_room = move_east[p1_room]  :  gosub load_p1_room

	LDA #142
	CMP p2_player0x
     BCS .skipL058
.condpart15
	LDA #24
	STA p2_player0x
	LDX p1_room
	LDA move_east,x
	STA p1_room
 jsr .load_p1_room
.skipL058
.
 ;;line 133;; 

.L059 ;;line 134;;  COLUPF = room_color[p0_room]

	LDX p0_room
	LDA room_color,x
	STA COLUPF
.L060 ;;line 135;;  p2_colupf = room_color[p1_room]

	LDX p1_room
	LDA room_color,x
	STA p2_colupf
.
 ;;line 136;; 

.L061 ;;line 137;;  drawscreen

 sta temp7
 lda #>(ret_point1-1)
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
 ldx #4
 jmp BS_jsr
ret_point1
.
 ;;line 138;; 

.L062 ;;line 139;;  if collision(player0,playfield) then gosub knock_back

	bit 	CXP0FB
	BPL .skipL062
.condpart16
 jsr .knock_back
.skipL062
.
 ;;line 140;; 

.L063 ;;line 141;;  goto main_loop

 jmp .main_loop
.
 ;;line 142;; 

.knock_back
 ;;line 143;; knock_back

.L064 ;;line 144;;  player0x = p0_oldx

	LDA p0_oldx
	STA player0x
.L065 ;;line 145;;  player0y = p0_oldy

	LDA p0_oldy
	STA player0y
.L066 ;;line 146;;  p2_player0x = p1_oldx

	LDA p1_oldx
	STA p2_player0x
.L067 ;;line 147;;  p2_player0y = p1_oldy

	LDA p1_oldy
	STA p2_player0y
.L068 ;;line 148;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 149;; 

.
 ;;line 150;; 

.
 ;;line 151;; 

.
 ;;line 152;; 

.load_p0_room
 ;;line 153;; load_p0_room

.L069 ;;line 154;;  temp1 = room_shape[p0_room]

	LDX p0_room
	LDA room_shape,x
	STA temp1
.L070 ;;line 155;;  COLUPF = room_color[p0_room]

	LDX p0_room
	LDA room_color,x
	STA COLUPF
.L071 ;;line 156;;  asm

   ldx temp1

   lda room_pointers_lo,x

   sta temp5

   lda room_pointers_hi,x

   sta temp6

   

   ldy #(split_ram_offset - 1)  

.loopTop

   lda (temp5),y

   sta playfield-128,y

   dey

   bpl .loopTop

.L072 ;;line 170;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 171;; 

.load_p1_room
 ;;line 172;; load_p1_room

.L073 ;;line 173;;  temp1 = room_shape[p1_room]

	LDX p1_room
	LDA room_shape,x
	STA temp1
.L074 ;;line 174;;  p2_colupf = room_color[p1_room]

	LDX p1_room
	LDA room_color,x
	STA p2_colupf
.L075 ;;line 175;;  asm

   ldx temp1

   lda room_pointers_lo,x

   sta temp5

   lda room_pointers_hi,x

   sta temp6

   

   ldy #(split_ram_offset - 1)  

.loopBot

   lda (temp5),y

   sta playfield-128+split_ram_offset,y  

   dey

   bpl .loopBot

.L076 ;;line 189;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 190;; 

.
 ;;line 191;; 

.
 ;;line 192;; 

.
 ;;line 193;; 

.L077 ;;line 194;;  data room_shape

	JMP .skipL077
room_shape
	.byte  7,11,4,1,2,9,10,3,9,12,8,4,15,6,5,3,13

	.byte  11,10,3,5,15,0,1,1,14,8,4,15,14,10,2,12,14

.skipL077
.
 ;;line 198;; 

.L078 ;;line 199;;  data move_north

	JMP .skipL078
move_north
	.byte  0,0,0,0,5,2,4,8,9,0,11,12,0,0,0,14,0,0

	.byte  3,21,0,0,20,0,0,22,23,28,0,27,24,32,0,31

.skipL078
.
 ;;line 203;; 

.L079 ;;line 204;;  data move_east

	JMP .skipL079
move_east
	.byte  1,0,3,4,0,0,7,10,0,0,0,13,0,14,0,17,15,0

	.byte  19,20,0,0,24,22,23,0,0,26,0,0,31,0,0,0

.skipL079
.
 ;;line 208;; 

.L080 ;;line 209;;  data move_south

	JMP .skipL080
move_south
	.byte  2,0,5,18,6,4,0,0,7,8,0,10,11,0,15,0,0,0

	.byte  0,0,22,19,25,26,30,0,0,29,27,0,0,33,31,0

.skipL080
.
 ;;line 213;; 

.L081 ;;line 214;;  data move_west

	JMP .skipL081
move_west
	.byte  0,0,0,2,3,0,0,6,0,0,7,0,0,11,13,16,0,15

	.byte  0,18,19,0,23,24,22,0,27,0,0,0,0,30,0,0

.skipL081
.
 ;;line 218;; 

.L082 ;;line 219;;  data room_color

	JMP .skipL082
room_color
	.byte  $80,$82,$84,$86,$C2,$C4,$62,$66,$68

	.byte  $76,$08,$06,$04,$02,$44,$46,$48

	.byte  $AA,$BC,$CC,$3C,$34,$38,$54,$56,$24

	.byte  $2E,$26,$28,$F4,$F6,$F8,$E4,$A8

.skipL082
.
 ;;line 225;; 

.L083 ;;line 226;;  asm

room_pointers_lo

 .byte <PF_data0, <PF_data1, <PF_data2, <PF_data3, <PF_data4, <PF_data5, <PF_data6, <PF_data7

 .byte <PF_data8, <PF_data9, <PF_data10, <PF_data11, <PF_data12, <PF_data13, <PF_data14, <PF_data15

room_pointers_hi

 .byte >PF_data0, >PF_data1, >PF_data2, >PF_data3, >PF_data4, >PF_data5, >PF_data6, >PF_data7

 .byte >PF_data8, >PF_data9, >PF_data10, >PF_data11, >PF_data12, >PF_data13, >PF_data14, >PF_data15

.
 ;;line 234;; 

.
 ;;line 235;; 

.
 ;;line 236;; 

.
 ;;line 237;; 

.draw_room_shape_0
 ;;line 238;; draw_room_shape_0

.L084 ;;line 239;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel0
PF_data0
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
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
.L085 ;;line 257;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 258;; 

.draw_room_shape_1
 ;;line 259;; draw_room_shape_1

.L086 ;;line 260;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel1
PF_data1
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel1
	lda PF_data1,x
	sta playfield-128,x
	dex
	bpl pflabel1
.L087 ;;line 278;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 279;; 

.draw_room_shape_2
 ;;line 280;; draw_room_shape_2

.L088 ;;line 281;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel2
PF_data2
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel2
	lda PF_data2,x
	sta playfield-128,x
	dex
	bpl pflabel2
.L089 ;;line 299;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 300;; 

.draw_room_shape_3
 ;;line 301;; draw_room_shape_3

.L090 ;;line 302;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel3
PF_data3
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel3
	lda PF_data3,x
	sta playfield-128,x
	dex
	bpl pflabel3
.L091 ;;line 320;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 321;; 

.draw_room_shape_4
 ;;line 322;; draw_room_shape_4

.L092 ;;line 323;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel4
PF_data4
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel4
	lda PF_data4,x
	sta playfield-128,x
	dex
	bpl pflabel4
.L093 ;;line 341;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 342;; 

.draw_room_shape_5
 ;;line 343;; draw_room_shape_5

.L094 ;;line 344;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel5
PF_data5
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel5
	lda PF_data5,x
	sta playfield-128,x
	dex
	bpl pflabel5
.L095 ;;line 362;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 363;; 

.draw_room_shape_6
 ;;line 364;; draw_room_shape_6

.L096 ;;line 365;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel6
PF_data6
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel6
	lda PF_data6,x
	sta playfield-128,x
	dex
	bpl pflabel6
.L097 ;;line 383;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 384;; 

.draw_room_shape_7
 ;;line 385;; draw_room_shape_7

.L098 ;;line 386;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel7
PF_data7
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel7
	lda PF_data7,x
	sta playfield-128,x
	dex
	bpl pflabel7
.L099 ;;line 404;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 405;; 

.draw_room_shape_8
 ;;line 406;; draw_room_shape_8

.L0100 ;;line 407;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel8
PF_data8
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel8
	lda PF_data8,x
	sta playfield-128,x
	dex
	bpl pflabel8
.L0101 ;;line 425;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 426;; 

.draw_room_shape_9
 ;;line 427;; draw_room_shape_9

.L0102 ;;line 428;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel9
PF_data9
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel9
	lda PF_data9,x
	sta playfield-128,x
	dex
	bpl pflabel9
.L0103 ;;line 446;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 447;; 

.draw_room_shape_10
 ;;line 448;; draw_room_shape_10

.L0104 ;;line 449;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel10
PF_data10
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel10
	lda PF_data10,x
	sta playfield-128,x
	dex
	bpl pflabel10
.L0105 ;;line 467;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 468;; 

.draw_room_shape_11
 ;;line 469;; draw_room_shape_11

.L0106 ;;line 470;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel11
PF_data11
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel11
	lda PF_data11,x
	sta playfield-128,x
	dex
	bpl pflabel11
.L0107 ;;line 488;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 489;; 

.draw_room_shape_12
 ;;line 490;; draw_room_shape_12

.L0108 ;;line 491;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel12
PF_data12
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel12
	lda PF_data12,x
	sta playfield-128,x
	dex
	bpl pflabel12
.L0109 ;;line 509;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 510;; 

.draw_room_shape_13
 ;;line 511;; draw_room_shape_13

.L0110 ;;line 512;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel13
PF_data13
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel13
	lda PF_data13,x
	sta playfield-128,x
	dex
	bpl pflabel13
.L0111 ;;line 530;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 531;; 

.draw_room_shape_14
 ;;line 532;; draw_room_shape_14

.L0112 ;;line 533;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel14
PF_data14
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel14
	lda PF_data14,x
	sta playfield-128,x
	dex
	bpl pflabel14
.L0113 ;;line 551;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 552;; 

.draw_room_shape_15
 ;;line 553;; draw_room_shape_15

.L0114 ;;line 554;;  playfield:

  ifconst pfres
	  ldx #(16>pfres)*(pfres*pfwidth-1)+(16<=pfres)*63
  else
	  ldx #((16*pfwidth-1)*((16*pfwidth-1)<47))+(47*((16*pfwidth-1)>=47))
  endif
	jmp pflabel15
PF_data15
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000010, %00000101
	if (pfwidth>2)
	.byte %11000010, %00000101
 endif
	.byte %11000010, %00000101
	if (pfwidth>2)
	.byte %11000010, %00000101
 endif
	.byte %11000011, %00000111
	if (pfwidth>2)
	.byte %11000011, %00000111
 endif
	.byte %11000011, %00000111
	if (pfwidth>2)
	.byte %11000011, %00000111
 endif
	.byte %11000011, %01100111
	if (pfwidth>2)
	.byte %11000011, %01100111
 endif
	.byte %11000011, %11111111
	if (pfwidth>2)
	.byte %11000011, %11111111
 endif
	.byte %11000011, %11111111
	if (pfwidth>2)
	.byte %11000011, %11111111
 endif
	.byte %11000011, %11111111
	if (pfwidth>2)
	.byte %11000011, %11111111
 endif
	.byte %11000011, %11111111
	if (pfwidth>2)
	.byte %11000011, %11111111
 endif
	.byte %11000011, %01111111
	if (pfwidth>2)
	.byte %11000011, %01111111
 endif
	.byte %11000011, %00111111
	if (pfwidth>2)
	.byte %11000011, %00111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel15
	lda PF_data15,x
	sta playfield-128,x
	dex
	bpl pflabel15
.L0115 ;;line 572;;  return
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
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
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL027_0
	.byte  %01101100
	.byte  %00101000
	.byte  %00111000
	.byte  %11111110
	.byte  %00111000
	.byte  %00111000
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL030_1
	.byte  %10000001
	.byte  %11000011
	.byte  %11100111
	.byte  %11111111
	.byte  %00111100
	.byte  %00011000
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL033_0
	.byte  %01101100
	.byte  %00101000
	.byte  %00111000
	.byte  %01111100
	.byte  %00010000
	.byte  %00111000
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL034_1
	.byte  %00011000
	.byte  %00111100
	.byte  %01111110
	.byte  %11011011
	.byte  %11111111
	.byte  %01011010
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left in bank 4")
 endif 
ECHOFIRST = 1
 
 
 
