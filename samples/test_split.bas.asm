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
; Provided under the CC0 license. See the included LICENSE.txt for details.
; Split Screen Kernel (Modified from original std_kernel.asm in bB 1.9)
; Steve Engelhardt
; 10/8/2026

     ifnconst vertical_reflect
kernel
; --- DUAL SCREEN AUTO-CONFIGURATION ---
 ifconst pfres
     if pfres == 32
split_ram_offset = 64
split_pos_auto   = 68
     endif
     if pfres == 24
split_ram_offset = 48
split_pos_auto   = 84
     endif
     if pfres == 12
split_ram_offset = 24
split_pos_auto   = 108
     endif
 else
     ; Default to 12 lines TOTAL (6 per half) if pfres is omitted
split_ram_offset = 24
split_pos_auto   = 108
 endif
 ; --------------------------------------
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
             lda #(96/pfres)+2 
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

.kerloop

continuekernel
     sleep 2
continuekernel2
     lda ballheight
     
     ifconst pfres
         ldy playfield+pfres*pfwidth-132,x
         sty PF1L ;3
         ldy playfield+pfres*pfwidth-131-pfadjust,x
         sty PF2L ;3
         ;sleep 14 
         ldy playfield+pfres*pfwidth-130,x
         sty PF1 
         ldy playfield+pfres*pfwidth-129-pfadjust,x
         sty PF2
     else
             ldy playfield-48+pfwidth*12+44-128,x
             sty PF1L ;3
             ldy playfield-48+pfwidth*12+45-128-pfadjust,x ;4
             sty PF2L ;3
             
             ldy playfield-48+pfwidth*12+46-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+47-128-pfadjust,x
             sty PF2
         endif

     dcp bally
     rol
     rol
goback
     sta ENABL 
.startkernel
     lda player1height ;3
     dcp player1y ;5
     bcc .skipDrawP1 ;2
     ldy player1y ;3
     lda (player1pointer),y 

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
         ;sleep 14 
         ldy playfield+pfres*pfwidth-130,x
         sty PF1 
         ldy playfield+pfres*pfwidth-129-pfadjust,x
         sty PF2
     else
             lda playfield-48+pfwidth*12+44-128,x ;4
             sta PF1L ;3
             lda playfield-48+pfwidth*12+45-128-pfadjust,x ;4
             sta PF2L ;3
             
             ldy playfield-48+pfwidth*12+46-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+47-128-pfadjust,x
             sty PF2
         endif 

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
                 lda #(96/pfres)
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
                 lda #(96/pfres)
             endif
         endif
         sta temp1
     endif
     ifnconst PFcolorandheight
         ifnconst PFcolors
             ifnconst PFheights
                 ifnconst no_blank_lines
                     ; --- DUAL SCREEN INJECTION POINT ---
                     cpx #split_pos_auto   ; Uses the auto-calculated split line
                     bne SplitNoDivider    ; 3 cycles if branch taken 
                     jmp SplitDoDivider    ; 3 cycles
SplitNoDivider
                     sleep 5               ; 5 cycles (Total: 2+3+5 = 10 cycles for non-split rows)
SplitReturnFromDivider
                     ; --- END INJECTION POINT ---
                     ifconst pfrowheight
                         lda #pfrowheight
                     else
                         ifnconst pfres
                             lda #8
                         else
                             lda #(96/pfres)
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
             sleep 3 
         else
             ldx playfieldpos
             sleep 2 
         endif

         jmp enterlastkernel

     else
lastkernelline
         ifconst PFheights
             ldx #1
             sleep 4 
         else
             ldx playfieldpos
             sleep 3 
         endif

         cpx #0
         bne .enterfromNBL
         jmp no_blank_lines_bailout
     endif

     if ((<*)>$d5)
         align 256
     endif

.skipDrawlastP1
     lda #0
     tay 
     jmp .continuelastP1

.endkerloop     
     nop

.enterfromNBL
     ifconst pfres
         ldy.w playfield+pfres*pfwidth-4
         sty PF1L ;3
         ldy.w playfield+pfres*pfwidth-3-pfadjust
         sty PF2L ;3
         ;sleep 14 
         ldy playfield+pfres*pfwidth-130,x
         sty PF1 
         ldy playfield+pfres*pfwidth-129-pfadjust,x
         sty PF2
     else
             ldy.w playfield-48+pfwidth*12+44
             sty PF1L ;3
             ldy.w playfield-48+pfwidth*12+45-pfadjust
             sty PF2L ;3
             
             ldy playfield-48+pfwidth*12+46-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+47-128-pfadjust,x
             sty PF2
         endif

enterlastkernel
     lda ballheight

     dcp bally
     rol
     rol
     sta ENABL 

     lda player1height ;3
     dcp player1y ;5
     bcc .skipDrawlastP1
     ldy player1y ;3
     lda (player1pointer),y 

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
     beq endkernel

     ifconst pfres
         ldy.w playfield+pfres*pfwidth-4
         sty PF1L ;3
         ldy.w playfield+pfres*pfwidth-3-pfadjust
         sty PF2L ;3

         ;sleep 14 
         ldy playfield+pfres*pfwidth-130,x
         sty PF1 
         ldy playfield+pfres*pfwidth-129-pfadjust,x
         sty PF2

     else
             ldy.w playfield-48+pfwidth*12+44
             sty PF1L ;3
             ldy.w playfield-48+pfwidth*12+45-pfadjust
             sty PF2L ;3
             
             ldy playfield-48+pfwidth*12+46-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+47-128-pfadjust,x
             sty PF2
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
         else 
             pla
             pha 
             pla
             pha
             jmp .endkerloop
         endif
     endif

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
     clc

     ifconst pfrowheight
         lda #pfrowheight+2
     else
         ifnconst pfres
             lda #10
         else
             lda #(96/pfres)+2 
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

     sta REFP0
     sta REFP1
     STA GRP0
     STA GRP1
     sta HMCLR
     sta ENAM0
     sta ENAM1
     sta ENABL

     lda temp2 
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

     lda INTIM
     clc
     ifnconst vblank_time
         adc #43+12+87
     else
         adc #vblank_time+12+87

     endif
     sta TIM64T

     ifconst minikernel
         jsr minikernel
     endif

     ifnconst noscore
         lda scorepointers+1
         sta temp1
         lda scorepointers+3
         sta temp3

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
         STx GRP1 

         lda scorepointers+5
         sta temp5,x
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
         STA HMOVE 
         jmp beginscore

         if ((<*)>$d4)
             align 256 
         endif

loop2
         lda (scorepointers),y 
         sta GRP0 
         ifconst pfscore
             lda.w pfscore1
             sta PF1
         else
             ifconst scorefade
                 sleep 2
                 dec stack2 
             else
                 sleep 7
             endif
         endif
beginscore
         lda (scorepointers+$8),y 
         sta GRP1 
         lda (scorepointers+$6),y 
         sta GRP0 
         lax (scorepointers+$2),y 
         txs
         lax (scorepointers+$4),y 
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

         lda (scorepointers+$A),y 
         stx GRP1 
         tsx
         stx GRP0 
         sta GRP1 
         sty GRP0 
         dey
         bpl loop2 

         ldx stack1 
         txs
         ldy temp1
         sty scorepointers+1

         LDA #0 
         sta PF1
         STA GRP0
         STA GRP1
         STA VDELP0
         STA VDELP1
         STA NUSIZ0
         STA NUSIZ1

         ldy temp3
         sty scorepointers+3

         ldy temp5
         sty scorepointers+5
     endif 
    ifconst readpaddle
        lda #%11000010
    else
        ifconst qtcontroller
            lda qtcontroller
            lsr    
            lda #4
            ror    
        else
            lda #2
        endif 
    endif 
 sta WSYNC
 sta VBLANK
 jmp SplitReturnSafely

SplitDoDivider
     txa               ; Push playfield offset X to stack
     pha               
     
     ; Clear leftover top-screen playfield to prevent divider artifacts
     ifconst split_color
         lda #0
         sta PF1       
         sta PF2
     endif
     
     ; Scanline 1: The 1-Pixel Colored Line + Clamps
     sta WSYNC
     ifconst split_color
         lda #split_color
         sta COLUBK    
     endif
     
     lda p2_player0y
     sta player0y
     lda p2_player1y         
     sta player1y
     lda p2_player0pointerlo
     sta player0pointerlo
     lda p2_player0pointerhi
     sta player0pointerhi

     ; Clamp Player 1 X 
     lda p2_player1x
     cmp #160          
     bcc .d_safe
     cmp #240          
     bcs .d_left
     lda #159          
     bne .d_safe       
.d_left  
     lda #0            
.d_safe  
     tax               
         
     ; Clamp Player 0 X 
     lda p2_player0x
     cmp #160
     bcc .c_safe
     cmp #240
     bcs .c_left
     lda #159
     bne .c_safe
.c_left  
     lda #0
.c_safe  
     tay               
         
     ; Scanline 2: Turn off color + Position P0
     sta WSYNC
     ifconst split_color
         lda #0
         sta COLUBK      
         lda temp1       ; <--- FIXED: Harmless 3-cycle read replaces destructive CXCLR!
         nop             ; 2-cycle padding 
     else
         sleep 10        
     endif
     tya               
     sec
SplitPosP0
     sbc #15
     bcs SplitPosP0
     sta RESP0         
     tay               
     
     ; Scanline 3: Position P1 
     sta WSYNC
     sleep 10          
     txa               
     sec
SplitPosP1
     sbc #15
     bcs SplitPosP1
     sta RESP1         
     tax               

     ; Scanline 4: Fine Positioning Math + Remaining Swaps
     sta WSYNC
     sta HMCLR         ; Keeps the ball from shifting!
     tya               
     eor #7
     asl
     asl
     asl
     asl
     sta HMP0

     txa               
     eor #7
     asl
     asl
     asl
     asl
     sta HMP1
     
     ; Offload remaining variable swaps to Scanline 4
     lda p2_colupf
     sta COLUPF        
     lda p2_colup0
     sta COLUP0        
     lda p2_colup1
     sta COLUP1        
     lda p2_player1pointerlo
     sta player1pointerlo 
     lda p2_player1pointerhi
     sta player1pointerhi 
     
     ; Scanline 5: Apply fine position, restore playfield, and phase sync
     sta WSYNC
     sta HMOVE         
     
     pla
     tax               
         
     ; Proven 25-cycle playfield phase sync
     sleep 10
     sleep 15
         
     jmp SplitReturnFromDivider
SplitReturnSafely
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
