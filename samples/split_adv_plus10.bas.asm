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

.L02 ;;line 5;;  const pfres = 24

.L03 ;;line 6;;  const noscore = 1

.L04 ;;line 7;;  const split_color = $A0

.
 ;;line 8;; 

.
 ;;line 9;; 

.
 ;;line 10;; 

.
 ;;line 11;; 

.
 ;;line 12;; 

.
 ;;line 13;; 

.L05 ;;line 14;;  const DEBUG_NO_SWALLOW = 1

.
 ;;line 15;; 

.
 ;;line 16;; 

.
 ;;line 17;; 

.
 ;;line 18;; 

.L06 ;;line 19;;  dim top_player0x = player0x

.L07 ;;line 20;;  dim top_player0y = player0y

.L08 ;;line 21;;  dim top_player1x = player1x

.L09 ;;line 22;;  dim top_player1y = player1y

.L010 ;;line 23;;  dim top_colup0 = COLUP0

.L011 ;;line 24;;  dim top_colup1 = COLUP1

.L012 ;;line 25;;  dim top_colupf = COLUPF

.L013 ;;line 26;;  dim top_p0_ptr_lo = player0pointerlo

.L014 ;;line 27;;  dim top_p0_ptr_hi = player0pointerhi

.L015 ;;line 28;;  dim top_p1_ptr_lo = player1pointerlo

.L016 ;;line 29;;  dim top_p1_ptr_hi = player1pointerhi

.
 ;;line 30;; 

.
 ;;line 31;; 

.
 ;;line 32;; 

.
 ;;line 33;; 

.L017 ;;line 34;;  const OBJ_RED_DRAGON = 0

.L018 ;;line 35;;  const OBJ_YEL_DRAGON = 1

.L019 ;;line 36;;  const OBJ_GRN_DRAGON = 2

.L020 ;;line 37;;  const OBJ_MAGNET = 3

.L021 ;;line 38;;  const OBJ_SWORD = 4

.L022 ;;line 39;;  const OBJ_CHALICE = 5

.L023 ;;line 40;;  const OBJ_BRIDGE = 6

.L024 ;;line 41;;  const OBJ_YEL_KEY = 7

.L025 ;;line 42;;  const OBJ_WHT_KEY = 8

.L026 ;;line 43;;  const OBJ_BLK_KEY = 9

.L027 ;;line 44;;  const OBJ_BAT = 10

.
 ;;line 45;; 

.L028 ;;line 46;;  const ENTRY_YELLOW = 2

.L029 ;;line 47;;  const ENTRY_WHITE = 23

.L030 ;;line 48;;  const ENTRY_BLACK = 13

.L031 ;;line 49;;  const CASTLE_YELLOW = 1

.L032 ;;line 50;;  const CASTLE_WHITE = 21

.L033 ;;line 51;;  const CASTLE_BLACK = 12

.
 ;;line 52;; 

.
 ;;line 53;; 

.
 ;;line 54;; 

.
 ;;line 55;; 

.
 ;;line 56;; 

.L034 ;;line 57;;  dim w_top_obj_room = w000

.L035 ;;line 58;;  dim w_bot_obj_room = w011

.L036 ;;line 59;;  dim w_top_oldx = w022

.L037 ;;line 60;;  dim w_top_oldy = w023

.L038 ;;line 61;;  dim w_bottom_oldx = w024

.L039 ;;line 62;;  dim w_bottom_oldy = w025

.L040 ;;line 63;;  dim w_top_carry_off_x = w026

.L041 ;;line 64;;  dim w_top_carry_off_y = w027

.L042 ;;line 65;;  dim w_bot_carry_off_x = w028

.L043 ;;line 66;;  dim w_bot_carry_off_y = w029

.L044 ;;line 67;;  dim w_top_obj_hit = w030

.L045 ;;line 68;;  dim w_bot_obj_hit = w031

.
 ;;line 69;; 

.
 ;;line 70;; 

.L046 ;;line 71;;  dim r_top_obj_room = r000

.L047 ;;line 72;;  dim r_bot_obj_room = r011

.L048 ;;line 73;;  dim r_top_oldx = r022

.L049 ;;line 74;;  dim r_top_oldy = r023

.L050 ;;line 75;;  dim r_bottom_oldx = r024

.L051 ;;line 76;;  dim r_bottom_oldy = r025

.L052 ;;line 77;;  dim r_top_carry_off_x = r026

.L053 ;;line 78;;  dim r_top_carry_off_y = r027

.L054 ;;line 79;;  dim r_bot_carry_off_x = r028

.L055 ;;line 80;;  dim r_bot_carry_off_y = r029

.L056 ;;line 81;;  dim r_top_obj_hit = r030

.L057 ;;line 82;;  dim r_bot_obj_hit = r031

.
 ;;line 83;; 

.
 ;;line 84;; 

.
 ;;line 85;; 

.
 ;;line 86;; 

.L058 ;;line 87;;  dim top_obj_x = var0

.L059 ;;line 88;;  dim top_obj_y = var11

.L060 ;;line 89;;  dim bot_obj_x = var22

.L061 ;;line 90;;  dim bot_obj_y = var33

.L062 ;;line 91;;  dim room_flags = var44

.L063 ;;line 92;;  dim bot_flicker_idx = var45

.L064 ;;line 93;;  dim flicker_idx = var46

.L065 ;;line 94;;  dim top_cxp1fb = var47

.
 ;;line 95;; 

.
 ;;line 96;; 

.
 ;;line 97;; 

.
 ;;line 98;; 

.L066 ;;line 99;;  dim bottom_colup0 = a

.L067 ;;line 100;;  dim bottom_colup1 = b

.L068 ;;line 101;;  dim bottom_player0y = c

.L069 ;;line 102;;  dim bottom_player0x = d

.L070 ;;line 103;;  dim bottom_colupf = e

.L071 ;;line 104;;  dim top_room = f

.L072 ;;line 105;;  dim bottom_room = g

.L073 ;;line 106;;  dim top_carried_item = h

.L074 ;;line 107;;  dim bot_carried_item = i

.L075 ;;line 108;;  dim gate_state = j

.L076 ;;line 109;;  dim top_drag_state = k

.L077 ;;line 110;;  dim bottom_player1y = l

.L078 ;;line 111;;  dim bottom_player1x = m

.L079 ;;line 112;;  dim bottom_p0_ptr_lo = n

.L080 ;;line 113;;  dim bottom_p0_ptr_hi = o

.L081 ;;line 114;;  dim bottom_p1_ptr_lo = p

.L082 ;;line 115;;  dim bottom_p1_ptr_hi = q

.L083 ;;line 116;;  dim bot_drag_state = r

.L084 ;;line 117;;  dim drag_dead = s

.
 ;;line 118;; 

.L085 ;;line 119;;  dim p2_ballx = v

.L086 ;;line 120;;  dim p2_bally = w

.
 ;;line 121;; 

.L087 ;;line 122;;  dim top_cxblpf = y

.L088 ;;line 123;;  dim top_cxp0fb = z

.
 ;;line 124;; 

.
 ;;line 125;; 

.
 ;;line 126;; 

.
 ;;line 127;; 

.L089 ;;line 128;;  ballx = 92  :  bally = 38

	LDA #92
	STA ballx
	LDA #38
	STA bally
.L090 ;;line 129;;  p2_ballx = 92  :  p2_bally = 38

	LDA #92
	STA p2_ballx
	LDA #38
	STA p2_bally
.L091 ;;line 130;;  ballheight = 4

	LDA #4
	STA ballheight
.
 ;;line 131;; 

.
 ;;line 132;; 

.L092 ;;line 133;;  top_player0x = 71  :  top_player0y = 255

	LDA #71
	STA top_player0x
	LDA #255
	STA top_player0y
.L093 ;;line 134;;  bottom_player0x = 76  :  bottom_player0y = 255

	LDA #76
	STA bottom_player0x
	LDA #255
	STA bottom_player0y
.
 ;;line 135;; 

.L094 ;;line 136;;  top_player1x = 120  :  top_player1y = 255

	LDA #120
	STA top_player1x
	LDA #255
	STA top_player1y
.L095 ;;line 137;;  bottom_player1x = 120  :  bottom_player1y = 255

	LDA #120
	STA bottom_player1x
	LDA #255
	STA bottom_player1y
.
 ;;line 138;; 

.L096 ;;line 139;;  missile0y = 255  :  missile1y = 255

	LDA #255
	STA missile0y
	STA missile1y
.
 ;;line 140;; 

.
 ;;line 141;; 

.L097 ;;line 142;;  player0:

	LDX #<playerL097_0
	STX player0pointerlo
	LDA #>playerL097_0
	STA player0pointerhi
	LDA #14
	STA player0height
.
 ;;line 159;; 

.L098 ;;line 160;;  bottom_p0_ptr_lo = top_p0_ptr_lo

	LDA top_p0_ptr_lo
	STA bottom_p0_ptr_lo
.L099 ;;line 161;;  bottom_p0_ptr_hi = top_p0_ptr_hi

	LDA top_p0_ptr_hi
	STA bottom_p0_ptr_hi
.L0100 ;;line 162;;  player0height = 15

	LDA #15
	STA player0height
.L0101 ;;line 163;;  NUSIZ0 = 5

	LDA #5
	STA NUSIZ0
.
 ;;line 164;; 

.L0102 ;;line 165;;  top_room = 2  :  bottom_room = 2

	LDA #2
	STA top_room
	STA bottom_room
.L0103 ;;line 166;;  room_flags = 0

	LDA #0
	STA room_flags
.L0104 ;;line 167;;  gosub init_level_2 bank2

 sta temp7
 lda #>(ret_point1-1)
 pha
 lda #<(ret_point1-1)
 pha
 lda #>(.init_level_2-1)
 pha
 lda #<(.init_level_2-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
ret_point1
.L0105 ;;line 168;;  gosub load_top_room

 jsr .load_top_room
.L0106 ;;line 169;;  gosub load_bottom_room

 jsr .load_bottom_room
.L0107 ;;line 170;;  gosub check_gates bank3

 sta temp7
 lda #>(ret_point2-1)
 pha
 lda #<(ret_point2-1)
 pha
 lda #>(.check_gates-1)
 pha
 lda #<(.check_gates-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point2
.
 ;;line 171;; 

.main_loop
 ;;line 172;; main_loop

.
 ;;line 173;; 

.
 ;;line 174;; 

.
 ;;line 175;; 

.L0108 ;;line 176;;  PF0 = 0

	LDA #0
	STA PF0
.L0109 ;;line 177;;  COLUBK = $04

	LDA #$04
	STA COLUBK
.L0110 ;;line 178;;  CTRLPF = $21

	LDA #$21
	STA CTRLPF
.L0111 ;;line 179;;  NUSIZ0 = 5

	LDA #5
	STA NUSIZ0
.L0112 ;;line 180;;  top_colup0 = $02

	LDA #$02
	STA top_colup0
.L0113 ;;line 181;;  bottom_colup0 = $02

	LDA #$02
	STA bottom_colup0
.
 ;;line 182;; 

.
 ;;line 183;; 

.L0114 ;;line 184;;  room_flags = room_flags  ^  $80

	LDA room_flags
	EOR #$80
	STA room_flags
.
 ;;line 185;; 

.
 ;;line 186;; 

.L0115 ;;line 187;;  w_top_oldx = ballx  :  w_top_oldy = bally

	LDA ballx
	STA w_top_oldx
	LDA bally
	STA w_top_oldy
.L0116 ;;line 188;;  w_bottom_oldx = p2_ballx  :  w_bottom_oldy = p2_bally

	LDA p2_ballx
	STA w_bottom_oldx
	LDA p2_bally
	STA w_bottom_oldy
.
 ;;line 189;; 

.
 ;;line 190;; 

.L0117 ;;line 191;;  if top_drag_state{7} then goto _skip_top_move

	BIT top_drag_state
	BPL .skipL0117
.condpart0
 jmp ._skip_top_move
.skipL0117
.L0118 ;;line 192;;  if joy0up then bally = bally  -  1

 lda #$10
 bit SWCHA
	BNE .skipL0118
.condpart1
	DEC bally
.skipL0118
.L0119 ;;line 193;;  if joy0down then bally = bally  +  1

 lda #$20
 bit SWCHA
	BNE .skipL0119
.condpart2
	INC bally
.skipL0119
.L0120 ;;line 194;;  if joy0left then ballx = ballx  -  1

 bit SWCHA
	BVS .skipL0120
.condpart3
	DEC ballx
.skipL0120
.L0121 ;;line 195;;  if joy0right then ballx = ballx  +  1

 bit SWCHA
	BMI .skipL0121
.condpart4
	INC ballx
.skipL0121
._skip_top_move
 ;;line 196;; _skip_top_move

.
 ;;line 197;; 

.
 ;;line 198;; 

.L0122 ;;line 199;;  if bot_drag_state{7} then goto _skip_bot_move

	BIT bot_drag_state
	BPL .skipL0122
.condpart5
 jmp ._skip_bot_move
.skipL0122
.L0123 ;;line 200;;  if joy1up then p2_bally = p2_bally  -  1

 lda #1
 bit SWCHA
	BNE .skipL0123
.condpart6
	DEC p2_bally
.skipL0123
.L0124 ;;line 201;;  if joy1down then p2_bally = p2_bally  +  1

 lda #2
 bit SWCHA
	BNE .skipL0124
.condpart7
	INC p2_bally
.skipL0124
.L0125 ;;line 202;;  if joy1left then p2_ballx = p2_ballx  -  1

 lda #4
 bit SWCHA
	BNE .skipL0125
.condpart8
	DEC p2_ballx
.skipL0125
.L0126 ;;line 203;;  if joy1right then p2_ballx = p2_ballx  +  1

 lda #8
 bit SWCHA
	BNE .skipL0126
.condpart9
	INC p2_ballx
.skipL0126
._skip_bot_move
 ;;line 204;; _skip_bot_move

.
 ;;line 205;; 

.L0127 ;;line 206;;  top_colupf = room_color[top_room]

	LDX top_room
	LDA room_color,x
	STA top_colupf
.L0128 ;;line 207;;  bottom_colupf = room_color[bottom_room]

	LDX bottom_room
	LDA room_color,x
	STA bottom_colupf
.
 ;;line 208;; 

.
 ;;line 209;; 

.L0129 ;;line 210;;  temp1 = top_carried_item

	LDA top_carried_item
	STA temp1
.L0130 ;;line 211;;  if temp1  <>  255 then w_top_obj_room[temp1] = top_room  :  top_obj_x[temp1] = ballx  +  r_top_carry_off_x  :  top_obj_y[temp1] = bally  +  r_top_carry_off_y

	LDA temp1
	CMP #255
     BEQ .skipL0130
.condpart10
	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA ballx
	CLC
	ADC r_top_carry_off_x
	LDX temp1
	STA top_obj_x,x
	LDA bally
	CLC
	ADC r_top_carry_off_y
	LDX temp1
	STA top_obj_y,x
.skipL0130
.
 ;;line 212;; 

.
 ;;line 213;; 

.L0131 ;;line 214;;  temp1 = bot_carried_item

	LDA bot_carried_item
	STA temp1
.L0132 ;;line 215;;  if temp1  <>  255 then w_bot_obj_room[temp1] = bottom_room  :  bot_obj_x[temp1] = p2_ballx  +  r_bot_carry_off_x  :  bot_obj_y[temp1] = p2_bally  +  r_bot_carry_off_y

	LDA temp1
	CMP #255
     BEQ .skipL0132
.condpart11
	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA p2_ballx
	CLC
	ADC r_bot_carry_off_x
	LDX temp1
	STA bot_obj_x,x
	LDA p2_bally
	CLC
	ADC r_bot_carry_off_y
	LDX temp1
	STA bot_obj_y,x
.skipL0132
.
 ;;line 216;; 

.
 ;;line 217;; 

.L0133 ;;line 218;;  gosub run_flicker_logic bank2

 sta temp7
 lda #>(ret_point3-1)
 pha
 lda #<(ret_point3-1)
 pha
 lda #>(.run_flicker_logic-1)
 pha
 lda #<(.run_flicker_logic-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
ret_point3
.
 ;;line 219;; 

.L0134 ;;line 220;;  drawscreen

 sta temp7
 lda #>(ret_point4-1)
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
 ldx #4
 jmp BS_jsr
ret_point4
.
 ;;line 221;; 

.
 ;;line 222;; 

.
 ;;line 223;; 

.
 ;;line 224;; 

.L0135 ;;line 225;;  if top_cxp0fb{6} then gosub gate_collide_top bank3

	BIT top_cxp0fb
	BVC .skipL0135
.condpart12
 sta temp7
 lda #>(ret_point5-1)
 pha
 lda #<(ret_point5-1)
 pha
 lda #>(.gate_collide_top-1)
 pha
 lda #<(.gate_collide_top-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point5
.skipL0135
.L0136 ;;line 226;;  if top_cxblpf{7}  &&  !top_drag_state{7} then ballx = r_top_oldx  :  bally = r_top_oldy

	BIT top_cxblpf
	BPL .skipL0136
.condpart13
	BIT top_drag_state
	BMI .skip13then
.condpart14
	LDA r_top_oldx
	STA ballx
	LDA r_top_oldy
	STA bally
.skip13then
.skipL0136
.
 ;;line 227;; 

.L0137 ;;line 228;;  if collision(player0,ball) then gosub gate_collide_bot bank3

	bit 	CXP0FB
	BVC .skipL0137
.condpart15
 sta temp7
 lda #>(ret_point6-1)
 pha
 lda #<(ret_point6-1)
 pha
 lda #>(.gate_collide_bot-1)
 pha
 lda #<(.gate_collide_bot-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point6
.skipL0137
.L0138 ;;line 229;;  if collision(ball,playfield)  &&  !bot_drag_state{7} then p2_ballx = r_bottom_oldx  :  p2_bally = r_bottom_oldy

	bit 	CXBLPF
	BPL .skipL0138
.condpart16
	BIT bot_drag_state
	BMI .skip16then
.condpart17
	LDA r_bottom_oldx
	STA p2_ballx
	LDA r_bottom_oldy
	STA p2_bally
.skip16then
.skipL0138
.
 ;;line 230;; 

.
 ;;line 231;; 

.
 ;;line 232;; 

.
 ;;line 233;; 

.
 ;;line 234;; 

.L0139 ;;line 235;;  if !room_flags{7} then goto _even_frame_logic

	BIT room_flags
	BMI .skipL0139
.condpart18
 jmp ._even_frame_logic
.skipL0139
.L0140 ;;line 236;;  goto _odd_frame_logic

 jmp ._odd_frame_logic
.
 ;;line 237;; 

._even_frame_logic
 ;;line 238;; _even_frame_logic

.
 ;;line 239;; 

.L0141 ;;line 240;;  if bally  <  32  ||  bally  >  44 then gosub castle_transitions_top bank3

	LDA bally
	CMP #32
     BCS .skipL0141
.condpart19
 jmp .condpart20
.skipL0141
	LDA #44
	CMP bally
     BCS .skip2OR
.condpart20
 sta temp7
 lda #>(ret_point7-1)
 pha
 lda #<(ret_point7-1)
 pha
 lda #>(.castle_transitions_top-1)
 pha
 lda #<(.castle_transitions_top-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point7
.skip2OR
.
 ;;line 241;; 

.L0142 ;;line 242;;  if bally  <  3 then bally = 44  :  w_top_oldy = 44  :  top_room = move_north[top_room]  :  room_flags{0} = 1

	LDA bally
	CMP #3
     BCS .skipL0142
.condpart21
	LDA #44
	STA bally
	STA w_top_oldy
	LDX top_room
	LDA move_north,x
	STA top_room
	LDA room_flags
	ORA #1
	STA room_flags
.skipL0142
.L0143 ;;line 243;;  if bally  >  44 then bally = 3  :  w_top_oldy = 3  :  top_room = move_south[top_room]  :  room_flags{0} = 1

	LDA #44
	CMP bally
     BCS .skipL0143
.condpart22
	LDA #3
	STA bally
	STA w_top_oldy
	LDX top_room
	LDA move_south,x
	STA top_room
	LDA room_flags
	ORA #1
	STA room_flags
.skipL0143
.L0144 ;;line 244;;  if ballx  <  17 then ballx = 139  :  w_top_oldx = 139  :  top_room = move_west[top_room]  :  room_flags{0} = 1

	LDA ballx
	CMP #17
     BCS .skipL0144
.condpart23
	LDA #139
	STA ballx
	STA w_top_oldx
	LDX top_room
	LDA move_west,x
	STA top_room
	LDA room_flags
	ORA #1
	STA room_flags
.skipL0144
.L0145 ;;line 245;;  if ballx  >  139 then ballx = 17  :  w_top_oldx = 17  :  top_room = move_east[top_room]  :  room_flags{0} = 1

	LDA #139
	CMP ballx
     BCS .skipL0145
.condpart24
	LDA #17
	STA ballx
	STA w_top_oldx
	LDX top_room
	LDA move_east,x
	STA top_room
	LDA room_flags
	ORA #1
	STA room_flags
.skipL0145
.
 ;;line 246;; 

.L0146 ;;line 247;;  gosub update_top_dragons bank2

 sta temp7
 lda #>(ret_point8-1)
 pha
 lda #<(ret_point8-1)
 pha
 lda #>(.update_top_dragons-1)
 pha
 lda #<(.update_top_dragons-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
ret_point8
.L0147 ;;line 248;;  goto main_loop

 jmp .main_loop
.
 ;;line 249;; 

._odd_frame_logic
 ;;line 250;; _odd_frame_logic

.
 ;;line 251;; 

.L0148 ;;line 252;;  if p2_bally  <  31  ||  p2_bally  >  45 then gosub castle_transitions_bot bank3

	LDA p2_bally
	CMP #31
     BCS .skipL0148
.condpart25
 jmp .condpart26
.skipL0148
	LDA #45
	CMP p2_bally
     BCS .skip3OR
.condpart26
 sta temp7
 lda #>(ret_point9-1)
 pha
 lda #<(ret_point9-1)
 pha
 lda #>(.castle_transitions_bot-1)
 pha
 lda #<(.castle_transitions_bot-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point9
.skip3OR
.
 ;;line 253;; 

.L0149 ;;line 254;;  if p2_bally  <  3 then p2_bally = 45  :  w_bottom_oldy = 45  :  bottom_room = move_north[bottom_room]  :  room_flags{1} = 1

	LDA p2_bally
	CMP #3
     BCS .skipL0149
.condpart27
	LDA #45
	STA p2_bally
	STA w_bottom_oldy
	LDX bottom_room
	LDA move_north,x
	STA bottom_room
	LDA room_flags
	ORA #2
	STA room_flags
.skipL0149
.L0150 ;;line 255;;  if p2_bally  >  45 then p2_bally = 3  :  w_bottom_oldy = 3  :  bottom_room = move_south[bottom_room]  :  room_flags{1} = 1

	LDA #45
	CMP p2_bally
     BCS .skipL0150
.condpart28
	LDA #3
	STA p2_bally
	STA w_bottom_oldy
	LDX bottom_room
	LDA move_south,x
	STA bottom_room
	LDA room_flags
	ORA #2
	STA room_flags
.skipL0150
.L0151 ;;line 256;;  if p2_ballx  <  17 then p2_ballx = 139  :  w_bottom_oldx = 139  :  bottom_room = move_west[bottom_room]  :  room_flags{1} = 1

	LDA p2_ballx
	CMP #17
     BCS .skipL0151
.condpart29
	LDA #139
	STA p2_ballx
	STA w_bottom_oldx
	LDX bottom_room
	LDA move_west,x
	STA bottom_room
	LDA room_flags
	ORA #2
	STA room_flags
.skipL0151
.L0152 ;;line 257;;  if p2_ballx  >  139 then p2_ballx = 17  :  w_bottom_oldx = 17  :  bottom_room = move_east[bottom_room]  :  room_flags{1} = 1

	LDA #139
	CMP p2_ballx
     BCS .skipL0152
.condpart30
	LDA #17
	STA p2_ballx
	STA w_bottom_oldx
	LDX bottom_room
	LDA move_east,x
	STA bottom_room
	LDA room_flags
	ORA #2
	STA room_flags
.skipL0152
.
 ;;line 258;; 

.L0153 ;;line 259;;  gosub update_bot_dragons bank2

 sta temp7
 lda #>(ret_point10-1)
 pha
 lda #<(ret_point10-1)
 pha
 lda #>(.update_bot_dragons-1)
 pha
 lda #<(.update_bot_dragons-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
ret_point10
.L0154 ;;line 260;;  goto main_loop

 jmp .main_loop
.
 ;;line 261;; 

.
 ;;line 262;; 

.
 ;;line 263;; 

.
 ;;line 264;; 

.L0155 ;;line 265;;  data move_north

	JMP .skipL0155
move_north
	.byte  0,0,1,2,3,4,0,0,10,0,8,9,11,12,7,13

	.byte  0,5,0,0,18,19,20,21,23,16,25,26,0,28,5

.skipL0155
.
 ;;line 269;; 

.L0156 ;;line 270;;  data move_east

	JMP .skipL0156
move_east
	.byte  0,0,0,6,7,3,5,4,9,10,11,8,0,0,15,16

	.byte  14,14,19,18,21,0,0,0,27,26,25,29,0,24,0

.skipL0156
.
 ;;line 274;; 

.L0157 ;;line 275;;  data move_south

	JMP .skipL0157
move_south
	.byte  0,2,3,4,5,30,0,14,10,11,8,12,13,15,0,0

	.byte  25,0,20,21,22,23,0,24,24,26,27,0,29,29,0

.skipL0157
.
 ;;line 279;; 

.L0158 ;;line 280;;  data move_west

	JMP .skipL0158
move_west
	.byte  0,0,0,5,7,6,3,4,11,8,9,10,0,0,16,14

	.byte  15,16,19,18,21,0,0,0,29,26,25,24,0,27,0

.skipL0158
.
 ;;line 284;; 

.L0159 ;;line 285;;  data room_shape

	JMP .skipL0159
room_shape
	.byte  0,5,19,0,1,3,4,2,20,21,22,23,18,19,6,6

	.byte  7,6,13,16,14,17,15,19,12,8,9,10,5,12,15

.skipL0159
.
 ;;line 289;; 

.L0160 ;;line 290;;  data room_color

	JMP .skipL0160
room_color
	.byte  $00,$18,$18,$86,$86,$86,$86,$86,$38,$38,$38,$38,$46,$02,$64,$64

	.byte  $64,$64,$38,$38,$38,$38,$38,$1A,$64,$38,$38,$38,$66,$A8,$86

.skipL0160
.
 ;;line 294;; 

.
 ;;line 295;; 

.
 ;;line 296;; 

.
 ;;line 297;; 

.load_top_room
 ;;line 298;; load_top_room

.L0161 ;;line 299;;  temp1 = room_shape[top_room]

	LDX top_room
	LDA room_shape,x
	STA temp1
.L0162 ;;line 300;;  top_colupf = room_color[top_room]

	LDX top_room
	LDA room_color,x
	STA top_colupf
.L0163 ;;line 301;;  asm

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

.L0164 ;;line 315;;  return otherbank

	JMP BS_return
.
 ;;line 316;; 

.load_bottom_room
 ;;line 317;; load_bottom_room

.L0165 ;;line 318;;  temp1 = room_shape[bottom_room]

	LDX bottom_room
	LDA room_shape,x
	STA temp1
.L0166 ;;line 319;;  bottom_colupf = room_color[bottom_room]

	LDX bottom_room
	LDA room_color,x
	STA bottom_colupf
.L0167 ;;line 320;;  asm

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

.L0168 ;;line 334;;  return otherbank

	JMP BS_return
.
 ;;line 335;; 

.
 ;;line 336;; 

.
 ;;line 337;; 

.
 ;;line 338;; 

.
 ;;line 339;; 

.room_0
 ;;line 340;; room_0

.L0169 ;;line 341;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel0
PF_data0
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11110000, %00000000
	if (pfwidth>2)
	.byte %11110000, %00000000
 endif
	.byte %11110000, %00000000
	if (pfwidth>2)
	.byte %11110000, %00000000
 endif
	.byte %11110011, %11111111
	if (pfwidth>2)
	.byte %11110011, %11111111
 endif
	.byte %11110011, %11111111
	if (pfwidth>2)
	.byte %11110011, %11111111
 endif
	.byte %00000011, %00000000
	if (pfwidth>2)
	.byte %00000011, %00000000
 endif
	.byte %00000011, %00000000
	if (pfwidth>2)
	.byte %00000011, %00000000
 endif
	.byte %11111111, %00111100
	if (pfwidth>2)
	.byte %11111111, %00111100
 endif
pflabel0
	lda PF_data0,x
	sta playfield-128,x
	dex
	bpl pflabel0
.L0170 ;;line 355;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 356;; 

.
 ;;line 357;; 

.room_1
 ;;line 358;; room_1

.L0171 ;;line 359;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel1
PF_data1
	.byte %11111111, %00111100
	if (pfwidth>2)
	.byte %11111111, %00111100
 endif
	.byte %00000011, %00110000
	if (pfwidth>2)
	.byte %00000011, %00110000
 endif
	.byte %00000011, %00110000
	if (pfwidth>2)
	.byte %00000011, %00110000
 endif
	.byte %11111111, %00110011
	if (pfwidth>2)
	.byte %11111111, %00110011
 endif
	.byte %11111111, %00110011
	if (pfwidth>2)
	.byte %11111111, %00110011
 endif
	.byte %00000000, %00110000
	if (pfwidth>2)
	.byte %00000000, %00110000
 endif
	.byte %00000000, %00110000
	if (pfwidth>2)
	.byte %00000000, %00110000
 endif
	.byte %11111111, %00111111
	if (pfwidth>2)
	.byte %11111111, %00111111
 endif
	.byte %11111111, %00111111
	if (pfwidth>2)
	.byte %11111111, %00111111
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel1
	lda PF_data1,x
	sta playfield-128,x
	dex
	bpl pflabel1
.L0172 ;;line 373;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 374;; 

.
 ;;line 375;; 

.room_2
 ;;line 376;; room_2

.L0173 ;;line 377;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel2
PF_data2
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11110011, %01111111
	if (pfwidth>2)
	.byte %11110011, %01111111
 endif
	.byte %11110011, %01111111
	if (pfwidth>2)
	.byte %11110011, %01111111
 endif
	.byte %00000000, %01100000
	if (pfwidth>2)
	.byte %00000000, %01100000
 endif
	.byte %00000000, %01100000
	if (pfwidth>2)
	.byte %00000000, %01100000
 endif
	.byte %11110011, %01111111
	if (pfwidth>2)
	.byte %11110011, %01111111
 endif
	.byte %11110011, %01111111
	if (pfwidth>2)
	.byte %11110011, %01111111
 endif
	.byte %00000011, %00000000
	if (pfwidth>2)
	.byte %00000011, %00000000
 endif
	.byte %00000011, %00000000
	if (pfwidth>2)
	.byte %00000011, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel2
	lda PF_data2,x
	sta playfield-128,x
	dex
	bpl pflabel2
.L0174 ;;line 391;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 392;; 

.
 ;;line 393;; 

.room_3
 ;;line 394;; room_3

.L0175 ;;line 395;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel3
PF_data3
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00001100
	if (pfwidth>2)
	.byte %00000000, %00001100
 endif
	.byte %00000000, %00001100
	if (pfwidth>2)
	.byte %00000000, %00001100
 endif
	.byte %11001111, %00001111
	if (pfwidth>2)
	.byte %11001111, %00001111
 endif
	.byte %11001111, %00001111
	if (pfwidth>2)
	.byte %11001111, %00001111
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
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel3
	lda PF_data3,x
	sta playfield-128,x
	dex
	bpl pflabel3
.L0176 ;;line 409;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 410;; 

.
 ;;line 411;; 

.room_4
 ;;line 412;; room_4

.L0177 ;;line 413;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel4
PF_data4
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %00000000, %11000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %11000000, %11000000
	if (pfwidth>2)
	.byte %11000000, %11000000
 endif
	.byte %11000000, %11000000
	if (pfwidth>2)
	.byte %11000000, %11000000
 endif
	.byte %11001111, %11001111
	if (pfwidth>2)
	.byte %11001111, %11001111
 endif
	.byte %11001111, %11001111
	if (pfwidth>2)
	.byte %11001111, %11001111
 endif
	.byte %00001111, %00001111
	if (pfwidth>2)
	.byte %00001111, %00001111
 endif
	.byte %00001111, %00001111
	if (pfwidth>2)
	.byte %00001111, %00001111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel4
	lda PF_data4,x
	sta playfield-128,x
	dex
	bpl pflabel4
.L0178 ;;line 427;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 428;; 

.room_5
 ;;line 429;; room_5

.L0179 ;;line 430;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel5
PF_data5
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000110, %00000000
	if (pfwidth>2)
	.byte %11000110, %00000000
 endif
	.byte %11000110, %00000000
	if (pfwidth>2)
	.byte %11000110, %00000000
 endif
	.byte %11000000, %00001100
	if (pfwidth>2)
	.byte %11000000, %00001100
 endif
	.byte %11000000, %00001100
	if (pfwidth>2)
	.byte %11000000, %00001100
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00001100
	if (pfwidth>2)
	.byte %11000000, %00001100
 endif
	.byte %11000000, %00001100
	if (pfwidth>2)
	.byte %11000000, %00001100
 endif
	.byte %11000110, %00000000
	if (pfwidth>2)
	.byte %11000110, %00000000
 endif
	.byte %11000110, %00000000
	if (pfwidth>2)
	.byte %11000110, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel5
	lda PF_data5,x
	sta playfield-128,x
	dex
	bpl pflabel5
.L0180 ;;line 444;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 445;; 

.room_6
 ;;line 446;; room_6

.L0181 ;;line 447;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel6
PF_data6
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00110000, %10000000
	if (pfwidth>2)
	.byte %00110000, %10000000
 endif
	.byte %00110000, %10000000
	if (pfwidth>2)
	.byte %00110000, %10000000
 endif
	.byte %00110000, %10000000
	if (pfwidth>2)
	.byte %00110000, %10000000
 endif
	.byte %00110000, %10000000
	if (pfwidth>2)
	.byte %00110000, %10000000
 endif
	.byte %00110000, %10000000
	if (pfwidth>2)
	.byte %00110000, %10000000
 endif
	.byte %00110000, %00000110
	if (pfwidth>2)
	.byte %00110000, %00000110
 endif
	.byte %00110000, %00000110
	if (pfwidth>2)
	.byte %00110000, %00000110
 endif
	.byte %00000000, %00000110
	if (pfwidth>2)
	.byte %00000000, %00000110
 endif
	.byte %00000000, %00000110
	if (pfwidth>2)
	.byte %00000000, %00000110
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel6
	lda PF_data6,x
	sta playfield-128,x
	dex
	bpl pflabel6
.L0182 ;;line 461;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 462;; 

.
 ;;line 463;; 

.room_7
 ;;line 464;; room_7

.L0183 ;;line 465;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel7
PF_data7
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000101
	if (pfwidth>2)
	.byte %00000000, %00001010
 endif
	.byte %00001000, %01000101
	if (pfwidth>2)
	.byte %00000100, %10001010
 endif
	.byte %00001000, %01000101
	if (pfwidth>2)
	.byte %00000100, %10001010
 endif
	.byte %00101000, %01000000
	if (pfwidth>2)
	.byte %00010100, %10000000
 endif
	.byte %00101000, %01000000
	if (pfwidth>2)
	.byte %00010100, %10000000
 endif
	.byte %00101000, %00000000
	if (pfwidth>2)
	.byte %00010100, %00000000
 endif
	.byte %00101000, %00000000
	if (pfwidth>2)
	.byte %00010100, %00000000
 endif
	.byte %00101000, %00000000
	if (pfwidth>2)
	.byte %00010100, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel7
	lda PF_data7,x
	sta playfield-128,x
	dex
	bpl pflabel7
.L0184 ;;line 479;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 480;; 

.
 ;;line 481;; 

.room_8
 ;;line 482;; room_8

.L0185 ;;line 483;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel8
PF_data8
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000011, %11000000
	if (pfwidth>2)
	.byte %00000011, %11000000
 endif
	.byte %00000011, %11000000
	if (pfwidth>2)
	.byte %00000011, %11000000
 endif
	.byte %11110011, %11001100
	if (pfwidth>2)
	.byte %11110011, %11001100
 endif
	.byte %11110011, %11001100
	if (pfwidth>2)
	.byte %11110011, %11001100
 endif
	.byte %00000011, %11001100
	if (pfwidth>2)
	.byte %00000011, %11001100
 endif
	.byte %00000011, %11001100
	if (pfwidth>2)
	.byte %00000011, %11001100
 endif
	.byte %11111111, %11001100
	if (pfwidth>2)
	.byte %11111111, %11001100
 endif
pflabel8
	lda PF_data8,x
	sta playfield-128,x
	dex
	bpl pflabel8
.L0186 ;;line 497;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 498;; 

.
 ;;line 499;; 

.room_9
 ;;line 500;; room_9

.L0187 ;;line 501;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel9
PF_data9
	.byte %11111111, %11001100
	if (pfwidth>2)
	.byte %11111111, %11001100
 endif
	.byte %00000000, %11001100
	if (pfwidth>2)
	.byte %00000000, %11001100
 endif
	.byte %00000000, %11001100
	if (pfwidth>2)
	.byte %00000000, %11001100
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %00000000, %00000001
	if (pfwidth>2)
	.byte %00000000, %00000001
 endif
	.byte %00000000, %00000001
	if (pfwidth>2)
	.byte %00000000, %00000001
 endif
	.byte %11111100, %11111001
	if (pfwidth>2)
	.byte %11111100, %11111001
 endif
	.byte %11111100, %11111001
	if (pfwidth>2)
	.byte %11111100, %11111001
 endif
	.byte %00000100, %00001001
	if (pfwidth>2)
	.byte %00000100, %00001001
 endif
	.byte %00000100, %00001001
	if (pfwidth>2)
	.byte %00000100, %00001001
 endif
	.byte %11100100, %11001001
	if (pfwidth>2)
	.byte %11100100, %11001001
 endif
pflabel9
	lda PF_data9,x
	sta playfield-128,x
	dex
	bpl pflabel9
.L0188 ;;line 515;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 516;; 

.
 ;;line 517;; 

.room_10
 ;;line 518;; room_10

.L0189 ;;line 519;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel10
PF_data10
	.byte %11100100, %11001001
	if (pfwidth>2)
	.byte %11100100, %11001001
 endif
	.byte %00100100, %11001000
	if (pfwidth>2)
	.byte %00100100, %11001000
 endif
	.byte %00100100, %11001000
	if (pfwidth>2)
	.byte %00100100, %11001000
 endif
	.byte %00100111, %11001111
	if (pfwidth>2)
	.byte %00100111, %11001111
 endif
	.byte %00100111, %11001111
	if (pfwidth>2)
	.byte %00100111, %11001111
 endif
	.byte %00100000, %11000000
	if (pfwidth>2)
	.byte %00100000, %11000000
 endif
	.byte %00100000, %11000000
	if (pfwidth>2)
	.byte %00100000, %11000000
 endif
	.byte %00100111, %11001111
	if (pfwidth>2)
	.byte %00100111, %11001111
 endif
	.byte %00100111, %11001111
	if (pfwidth>2)
	.byte %00100111, %11001111
 endif
	.byte %00000000, %11000001
	if (pfwidth>2)
	.byte %00000000, %11000001
 endif
	.byte %00000000, %11000001
	if (pfwidth>2)
	.byte %00000000, %11000001
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel10
	lda PF_data10,x
	sta playfield-128,x
	dex
	bpl pflabel10
.L0190 ;;line 533;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 534;; 

.room_11
 ;;line 535;; room_11

.L0191 ;;line 536;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel11
PF_data11
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel11
	lda PF_data11,x
	sta playfield-128,x
	dex
	bpl pflabel11
.L0192 ;;line 550;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 551;; 

.
 ;;line 552;; 

.room_12
 ;;line 553;; room_12

.L0193 ;;line 554;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel12
PF_data12
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00011000, %00000110
	if (pfwidth>2)
	.byte %00011000, %00000110
 endif
	.byte %00011000, %10000110
	if (pfwidth>2)
	.byte %00011000, %10000110
 endif
	.byte %00110000, %10000011
	if (pfwidth>2)
	.byte %00110000, %10000011
 endif
	.byte %00110000, %10000011
	if (pfwidth>2)
	.byte %00110000, %10000011
 endif
	.byte %00000000, %10000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %00000000, %10000000
	if (pfwidth>2)
	.byte %00000000, %10000000
 endif
	.byte %00110000, %10000011
	if (pfwidth>2)
	.byte %00110000, %10000011
 endif
	.byte %00110000, %10000011
	if (pfwidth>2)
	.byte %00110000, %10000011
 endif
	.byte %00110000, %10000011
	if (pfwidth>2)
	.byte %00110000, %10000011
 endif
	.byte %00110000, %10000011
	if (pfwidth>2)
	.byte %00110000, %10000011
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel12
	lda PF_data12,x
	sta playfield-128,x
	dex
	bpl pflabel12
.L0194 ;;line 568;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 569;; 

.
 ;;line 570;; 

.room_13
 ;;line 571;; room_13

.L0195 ;;line 572;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel13
PF_data13
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11001000
	if (pfwidth>2)
	.byte %00000000, %11001000
 endif
	.byte %00000000, %11001000
	if (pfwidth>2)
	.byte %00000000, %11001000
 endif
	.byte %11111111, %11001001
	if (pfwidth>2)
	.byte %11111111, %11001001
 endif
	.byte %11111111, %11001001
	if (pfwidth>2)
	.byte %11111111, %11001001
 endif
	.byte %11000000, %11001001
	if (pfwidth>2)
	.byte %11000000, %11001001
 endif
	.byte %11000000, %11001001
	if (pfwidth>2)
	.byte %11000000, %11001001
 endif
	.byte %11001100, %11001111
	if (pfwidth>2)
	.byte %11001100, %11001111
 endif
pflabel13
	lda PF_data13,x
	sta playfield-128,x
	dex
	bpl pflabel13
.L0196 ;;line 586;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 587;; 

.
 ;;line 588;; 

.room_14
 ;;line 589;; room_14

.L0197 ;;line 590;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel14
PF_data14
	.byte %11001100, %11001111
	if (pfwidth>2)
	.byte %11001100, %11001111
 endif
	.byte %11000100, %11000000
	if (pfwidth>2)
	.byte %11000100, %11000000
 endif
	.byte %11000100, %11000000
	if (pfwidth>2)
	.byte %11000100, %11000000
 endif
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111100, %11111111
 endif
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111100, %11111111
 endif
	.byte %00000100, %00000001
	if (pfwidth>2)
	.byte %00000100, %00000001
 endif
	.byte %00000100, %00000001
	if (pfwidth>2)
	.byte %00000100, %00000001
 endif
	.byte %11001100, %00001111
	if (pfwidth>2)
	.byte %11001100, %00001111
 endif
	.byte %11001100, %00001111
	if (pfwidth>2)
	.byte %11001100, %00001111
 endif
	.byte %00001000, %00001000
	if (pfwidth>2)
	.byte %00001000, %00001000
 endif
	.byte %00001000, %00001000
	if (pfwidth>2)
	.byte %00001000, %00001000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel14
	lda PF_data14,x
	sta playfield-128,x
	dex
	bpl pflabel14
.L0198 ;;line 604;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 605;; 

.
 ;;line 606;; 

.room_15
 ;;line 607;; room_15

.L0199 ;;line 608;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel15
PF_data15
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %11100111, %00001111
	if (pfwidth>2)
	.byte %11100111, %00001111
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11000000, %00001110
	if (pfwidth>2)
	.byte %11000000, %00001110
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel15
	lda PF_data15,x
	sta playfield-128,x
	dex
	bpl pflabel15
.L0200 ;;line 622;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 623;; 

.
 ;;line 624;; 

.room_16
 ;;line 625;; room_16

.L0201 ;;line 626;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel16
PF_data16
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %00000000, %11000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %00000011, %11000000
	if (pfwidth>2)
	.byte %00000011, %11000000
 endif
	.byte %00000011, %11000000
	if (pfwidth>2)
	.byte %00000011, %11000000
 endif
	.byte %11110011, %11111100
	if (pfwidth>2)
	.byte %11110011, %11111100
 endif
	.byte %11110011, %11111100
	if (pfwidth>2)
	.byte %11110011, %11111100
 endif
	.byte %11110011, %00000000
	if (pfwidth>2)
	.byte %11110011, %00000000
 endif
	.byte %11110011, %00000000
	if (pfwidth>2)
	.byte %11110011, %00000000
 endif
	.byte %11110011, %00001111
	if (pfwidth>2)
	.byte %11110011, %00001111
 endif
pflabel16
	lda PF_data16,x
	sta playfield-128,x
	dex
	bpl pflabel16
.L0202 ;;line 640;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 641;; 

.
 ;;line 642;; 

.room_17
 ;;line 643;; room_17

.L0203 ;;line 644;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel17
PF_data17
	.byte %11110011, %00001111
	if (pfwidth>2)
	.byte %11110011, %00001111
 endif
	.byte %11110000, %00000000
	if (pfwidth>2)
	.byte %11110000, %00000000
 endif
	.byte %11110000, %00000000
	if (pfwidth>2)
	.byte %11110000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel17
	lda PF_data17,x
	sta playfield-128,x
	dex
	bpl pflabel17
.L0204 ;;line 658;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 659;; 

.
 ;;line 660;; 

.room_18
 ;;line 661;; room_18

.L0205 ;;line 662;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel18
PF_data18
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
	.byte %11111111, %00000111
	if (pfwidth>2)
	.byte %11111111, %00000111
 endif
	.byte %11000000, %00000110
	if (pfwidth>2)
	.byte %11000000, %00000110
 endif
	.byte %11000000, %00000110
	if (pfwidth>2)
	.byte %11000000, %00000110
 endif
	.byte %11000000, %00000110
	if (pfwidth>2)
	.byte %11000000, %00000110
 endif
	.byte %11000000, %00000110
	if (pfwidth>2)
	.byte %11000000, %00000110
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel18
	lda PF_data18,x
	sta playfield-128,x
	dex
	bpl pflabel18
.L0206 ;;line 676;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 677;; 

.room_19
 ;;line 678;; room_19

.L0207 ;;line 679;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel19
PF_data19
	.byte %11111110, %00010101
	if (pfwidth>2)
	.byte %11111110, %00010101
 endif
	.byte %11000011, %00011111
	if (pfwidth>2)
	.byte %11000011, %00011111
 endif
	.byte %11000011, %11111111
	if (pfwidth>2)
	.byte %11000011, %11111111
 endif
	.byte %11000011, %11111111
	if (pfwidth>2)
	.byte %11000011, %11111111
 endif
	.byte %11000011, %00111111
	if (pfwidth>2)
	.byte %11000011, %00111111
 endif
	.byte %11000000, %00111111
	if (pfwidth>2)
	.byte %11000000, %00111111
 endif
	.byte %11000000, %00111111
	if (pfwidth>2)
	.byte %11000000, %00111111
 endif
	.byte %11000000, %00111111
	if (pfwidth>2)
	.byte %11000000, %00111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
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
pflabel19
	lda PF_data19,x
	sta playfield-128,x
	dex
	bpl pflabel19
.L0208 ;;line 693;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 694;; 

.room_20
 ;;line 695;; room_20

.
 ;;line 696;; 

.L0209 ;;line 697;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel20
PF_data20
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111100, %11111111
 endif
	.byte %00000000, %00000011
	if (pfwidth>2)
	.byte %00000000, %00000011
 endif
	.byte %00000000, %00000011
	if (pfwidth>2)
	.byte %00000000, %00000011
 endif
	.byte %11111111, %00000011
	if (pfwidth>2)
	.byte %11111111, %00000011
 endif
	.byte %11111111, %00000011
	if (pfwidth>2)
	.byte %11111111, %00000011
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11001111, %11111111
	if (pfwidth>2)
	.byte %11001111, %11111111
 endif
	.byte %11001111, %11111111
	if (pfwidth>2)
	.byte %11001111, %11111111
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111100, %11111111
 endif
pflabel20
	lda PF_data20,x
	sta playfield-128,x
	dex
	bpl pflabel20
.L0210 ;;line 711;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 712;; 

.room_21
 ;;line 713;; room_21

.
 ;;line 714;; 

.L0211 ;;line 715;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel21
PF_data21
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel21
	lda PF_data21,x
	sta playfield-128,x
	dex
	bpl pflabel21
.L0212 ;;line 729;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 730;; 

.room_22
 ;;line 731;; room_22

.
 ;;line 732;; 

.L0213 ;;line 733;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel22
PF_data22
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel22
	lda PF_data22,x
	sta playfield-128,x
	dex
	bpl pflabel22
.L0214 ;;line 747;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 748;; 

.room_23
 ;;line 749;; room_23

.
 ;;line 750;; 

.L0215 ;;line 751;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel23
PF_data23
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00001111
 endif
pflabel23
	lda PF_data23,x
	sta playfield-128,x
	dex
	bpl pflabel23
.L0216 ;;line 765;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 766;; 

.L0217 ;;line 767;;  asm

room_pointers_lo

 .byte <PF_data0, <PF_data1, <PF_data2, <PF_data3, <PF_data4, <PF_data5, <PF_data6, <PF_data7

 .byte <PF_data8, <PF_data9, <PF_data10, <PF_data11, <PF_data12, <PF_data13, <PF_data14, <PF_data15

 .byte <PF_data16, <PF_data17, <PF_data18, <PF_data19, <PF_data20, <PF_data21, <PF_data22, <PF_data23

room_pointers_hi

 .byte >PF_data0, >PF_data1, >PF_data2, >PF_data3, >PF_data4, >PF_data5, >PF_data6, >PF_data7

 .byte >PF_data8, >PF_data9, >PF_data10, >PF_data11, >PF_data12, >PF_data13, >PF_data14, >PF_data15

 .byte >PF_data16, >PF_data17, >PF_data18, >PF_data19, >PF_data20, >PF_data21, >PF_data22, >PF_data23

.
 ;;line 777;; 

.L0218 ;;line 778;;  bank 2

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
.
 ;;line 779;; 

.
 ;;line 780;; 

.
 ;;line 781;; 

.
 ;;line 782;; 

.
 ;;line 783;; 

.
 ;;line 784;; 

.
 ;;line 785;; 

.
 ;;line 786;; 

.
 ;;line 787;; 

.
 ;;line 788;; 

.
 ;;line 789;; 

.
 ;;line 790;; 

.
 ;;line 791;; 

.
 ;;line 792;; 

.
 ;;line 793;; 

.
 ;;line 794;; 

.
 ;;line 795;; 

.
 ;;line 796;; 

.
 ;;line 797;; 

.
 ;;line 798;; 

.
 ;;line 799;; 

.
 ;;line 800;; 

.
 ;;line 801;; 

.
 ;;line 802;; 

.
 ;;line 803;; 

.
 ;;line 804;; 

.L0219 ;;line 805;;  data init_rooms

	JMP .skipL0219
init_rooms
	.byte            8, 19, 26, 16,  1, 14, 11,  2,  5, 24,  8

.skipL0219
.
 ;;line 808;; 

.L0220 ;;line 809;;  data init_x

	JMP .skipL0220
init_x
	.byte           30, 50, 70, 90, 30, 50, 70, 40, 70, 100, 70

.skipL0220
.
 ;;line 812;; 

.L0221 ;;line 813;;  data init_y

	JMP .skipL0221
init_y
	.byte           20, 20, 20, 20, 20, 20, 20, 25, 25,  25, 25

.skipL0221
.
 ;;line 816;; 

.
 ;;line 817;; 

.L0222 ;;line 818;;  data move_north_b2

	JMP .skipL0222
move_north_b2
	.byte  0,0,1,2,3,4,0,0,10,0,8,9,11,12,7,13

	.byte  0,5,0,0,18,19,20,21,23,16,25,26,0,28,5

.skipL0222
.
 ;;line 822;; 

.L0223 ;;line 823;;  data move_east_b2

	JMP .skipL0223
move_east_b2
	.byte  0,0,0,6,7,3,5,4,9,10,11,8,0,0,15,16

	.byte  14,14,19,18,21,0,0,0,27,26,25,29,0,24,0

.skipL0223
.
 ;;line 827;; 

.L0224 ;;line 828;;  data move_south_b2

	JMP .skipL0224
move_south_b2
	.byte  0,2,3,4,5,30,0,14,10,11,8,12,13,15,0,0

	.byte  25,0,20,21,22,23,0,24,24,26,27,0,29,29,0

.skipL0224
.
 ;;line 832;; 

.L0225 ;;line 833;;  data move_west_b2

	JMP .skipL0225
move_west_b2
	.byte  0,0,0,5,7,6,3,4,11,8,9,10,0,0,16,14

	.byte  15,16,19,18,21,0,0,0,29,26,25,24,0,27,0

.skipL0225
.
 ;;line 837;; 

.init_level_2
 ;;line 838;; init_level_2

.L0226 ;;line 839;;  top_carried_item = 255  :  bot_carried_item = 255

	LDA #255
	STA top_carried_item
	STA bot_carried_item
.L0227 ;;line 840;;  gate_state = 0  :  drag_dead = 0

	LDA #0
	STA gate_state
	STA drag_dead
.
 ;;line 841;; 

.L0228 ;;line 842;;  top_drag_state = 3  :  bot_drag_state = 3

	LDA #3
	STA top_drag_state
	STA bot_drag_state
.L0229 ;;line 843;;  flicker_idx = 0  :  bot_flicker_idx = 0

	LDA #0
	STA flicker_idx
	STA bot_flicker_idx
.
 ;;line 844;; 

.
 ;;line 845;; 

.L0230 ;;line 846;;  for temp1 = 0 to 10

	LDA #0
	STA temp1
.L0230fortemp1
.L0231 ;;line 847;;  temp2 = init_rooms[temp1]

	LDX temp1
	LDA init_rooms,x
	STA temp2
.L0232 ;;line 848;;  w_top_obj_room[temp1] = temp2

	LDA temp2
	LDX temp1
	STA w_top_obj_room,x
.L0233 ;;line 849;;  w_bot_obj_room[temp1] = temp2

	LDA temp2
	LDX temp1
	STA w_bot_obj_room,x
.
 ;;line 850;; 

.L0234 ;;line 851;;  temp2 = init_x[temp1]

	LDX temp1
	LDA init_x,x
	STA temp2
.L0235 ;;line 852;;  top_obj_x[temp1] = temp2

	LDA temp2
	LDX temp1
	STA top_obj_x,x
.L0236 ;;line 853;;  bot_obj_x[temp1] = temp2

	LDA temp2
	LDX temp1
	STA bot_obj_x,x
.
 ;;line 854;; 

.L0237 ;;line 855;;  temp2 = init_y[temp1]

	LDX temp1
	LDA init_y,x
	STA temp2
.L0238 ;;line 856;;  top_obj_y[temp1] = temp2

	LDA temp2
	LDX temp1
	STA top_obj_y,x
.L0239 ;;line 857;;  bot_obj_y[temp1] = temp2

	LDA temp2
	LDX temp1
	STA bot_obj_y,x
.L0240 ;;line 858;;  next

	LDA temp1
	CMP #10
	INC temp1
	bcc .L0230fortemp1
 if ( (((((#>*)&$1f)*256)|(#<.L0230fortemp1))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0230fortemp1))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 2 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.L0241 ;;line 859;;  return otherbank

	JMP BS_return
.
 ;;line 860;; 

.
 ;;line 861;; 

.
 ;;line 862;; 

.
 ;;line 863;; 

.
 ;;line 864;; 

.
 ;;line 865;; 

.
 ;;line 866;; 

.
 ;;line 867;; 

.
 ;;line 868;; 

.
 ;;line 869;; 

.
 ;;line 870;; 

.
 ;;line 871;; 

.
 ;;line 872;; 

.update_top_dragons
 ;;line 873;; update_top_dragons

.L0242 ;;line 874;;  if top_drag_state{7} then gosub top_drag_eaten  :  return otherbank

	BIT top_drag_state
	BPL .skipL0242
.condpart31
 jsr .top_drag_eaten
	JMP BS_return
.skipL0242
.L0243 ;;line 875;;  temp1 = top_drag_state  &  3

	LDA top_drag_state
	AND #3
	STA temp1
.L0244 ;;line 876;;  if temp1  <  3 then gosub top_drag_roaring  :  return otherbank

	LDA temp1
	CMP #3
     BCS .skipL0244
.condpart32
 jsr .top_drag_roaring
	JMP BS_return
.skipL0244
.
 ;;line 877;; 

.L0245 ;;line 878;;  temp1 = 0  :  gosub top_one_dragon

	LDA #0
	STA temp1
 jsr .top_one_dragon
.L0246 ;;line 879;;  temp1 = 1  :  gosub top_one_dragon

	LDA #1
	STA temp1
 jsr .top_one_dragon
.L0247 ;;line 880;;  temp1 = 2  :  gosub top_one_dragon

	LDA #2
	STA temp1
 jsr .top_one_dragon
.L0248 ;;line 881;;  return otherbank

	JMP BS_return
.
 ;;line 882;; 

.top_drag_eaten
 ;;line 883;; top_drag_eaten

.L0249 ;;line 884;;  if joy0fire then top_drag_state = 3  :  top_room = ENTRY_YELLOW  :  ballx = 92  :  bally = 38  :  room_flags{0} = 1  :  return

 bit INPT4
	BMI .skipL0249
.condpart33
	LDA #3
	STA top_drag_state
	LDA #ENTRY_YELLOW
	STA top_room
	LDA #92
	STA ballx
	LDA #38
	STA bally
	LDA room_flags
	ORA #1
	STA room_flags
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0249
.L0250 ;;line 885;;  temp1 = top_drag_state  &  3

	LDA top_drag_state
	AND #3
	STA temp1
.L0251 ;;line 886;;  if temp1  <  3 then ballx = top_obj_x[temp1]  +  2  :  bally = top_obj_y[temp1]  -  13

	LDA temp1
	CMP #3
     BCS .skipL0251
.condpart34
	LDX temp1
	LDA top_obj_x,x
	CLC
	ADC #2
	STA ballx
	LDX temp1
	LDA top_obj_y,x
	SEC
	SBC #13
	STA bally
.skipL0251
.L0252 ;;line 887;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 888;; 

.top_drag_roaring
 ;;line 889;; top_drag_roaring

.
 ;;line 890;; 

.L0253 ;;line 891;;  if r_top_obj_room[temp1]  <>  top_room then top_drag_state = 3  :  return

	LDX temp1
	LDA r_top_obj_room,x
	CMP top_room
     BEQ .skipL0253
.condpart35
	LDA #3
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0253
.L0254 ;;line 892;;  temp5 = top_obj_x[temp1]  :  temp6 = top_obj_y[temp1]

	LDX temp1
	LDA top_obj_x,x
	STA temp5
	LDX temp1
	LDA top_obj_y,x
	STA temp6
.L0255 ;;line 893;;  gosub check_top_sword_hit

 jsr .check_top_sword_hit
.L0256 ;;line 894;;  if temp4 = 1 then drag_dead = drag_dead  |  bit_mask[temp1]  :  top_drag_state = 3  :  return

	LDA temp4
	CMP #1
     BNE .skipL0256
.condpart36
	LDA drag_dead
	LDX temp1
	ORA bit_mask,x
	STA drag_dead
	LDA #3
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0256
.
 ;;line 895;; 

.
 ;;line 896;; 

.L0257 ;;line 897;;  temp2 = top_drag_state  +  4

	LDA top_drag_state
	CLC
	ADC #4
	STA temp2
.L0258 ;;line 898;;  if temp2  <  88 then top_drag_state = temp2  :  return

	LDA temp2
	CMP #88
     BCS .skipL0258
.condpart37
	LDA temp2
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0258
.
 ;;line 899;; 

.
 ;;line 900;; 

.L0259 ;;line 901;;  gosub check_top_ball_hit

 jsr .check_top_ball_hit
.L0260 ;;line 902;;  if temp4 = 0 then top_drag_state = 3  :  return

	LDA temp4
	CMP #0
     BNE .skipL0260
.condpart38
	LDA #3
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0260
.
 ;;line 903;; 

.
 ;;line 904;; 

.L0261 ;;line 905;;  if DEBUG_NO_SWALLOW = 1 then top_drag_state = 3  :  return

	LDA #DEBUG_NO_SWALLOW
	CMP #1
     BNE .skipL0261
.condpart39
	LDA #3
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0261
.L0262 ;;line 906;;  top_drag_state = temp1  |  128

	LDA temp1
	ORA #128
	STA top_drag_state
.L0263 ;;line 907;;  top_carried_item = 255

	LDA #255
	STA top_carried_item
.L0264 ;;line 908;;  ballx = temp5  +  2  :  bally = temp6  -  13

	LDA temp5
	CLC
	ADC #2
	STA ballx
	LDA temp6
	SEC
	SBC #13
	STA bally
.L0265 ;;line 909;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 910;; 

.top_one_dragon
 ;;line 911;; top_one_dragon

.L0266 ;;line 912;;  temp4 = drag_dead  &  bit_mask[temp1]

	LDA drag_dead
	LDX temp1
	AND bit_mask,x
	STA temp4
.L0267 ;;line 913;;  if temp4  <>  0 then return

	LDA temp4
	CMP #0
     BEQ .skipL0267
.condpart40
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0267
.L0268 ;;line 914;;  if r_top_obj_room[temp1]  <>  top_room then goto top_dragon_offscreen

	LDX temp1
	LDA r_top_obj_room,x
	CMP top_room
     BEQ .skipL0268
.condpart41
 jmp .top_dragon_offscreen
.skipL0268
.
 ;;line 915;; 

.L0269 ;;line 916;;  temp5 = top_obj_x[temp1]  :  temp6 = top_obj_y[temp1]

	LDX temp1
	LDA top_obj_x,x
	STA temp5
	LDX temp1
	LDA top_obj_y,x
	STA temp6
.L0270 ;;line 917;;  gosub check_top_sword_hit

 jsr .check_top_sword_hit
.L0271 ;;line 918;;  if temp4 = 1 then drag_dead = drag_dead  |  bit_mask[temp1]  :  return

	LDA temp4
	CMP #1
     BNE .skipL0271
.condpart42
	LDA drag_dead
	LDX temp1
	ORA bit_mask,x
	STA drag_dead
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0271
.
 ;;line 919;; 

.
 ;;line 920;; 

.L0272 ;;line 921;;  if temp1 = 1  &&  r_top_obj_room[7] = top_room then goto _top_flee_key

	LDA temp1
	CMP #1
     BNE .skipL0272
.condpart43
	LDX #7
	LDA r_top_obj_room,x
	CMP top_room
     BNE .skip43then
.condpart44
 jmp ._top_flee_key
.skip43then
.skipL0272
.
 ;;line 922;; 

.
 ;;line 923;; 

.L0273 ;;line 924;;  temp2 = ballx  +  3

	LDA ballx
	CLC
	ADC #3
	STA temp2
.L0274 ;;line 925;;  temp3 = bally  +  12

	LDA bally
	CLC
	ADC #12
	STA temp3
.L0275 ;;line 926;;  if temp5  <  temp2 then temp5 = temp5  +  1

	LDA temp5
	CMP temp2
     BCS .skipL0275
.condpart45
	INC temp5
.skipL0275
.L0276 ;;line 927;;  if temp5  >  temp2 then temp5 = temp5  -  1

	LDA temp2
	CMP temp5
     BCS .skipL0276
.condpart46
	DEC temp5
.skipL0276
.L0277 ;;line 928;;  if temp6  <  temp3 then temp6 = temp6  +  1

	LDA temp6
	CMP temp3
     BCS .skipL0277
.condpart47
	INC temp6
.skipL0277
.L0278 ;;line 929;;  if temp6  >  temp3 then temp6 = temp6  -  1

	LDA temp3
	CMP temp6
     BCS .skipL0278
.condpart48
	DEC temp6
.skipL0278
.L0279 ;;line 930;;  top_obj_x[temp1] = temp5  :  top_obj_y[temp1] = temp6

	LDA temp5
	LDX temp1
	STA top_obj_x,x
	LDA temp6
	LDX temp1
	STA top_obj_y,x
.
 ;;line 931;; 

.L0280 ;;line 932;;  gosub check_top_ball_hit

 jsr .check_top_ball_hit
.L0281 ;;line 933;;  if temp4 = 1 then top_drag_state = temp1

	LDA temp4
	CMP #1
     BNE .skipL0281
.condpart49
	LDA temp1
	STA top_drag_state
.skipL0281
.L0282 ;;line 934;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 935;; 

._top_flee_key
 ;;line 936;; _top_flee_key

.L0283 ;;line 937;;  if temp5  <  top_obj_x[7]  &&  temp5  >  20 then temp5 = temp5  -  1

	LDA temp5
	LDX #7
	CMP top_obj_x,x
     BCS .skipL0283
.condpart50
	LDA #20
	CMP temp5
     BCS .skip50then
.condpart51
	DEC temp5
.skip50then
.skipL0283
.L0284 ;;line 938;;  if temp5  >=  top_obj_x[7]  &&  temp5  <  130 then temp5 = temp5  +  1

	LDA temp5
	LDX #7
	CMP top_obj_x,x
     BCC .skipL0284
.condpart52
	LDA temp5
	CMP #130
     BCS .skip52then
.condpart53
	INC temp5
.skip52then
.skipL0284
.L0285 ;;line 939;;  if temp6  <  top_obj_y[7]  &&  temp6  >  18 then temp6 = temp6  -  1

	LDA temp6
	LDX #7
	CMP top_obj_y,x
     BCS .skipL0285
.condpart54
	LDA #18
	CMP temp6
     BCS .skip54then
.condpart55
	DEC temp6
.skip54then
.skipL0285
.L0286 ;;line 940;;  if temp6  >=  top_obj_y[7]  &&  temp6  <  42 then temp6 = temp6  +  1

	LDA temp6
	LDX #7
	CMP top_obj_y,x
     BCC .skipL0286
.condpart56
	LDA temp6
	CMP #42
     BCS .skip56then
.condpart57
	INC temp6
.skip56then
.skipL0286
.L0287 ;;line 941;;  top_obj_x[1] = temp5  :  top_obj_y[1] = temp6

	LDA temp5
	LDX #1
	STA top_obj_x,x
	LDA temp6
	LDX #1
	STA top_obj_y,x
.L0288 ;;line 942;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 943;; 

.
 ;;line 944;; 

.top_dragon_offscreen
 ;;line 945;; top_dragon_offscreen

.L0289 ;;line 946;;  temp4 = r_top_obj_room[temp1]

	LDX temp1
	LDA r_top_obj_room,x
	STA temp4
.L0290 ;;line 947;;  temp5 = top_obj_x[temp1]  :  temp6 = top_obj_y[temp1]

	LDX temp1
	LDA top_obj_x,x
	STA temp5
	LDX temp1
	LDA top_obj_y,x
	STA temp6
.L0291 ;;line 948;;  if move_north_b2[temp4] = top_room then goto _top_pursue_n

	LDX temp4
	LDA move_north_b2,x
	CMP top_room
     BNE .skipL0291
.condpart58
 jmp ._top_pursue_n
.skipL0291
.L0292 ;;line 949;;  if move_south_b2[temp4] = top_room then goto _top_pursue_s

	LDX temp4
	LDA move_south_b2,x
	CMP top_room
     BNE .skipL0292
.condpart59
 jmp ._top_pursue_s
.skipL0292
.L0293 ;;line 950;;  if move_east_b2[temp4] = top_room then goto _top_pursue_e

	LDX temp4
	LDA move_east_b2,x
	CMP top_room
     BNE .skipL0293
.condpart60
 jmp ._top_pursue_e
.skipL0293
.L0294 ;;line 951;;  if move_west_b2[temp4] = top_room then goto _top_pursue_w

	LDX temp4
	LDA move_west_b2,x
	CMP top_room
     BNE .skipL0294
.condpart61
 jmp ._top_pursue_w
.skipL0294
.L0295 ;;line 952;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 953;; 

._top_pursue_n
 ;;line 954;; _top_pursue_n

.L0296 ;;line 955;;  if temp6  >  3 then top_obj_y[temp1] = temp6  -  1  :  return

	LDA #3
	CMP temp6
     BCS .skipL0296
.condpart62
	LDA temp6
	SEC
	SBC #1
	LDX temp1
	STA top_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0296
.L0297 ;;line 956;;  w_top_obj_room[temp1] = top_room  :  top_obj_y[temp1] = 28  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA #28
	LDX temp1
	STA top_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 957;; 

._top_pursue_s
 ;;line 958;; _top_pursue_s

.L0298 ;;line 959;;  if temp6  <  38 then top_obj_y[temp1] = temp6  +  1  :  return

	LDA temp6
	CMP #38
     BCS .skipL0298
.condpart63
	LDA temp6
	CLC
	ADC #1
	LDX temp1
	STA top_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0298
.L0299 ;;line 960;;  w_top_obj_room[temp1] = top_room  :  top_obj_y[temp1] = 4  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA #4
	LDX temp1
	STA top_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 961;; 

._top_pursue_e
 ;;line 962;; _top_pursue_e

.L0300 ;;line 963;;  if temp5  <  134 then top_obj_x[temp1] = temp5  +  1  :  return

	LDA temp5
	CMP #134
     BCS .skipL0300
.condpart64
	LDA temp5
	CLC
	ADC #1
	LDX temp1
	STA top_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0300
.L0301 ;;line 964;;  w_top_obj_room[temp1] = top_room  :  top_obj_x[temp1] = 18  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA #18
	LDX temp1
	STA top_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 965;; 

._top_pursue_w
 ;;line 966;; _top_pursue_w

.L0302 ;;line 967;;  if temp5  >  18 then top_obj_x[temp1] = temp5  -  1  :  return

	LDA #18
	CMP temp5
     BCS .skipL0302
.condpart65
	LDA temp5
	SEC
	SBC #1
	LDX temp1
	STA top_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0302
.L0303 ;;line 968;;  w_top_obj_room[temp1] = top_room  :  top_obj_x[temp1] = 132  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA #132
	LDX temp1
	STA top_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 969;; 

.check_top_sword_hit
 ;;line 970;; check_top_sword_hit

.L0304 ;;line 971;;  temp4 = 0

	LDA #0
	STA temp4
.L0305 ;;line 972;;  if r_top_obj_room[4]  <>  top_room then return

	LDX #4
	LDA r_top_obj_room,x
	CMP top_room
     BEQ .skipL0305
.condpart66
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0305
.L0306 ;;line 973;;  temp2 = temp5  +  8  :  temp3 = top_obj_x[4]  +  8

	LDA temp5
	CLC
	ADC #8
	STA temp2
	LDX #4
	LDA top_obj_x,x
	CLC
	ADC #8
	STA temp3
.L0307 ;;line 974;;  if temp2  <  top_obj_x[4]  ||  temp5  >  temp3 then return

	LDA temp2
	LDX #4
	CMP top_obj_x,x
     BCS .skipL0307
.condpart67
 jmp .condpart68
.skipL0307
	LDA temp3
	CMP temp5
     BCS .skip9OR
.condpart68
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip9OR
.L0308 ;;line 975;;  temp2 = temp6  +  20  :  temp3 = top_obj_y[4]  +  6

	LDA temp6
	CLC
	ADC #20
	STA temp2
	LDX #4
	LDA top_obj_y,x
	CLC
	ADC #6
	STA temp3
.L0309 ;;line 976;;  if temp2  <  top_obj_y[4]  ||  temp6  >  temp3 then return

	LDA temp2
	LDX #4
	CMP top_obj_y,x
     BCS .skipL0309
.condpart69
 jmp .condpart70
.skipL0309
	LDA temp3
	CMP temp6
     BCS .skip10OR
.condpart70
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip10OR
.L0310 ;;line 977;;  temp4 = 1

	LDA #1
	STA temp4
.L0311 ;;line 978;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 979;; 

.check_top_ball_hit
 ;;line 980;; check_top_ball_hit

.L0312 ;;line 981;;  temp4 = 0

	LDA #0
	STA temp4
.
 ;;line 982;; 

.L0313 ;;line 983;;  temp2 = ballx  +  1  :  temp3 = ballx  +  6

	LDA ballx
	CLC
	ADC #1
	STA temp2
	LDA ballx
	CLC
	ADC #6
	STA temp3
.L0314 ;;line 984;;  if temp5  <  temp2  ||  temp5  >  temp3 then return

	LDA temp5
	CMP temp2
     BCS .skipL0314
.condpart71
 jmp .condpart72
.skipL0314
	LDA temp3
	CMP temp5
     BCS .skip11OR
.condpart72
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip11OR
.L0315 ;;line 985;;  temp2 = bally  +  9  :  temp3 = bally  +  15

	LDA bally
	CLC
	ADC #9
	STA temp2
	LDA bally
	CLC
	ADC #15
	STA temp3
.L0316 ;;line 986;;  if temp6  <  temp2  ||  temp6  >  temp3 then return

	LDA temp6
	CMP temp2
     BCS .skipL0316
.condpart73
 jmp .condpart74
.skipL0316
	LDA temp3
	CMP temp6
     BCS .skip12OR
.condpart74
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip12OR
.L0317 ;;line 987;;  temp4 = 1

	LDA #1
	STA temp4
.L0318 ;;line 988;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 989;; 

.
 ;;line 990;; 

.
 ;;line 991;; 

.
 ;;line 992;; 

.update_bot_dragons
 ;;line 993;; update_bot_dragons

.L0319 ;;line 994;;  if bot_drag_state{7} then gosub bot_drag_eaten  :  return otherbank

	BIT bot_drag_state
	BPL .skipL0319
.condpart75
 jsr .bot_drag_eaten
	JMP BS_return
.skipL0319
.L0320 ;;line 995;;  temp1 = bot_drag_state  &  3

	LDA bot_drag_state
	AND #3
	STA temp1
.L0321 ;;line 996;;  if temp1  <  3 then gosub bot_drag_roaring  :  return otherbank

	LDA temp1
	CMP #3
     BCS .skipL0321
.condpart76
 jsr .bot_drag_roaring
	JMP BS_return
.skipL0321
.
 ;;line 997;; 

.L0322 ;;line 998;;  temp1 = 0  :  gosub bot_one_dragon

	LDA #0
	STA temp1
 jsr .bot_one_dragon
.L0323 ;;line 999;;  temp1 = 1  :  gosub bot_one_dragon

	LDA #1
	STA temp1
 jsr .bot_one_dragon
.L0324 ;;line 1000;;  temp1 = 2  :  gosub bot_one_dragon

	LDA #2
	STA temp1
 jsr .bot_one_dragon
.L0325 ;;line 1001;;  return otherbank

	JMP BS_return
.
 ;;line 1002;; 

.bot_drag_eaten
 ;;line 1003;; bot_drag_eaten

.L0326 ;;line 1004;;  if joy1fire then bot_drag_state = 3  :  bottom_room = ENTRY_YELLOW  :  p2_ballx = 92  :  p2_bally = 38  :  room_flags{1} = 1  :  return

 bit INPT5
	BMI .skipL0326
.condpart77
	LDA #3
	STA bot_drag_state
	LDA #ENTRY_YELLOW
	STA bottom_room
	LDA #92
	STA p2_ballx
	LDA #38
	STA p2_bally
	LDA room_flags
	ORA #2
	STA room_flags
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0326
.L0327 ;;line 1005;;  temp1 = bot_drag_state  &  3

	LDA bot_drag_state
	AND #3
	STA temp1
.L0328 ;;line 1006;;  if temp1  <  3 then p2_ballx = bot_obj_x[temp1]  +  2  :  p2_bally = bot_obj_y[temp1]  -  13

	LDA temp1
	CMP #3
     BCS .skipL0328
.condpart78
	LDX temp1
	LDA bot_obj_x,x
	CLC
	ADC #2
	STA p2_ballx
	LDX temp1
	LDA bot_obj_y,x
	SEC
	SBC #13
	STA p2_bally
.skipL0328
.L0329 ;;line 1007;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1008;; 

.bot_drag_roaring
 ;;line 1009;; bot_drag_roaring

.
 ;;line 1010;; 

.L0330 ;;line 1011;;  if r_bot_obj_room[temp1]  <>  bottom_room then bot_drag_state = 3  :  return

	LDX temp1
	LDA r_bot_obj_room,x
	CMP bottom_room
     BEQ .skipL0330
.condpart79
	LDA #3
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0330
.L0331 ;;line 1012;;  temp5 = bot_obj_x[temp1]  :  temp6 = bot_obj_y[temp1]

	LDX temp1
	LDA bot_obj_x,x
	STA temp5
	LDX temp1
	LDA bot_obj_y,x
	STA temp6
.L0332 ;;line 1013;;  gosub check_bot_sword_hit

 jsr .check_bot_sword_hit
.L0333 ;;line 1014;;  if temp4 = 1 then drag_dead = drag_dead  |  bot_bit_mask[temp1]  :  bot_drag_state = 3  :  return

	LDA temp4
	CMP #1
     BNE .skipL0333
.condpart80
	LDA drag_dead
	LDX temp1
	ORA bot_bit_mask,x
	STA drag_dead
	LDA #3
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0333
.
 ;;line 1015;; 

.
 ;;line 1016;; 

.L0334 ;;line 1017;;  temp2 = bot_drag_state  +  4

	LDA bot_drag_state
	CLC
	ADC #4
	STA temp2
.L0335 ;;line 1018;;  if temp2  <  88 then bot_drag_state = temp2  :  return

	LDA temp2
	CMP #88
     BCS .skipL0335
.condpart81
	LDA temp2
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0335
.
 ;;line 1019;; 

.
 ;;line 1020;; 

.L0336 ;;line 1021;;  gosub check_bot_ball_hit

 jsr .check_bot_ball_hit
.L0337 ;;line 1022;;  if temp4 = 0 then bot_drag_state = 3  :  return

	LDA temp4
	CMP #0
     BNE .skipL0337
.condpart82
	LDA #3
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0337
.
 ;;line 1023;; 

.
 ;;line 1024;; 

.L0338 ;;line 1025;;  if DEBUG_NO_SWALLOW = 1 then bot_drag_state = 3  :  return

	LDA #DEBUG_NO_SWALLOW
	CMP #1
     BNE .skipL0338
.condpart83
	LDA #3
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0338
.L0339 ;;line 1026;;  bot_drag_state = temp1  |  128

	LDA temp1
	ORA #128
	STA bot_drag_state
.L0340 ;;line 1027;;  bot_carried_item = 255

	LDA #255
	STA bot_carried_item
.L0341 ;;line 1028;;  p2_ballx = temp5  +  2  :  p2_bally = temp6  -  13

	LDA temp5
	CLC
	ADC #2
	STA p2_ballx
	LDA temp6
	SEC
	SBC #13
	STA p2_bally
.L0342 ;;line 1029;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1030;; 

.bot_one_dragon
 ;;line 1031;; bot_one_dragon

.L0343 ;;line 1032;;  temp4 = drag_dead  &  bot_bit_mask[temp1]

	LDA drag_dead
	LDX temp1
	AND bot_bit_mask,x
	STA temp4
.L0344 ;;line 1033;;  if temp4  <>  0 then return

	LDA temp4
	CMP #0
     BEQ .skipL0344
.condpart84
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0344
.L0345 ;;line 1034;;  if r_bot_obj_room[temp1]  <>  bottom_room then goto bot_dragon_offscreen

	LDX temp1
	LDA r_bot_obj_room,x
	CMP bottom_room
     BEQ .skipL0345
.condpart85
 jmp .bot_dragon_offscreen
.skipL0345
.
 ;;line 1035;; 

.L0346 ;;line 1036;;  temp5 = bot_obj_x[temp1]  :  temp6 = bot_obj_y[temp1]

	LDX temp1
	LDA bot_obj_x,x
	STA temp5
	LDX temp1
	LDA bot_obj_y,x
	STA temp6
.L0347 ;;line 1037;;  gosub check_bot_sword_hit

 jsr .check_bot_sword_hit
.L0348 ;;line 1038;;  if temp4 = 1 then drag_dead = drag_dead  |  bot_bit_mask[temp1]  :  return

	LDA temp4
	CMP #1
     BNE .skipL0348
.condpart86
	LDA drag_dead
	LDX temp1
	ORA bot_bit_mask,x
	STA drag_dead
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0348
.
 ;;line 1039;; 

.
 ;;line 1040;; 

.L0349 ;;line 1041;;  if temp1 = 1  &&  r_bot_obj_room[7] = bottom_room then goto _bot_flee_key

	LDA temp1
	CMP #1
     BNE .skipL0349
.condpart87
	LDX #7
	LDA r_bot_obj_room,x
	CMP bottom_room
     BNE .skip87then
.condpart88
 jmp ._bot_flee_key
.skip87then
.skipL0349
.
 ;;line 1042;; 

.
 ;;line 1043;; 

.L0350 ;;line 1044;;  temp2 = p2_ballx  +  3

	LDA p2_ballx
	CLC
	ADC #3
	STA temp2
.L0351 ;;line 1045;;  temp3 = p2_bally  +  12

	LDA p2_bally
	CLC
	ADC #12
	STA temp3
.L0352 ;;line 1046;;  if temp5  <  temp2 then temp5 = temp5  +  1

	LDA temp5
	CMP temp2
     BCS .skipL0352
.condpart89
	INC temp5
.skipL0352
.L0353 ;;line 1047;;  if temp5  >  temp2 then temp5 = temp5  -  1

	LDA temp2
	CMP temp5
     BCS .skipL0353
.condpart90
	DEC temp5
.skipL0353
.L0354 ;;line 1048;;  if temp6  <  temp3 then temp6 = temp6  +  1

	LDA temp6
	CMP temp3
     BCS .skipL0354
.condpart91
	INC temp6
.skipL0354
.L0355 ;;line 1049;;  if temp6  >  temp3 then temp6 = temp6  -  1

	LDA temp3
	CMP temp6
     BCS .skipL0355
.condpart92
	DEC temp6
.skipL0355
.L0356 ;;line 1050;;  bot_obj_x[temp1] = temp5  :  bot_obj_y[temp1] = temp6

	LDA temp5
	LDX temp1
	STA bot_obj_x,x
	LDA temp6
	LDX temp1
	STA bot_obj_y,x
.
 ;;line 1051;; 

.L0357 ;;line 1052;;  gosub check_bot_ball_hit

 jsr .check_bot_ball_hit
.L0358 ;;line 1053;;  if temp4 = 1 then bot_drag_state = temp1

	LDA temp4
	CMP #1
     BNE .skipL0358
.condpart93
	LDA temp1
	STA bot_drag_state
.skipL0358
.L0359 ;;line 1054;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1055;; 

._bot_flee_key
 ;;line 1056;; _bot_flee_key

.L0360 ;;line 1057;;  if temp5  <  bot_obj_x[7]  &&  temp5  >  20 then temp5 = temp5  -  1

	LDA temp5
	LDX #7
	CMP bot_obj_x,x
     BCS .skipL0360
.condpart94
	LDA #20
	CMP temp5
     BCS .skip94then
.condpart95
	DEC temp5
.skip94then
.skipL0360
.L0361 ;;line 1058;;  if temp5  >=  bot_obj_x[7]  &&  temp5  <  130 then temp5 = temp5  +  1

	LDA temp5
	LDX #7
	CMP bot_obj_x,x
     BCC .skipL0361
.condpart96
	LDA temp5
	CMP #130
     BCS .skip96then
.condpart97
	INC temp5
.skip96then
.skipL0361
.L0362 ;;line 1059;;  if temp6  <  bot_obj_y[7]  &&  temp6  >  18 then temp6 = temp6  -  1

	LDA temp6
	LDX #7
	CMP bot_obj_y,x
     BCS .skipL0362
.condpart98
	LDA #18
	CMP temp6
     BCS .skip98then
.condpart99
	DEC temp6
.skip98then
.skipL0362
.L0363 ;;line 1060;;  if temp6  >=  bot_obj_y[7]  &&  temp6  <  42 then temp6 = temp6  +  1

	LDA temp6
	LDX #7
	CMP bot_obj_y,x
     BCC .skipL0363
.condpart100
	LDA temp6
	CMP #42
     BCS .skip100then
.condpart101
	INC temp6
.skip100then
.skipL0363
.L0364 ;;line 1061;;  bot_obj_x[1] = temp5  :  bot_obj_y[1] = temp6

	LDA temp5
	LDX #1
	STA bot_obj_x,x
	LDA temp6
	LDX #1
	STA bot_obj_y,x
.L0365 ;;line 1062;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1063;; 

.
 ;;line 1064;; 

.bot_dragon_offscreen
 ;;line 1065;; bot_dragon_offscreen

.L0366 ;;line 1066;;  temp4 = r_bot_obj_room[temp1]

	LDX temp1
	LDA r_bot_obj_room,x
	STA temp4
.L0367 ;;line 1067;;  temp5 = bot_obj_x[temp1]  :  temp6 = bot_obj_y[temp1]

	LDX temp1
	LDA bot_obj_x,x
	STA temp5
	LDX temp1
	LDA bot_obj_y,x
	STA temp6
.L0368 ;;line 1068;;  if move_north_b2[temp4] = bottom_room then goto _bot_pursue_n

	LDX temp4
	LDA move_north_b2,x
	CMP bottom_room
     BNE .skipL0368
.condpart102
 jmp ._bot_pursue_n
.skipL0368
.L0369 ;;line 1069;;  if move_south_b2[temp4] = bottom_room then goto _bot_pursue_s

	LDX temp4
	LDA move_south_b2,x
	CMP bottom_room
     BNE .skipL0369
.condpart103
 jmp ._bot_pursue_s
.skipL0369
.L0370 ;;line 1070;;  if move_east_b2[temp4] = bottom_room then goto _bot_pursue_e

	LDX temp4
	LDA move_east_b2,x
	CMP bottom_room
     BNE .skipL0370
.condpart104
 jmp ._bot_pursue_e
.skipL0370
.L0371 ;;line 1071;;  if move_west_b2[temp4] = bottom_room then goto _bot_pursue_w

	LDX temp4
	LDA move_west_b2,x
	CMP bottom_room
     BNE .skipL0371
.condpart105
 jmp ._bot_pursue_w
.skipL0371
.L0372 ;;line 1072;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1073;; 

._bot_pursue_n
 ;;line 1074;; _bot_pursue_n

.L0373 ;;line 1075;;  if temp6  >  3 then bot_obj_y[temp1] = temp6  -  1  :  return

	LDA #3
	CMP temp6
     BCS .skipL0373
.condpart106
	LDA temp6
	SEC
	SBC #1
	LDX temp1
	STA bot_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0373
.L0374 ;;line 1076;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_y[temp1] = 28  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA #28
	LDX temp1
	STA bot_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1077;; 

._bot_pursue_s
 ;;line 1078;; _bot_pursue_s

.L0375 ;;line 1079;;  if temp6  <  38 then bot_obj_y[temp1] = temp6  +  1  :  return

	LDA temp6
	CMP #38
     BCS .skipL0375
.condpart107
	LDA temp6
	CLC
	ADC #1
	LDX temp1
	STA bot_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0375
.L0376 ;;line 1080;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_y[temp1] = 4  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA #4
	LDX temp1
	STA bot_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1081;; 

._bot_pursue_e
 ;;line 1082;; _bot_pursue_e

.L0377 ;;line 1083;;  if temp5  <  134 then bot_obj_x[temp1] = temp5  +  1  :  return

	LDA temp5
	CMP #134
     BCS .skipL0377
.condpart108
	LDA temp5
	CLC
	ADC #1
	LDX temp1
	STA bot_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0377
.L0378 ;;line 1084;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_x[temp1] = 18  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA #18
	LDX temp1
	STA bot_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1085;; 

._bot_pursue_w
 ;;line 1086;; _bot_pursue_w

.L0379 ;;line 1087;;  if temp5  >  18 then bot_obj_x[temp1] = temp5  -  1  :  return

	LDA #18
	CMP temp5
     BCS .skipL0379
.condpart109
	LDA temp5
	SEC
	SBC #1
	LDX temp1
	STA bot_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0379
.L0380 ;;line 1088;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_x[temp1] = 132  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA #132
	LDX temp1
	STA bot_obj_x,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1089;; 

.check_bot_sword_hit
 ;;line 1090;; check_bot_sword_hit

.L0381 ;;line 1091;;  temp4 = 0

	LDA #0
	STA temp4
.L0382 ;;line 1092;;  if r_bot_obj_room[4]  <>  bottom_room then return

	LDX #4
	LDA r_bot_obj_room,x
	CMP bottom_room
     BEQ .skipL0382
.condpart110
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0382
.L0383 ;;line 1093;;  temp2 = temp5  +  8  :  temp3 = bot_obj_x[4]  +  8

	LDA temp5
	CLC
	ADC #8
	STA temp2
	LDX #4
	LDA bot_obj_x,x
	CLC
	ADC #8
	STA temp3
.L0384 ;;line 1094;;  if temp2  <  bot_obj_x[4]  ||  temp5  >  temp3 then return

	LDA temp2
	LDX #4
	CMP bot_obj_x,x
     BCS .skipL0384
.condpart111
 jmp .condpart112
.skipL0384
	LDA temp3
	CMP temp5
     BCS .skip18OR
.condpart112
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip18OR
.L0385 ;;line 1095;;  temp2 = temp6  +  20  :  temp3 = bot_obj_y[4]  +  6

	LDA temp6
	CLC
	ADC #20
	STA temp2
	LDX #4
	LDA bot_obj_y,x
	CLC
	ADC #6
	STA temp3
.L0386 ;;line 1096;;  if temp2  <  bot_obj_y[4]  ||  temp6  >  temp3 then return

	LDA temp2
	LDX #4
	CMP bot_obj_y,x
     BCS .skipL0386
.condpart113
 jmp .condpart114
.skipL0386
	LDA temp3
	CMP temp6
     BCS .skip19OR
.condpart114
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip19OR
.L0387 ;;line 1097;;  temp4 = 1

	LDA #1
	STA temp4
.L0388 ;;line 1098;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1099;; 

.
 ;;line 1100;; 

.
 ;;line 1101;; 

.
 ;;line 1102;; 

.check_bot_ball_hit
 ;;line 1103;; check_bot_ball_hit

.L0389 ;;line 1104;;  temp4 = 0

	LDA #0
	STA temp4
.
 ;;line 1105;; 

.L0390 ;;line 1106;;  temp2 = p2_ballx  +  1  :  temp3 = p2_ballx  +  6

	LDA p2_ballx
	CLC
	ADC #1
	STA temp2
	LDA p2_ballx
	CLC
	ADC #6
	STA temp3
.L0391 ;;line 1107;;  if temp5  <  temp2  ||  temp5  >  temp3 then return

	LDA temp5
	CMP temp2
     BCS .skipL0391
.condpart115
 jmp .condpart116
.skipL0391
	LDA temp3
	CMP temp5
     BCS .skip20OR
.condpart116
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip20OR
.L0392 ;;line 1108;;  temp2 = p2_bally  +  9  :  temp3 = p2_bally  +  15

	LDA p2_bally
	CLC
	ADC #9
	STA temp2
	LDA p2_bally
	CLC
	ADC #15
	STA temp3
.L0393 ;;line 1109;;  if temp6  <  temp2  ||  temp6  >  temp3 then return

	LDA temp6
	CMP temp2
     BCS .skipL0393
.condpart117
 jmp .condpart118
.skipL0393
	LDA temp3
	CMP temp6
     BCS .skip21OR
.condpart118
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip21OR
.L0394 ;;line 1110;;  temp4 = 1

	LDA #1
	STA temp4
.L0395 ;;line 1111;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1112;; 

.L0396 ;;line 1113;;  data bit_mask

	JMP .skipL0396
bit_mask
	.byte  1, 2, 4

.skipL0396
.
 ;;line 1116;; 

.L0397 ;;line 1117;;  data bot_bit_mask

	JMP .skipL0397
bot_bit_mask
	.byte  8, 16, 32

.skipL0397
.
 ;;line 1120;; 

.
 ;;line 1121;; 

.run_flicker_logic
 ;;line 1122;; run_flicker_logic

.L0398 ;;line 1123;;  asm

   lda #255

   sta w_top_obj_hit

   sta top_player1y

   sta w_bot_obj_hit

   sta bottom_player1y



   

   ldx flicker_idx

   ldy #11

.loop_top_flicker

   inx

   cpx #11

   bcc .top_idx_ok

   ldx #0

.top_idx_ok

   lda r_top_obj_room,x

   cmp top_room

   beq .found_top_obj

   dey

   bne .loop_top_flicker

   beq .done_top_flicker



.found_top_obj

   stx flicker_idx

   stx w_top_obj_hit

   lda top_obj_x,x

   sta top_player1x

   lda top_obj_y,x

   sta top_player1y

   lda obj_colors,x

   sta top_colup1



.done_top_flicker

   

   ldx bot_flicker_idx

   ldy #11

.loop_bot_flicker

   inx

   cpx #11

   bcc .bot_idx_ok

   ldx #0

.bot_idx_ok

   lda r_bot_obj_room,x

   cmp bottom_room

   beq .found_bot_obj

   dey

   bne .loop_bot_flicker

   beq .done_bot_flicker



.found_bot_obj

   stx bot_flicker_idx

   stx w_bot_obj_hit

   lda bot_obj_x,x

   sta bottom_player1x

   lda bot_obj_y,x

   sta bottom_player1y

   lda obj_colors,x

   sta bottom_colup1



.done_bot_flicker

.L0399 ;;line 1185;;  return otherbank

	JMP BS_return
.
 ;;line 1186;; 

.
 ;;line 1187;; 

.L0400 ;;line 1188;;  data obj_colors

	JMP .skipL0400
obj_colors
	.byte  $44, $1E, $C4, $00, $1E, $1E, $44, $1E, $0E, $00, $00

.skipL0400
.
 ;;line 1191;; 

.L0401 ;;line 1192;;  bank 3

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
.
 ;;line 1193;; 

.apply_graphics
 ;;line 1194;; apply_graphics

.
 ;;line 1195;; 

.L0402 ;;line 1196;;  temp3 = r_bot_obj_hit  :  temp4 = bot_drag_state  :  temp2 = drag_dead  /  8  :  gosub set_sprite_pointers

	LDA r_bot_obj_hit
	STA temp3
	LDA bot_drag_state
	STA temp4
	LDA drag_dead
	lsr
	lsr
	lsr
	STA temp2
 jsr .set_sprite_pointers
.L0403 ;;line 1197;;  bottom_p1_ptr_lo = top_p1_ptr_lo

	LDA top_p1_ptr_lo
	STA bottom_p1_ptr_lo
.L0404 ;;line 1198;;  bottom_p1_ptr_hi = top_p1_ptr_hi

	LDA top_p1_ptr_hi
	STA bottom_p1_ptr_hi
.
 ;;line 1199;; 

.
 ;;line 1200;; 

.L0405 ;;line 1201;;  temp3 = r_top_obj_hit  :  temp4 = top_drag_state  :  temp2 = drag_dead  &  7  :  gosub set_sprite_pointers

	LDA r_top_obj_hit
	STA temp3
	LDA top_drag_state
	STA temp4
	LDA drag_dead
	AND #7
	STA temp2
 jsr .set_sprite_pointers
.
 ;;line 1202;; 

.
 ;;line 1203;; 

.L0406 ;;line 1204;;  if joy0fire then top_carried_item = 255  :  goto _check_bot_pickup

 bit INPT4
	BMI .skipL0406
.condpart119
	LDA #255
	STA top_carried_item
 jmp ._check_bot_pickup
.skipL0406
.L0407 ;;line 1205;;  temp1 = r_top_obj_hit

	LDA r_top_obj_hit
	STA temp1
.L0408 ;;line 1206;;  if temp1  <  3  ||  temp1 = 255 then goto _check_bot_pickup

	LDA temp1
	CMP #3
     BCS .skipL0408
.condpart120
 jmp .condpart121
.skipL0408
	LDA temp1
	CMP #255
     BNE .skip22OR
.condpart121
 jmp ._check_bot_pickup
.skip22OR
.L0409 ;;line 1207;;  if temp1 = top_carried_item then goto _check_bot_pickup

	LDA temp1
	CMP top_carried_item
     BNE .skipL0409
.condpart122
 jmp ._check_bot_pickup
.skipL0409
.
 ;;line 1208;; 

.L0410 ;;line 1209;;  temp5 = ballx  +  4

	LDA ballx
	CLC
	ADC #4
	STA temp5
.L0411 ;;line 1210;;  temp6 = top_player1x  +  8

	LDA top_player1x
	CLC
	ADC #8
	STA temp6
.L0412 ;;line 1211;;  if temp5  <  top_player1x  ||  ballx  >  temp6 then goto _check_bot_pickup

	LDA temp5
	CMP top_player1x
     BCS .skipL0412
.condpart123
 jmp .condpart124
.skipL0412
	LDA temp6
	CMP ballx
     BCS .skip23OR
.condpart124
 jmp ._check_bot_pickup
.skip23OR
.
 ;;line 1212;; 

.L0413 ;;line 1213;;  temp5 = bally  +  4

	LDA bally
	CLC
	ADC #4
	STA temp5
.L0414 ;;line 1214;;  temp6 = top_player1y  +  8

	LDA top_player1y
	CLC
	ADC #8
	STA temp6
.L0415 ;;line 1215;;  if temp5  <  top_player1y  ||  bally  >  temp6 then goto _check_bot_pickup

	LDA temp5
	CMP top_player1y
     BCS .skipL0415
.condpart125
 jmp .condpart126
.skipL0415
	LDA temp6
	CMP bally
     BCS .skip24OR
.condpart126
 jmp ._check_bot_pickup
.skip24OR
.
 ;;line 1216;; 

.
 ;;line 1217;; 

.L0416 ;;line 1218;;  top_carried_item = temp1

	LDA temp1
	STA top_carried_item
.L0417 ;;line 1219;;  w_top_carry_off_x = top_obj_x[temp1]  -  ballx

	LDX temp1
	LDA top_obj_x,x
	SEC
	SBC ballx
	STA w_top_carry_off_x
.L0418 ;;line 1220;;  w_top_carry_off_y = top_obj_y[temp1]  -  bally

	LDX temp1
	LDA top_obj_y,x
	SEC
	SBC bally
	STA w_top_carry_off_y
.
 ;;line 1221;; 

._check_bot_pickup
 ;;line 1222;; _check_bot_pickup

.
 ;;line 1223;; 

.L0419 ;;line 1224;;  if joy1fire then bot_carried_item = 255  :  return otherbank

 bit INPT5
	BMI .skipL0419
.condpart127
	LDA #255
	STA bot_carried_item
	JMP BS_return
.skipL0419
.L0420 ;;line 1225;;  temp1 = r_bot_obj_hit

	LDA r_bot_obj_hit
	STA temp1
.L0421 ;;line 1226;;  if temp1  <  3  ||  temp1 = 255 then return otherbank

	LDA temp1
	CMP #3
     BCS .skipL0421
.condpart128
 jmp .condpart129
.skipL0421
	LDA temp1
	CMP #255
     BNE .skip25OR
.condpart129
	JMP BS_return
.skip25OR
.L0422 ;;line 1227;;  if temp1 = bot_carried_item then return otherbank

	LDA temp1
	CMP bot_carried_item
     BNE .skipL0422
.condpart130
	JMP BS_return
.skipL0422
.
 ;;line 1228;; 

.L0423 ;;line 1229;;  temp5 = p2_ballx  +  4

	LDA p2_ballx
	CLC
	ADC #4
	STA temp5
.L0424 ;;line 1230;;  temp6 = bottom_player1x  +  8

	LDA bottom_player1x
	CLC
	ADC #8
	STA temp6
.L0425 ;;line 1231;;  if temp5  <  bottom_player1x  ||  p2_ballx  >  temp6 then return otherbank

	LDA temp5
	CMP bottom_player1x
     BCS .skipL0425
.condpart131
 jmp .condpart132
.skipL0425
	LDA temp6
	CMP p2_ballx
     BCS .skip26OR
.condpart132
	JMP BS_return
.skip26OR
.
 ;;line 1232;; 

.L0426 ;;line 1233;;  temp5 = p2_bally  +  4

	LDA p2_bally
	CLC
	ADC #4
	STA temp5
.L0427 ;;line 1234;;  temp6 = bottom_player1y  +  8

	LDA bottom_player1y
	CLC
	ADC #8
	STA temp6
.L0428 ;;line 1235;;  if temp5  <  bottom_player1y  ||  p2_bally  >  temp6 then return otherbank

	LDA temp5
	CMP bottom_player1y
     BCS .skipL0428
.condpart133
 jmp .condpart134
.skipL0428
	LDA temp6
	CMP p2_bally
     BCS .skip27OR
.condpart134
	JMP BS_return
.skip27OR
.
 ;;line 1236;; 

.
 ;;line 1237;; 

.L0429 ;;line 1238;;  bot_carried_item = temp1

	LDA temp1
	STA bot_carried_item
.L0430 ;;line 1239;;  w_bot_carry_off_x = bot_obj_x[temp1]  -  p2_ballx

	LDX temp1
	LDA bot_obj_x,x
	SEC
	SBC p2_ballx
	STA w_bot_carry_off_x
.L0431 ;;line 1240;;  w_bot_carry_off_y = bot_obj_y[temp1]  -  p2_bally

	LDX temp1
	LDA bot_obj_y,x
	SEC
	SBC p2_bally
	STA w_bot_carry_off_y
.L0432 ;;line 1241;;  return otherbank

	JMP BS_return
.
 ;;line 1242;; 

.set_sprite_pointers
 ;;line 1243;; set_sprite_pointers

.L0433 ;;line 1244;;  if temp3  <  3 then goto _select_dragon_pose

	LDA temp3
	CMP #3
     BCS .skipL0433
.condpart135
 jmp ._select_dragon_pose
.skipL0433
.L0434 ;;line 1245;;  if temp3 = 3 then goto _gfx_magnet

	LDA temp3
	CMP #3
     BNE .skipL0434
.condpart136
 jmp ._gfx_magnet
.skipL0434
.L0435 ;;line 1246;;  if temp3 = 4 then goto _gfx_sword

	LDA temp3
	CMP #4
     BNE .skipL0435
.condpart137
 jmp ._gfx_sword
.skipL0435
.L0436 ;;line 1247;;  if temp3 = 5 then goto _gfx_chalice

	LDA temp3
	CMP #5
     BNE .skipL0436
.condpart138
 jmp ._gfx_chalice
.skipL0436
.L0437 ;;line 1248;;  if temp3 = 6 then goto _gfx_bridge

	LDA temp3
	CMP #6
     BNE .skipL0437
.condpart139
 jmp ._gfx_bridge
.skipL0437
.L0438 ;;line 1249;;  if temp3 = 7  ||  temp3 = 8 then goto _gfx_key

	LDA temp3
	CMP #7
     BNE .skipL0438
.condpart140
 jmp .condpart141
.skipL0438
	LDA temp3
	CMP #8
     BNE .skip28OR
.condpart141
 jmp ._gfx_key
.skip28OR
.L0439 ;;line 1250;;  if temp3 = 9 then goto _gfx_key

	LDA temp3
	CMP #9
     BNE .skipL0439
.condpart142
 jmp ._gfx_key
.skipL0439
.L0440 ;;line 1251;;  if temp3 = 10 then goto _gfx_bat

	LDA temp3
	CMP #10
     BNE .skipL0440
.condpart143
 jmp ._gfx_bat
.skipL0440
.L0441 ;;line 1252;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1253;; 

._select_dragon_pose
 ;;line 1254;; _select_dragon_pose

.
 ;;line 1255;; 

.L0442 ;;line 1256;;  temp2 = temp2  &  bit_mask_b3[temp3]

	LDA temp2
	LDX temp3
	AND bit_mask_b3,x
	STA temp2
.L0443 ;;line 1257;;  if temp2  <>  0 then goto _gfx_dragon_dead

	LDA temp2
	CMP #0
     BEQ .skipL0443
.condpart144
 jmp ._gfx_dragon_dead
.skipL0443
.
 ;;line 1258;; 

.L0444 ;;line 1259;;  if temp4{7} then goto _gfx_dragon

	BIT temp4
	BPL .skipL0444
.condpart145
 jmp ._gfx_dragon
.skipL0444
.
 ;;line 1260;; 

.L0445 ;;line 1261;;  temp2 = temp4  &  3

	LDA temp4
	AND #3
	STA temp2
.L0446 ;;line 1262;;  if temp2 = temp3 then goto _gfx_dragon_roar

	LDA temp2
	CMP temp3
     BNE .skipL0446
.condpart146
 jmp ._gfx_dragon_roar
.skipL0446
.L0447 ;;line 1263;;  goto _gfx_dragon

 jmp ._gfx_dragon
.
 ;;line 1264;; 

.L0448 ;;line 1265;;  data bit_mask_b3

	JMP .skipL0448
bit_mask_b3
	.byte  1, 2, 4

.skipL0448
.
 ;;line 1268;; 

._gfx_dragon
 ;;line 1269;; _gfx_dragon

.L0449 ;;line 1270;;  player1:

	LDX #<playerL0449_1
	STX player1pointerlo
	LDA #>playerL0449_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0450 ;;line 1297;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1298;; 

._gfx_dragon_roar
 ;;line 1299;; _gfx_dragon_roar

.L0451 ;;line 1300;;  player1:

	LDX #<playerL0451_1
	STX player1pointerlo
	LDA #>playerL0451_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0452 ;;line 1327;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1328;; 

._gfx_dragon_dead
 ;;line 1329;; _gfx_dragon_dead

.L0453 ;;line 1330;;  player1:

	LDX #<playerL0453_1
	STX player1pointerlo
	LDA #>playerL0453_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0454 ;;line 1357;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1358;; 

._gfx_magnet
 ;;line 1359;; _gfx_magnet

.L0455 ;;line 1360;;  player1:

	LDX #<playerL0455_1
	STX player1pointerlo
	LDA #>playerL0455_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0456 ;;line 1387;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1388;; 

._gfx_sword
 ;;line 1389;; _gfx_sword

.L0457 ;;line 1390;;  player1:

	LDX #<playerL0457_1
	STX player1pointerlo
	LDA #>playerL0457_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0458 ;;line 1417;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1418;; 

._gfx_chalice
 ;;line 1419;; _gfx_chalice

.L0459 ;;line 1420;;  player1:

	LDX #<playerL0459_1
	STX player1pointerlo
	LDA #>playerL0459_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0460 ;;line 1447;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1448;; 

._gfx_bridge
 ;;line 1449;; _gfx_bridge

.L0461 ;;line 1450;;  player1:

	LDX #<playerL0461_1
	STX player1pointerlo
	LDA #>playerL0461_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0462 ;;line 1477;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1478;; 

._gfx_key
 ;;line 1479;; _gfx_key

.L0463 ;;line 1480;;  player1:

	LDX #<playerL0463_1
	STX player1pointerlo
	LDA #>playerL0463_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0464 ;;line 1507;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1508;; 

._gfx_bat
 ;;line 1509;; _gfx_bat

.L0465 ;;line 1510;;  player1:

	LDX #<playerL0465_1
	STX player1pointerlo
	LDA #>playerL0465_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0466 ;;line 1537;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1538;; 

.check_gates
 ;;line 1539;; check_gates

.L0467 ;;line 1540;;  top_player0y = 255

	LDA #255
	STA top_player0y
.L0468 ;;line 1541;;  bottom_player0y = 255

	LDA #255
	STA bottom_player0y
.
 ;;line 1542;; 

.
 ;;line 1543;; 

.L0469 ;;line 1544;;  if top_room = ENTRY_YELLOW  &&  !gate_state{0} then top_player0y = 31

	LDA top_room
	CMP #ENTRY_YELLOW
     BNE .skipL0469
.condpart147
	LDA gate_state
	LSR
	BCS .skip147then
.condpart148
	LDA #31
	STA top_player0y
.skip147then
.skipL0469
.L0470 ;;line 1545;;  if top_room = ENTRY_WHITE  &&  !gate_state{1} then top_player0y = 31

	LDA top_room
	CMP #ENTRY_WHITE
     BNE .skipL0470
.condpart149
	LDA gate_state
	AND #2
	BNE .skip149then
.condpart150
	LDA #31
	STA top_player0y
.skip149then
.skipL0470
.L0471 ;;line 1546;;  if top_room = ENTRY_BLACK  &&  !gate_state{2} then top_player0y = 31

	LDA top_room
	CMP #ENTRY_BLACK
     BNE .skipL0471
.condpart151
	LDA gate_state
	AND #4
	BNE .skip151then
.condpart152
	LDA #31
	STA top_player0y
.skip151then
.skipL0471
.
 ;;line 1547;; 

.
 ;;line 1548;; 

.L0472 ;;line 1549;;  if bottom_room = ENTRY_YELLOW  &&  !gate_state{3} then bottom_player0y = 30

	LDA bottom_room
	CMP #ENTRY_YELLOW
     BNE .skipL0472
.condpart153
	LDA gate_state
	AND #8
	BNE .skip153then
.condpart154
	LDA #30
	STA bottom_player0y
.skip153then
.skipL0472
.L0473 ;;line 1550;;  if bottom_room = ENTRY_WHITE  &&  !gate_state{4} then bottom_player0y = 30

	LDA bottom_room
	CMP #ENTRY_WHITE
     BNE .skipL0473
.condpart155
	LDA gate_state
	AND #16
	BNE .skip155then
.condpart156
	LDA #30
	STA bottom_player0y
.skip155then
.skipL0473
.L0474 ;;line 1551;;  if bottom_room = ENTRY_BLACK  &&  !gate_state{5} then bottom_player0y = 30

	LDA bottom_room
	CMP #ENTRY_BLACK
     BNE .skipL0474
.condpart157
	LDA gate_state
	AND #32
	BNE .skip157then
.condpart158
	LDA #30
	STA bottom_player0y
.skip157then
.skipL0474
.L0475 ;;line 1552;;  return otherbank

	JMP BS_return
.
 ;;line 1553;; 

.gate_collide_top
 ;;line 1554;; gate_collide_top

.L0476 ;;line 1555;;  temp1 = top_carried_item

	LDA top_carried_item
	STA temp1
.L0477 ;;line 1556;;  if top_room = ENTRY_YELLOW  &&  temp1 = 7 then gate_state{0} = 1  :  top_player0y = 255  :  return otherbank

	LDA top_room
	CMP #ENTRY_YELLOW
     BNE .skipL0477
.condpart159
	LDA temp1
	CMP #7
     BNE .skip159then
.condpart160
	LDA gate_state
	ORA #1
	STA gate_state
	LDA #255
	STA top_player0y
	JMP BS_return
.skip159then
.skipL0477
.L0478 ;;line 1557;;  if top_room = ENTRY_WHITE  &&  temp1 = 8 then gate_state{1} = 1  :  top_player0y = 255  :  return otherbank

	LDA top_room
	CMP #ENTRY_WHITE
     BNE .skipL0478
.condpart161
	LDA temp1
	CMP #8
     BNE .skip161then
.condpart162
	LDA gate_state
	ORA #2
	STA gate_state
	LDA #255
	STA top_player0y
	JMP BS_return
.skip161then
.skipL0478
.L0479 ;;line 1558;;  if top_room = ENTRY_BLACK  &&  temp1 = 9 then gate_state{2} = 1  :  top_player0y = 255  :  return otherbank

	LDA top_room
	CMP #ENTRY_BLACK
     BNE .skipL0479
.condpart163
	LDA temp1
	CMP #9
     BNE .skip163then
.condpart164
	LDA gate_state
	ORA #4
	STA gate_state
	LDA #255
	STA top_player0y
	JMP BS_return
.skip163then
.skipL0479
.L0480 ;;line 1559;;  ballx = r_top_oldx  :  bally = r_top_oldy

	LDA r_top_oldx
	STA ballx
	LDA r_top_oldy
	STA bally
.L0481 ;;line 1560;;  return otherbank

	JMP BS_return
.
 ;;line 1561;; 

.gate_collide_bot
 ;;line 1562;; gate_collide_bot

.L0482 ;;line 1563;;  temp1 = bot_carried_item

	LDA bot_carried_item
	STA temp1
.L0483 ;;line 1564;;  if bottom_room = ENTRY_YELLOW  &&  temp1 = 7 then gate_state{3} = 1  :  bottom_player0y = 255  :  return otherbank

	LDA bottom_room
	CMP #ENTRY_YELLOW
     BNE .skipL0483
.condpart165
	LDA temp1
	CMP #7
     BNE .skip165then
.condpart166
	LDA gate_state
	ORA #8
	STA gate_state
	LDA #255
	STA bottom_player0y
	JMP BS_return
.skip165then
.skipL0483
.L0484 ;;line 1565;;  if bottom_room = ENTRY_WHITE  &&  temp1 = 8 then gate_state{4} = 1  :  bottom_player0y = 255  :  return otherbank

	LDA bottom_room
	CMP #ENTRY_WHITE
     BNE .skipL0484
.condpart167
	LDA temp1
	CMP #8
     BNE .skip167then
.condpart168
	LDA gate_state
	ORA #16
	STA gate_state
	LDA #255
	STA bottom_player0y
	JMP BS_return
.skip167then
.skipL0484
.L0485 ;;line 1566;;  if bottom_room = ENTRY_BLACK  &&  temp1 = 9 then gate_state{5} = 1  :  bottom_player0y = 255  :  return otherbank

	LDA bottom_room
	CMP #ENTRY_BLACK
     BNE .skipL0485
.condpart169
	LDA temp1
	CMP #9
     BNE .skip169then
.condpart170
	LDA gate_state
	ORA #32
	STA gate_state
	LDA #255
	STA bottom_player0y
	JMP BS_return
.skip169then
.skipL0485
.L0486 ;;line 1567;;  p2_ballx = r_bottom_oldx  :  p2_bally = r_bottom_oldy

	LDA r_bottom_oldx
	STA p2_ballx
	LDA r_bottom_oldy
	STA p2_bally
.L0487 ;;line 1568;;  return otherbank

	JMP BS_return
.
 ;;line 1569;; 

.
 ;;line 1570;; 

.castle_transitions_top
 ;;line 1571;; castle_transitions_top

.L0488 ;;line 1572;;  if bally  >  44 then goto _top_castle_exit_check

	LDA #44
	CMP bally
     BCS .skipL0488
.condpart171
 jmp ._top_castle_exit_check
.skipL0488
.L0489 ;;line 1573;;  if ballx  <  71  ||  ballx  >  85 then return otherbank

	LDA ballx
	CMP #71
     BCS .skipL0489
.condpart172
 jmp .condpart173
.skipL0489
	LDA #85
	CMP ballx
     BCS .skip41OR
.condpart173
	JMP BS_return
.skip41OR
.L0490 ;;line 1574;;  if bally  <  32  &&  top_room = ENTRY_YELLOW then top_room = CASTLE_YELLOW  :  bally = 42  :  w_top_oldy = 42  :  room_flags{0} = 1  :  return otherbank

	LDA bally
	CMP #32
     BCS .skipL0490
.condpart174
	LDA top_room
	CMP #ENTRY_YELLOW
     BNE .skip174then
.condpart175
	LDA #CASTLE_YELLOW
	STA top_room
	LDA #42
	STA bally
	STA w_top_oldy
	LDA room_flags
	ORA #1
	STA room_flags
	JMP BS_return
.skip174then
.skipL0490
.L0491 ;;line 1575;;  if bally  <  32  &&  top_room = ENTRY_WHITE then top_room = CASTLE_WHITE  :  bally = 42  :  w_top_oldy = 42  :  room_flags{0} = 1  :  return otherbank

	LDA bally
	CMP #32
     BCS .skipL0491
.condpart176
	LDA top_room
	CMP #ENTRY_WHITE
     BNE .skip176then
.condpart177
	LDA #CASTLE_WHITE
	STA top_room
	LDA #42
	STA bally
	STA w_top_oldy
	LDA room_flags
	ORA #1
	STA room_flags
	JMP BS_return
.skip176then
.skipL0491
.L0492 ;;line 1576;;  if bally  <  32  &&  top_room = ENTRY_BLACK then top_room = CASTLE_BLACK  :  bally = 42  :  w_top_oldy = 42  :  room_flags{0} = 1  :  return otherbank

	LDA bally
	CMP #32
     BCS .skipL0492
.condpart178
	LDA top_room
	CMP #ENTRY_BLACK
     BNE .skip178then
.condpart179
	LDA #CASTLE_BLACK
	STA top_room
	LDA #42
	STA bally
	STA w_top_oldy
	LDA room_flags
	ORA #1
	STA room_flags
	JMP BS_return
.skip178then
.skipL0492
.L0493 ;;line 1577;;  return otherbank

	JMP BS_return
.
 ;;line 1578;; 

._top_castle_exit_check
 ;;line 1579;; _top_castle_exit_check

.L0494 ;;line 1580;;  if top_room = CASTLE_YELLOW then top_room = ENTRY_YELLOW  :  bally = 34  :  w_top_oldy = 34  :  room_flags{0} = 1  :  return otherbank

	LDA top_room
	CMP #CASTLE_YELLOW
     BNE .skipL0494
.condpart180
	LDA #ENTRY_YELLOW
	STA top_room
	LDA #34
	STA bally
	STA w_top_oldy
	LDA room_flags
	ORA #1
	STA room_flags
	JMP BS_return
.skipL0494
.L0495 ;;line 1581;;  if top_room = CASTLE_WHITE then top_room = ENTRY_WHITE  :  bally = 34  :  w_top_oldy = 34  :  room_flags{0} = 1  :  return otherbank

	LDA top_room
	CMP #CASTLE_WHITE
     BNE .skipL0495
.condpart181
	LDA #ENTRY_WHITE
	STA top_room
	LDA #34
	STA bally
	STA w_top_oldy
	LDA room_flags
	ORA #1
	STA room_flags
	JMP BS_return
.skipL0495
.L0496 ;;line 1582;;  if top_room = CASTLE_BLACK then top_room = ENTRY_BLACK  :  bally = 34  :  w_top_oldy = 34  :  room_flags{0} = 1  :  return otherbank

	LDA top_room
	CMP #CASTLE_BLACK
     BNE .skipL0496
.condpart182
	LDA #ENTRY_BLACK
	STA top_room
	LDA #34
	STA bally
	STA w_top_oldy
	LDA room_flags
	ORA #1
	STA room_flags
	JMP BS_return
.skipL0496
.L0497 ;;line 1583;;  return otherbank

	JMP BS_return
.
 ;;line 1584;; 

.castle_transitions_bot
 ;;line 1585;; castle_transitions_bot

.L0498 ;;line 1586;;  if p2_bally  >  45 then goto _bot_castle_exit_check

	LDA #45
	CMP p2_bally
     BCS .skipL0498
.condpart183
 jmp ._bot_castle_exit_check
.skipL0498
.L0499 ;;line 1587;;  if p2_ballx  <  76  ||  p2_ballx  >  90 then return otherbank

	LDA p2_ballx
	CMP #76
     BCS .skipL0499
.condpart184
 jmp .condpart185
.skipL0499
	LDA #90
	CMP p2_ballx
     BCS .skip45OR
.condpart185
	JMP BS_return
.skip45OR
.L0500 ;;line 1588;;  if p2_bally  <  31  &&  bottom_room = ENTRY_YELLOW then bottom_room = CASTLE_YELLOW  :  p2_bally = 42  :  w_bottom_oldy = 42  :  room_flags{1} = 1  :  return otherbank

	LDA p2_bally
	CMP #31
     BCS .skipL0500
.condpart186
	LDA bottom_room
	CMP #ENTRY_YELLOW
     BNE .skip186then
.condpart187
	LDA #CASTLE_YELLOW
	STA bottom_room
	LDA #42
	STA p2_bally
	STA w_bottom_oldy
	LDA room_flags
	ORA #2
	STA room_flags
	JMP BS_return
.skip186then
.skipL0500
.L0501 ;;line 1589;;  if p2_bally  <  31  &&  bottom_room = ENTRY_WHITE then bottom_room = CASTLE_WHITE  :  p2_bally = 42  :  w_bottom_oldy = 42  :  room_flags{1} = 1  :  return otherbank

	LDA p2_bally
	CMP #31
     BCS .skipL0501
.condpart188
	LDA bottom_room
	CMP #ENTRY_WHITE
     BNE .skip188then
.condpart189
	LDA #CASTLE_WHITE
	STA bottom_room
	LDA #42
	STA p2_bally
	STA w_bottom_oldy
	LDA room_flags
	ORA #2
	STA room_flags
	JMP BS_return
.skip188then
.skipL0501
.L0502 ;;line 1590;;  if p2_bally  <  31  &&  bottom_room = ENTRY_BLACK then bottom_room = CASTLE_BLACK  :  p2_bally = 42  :  w_bottom_oldy = 42  :  room_flags{1} = 1  :  return otherbank

	LDA p2_bally
	CMP #31
     BCS .skipL0502
.condpart190
	LDA bottom_room
	CMP #ENTRY_BLACK
     BNE .skip190then
.condpart191
	LDA #CASTLE_BLACK
	STA bottom_room
	LDA #42
	STA p2_bally
	STA w_bottom_oldy
	LDA room_flags
	ORA #2
	STA room_flags
	JMP BS_return
.skip190then
.skipL0502
.L0503 ;;line 1591;;  return otherbank

	JMP BS_return
.
 ;;line 1592;; 

._bot_castle_exit_check
 ;;line 1593;; _bot_castle_exit_check

.L0504 ;;line 1594;;  if bottom_room = CASTLE_YELLOW then bottom_room = ENTRY_YELLOW  :  p2_bally = 33  :  w_bottom_oldy = 33  :  room_flags{1} = 1  :  return otherbank

	LDA bottom_room
	CMP #CASTLE_YELLOW
     BNE .skipL0504
.condpart192
	LDA #ENTRY_YELLOW
	STA bottom_room
	LDA #33
	STA p2_bally
	STA w_bottom_oldy
	LDA room_flags
	ORA #2
	STA room_flags
	JMP BS_return
.skipL0504
.L0505 ;;line 1595;;  if bottom_room = CASTLE_WHITE then bottom_room = ENTRY_WHITE  :  p2_bally = 33  :  w_bottom_oldy = 33  :  room_flags{1} = 1  :  return otherbank

	LDA bottom_room
	CMP #CASTLE_WHITE
     BNE .skipL0505
.condpart193
	LDA #ENTRY_WHITE
	STA bottom_room
	LDA #33
	STA p2_bally
	STA w_bottom_oldy
	LDA room_flags
	ORA #2
	STA room_flags
	JMP BS_return
.skipL0505
.L0506 ;;line 1596;;  if bottom_room = CASTLE_BLACK then bottom_room = ENTRY_BLACK  :  p2_bally = 33  :  w_bottom_oldy = 33  :  room_flags{1} = 1  :  return otherbank

	LDA bottom_room
	CMP #CASTLE_BLACK
     BNE .skipL0506
.condpart194
	LDA #ENTRY_BLACK
	STA bottom_room
	LDA #33
	STA p2_bally
	STA w_bottom_oldy
	LDA room_flags
	ORA #2
	STA room_flags
	JMP BS_return
.skipL0506
.L0507 ;;line 1597;;  return otherbank

	JMP BS_return
.
 ;;line 1598;; 

.L0508 ;;line 1599;;  bank 4

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

top_player0y     = player0y
top_player1y     = player1y
top_p0_ptr_lo    = player0pointerlo
top_p0_ptr_hi    = player0pointerhi
top_p1_ptr_lo    = player1pointerlo
top_p1_ptr_hi    = player1pointerhi
top_colup0       = COLUP0
top_colup1       = COLUP1
top_colupf       = COLUPF

     ifnconst vertical_reflect
kernel
; --- DUAL SCREEN AUTO-CONFIGURATION ---
 ifconst pfres
     if pfres == 32
split_ram_offset = 64
split_pos_auto   = 64
     endif
     if pfres == 24
split_ram_offset = 48
split_pos_auto   = 80
     endif
     if pfres == 12
split_ram_offset = 24
split_pos_auto   = 104
     endif
 else
     ; Default to 12 lines TOTAL (6 per half) if pfres is omitted
split_ram_offset = 24
split_pos_auto   = 104
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
         ldx #128-48+(4-pfwidth)*12
     else
         ldx #128-pfres*pfwidth
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
         ldy playfield+pfres*pfwidth-128,x
         sty PF1L ;3
         ldy playfield+pfres*pfwidth-127-pfadjust,x
         sty PF2L ;3
         ;sleep 14 
         ldy playfield+pfres*pfwidth-126,x
         sty PF1 
         ldy playfield+pfres*pfwidth-125-pfadjust,x
         sty PF2
     else
             ldy playfield-48+pfwidth*12+48-128,x
             sty PF1L ;3
             ldy playfield-48+pfwidth*12+49-128-pfadjust,x ;4
             sty PF2L ;3
             
             ldy playfield-48+pfwidth*12+50-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+51-128-pfadjust,x
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
         lda playfield+pfres*pfwidth-128,x 
         sta PF1L ;3
         lda playfield+pfres*pfwidth-127-pfadjust,x 
         sta PF2L ;3
         ;sleep 14 
         ldy playfield+pfres*pfwidth-126,x
         sty PF1 
         ldy playfield+pfres*pfwidth-125-pfadjust,x
         sty PF2
     else
             lda playfield-48+pfwidth*12+48-128,x ;4
             sta PF1L ;3
             lda playfield-48+pfwidth*12+49-128-pfadjust,x ;4
             sta PF2L ;3
             
             ldy playfield-48+pfwidth*12+50-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+51-128-pfadjust,x
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
         ldy.w playfield-128+pfres*pfwidth-4      ; Fixed A7 memory addressing
         sty PF1L ;3
         ldy.w playfield-128+pfres*pfwidth-3-pfadjust
         sty PF2L ;3

         ;sleep 14 
         ldy.w playfield-128+pfres*pfwidth-2      ; Fixed A7 memory addressing
         sty PF1 
         ldy.w playfield-128+pfres*pfwidth-1-pfadjust
         sty PF2
     else
             ldy.w playfield-48+pfwidth*12+44
             sty PF1L ;3
             ldy.w playfield-48+pfwidth*12+45-pfadjust
             sty PF2L ;3
             
             ldy.w playfield-48+pfwidth*12+46         ; Fixed
             sty PF1 
             ldy.w playfield-48+pfwidth*12+47-pfadjust; Fixed
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
            ldy.w playfield-128+pfres*pfwidth-4      ; Fixed A7 memory addressing
            sty PF1L ;3
            ldy.w playfield-128+pfres*pfwidth-3-pfadjust
            sty PF2L ;3

            ;sleep 14 
            ldy.w playfield-128+pfres*pfwidth-2      ; Fixed A7 memory addressing
            sty PF1 
            ldy.w playfield-128+pfres*pfwidth-1-pfadjust
            sty PF2

             else
                     ldy.w playfield-48+pfwidth*12+44
                     sty PF1L ;3
                     ldy.w playfield-48+pfwidth*12+45-pfadjust
                     sty PF2L ;3
                     
                     ldy.w playfield-48+pfwidth*12+46         ; Fixed
                     sty PF1 
                     ldy.w playfield-48+pfwidth*12+47-pfadjust; Fixed
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
 
; =========================================================
; THE DIVIDER & SWAP ROUTINE 
; =========================================================
SplitDoDivider
     txa                ; Push playfield offset X to stack (Cycle 37)
     pha                ; (Cycle 40)
     
     ; --- CACHE TOP SCREEN COLLISIONS ---
     lda CXBLPF         ; (Cycle 43)
     sta top_cxblpf     ; (Cycle 46)
     lda CXP0FB         ; (Cycle 49)
     sta top_cxp0fb     ; (Cycle 52)
     lda CXP1FB         ; (Cycle 55)
     sta top_cxp1fb     ; (Cycle 58)
     sta CXCLR          ; (Cycle 61)
     
     ; Clear leftover top-screen sprites & ball before divider scanlines!
     ; (GRP1 MUST be written last to latch GRP0 and ENABL via VDELP0/VDELBL)
     lda #0             ; (Cycle 63)
     sta GRP0           ; (Cycle 66)
     sta ENABL          ; (Cycle 69)
     sta GRP1           ; (Cycle 72 - safely before Cycle 76 WSYNC!)
     
     ; Scanline 1: The 1-Pixel Colored Line + Pointer Swaps
     sta WSYNC
     ifconst split_color
         lda #split_color
         sta COLUBK    
     endif
     
     lda bottom_player0y
     sta top_player0y
     lda bottom_player1y         
     sta top_player1y
     lda bottom_p0_ptr_lo
     sta top_p0_ptr_lo
     lda bottom_p0_ptr_hi
     sta top_p0_ptr_hi
     lda bottom_p1_ptr_lo
     sta top_p1_ptr_lo
     lda bottom_p1_ptr_hi
     sta top_p1_ptr_hi

     ; Fast Clamp Bottom Player 1 X 
     lda bottom_player1x
     cmp #160          
     bcc .d_safe
     lda #159          
.d_safe  
     tax               
         
     ; Fast Clamp Bottom Player 0 X 
     lda bottom_player0x
     cmp #160
     bcc .c_safe
     lda #159
.c_safe  
     tay               
         
     ; Scanline 2: Position Bottom P0
     sta WSYNC
     ifconst split_color
         lda #0
         sta COLUBK      
         lda temp1       
         nop             
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
     
     ; Scanline 3: Position Bottom P1 
     sta WSYNC
     sleep 10          
     txa               
     sec
SplitPosP1
     sbc #15
     bcs SplitPosP1
     sta RESP1         
     tax               

     ; Scanline 4: Position Bottom Ball
     sta WSYNC
     sleep 10          
     lda p2_ballx
     sec
SplitPosBall
     sbc #15
     bcs SplitPosBall
     sta RESBL
     pha               ; PUSH remainder to stack (Saves temp4 from corruption!)
     
     ; Scanline 5: Fine Positioning Math + Remaining Swaps
     sta WSYNC
     sta HMCLR         
     
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
     
     pla               ; PULL ball remainder from stack
     eor #7
     asl
     asl
     asl
     asl
     sta HMBL
     
     ; Offload remaining color swaps 
     lda bottom_colupf
     sta top_colupf        
     lda bottom_colup0
     sta top_colup0        
     lda bottom_colup1
     sta top_colup1        
     
     ; Scanline 6: Apply fine position, restore playfield, and phase sync
     sta WSYNC
     sta HMOVE         
     
     ; Swap Ball Y-Coordinate 
     ; (The kernel automatically restores the true top 'bally' at the end of the frame)
     lda p2_bally
     sta bally

     pla
     tax               
         
     ; Proven playfield phase sync (25 cycles minus 12 cycles used above = 13)
     sleep 13
         
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
.
 ;;line 1600;; 

.
 ;;line 1601;; 

.
 ;;line 1602;; 

.
 ;;line 1603;; 

.L0509 ;;line 1604;;  vblank

vblank_bB_code
.L0510 ;;line 1605;;  if !room_flags{0} then goto _skip_vblank_top

	LDA room_flags
	LSR
	BCS .skipL0510
.condpart195
 jmp ._skip_vblank_top
.skipL0510
.L0511 ;;line 1606;;  room_flags{0} = 0

	LDA room_flags
	AND #254
	STA room_flags
.L0512 ;;line 1607;;  gosub load_top_room bank1

 sta temp7
 lda #>(ret_point11-1)
 pha
 lda #<(ret_point11-1)
 pha
 lda #>(.load_top_room-1)
 pha
 lda #<(.load_top_room-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
ret_point11
.L0513 ;;line 1608;;  gosub check_gates bank3

 sta temp7
 lda #>(ret_point12-1)
 pha
 lda #<(ret_point12-1)
 pha
 lda #>(.check_gates-1)
 pha
 lda #<(.check_gates-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point12
.
 ;;line 1609;; 

._skip_vblank_top
 ;;line 1610;; _skip_vblank_top

.L0514 ;;line 1611;;  if !room_flags{1} then goto _skip_vblank_bot

	LDA room_flags
	AND #2
	BNE .skipL0514
.condpart196
 jmp ._skip_vblank_bot
.skipL0514
.L0515 ;;line 1612;;  room_flags{1} = 0

	LDA room_flags
	AND #253
	STA room_flags
.L0516 ;;line 1613;;  gosub load_bottom_room bank1

 sta temp7
 lda #>(ret_point13-1)
 pha
 lda #<(ret_point13-1)
 pha
 lda #>(.load_bottom_room-1)
 pha
 lda #<(.load_bottom_room-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
ret_point13
.L0517 ;;line 1614;;  gosub check_gates bank3

 sta temp7
 lda #>(ret_point14-1)
 pha
 lda #<(ret_point14-1)
 pha
 lda #>(.check_gates-1)
 pha
 lda #<(.check_gates-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point14
.
 ;;line 1615;; 

._skip_vblank_bot
 ;;line 1616;; _skip_vblank_bot

.L0518 ;;line 1617;;  gosub apply_graphics bank3

 sta temp7
 lda #>(ret_point15-1)
 pha
 lda #<(ret_point15-1)
 pha
 lda #>(.apply_graphics-1)
 pha
 lda #<(.apply_graphics-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
ret_point15
.L0519 ;;line 1618;;  return
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
 if (<*) > (<(*+14))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL097_0
	.byte  %01111111
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01111111
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0449_1
	.byte   %00111111
	.byte   %11100001
	.byte   %10001111
	.byte   %00001000
	.byte   %00111100
	.byte   %11111111
	.byte   %11000111
	.byte   %11000011
	.byte   %11000011
	.byte   %11100011
	.byte   %01111111
	.byte   %00111111
	.byte   %00011110
	.byte   %00000100
	.byte   %00000100
	.byte   %00001110
	.byte   %11111110
	.byte   %11110011
	.byte   %00001111
	.byte   %00000110
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0451_1
	.byte   %00011100
	.byte   %00001000
	.byte   %00111100
	.byte   %11111110
	.byte   %11000011
	.byte   %00000111
	.byte   %00011111
	.byte   %00111110
	.byte   %01111000
	.byte   %01110000
	.byte   %01110000
	.byte   %01111001
	.byte   %00111111
	.byte   %00011111
	.byte   %11001110
	.byte   %11100100
	.byte   %00001100
	.byte   %00111110
	.byte   %11101111
	.byte   %11000111
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0453_1
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000110
	.byte   %00100011
	.byte   %10010001
	.byte   %01111110
	.byte   %01001000
	.byte   %00011100
	.byte   %00111110
	.byte   %01111011
	.byte   %11111001
	.byte   %10111111
	.byte   %11011111
	.byte   %01001110
	.byte   %00100100
	.byte   %00011100
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0455_1
	.byte   %11000011
	.byte   %11000011
	.byte   %11000011
	.byte   %11000011
	.byte   %11000011
	.byte   %11100111
	.byte   %01111110
	.byte   %00111100
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0457_1
	.byte   %00100000
	.byte   %01000000
	.byte   %11111111
	.byte   %01000000
	.byte   %00100000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0459_1
	.byte   %01111110
	.byte   %00011000
	.byte   %00011000
	.byte   %00111100
	.byte   %01111110
	.byte   %01111110
	.byte   %11000011
	.byte   %10000001
	.byte   %10000001
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0461_1
	.byte   %11000011
	.byte   %11000011
	.byte   %11000011
	.byte   %11000011
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %01000010
	.byte   %11000011
	.byte   %11000011
	.byte   %11000011
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0463_1
	.byte   %10100111
	.byte   %11111101
	.byte   %00000111
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0465_1
	.byte   %01100110
	.byte   %01011010
	.byte   %11111111
	.byte   %11000011
	.byte   %11000011
	.byte   %10000001
	.byte   %10000001
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
	.byte   %00000000
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
