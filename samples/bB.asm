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

.L03 ;;line 11;;  const split_color = $00

.
 ;;line 12;; 

.
 ;;line 13;; 

.
 ;;line 14;; 

.
 ;;line 15;; 

.
 ;;line 16;; 

.
 ;;line 17;; 

.
 ;;line 18;; 

.
 ;;line 19;; 

.
 ;;line 20;; 

.
 ;;line 21;; 

.
 ;;line 22;; 

.
 ;;line 23;; 

.
 ;;line 24;; 

.
 ;;line 25;; 

.
 ;;line 26;; 

.
 ;;line 27;; 

.
 ;;line 28;; 

.
 ;;line 29;; 

.
 ;;line 30;; 

.
 ;;line 31;; 

.
 ;;line 32;; 

.
 ;;line 33;; 

.
 ;;line 34;; 

.
 ;;line 35;; 

.
 ;;line 36;; 

.
 ;;line 37;; 

.
 ;;line 38;; 

.
 ;;line 39;; 

.
 ;;line 40;; 

.
 ;;line 41;; 

.L04 ;;line 42;;  dim p2_colup0 = a

.L05 ;;line 43;;  dim p2_colup1 = b

.
 ;;line 44;; 

.L06 ;;line 45;;  dim p2_player0y = c

.L07 ;;line 46;;  dim p2_player0x = d

.
 ;;line 47;; 

.L08 ;;line 48;;  dim p2_colupf = e

.
 ;;line 49;; 

.L09 ;;line 50;;  dim p0_room = f

.L010 ;;line 51;;  dim p1_room = g

.
 ;;line 52;; 

.L011 ;;line 53;;  dim p0_oldx = h

.L012 ;;line 54;;  dim p0_oldy = i

.
 ;;line 55;; 

.L013 ;;line 56;;  dim p1_oldx = j

.L014 ;;line 57;;  dim p1_oldy = k

.
 ;;line 58;; 

.L015 ;;line 59;;  dim p2_player1y = l

.L016 ;;line 60;;  dim p2_player1x = m

.
 ;;line 61;; 

.L017 ;;line 62;;  dim p2_player0pointerlo = n

.L018 ;;line 63;;  dim p2_player0pointerhi = o

.
 ;;line 64;; 

.L019 ;;line 65;;  dim p2_player1pointerlo = p

.L020 ;;line 66;;  dim p2_player1pointerhi = q

.
 ;;line 67;; 

.L021 ;;line 68;;  dim anim_timer = r

.L022 ;;line 69;;  dim frame = s

.
 ;;line 70;; 

.L023 ;;line 71;;  dim p1_top_dir = t

.L024 ;;line 72;;  dim p1_bot_dir = u

.
 ;;line 73;; 

.
 ;;line 74;; 

.L025 ;;line 75;;  player0x = 92  :  player0y = 25

	LDA #92
	STA player0x
	LDA #25
	STA player0y
.L026 ;;line 76;;  p2_player0x = 92  :  p2_player0y = 25

	LDA #92
	STA p2_player0x
	LDA #25
	STA p2_player0y
.
 ;;line 77;; 

.L027 ;;line 78;;  player1x = 60  :  player1y = 25

	LDA #60
	STA player1x
	LDA #25
	STA player1y
.L028 ;;line 79;;  p2_player1x = 80  :  p2_player1y = 25

	LDA #80
	STA p2_player1x
	LDA #25
	STA p2_player1y
.
 ;;line 80;; 

.L029 ;;line 81;;  p1_top_dir = 0  :  p1_bot_dir = 1

	LDA #0
	STA p1_top_dir
	LDA #1
	STA p1_bot_dir
.
 ;;line 82;; 

.L030 ;;line 83;;  p0_room = 19  :  p1_room = 18

	LDA #19
	STA p0_room
	LDA #18
	STA p1_room
.
 ;;line 84;; 

.
 ;;line 85;; 

.L031 ;;line 86;;  gosub load_p0_room

 jsr .load_p0_room
.L032 ;;line 87;;  gosub load_p1_room

 jsr .load_p1_room
.
 ;;line 88;; 

.main_loop
 ;;line 89;; main_loop

.
 ;;line 90;; 

.L033 ;;line 91;;  scorecolor = $06

	LDA #$06
	STA scorecolor
.L034 ;;line 92;;  score = 123456

	LDA #$56
	STA score+2
	LDA #$34
	STA score+1
	LDA #$12
	STA score
.
 ;;line 93;; 

.L035 ;;line 94;;  anim_timer = anim_timer  +  1

	INC anim_timer
.L036 ;;line 95;;  if anim_timer = 15 then anim_timer = 0  :  frame = frame  ^  1

	LDA anim_timer
	CMP #15
     BNE .skipL036
.condpart0
	LDA #0
	STA anim_timer
	LDA frame
	EOR #1
	STA frame
.skipL036
.
 ;;line 96;; 

.
 ;;line 97;; 

.L037 ;;line 98;;  if frame = 1 then goto bot_frame1

	LDA frame
	CMP #1
     BNE .skipL037
.condpart1
 jmp .bot_frame1
.skipL037
.
 ;;line 99;; 

.bot_frame0
 ;;line 100;; bot_frame0

.
 ;;line 101;; 

.L038 ;;line 102;;  player0:

	LDX #<playerL038_0
	STX player0pointerlo
	LDA #>playerL038_0
	STA player0pointerhi
	LDA #5
	STA player0height
.
 ;;line 110;; 

.
 ;;line 111;; 

.L039 ;;line 112;;  player1:

	LDX #<playerL039_1
	STX player1pointerlo
	LDA #>playerL039_1
	STA player1pointerhi
	LDA #5
	STA player1height
.L040 ;;line 120;;  goto bot_save

 jmp .bot_save
.
 ;;line 121;; 

.bot_frame1
 ;;line 122;; bot_frame1

.
 ;;line 123;; 

.L041 ;;line 124;;  player0:

	LDX #<playerL041_0
	STX player0pointerlo
	LDA #>playerL041_0
	STA player0pointerhi
	LDA #5
	STA player0height
.
 ;;line 132;; 

.
 ;;line 133;; 

.L042 ;;line 134;;  player1:

	LDX #<playerL042_1
	STX player1pointerlo
	LDA #>playerL042_1
	STA player1pointerhi
	LDA #5
	STA player1height
.
 ;;line 142;; 

.bot_save
 ;;line 143;; bot_save

.
 ;;line 144;; 

.L043 ;;line 145;;  p2_player0pointerlo = player0pointerlo

	LDA player0pointerlo
	STA p2_player0pointerlo
.L044 ;;line 146;;  p2_player0pointerhi = player0pointerhi

	LDA player0pointerhi
	STA p2_player0pointerhi
.L045 ;;line 147;;  p2_player1pointerlo = player1pointerlo

	LDA player1pointerlo
	STA p2_player1pointerlo
.L046 ;;line 148;;  p2_player1pointerhi = player1pointerhi

	LDA player1pointerhi
	STA p2_player1pointerhi
.
 ;;line 149;; 

.
 ;;line 150;; 

.
 ;;line 151;; 

.L047 ;;line 152;;  if frame = 1 then goto top_frame1

	LDA frame
	CMP #1
     BNE .skipL047
.condpart2
 jmp .top_frame1
.skipL047
.
 ;;line 153;; 

.top_frame0
 ;;line 154;; top_frame0

.
 ;;line 155;; 

.L048 ;;line 156;;  player0:

	LDX #<playerL048_0
	STX player0pointerlo
	LDA #>playerL048_0
	STA player0pointerhi
	LDA #5
	STA player0height
.
 ;;line 164;; 

.
 ;;line 165;; 

.L049 ;;line 166;;  player1:

	LDX #<playerL049_1
	STX player1pointerlo
	LDA #>playerL049_1
	STA player1pointerhi
	LDA #5
	STA player1height
.L050 ;;line 174;;  goto top_save

 jmp .top_save
.
 ;;line 175;; 

.top_frame1
 ;;line 176;; top_frame1

.
 ;;line 177;; 

.L051 ;;line 178;;  player0:

	LDX #<playerL051_0
	STX player0pointerlo
	LDA #>playerL051_0
	STA player0pointerhi
	LDA #5
	STA player0height
.
 ;;line 186;; 

.
 ;;line 187;; 

.L052 ;;line 188;;  player1:

	LDX #<playerL052_1
	STX player1pointerlo
	LDA #>playerL052_1
	STA player1pointerhi
	LDA #5
	STA player1height
.top_save
 ;;line 196;; top_save

.
 ;;line 197;; 

.
 ;;line 198;; 

.L053 ;;line 199;;  if p1_top_dir = 0 then player1x = player1x  +  1  :  if player1x  >  80 then p1_top_dir = 1

	LDA p1_top_dir
	CMP #0
     BNE .skipL053
.condpart3
	INC player1x
	LDA #80
	CMP player1x
     BCS .skip3then
.condpart4
	LDA #1
	STA p1_top_dir
.skip3then
.skipL053
.L054 ;;line 200;;  if p1_top_dir = 1 then player1x = player1x  -  1  :  if player1x  <  60 then p1_top_dir = 0

	LDA p1_top_dir
	CMP #1
     BNE .skipL054
.condpart5
	DEC player1x
	LDA player1x
	CMP #60
     BCS .skip5then
.condpart6
	LDA #0
	STA p1_top_dir
.skip5then
.skipL054
.
 ;;line 201;; 

.
 ;;line 202;; 

.L055 ;;line 203;;  if p1_bot_dir = 0 then p2_player1x = p2_player1x  +  1  :  if p2_player1x  >  80 then p1_bot_dir = 1

	LDA p1_bot_dir
	CMP #0
     BNE .skipL055
.condpart7
	INC p2_player1x
	LDA #80
	CMP p2_player1x
     BCS .skip7then
.condpart8
	LDA #1
	STA p1_bot_dir
.skip7then
.skipL055
.L056 ;;line 204;;  if p1_bot_dir = 1 then p2_player1x = p2_player1x  -  1  :  if p2_player1x  <  60 then p1_bot_dir = 0

	LDA p1_bot_dir
	CMP #1
     BNE .skipL056
.condpart9
	DEC p2_player1x
	LDA p2_player1x
	CMP #60
     BCS .skip9then
.condpart10
	LDA #0
	STA p1_bot_dir
.skip9then
.skipL056
.
 ;;line 205;; 

.L057 ;;line 206;;  COLUBK = $00

	LDA #$00
	STA COLUBK
.L058 ;;line 207;;  CTRLPF = $21

	LDA #$21
	STA CTRLPF
.
 ;;line 208;; 

.L059 ;;line 209;;  COLUP0 = $1E

	LDA #$1E
	STA COLUP0
.L060 ;;line 210;;  p2_colup0 = $44

	LDA #$44
	STA p2_colup0
.L061 ;;line 211;;  COLUP1 = $2F

	LDA #$2F
	STA COLUP1
.L062 ;;line 212;;  p2_colup1 = $84

	LDA #$84
	STA p2_colup1
.
 ;;line 213;; 

.
 ;;line 214;; 

.L063 ;;line 215;;  p0_oldx = player0x  :  p0_oldy = player0y

	LDA player0x
	STA p0_oldx
	LDA player0y
	STA p0_oldy
.L064 ;;line 216;;  p1_oldx = p2_player0x  :  p1_oldy = p2_player0y

	LDA p2_player0x
	STA p1_oldx
	LDA p2_player0y
	STA p1_oldy
.
 ;;line 217;; 

.
 ;;line 218;; 

.L065 ;;line 219;;  if joy0up then player0y = player0y  -  1

 lda #$10
 bit SWCHA
	BNE .skipL065
.condpart11
	DEC player0y
.skipL065
.L066 ;;line 220;;  if joy0down then player0y = player0y  +  1

 lda #$20
 bit SWCHA
	BNE .skipL066
.condpart12
	INC player0y
.skipL066
.L067 ;;line 221;;  if joy0left then player0x = player0x  -  1

 bit SWCHA
	BVS .skipL067
.condpart13
	DEC player0x
.skipL067
.L068 ;;line 222;;  if joy0right then player0x = player0x  +  1

 bit SWCHA
	BMI .skipL068
.condpart14
	INC player0x
.skipL068
.
 ;;line 223;; 

.
 ;;line 224;; 

.L069 ;;line 225;;  if joy1up then p2_player0y = p2_player0y  -  1

 lda #1
 bit SWCHA
	BNE .skipL069
.condpart15
	DEC p2_player0y
.skipL069
.L070 ;;line 226;;  if joy1down then p2_player0y = p2_player0y  +  1

 lda #2
 bit SWCHA
	BNE .skipL070
.condpart16
	INC p2_player0y
.skipL070
.L071 ;;line 227;;  if joy1left then p2_player0x = p2_player0x  -  1

 lda #4
 bit SWCHA
	BNE .skipL071
.condpart17
	DEC p2_player0x
.skipL071
.L072 ;;line 228;;  if joy1right then p2_player0x = p2_player0x  +  1

 lda #8
 bit SWCHA
	BNE .skipL072
.condpart18
	INC p2_player0x
.skipL072
.
 ;;line 229;; 

.
 ;;line 230;; 

.L073 ;;line 231;;  if player0y  <  8 then player0y = 42  :  p0_room = move_north[p0_room]  :  gosub load_p0_room

	LDA player0y
	CMP #8
     BCS .skipL073
.condpart19
	LDA #42
	STA player0y
	LDX p0_room
	LDA move_north,x
	STA p0_room
 jsr .load_p0_room
.skipL073
.L074 ;;line 232;;  if player0y  >  44 then player0y = 8  :  p0_room = move_south[p0_room]  :  gosub load_p0_room

	LDA #44
	CMP player0y
     BCS .skipL074
.condpart20
	LDA #8
	STA player0y
	LDX p0_room
	LDA move_south,x
	STA p0_room
 jsr .load_p0_room
.skipL074
.L075 ;;line 233;;  if player0x  <  16 then player0x = 136  :  p0_room = move_west[p0_room]  :  gosub load_p0_room

	LDA player0x
	CMP #16
     BCS .skipL075
.condpart21
	LDA #136
	STA player0x
	LDX p0_room
	LDA move_west,x
	STA p0_room
 jsr .load_p0_room
.skipL075
.L076 ;;line 234;;  if player0x  >  138 then player0x = 24  :  p0_room = move_east[p0_room]  :  gosub load_p0_room

	LDA #138
	CMP player0x
     BCS .skipL076
.condpart22
	LDA #24
	STA player0x
	LDX p0_room
	LDA move_east,x
	STA p0_room
 jsr .load_p0_room
.skipL076
.
 ;;line 235;; 

.
 ;;line 236;; 

.L077 ;;line 237;;  if p2_player0y  <  6 then p2_player0y = 42  :  p1_room = move_north[p1_room]  :  gosub load_p1_room

	LDA p2_player0y
	CMP #6
     BCS .skipL077
.condpart23
	LDA #42
	STA p2_player0y
	LDX p1_room
	LDA move_north,x
	STA p1_room
 jsr .load_p1_room
.skipL077
.L078 ;;line 238;;  if p2_player0y  >  44 then p2_player0y = 8  :  p1_room = move_south[p1_room]  :  gosub load_p1_room

	LDA #44
	CMP p2_player0y
     BCS .skipL078
.condpart24
	LDA #8
	STA p2_player0y
	LDX p1_room
	LDA move_south,x
	STA p1_room
 jsr .load_p1_room
.skipL078
.L079 ;;line 239;;  if p2_player0x  <  16 then p2_player0x = 142  :  p1_room = move_west[p1_room]  :  gosub load_p1_room

	LDA p2_player0x
	CMP #16
     BCS .skipL079
.condpart25
	LDA #142
	STA p2_player0x
	LDX p1_room
	LDA move_west,x
	STA p1_room
 jsr .load_p1_room
.skipL079
.L080 ;;line 240;;  if p2_player0x  >  142 then p2_player0x = 24  :  p1_room = move_east[p1_room]  :  gosub load_p1_room

	LDA #142
	CMP p2_player0x
     BCS .skipL080
.condpart26
	LDA #24
	STA p2_player0x
	LDX p1_room
	LDA move_east,x
	STA p1_room
 jsr .load_p1_room
.skipL080
.
 ;;line 241;; 

.L081 ;;line 242;;  COLUPF = room_color[p0_room]

	LDX p0_room
	LDA room_color,x
	STA COLUPF
.L082 ;;line 243;;  p2_colupf = room_color[p1_room]

	LDX p1_room
	LDA room_color,x
	STA p2_colupf
.
 ;;line 244;; 

.L083 ;;line 245;;  drawscreen

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
 ;;line 246;; 

.L084 ;;line 247;;  if collision(player0,playfield) then gosub knock_back

	bit 	CXP0FB
	BPL .skipL084
.condpart27
 jsr .knock_back
.skipL084
.
 ;;line 248;; 

.L085 ;;line 249;;  goto main_loop

 jmp .main_loop
.
 ;;line 250;; 

.knock_back
 ;;line 251;; knock_back

.L086 ;;line 252;;  player0x = p0_oldx

	LDA p0_oldx
	STA player0x
.L087 ;;line 253;;  player0y = p0_oldy

	LDA p0_oldy
	STA player0y
.L088 ;;line 254;;  p2_player0x = p1_oldx

	LDA p1_oldx
	STA p2_player0x
.L089 ;;line 255;;  p2_player0y = p1_oldy

	LDA p1_oldy
	STA p2_player0y
.L090 ;;line 256;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 257;; 

.
 ;;line 258;; 

.
 ;;line 259;; 

.
 ;;line 260;; 

.load_p0_room
 ;;line 261;; load_p0_room

.L091 ;;line 262;;  temp1 = room_shape[p0_room]

	LDX p0_room
	LDA room_shape,x
	STA temp1
.L092 ;;line 263;;  COLUPF = room_color[p0_room]

	LDX p0_room
	LDA room_color,x
	STA COLUPF
.L093 ;;line 264;;  asm

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

.L094 ;;line 278;;  drawscreen

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
.L095 ;;line 279;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 280;; 

.load_p1_room
 ;;line 281;; load_p1_room

.L096 ;;line 282;;  temp1 = room_shape[p1_room]

	LDX p1_room
	LDA room_shape,x
	STA temp1
.L097 ;;line 283;;  p2_colupf = room_color[p1_room]

	LDX p1_room
	LDA room_color,x
	STA p2_colupf
.L098 ;;line 284;;  asm

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

.L099 ;;line 298;;  drawscreen

 sta temp7
 lda #>(ret_point3-1)
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
 ldx #4
 jmp BS_jsr
ret_point3
.L0100 ;;line 299;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 300;; 

.
 ;;line 301;; 

.
 ;;line 302;; 

.
 ;;line 303;; 

.L0101 ;;line 304;;  data room_shape

	JMP .skipL0101
room_shape
	.byte  7,11,4,1,2,9,10,3,9,12,8,4,15,6,5,3,13

	.byte  11,10,3,5,15,0,1,1,14,8,4,15,14,10,2,12,14

.skipL0101
.
 ;;line 308;; 

.L0102 ;;line 309;;  data move_north

	JMP .skipL0102
move_north
	.byte  0,0,0,0,5,2,4,8,9,0,11,12,0,0,0,14,0,0

	.byte  3,21,0,0,20,0,0,22,23,28,0,27,24,32,0,31

.skipL0102
.
 ;;line 313;; 

.L0103 ;;line 314;;  data move_east

	JMP .skipL0103
move_east
	.byte  1,0,3,4,0,0,7,10,0,0,0,13,0,14,0,17,15,0

	.byte  19,20,0,0,24,22,23,0,0,26,0,0,31,0,0,0

.skipL0103
.
 ;;line 318;; 

.L0104 ;;line 319;;  data move_south

	JMP .skipL0104
move_south
	.byte  2,0,5,18,6,4,0,0,7,8,0,10,11,0,15,0,0,0

	.byte  0,0,22,19,25,26,30,0,0,29,27,0,0,33,31,0

.skipL0104
.
 ;;line 323;; 

.L0105 ;;line 324;;  data move_west

	JMP .skipL0105
move_west
	.byte  0,0,0,2,3,0,0,6,0,0,7,0,0,11,13,16,0,15

	.byte  0,18,19,0,23,24,22,0,27,0,0,0,0,30,0,0

.skipL0105
.
 ;;line 328;; 

.L0106 ;;line 329;;  data room_color

	JMP .skipL0106
room_color
	.byte  $80,$82,$84,$86,$C2,$C4,$62,$66,$68

	.byte  $76,$08,$06,$04,$02,$44,$46,$48

	.byte  $AA,$BC,$CC,$3C,$34,$38,$54,$56,$24

	.byte  $2E,$26,$28,$F4,$F6,$F8,$E4,$A8

.skipL0106
.
 ;;line 335;; 

.L0107 ;;line 336;;  asm

room_pointers_lo

 .byte <PF_data0, <PF_data1, <PF_data2, <PF_data3, <PF_data4, <PF_data5, <PF_data6, <PF_data7

 .byte <PF_data8, <PF_data9, <PF_data10, <PF_data11, <PF_data12, <PF_data13, <PF_data14, <PF_data15

room_pointers_hi

 .byte >PF_data0, >PF_data1, >PF_data2, >PF_data3, >PF_data4, >PF_data5, >PF_data6, >PF_data7

 .byte >PF_data8, >PF_data9, >PF_data10, >PF_data11, >PF_data12, >PF_data13, >PF_data14, >PF_data15

.
 ;;line 344;; 

.
 ;;line 345;; 

.
 ;;line 346;; 

.
 ;;line 347;; 

.draw_room_shape_0
 ;;line 348;; draw_room_shape_0

.L0108 ;;line 349;;  playfield:

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
.L0109 ;;line 367;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 368;; 

.draw_room_shape_1
 ;;line 369;; draw_room_shape_1

.L0110 ;;line 370;;  playfield:

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
.L0111 ;;line 388;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 389;; 

.draw_room_shape_2
 ;;line 390;; draw_room_shape_2

.L0112 ;;line 391;;  playfield:

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
.L0113 ;;line 409;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 410;; 

.draw_room_shape_3
 ;;line 411;; draw_room_shape_3

.L0114 ;;line 412;;  playfield:

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
.L0115 ;;line 430;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 431;; 

.draw_room_shape_4
 ;;line 432;; draw_room_shape_4

.L0116 ;;line 433;;  playfield:

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
.L0117 ;;line 451;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 452;; 

.draw_room_shape_5
 ;;line 453;; draw_room_shape_5

.L0118 ;;line 454;;  playfield:

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
.L0119 ;;line 472;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 473;; 

.draw_room_shape_6
 ;;line 474;; draw_room_shape_6

.L0120 ;;line 475;;  playfield:

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
.L0121 ;;line 493;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 494;; 

.draw_room_shape_7
 ;;line 495;; draw_room_shape_7

.L0122 ;;line 496;;  playfield:

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
.L0123 ;;line 514;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 515;; 

.draw_room_shape_8
 ;;line 516;; draw_room_shape_8

.L0124 ;;line 517;;  playfield:

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
.L0125 ;;line 535;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 536;; 

.draw_room_shape_9
 ;;line 537;; draw_room_shape_9

.L0126 ;;line 538;;  playfield:

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
.L0127 ;;line 556;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 557;; 

.draw_room_shape_10
 ;;line 558;; draw_room_shape_10

.L0128 ;;line 559;;  playfield:

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
.L0129 ;;line 577;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 578;; 

.draw_room_shape_11
 ;;line 579;; draw_room_shape_11

.L0130 ;;line 580;;  playfield:

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
.L0131 ;;line 598;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 599;; 

.draw_room_shape_12
 ;;line 600;; draw_room_shape_12

.L0132 ;;line 601;;  playfield:

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
.L0133 ;;line 619;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 620;; 

.draw_room_shape_13
 ;;line 621;; draw_room_shape_13

.L0134 ;;line 622;;  playfield:

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
.L0135 ;;line 640;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 641;; 

.draw_room_shape_14
 ;;line 642;; draw_room_shape_14

.L0136 ;;line 643;;  playfield:

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
.L0137 ;;line 661;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 662;; 

.draw_room_shape_15
 ;;line 663;; draw_room_shape_15

.L0138 ;;line 664;;  playfield:

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
.L0139 ;;line 682;;  return
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
playerL038_0
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
playerL039_1
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
playerL041_0
	.byte  %01101100
	.byte  %00101000
	.byte  %00111000
	.byte  %11111110
	.byte  %00010000
	.byte  %00101000
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL042_1
	.byte  %00000000
	.byte  %01000010
	.byte  %01100110
	.byte  %01111110
	.byte  %00111100
	.byte  %00011000
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL048_0
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
playerL049_1
	.byte  %00011000
	.byte  %00111100
	.byte  %01111110
	.byte  %11011011
	.byte  %11111111
	.byte  %01011010
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL051_0
	.byte  %01101100
	.byte  %00101000
	.byte  %00111000
	.byte  %01111100
	.byte  %00101000
	.byte  %00010000
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL052_1
	.byte  %00000000
	.byte  %00011000
	.byte  %00111100
	.byte  %01011010
	.byte  %01111110
	.byte  %00100100
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left in bank 4")
 endif 
ECHOFIRST = 1
 
 
 
