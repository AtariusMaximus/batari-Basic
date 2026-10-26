game
.L00 ;;line 1;;  set kernel split

.L01 ;;line 2;;  set romsize 16kSC

.
 ;;line 3;; 

.
 ;;line 4;; 

.L02 ;;line 5;;  const pfres = 24

.L03 ;;line 6;;  const noscore = 1

.
 ;;line 7;; 

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

.
 ;;line 42;; 

.
 ;;line 43;; 

.
 ;;line 44;; 

.
 ;;line 45;; 

.
 ;;line 46;; 

.
 ;;line 47;; 

.
 ;;line 48;; 

.
 ;;line 49;; 

.
 ;;line 50;; 

.
 ;;line 51;; 

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

.
 ;;line 57;; 

.
 ;;line 58;; 

.
 ;;line 59;; 

.
 ;;line 60;; 

.
 ;;line 61;; 

.
 ;;line 62;; 

.
 ;;line 63;; 

.
 ;;line 64;; 

.
 ;;line 65;; 

.
 ;;line 66;; 

.
 ;;line 67;; 

.
 ;;line 68;; 

.
 ;;line 69;; 

.
 ;;line 70;; 

.
 ;;line 71;; 

.
 ;;line 72;; 

.
 ;;line 73;; 

.
 ;;line 74;; 

.
 ;;line 75;; 

.
 ;;line 76;; 

.
 ;;line 77;; 

.
 ;;line 78;; 

.
 ;;line 79;; 

.
 ;;line 80;; 

.
 ;;line 81;; 

.
 ;;line 82;; 

.
 ;;line 83;; 

.
 ;;line 84;; 

.
 ;;line 85;; 

.
 ;;line 86;; 

.
 ;;line 87;; 

.
 ;;line 88;; 

.
 ;;line 89;; 

.
 ;;line 90;; 

.
 ;;line 91;; 

.
 ;;line 92;; 

.
 ;;line 93;; 

.
 ;;line 94;; 

.
 ;;line 95;; 

.
 ;;line 96;; 

.
 ;;line 97;; 

.
 ;;line 98;; 

.
 ;;line 99;; 

.
 ;;line 100;; 

.
 ;;line 101;; 

.
 ;;line 102;; 

.
 ;;line 103;; 

.
 ;;line 104;; 

.
 ;;line 105;; 

.
 ;;line 106;; 

.
 ;;line 107;; 

.
 ;;line 108;; 

.
 ;;line 109;; 

.
 ;;line 110;; 

.
 ;;line 111;; 

.
 ;;line 112;; 

.
 ;;line 113;; 

.
 ;;line 114;; 

.
 ;;line 115;; 

.
 ;;line 116;; 

.
 ;;line 117;; 

.
 ;;line 118;; 

.
 ;;line 119;; 

.
 ;;line 120;; 

.
 ;;line 121;; 

.
 ;;line 122;; 

.
 ;;line 123;; 

.
 ;;line 124;; 

.
 ;;line 125;; 

.
 ;;line 126;; 

.
 ;;line 127;; 

.
 ;;line 128;; 

.
 ;;line 129;; 

.
 ;;line 130;; 

.
 ;;line 131;; 

.
 ;;line 132;; 

.
 ;;line 133;; 

.
 ;;line 134;; 

.
 ;;line 135;; 

.
 ;;line 136;; 

.
 ;;line 137;; 

.
 ;;line 138;; 

.
 ;;line 139;; 

.
 ;;line 140;; 

.
 ;;line 141;; 

.
 ;;line 142;; 

.
 ;;line 143;; 

.
 ;;line 144;; 

.
 ;;line 145;; 

.
 ;;line 146;; 

.
 ;;line 147;; 

.L04 ;;line 148;;  const DEBUG_NO_SWALLOW = 0

.L05 ;;line 149;;  dim split_color = aux4

.L06 ;;line 150;;  const logo_color = $00

.L07 ;;line 151;;  const logo_height = 48

.
 ;;line 152;; 

.
 ;;line 153;; 

.
 ;;line 154;; 

.
 ;;line 155;; 

.L08 ;;line 156;;  dim top_player0x = player0x

.L09 ;;line 157;;  dim top_player0y = player0y

.L010 ;;line 158;;  dim top_player1x = player1x

.L011 ;;line 159;;  dim top_player1y = player1y

.L012 ;;line 160;;  dim top_colup0 = COLUP0

.L013 ;;line 161;;  dim top_colup1 = COLUP1

.L014 ;;line 162;;  dim top_colupf = COLUPF

.L015 ;;line 163;;  dim top_p0_ptr_lo = player0pointerlo

.L016 ;;line 164;;  dim top_p0_ptr_hi = player0pointerhi

.L017 ;;line 165;;  dim top_p1_ptr_lo = player1pointerlo

.L018 ;;line 166;;  dim top_p1_ptr_hi = player1pointerhi

.
 ;;line 167;; 

.
 ;;line 168;; 

.
 ;;line 169;; 

.
 ;;line 170;; 

.L019 ;;line 171;;  const OBJ_RED_DRAGON = 0

.L020 ;;line 172;;  const OBJ_YEL_DRAGON = 1

.L021 ;;line 173;;  const OBJ_GRN_DRAGON = 2

.L022 ;;line 174;;  const OBJ_MAGNET = 3

.L023 ;;line 175;;  const OBJ_SWORD = 4

.L024 ;;line 176;;  const OBJ_CHALICE = 5

.L025 ;;line 177;;  const OBJ_BRIDGE = 6

.L026 ;;line 178;;  const OBJ_YEL_KEY = 7

.L027 ;;line 179;;  const OBJ_WHT_KEY = 8

.L028 ;;line 180;;  const OBJ_BLK_KEY = 9

.L029 ;;line 181;;  const OBJ_BAT = 10

.
 ;;line 182;; 

.L030 ;;line 183;;  const ENTRY_YELLOW = 2

.L031 ;;line 184;;  const ENTRY_WHITE = 23

.L032 ;;line 185;;  const ENTRY_BLACK = 13

.L033 ;;line 186;;  const CASTLE_YELLOW = 1

.L034 ;;line 187;;  const CASTLE_WHITE = 21

.L035 ;;line 188;;  const CASTLE_BLACK = 12

.
 ;;line 189;; 

.
 ;;line 190;; 

.
 ;;line 191;; 

.
 ;;line 192;; 

.
 ;;line 193;; 

.L036 ;;line 194;;  dim w_top_obj_room = w000

.L037 ;;line 195;;  dim w_bot_obj_room = w011

.L038 ;;line 196;;  dim w_top_oldx = w022

.L039 ;;line 197;;  dim w_top_oldy = w023

.L040 ;;line 198;;  dim w_bottom_oldx = w024

.L041 ;;line 199;;  dim w_bottom_oldy = w025

.L042 ;;line 200;;  dim w_top_carry_off_x = w026

.L043 ;;line 201;;  dim w_top_carry_off_y = w027

.L044 ;;line 202;;  dim w_bot_carry_off_x = w028

.L045 ;;line 203;;  dim w_bot_carry_off_y = w029

.L046 ;;line 204;;  dim w_bottom_ctrlpf = w030

.L047 ;;line 205;;  dim w_bottom_nusiz1 = w031

.
 ;;line 206;; 

.
 ;;line 207;; 

.L048 ;;line 208;;  dim r_top_obj_room = r000

.L049 ;;line 209;;  dim r_bot_obj_room = r011

.L050 ;;line 210;;  dim r_top_oldx = r022

.L051 ;;line 211;;  dim r_top_oldy = r023

.L052 ;;line 212;;  dim r_bottom_oldx = r024

.L053 ;;line 213;;  dim r_bottom_oldy = r025

.L054 ;;line 214;;  dim r_top_carry_off_x = r026

.L055 ;;line 215;;  dim r_top_carry_off_y = r027

.L056 ;;line 216;;  dim r_bot_carry_off_x = r028

.L057 ;;line 217;;  dim r_bot_carry_off_y = r029

.L058 ;;line 218;;  dim r_bottom_ctrlpf = r030

.L059 ;;line 219;;  dim r_bottom_nusiz1 = r031

.
 ;;line 220;; 

.
 ;;line 221;; 

.
 ;;line 222;; 

.
 ;;line 223;; 

.L060 ;;line 224;;  dim top_obj_x = var0

.L061 ;;line 225;;  dim top_obj_y = var11

.L062 ;;line 226;;  dim bot_obj_x = var22

.L063 ;;line 227;;  dim bot_obj_y = var33

.
 ;;line 228;; 

.L064 ;;line 229;;  dim room_flags = var44

.L065 ;;line 230;;  dim bot_flicker_idx = var45

.L066 ;;line 231;;  dim flicker_idx = var46

.L067 ;;line 232;;  dim bot_nusiz0 = var47

.L068 ;;line 233;;  dim drag_awake = aux3

.
 ;;line 234;; 

.
 ;;line 235;; 

.L069 ;;line 236;;  const bottom_colubk_val = $06

.
 ;;line 237;; 

.
 ;;line 238;; 

.
 ;;line 239;; 

.
 ;;line 240;; 

.L070 ;;line 241;;  dim bottom_colup0 = a

.L071 ;;line 242;;  dim bottom_colup1 = b

.L072 ;;line 243;;  dim bottom_player0y = c

.L073 ;;line 244;;  dim bottom_player0x = d

.L074 ;;line 245;;  dim bottom_colupf = e

.L075 ;;line 246;;  dim top_room = f

.L076 ;;line 247;;  dim bottom_room = g

.L077 ;;line 248;;  dim top_carried_item = h

.L078 ;;line 249;;  dim bot_carried_item = i

.L079 ;;line 250;;  dim gate_state = j

.L080 ;;line 251;;  dim top_drag_state = k

.L081 ;;line 252;;  dim bottom_player1y = l

.L082 ;;line 253;;  dim bottom_player1x = m

.L083 ;;line 254;;  dim bottom_p0_ptr_lo = n

.L084 ;;line 255;;  dim bottom_p0_ptr_hi = o

.L085 ;;line 256;;  dim bottom_p1_ptr_lo = p

.L086 ;;line 257;;  dim bottom_p1_ptr_hi = q

.L087 ;;line 258;;  dim bot_drag_state = r

.L088 ;;line 259;;  dim drag_dead = s

.L089 ;;line 260;;  dim top_bat_state = t

.L090 ;;line 261;;  dim bot_bat_state = u

.L091 ;;line 262;;  dim p2_ballx = v

.L092 ;;line 263;;  dim p2_bally = w

.L093 ;;line 264;;  dim bat_fedup = x

.L094 ;;line 265;;  dim top_cxblpf = y

.L095 ;;line 266;;  dim top_cxp0fb = z

.
 ;;line 267;; 

.
 ;;line 268;; 

.
 ;;line 269;; 

.
 ;;line 270;; 

.L096 ;;line 271;;  goto _title_screen bank3

 sta temp7
 lda #>(._title_screen-1)
 pha
 lda #<(._title_screen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #3
 jmp BS_jsr
.
 ;;line 272;; 

.main_loop
 ;;line 273;; main_loop

.L097 ;;line 274;;  split_color = $00

	LDA #$00
	STA split_color
.L098 ;;line 275;;  if switchreset then reboot

 lda #1
 bit SWCHB
	BNE .skipL098
.condpart0
	JMP ($FFFC)
.skipL098
.L099 ;;line 276;;  if r005 = 1  ||  r016 = 1 then top_drag_state = 0  :  goto game_won

	LDA r005
	CMP #1
     BNE .skipL099
.condpart1
 jmp .condpart2
.skipL099
	LDA r016
	CMP #1
     BNE .skip0OR
.condpart2
	LDA #0
	STA top_drag_state
 jmp .game_won
.skip0OR
.
 ;;line 277;; 

.
 ;;line 278;; 

.L0100 ;;line 279;;  room_flags = room_flags  ^  $80

	LDA room_flags
	EOR #$80
	STA room_flags
.
 ;;line 280;; 

.
 ;;line 281;; 

.L0101 ;;line 282;;  gosub run_flicker_logic bank2

 sta temp7
 lda #>(ret_point1-1)
 pha
 lda #<(ret_point1-1)
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
ret_point1
.
 ;;line 283;; 

._draw_now
 ;;line 284;; _draw_now

.
 ;;line 285;; 

.L0102 ;;line 286;;  PF0 = 0

	LDA #0
	STA PF0
.L0103 ;;line 287;;  top_colubk = $06

	LDA #$06
	STA top_colubk
.L0104 ;;line 288;;  COLUBK = $06

	LDA #$06
	STA COLUBK
.L0105 ;;line 289;;  top_colupf = room_color[top_room]

	LDX top_room
	LDA room_color,x
	STA top_colupf
.L0106 ;;line 290;;  bottom_colupf = room_color[bottom_room]

	LDX bottom_room
	LDA room_color,x
	STA bottom_colupf
.
 ;;line 291;; 

.L0107 ;;line 292;;  top_colup0 = $02

	LDA #$02
	STA top_colup0
.L0108 ;;line 293;;  player0color = $02

	LDA #$02
	STA player0color
.L0109 ;;line 294;;  bottom_colup0 = $02

	LDA #$02
	STA bottom_colup0
.L0110 ;;line 295;;  NUSIZ0 = 5

	LDA #5
	STA NUSIZ0
.L0111 ;;line 296;;  CTRLPF = $21

	LDA #$21
	STA CTRLPF
.
 ;;line 297;; 

.L0112 ;;line 298;;  if !room_flags{2} then goto _skip_top_torch

	LDA room_flags
	AND #4
	BNE .skipL0112
.condpart3
 jmp ._skip_top_torch
.skipL0112
.L0113 ;;line 299;;  top_colup0 = $28

	LDA #$28
	STA top_colup0
.L0114 ;;line 300;;  player0color = $28

	LDA #$28
	STA player0color
.L0115 ;;line 301;;  NUSIZ0 = 7

	LDA #7
	STA NUSIZ0
.L0116 ;;line 302;;  CTRLPF = $25

	LDA #$25
	STA CTRLPF
._skip_top_torch
 ;;line 303;; _skip_top_torch

.
 ;;line 304;; 

.L0117 ;;line 305;;  if room_flags{3} then bottom_colup0 = $28

	LDA room_flags
	AND #8
	BEQ .skipL0117
.condpart4
	LDA #$28
	STA bottom_colup0
.skipL0117
.
 ;;line 306;; 

.L0118 ;;line 307;;  asm

 lda room_flags

 and #8

 lsr

 tax

 ora #$21

 sta w_bottom_ctrlpf

 txa

 lsr

 ora #5

 sta bot_nusiz0

.L0119 ;;line 319;;  drawscreen

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
.
 ;;line 320;; 

.
 ;;line 321;; 

.
 ;;line 322;; 

.
 ;;line 323;; 

.L0120 ;;line 324;;  temp5 = 0

	LDA #0
	STA temp5
.L0121 ;;line 325;;  if top_cxp0fb{6}  &&  !room_flags{2} then gosub gate_collide_top bank4

	BIT top_cxp0fb
	BVC .skipL0121
.condpart5
	LDA room_flags
	AND #4
	BNE .skip5then
.condpart6
 sta temp7
 lda #>(ret_point3-1)
 pha
 lda #<(ret_point3-1)
 pha
 lda #>(.gate_collide_top-1)
 pha
 lda #<(.gate_collide_top-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point3
.skip5then
.skipL0121
.L0122 ;;line 326;;  if temp5  <>  0 then goto _skip_top_pf_check

	LDA temp5
	CMP #0
     BEQ .skipL0122
.condpart7
 jmp ._skip_top_pf_check
.skipL0122
.L0123 ;;line 327;;  if top_cxblpf{7}  &&  !top_drag_state{7} then gosub bridge_pf_check_top bank4

	BIT top_cxblpf
	BPL .skipL0123
.condpart8
	BIT top_drag_state
	BMI .skip8then
.condpart9
 sta temp7
 lda #>(ret_point4-1)
 pha
 lda #<(ret_point4-1)
 pha
 lda #>(.bridge_pf_check_top-1)
 pha
 lda #<(.bridge_pf_check_top-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point4
.skip8then
.skipL0123
._skip_top_pf_check
 ;;line 328;; _skip_top_pf_check

.
 ;;line 329;; 

.L0124 ;;line 330;;  temp6 = 0

	LDA #0
	STA temp6
.L0125 ;;line 331;;  if collision(player0,ball)  &&  !room_flags{3} then gosub gate_collide_bot bank4

	bit 	CXP0FB
	BVC .skipL0125
.condpart10
	LDA room_flags
	AND #8
	BNE .skip10then
.condpart11
 sta temp7
 lda #>(ret_point5-1)
 pha
 lda #<(ret_point5-1)
 pha
 lda #>(.gate_collide_bot-1)
 pha
 lda #<(.gate_collide_bot-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point5
.skip10then
.skipL0125
.L0126 ;;line 332;;  if temp6  <>  0 then goto _skip_bot_pf_check

	LDA temp6
	CMP #0
     BEQ .skipL0126
.condpart12
 jmp ._skip_bot_pf_check
.skipL0126
.L0127 ;;line 333;;  if collision(ball,playfield)  &&  !bot_drag_state{7} then gosub bridge_pf_check_bot bank4

	bit 	CXBLPF
	BPL .skipL0127
.condpart13
	BIT bot_drag_state
	BMI .skip13then
.condpart14
 sta temp7
 lda #>(ret_point6-1)
 pha
 lda #<(ret_point6-1)
 pha
 lda #>(.bridge_pf_check_bot-1)
 pha
 lda #<(.bridge_pf_check_bot-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point6
.skip13then
.skipL0127
._skip_bot_pf_check
 ;;line 334;; _skip_bot_pf_check

.
 ;;line 335;; 

.
 ;;line 336;; 

.L0128 ;;line 337;;  if temp5 = 0 then w_top_oldx = ballx  :  w_top_oldy = bally

	LDA temp5
	CMP #0
     BNE .skipL0128
.condpart15
	LDA ballx
	STA w_top_oldx
	LDA bally
	STA w_top_oldy
.skipL0128
.L0129 ;;line 338;;  if temp6 = 0 then w_bottom_oldx = p2_ballx  :  w_bottom_oldy = p2_bally

	LDA temp6
	CMP #0
     BNE .skipL0129
.condpart16
	LDA p2_ballx
	STA w_bottom_oldx
	LDA p2_bally
	STA w_bottom_oldy
.skipL0129
.
 ;;line 339;; 

.
 ;;line 340;; 

.L0130 ;;line 341;;  asm

   lda room_flags

   bmi .odd_frame_x



.even_frame_y

   

   lda top_drag_state

   bmi .skip_ty

   lda SWCHA

   and #$30

   cmp #$20       

   beq .t_up

   cmp #$10       

   bne .skip_ty

   inc bally

   inc bally

   jmp .skip_ty

.t_up

   dec bally

   dec bally

.skip_ty



   

   lda bot_drag_state

   bmi .joy_done

   lda SWCHA

   and #$03

   cmp #$02       

   beq .b_up

   cmp #$01       

   bne .joy_done

   inc p2_bally

   inc p2_bally

   jmp .joy_done

.b_up

   dec p2_bally

   dec p2_bally

   jmp .joy_done



.odd_frame_x

   

   lda top_drag_state

   bmi .skip_tx

   lda SWCHA

   and #$C0

   cmp #$80       

   beq .t_left

   cmp #$40       

   bne .skip_tx

   inc ballx

   inc ballx

   jmp .skip_tx

.t_left

   dec ballx

   dec ballx

.skip_tx



   

   lda bot_drag_state

   bmi .joy_done

   lda SWCHA

   and #$0C

   cmp #$08       

   beq .b_left

   cmp #$04       

   bne .joy_done

   inc p2_ballx

   inc p2_ballx

   jmp .joy_done

.b_left

   dec p2_ballx

   dec p2_ballx

.joy_done

.
 ;;line 415;; 

.
 ;;line 416;; 

.
 ;;line 417;; 

.
 ;;line 418;; 

.
 ;;line 419;; 

.
 ;;line 420;; 

.L0131 ;;line 421;;  if !room_flags{7} then goto _even_frame_logic

	BIT room_flags
	BMI .skipL0131
.condpart17
 jmp ._even_frame_logic
.skipL0131
.L0132 ;;line 422;;  goto _odd_frame_logic

 jmp ._odd_frame_logic
.
 ;;line 423;; 

._even_frame_logic
 ;;line 424;; _even_frame_logic

.
 ;;line 425;; 

.L0133 ;;line 426;;  if top_drag_state{7} then gosub update_top_dragons bank2  :  goto main_loop

	BIT top_drag_state
	BPL .skipL0133
.condpart18
 sta temp7
 lda #>(ret_point7-1)
 pha
 lda #<(ret_point7-1)
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
ret_point7
 jmp .main_loop
.skipL0133
.
 ;;line 427;; 

.L0134 ;;line 428;;  if bally  <  32  ||  bally  >  46 then gosub castle_transitions_top

	LDA bally
	CMP #32
     BCS .skipL0134
.condpart19
 jmp .condpart20
.skipL0134
	LDA #46
	CMP bally
     BCS .skip5OR
.condpart20
 jsr .castle_transitions_top
.skip5OR
.L0135 ;;line 429;;  if room_flags{0} then room_flags{0} = 0  :  goto _top_room_changed

	LDA room_flags
	LSR
	BCC .skipL0135
.condpart21
	LDA room_flags
	AND #254
	STA room_flags
 jmp ._top_room_changed
.skipL0135
.
 ;;line 430;; 

.
 ;;line 431;; 

.L0136 ;;line 432;;  if ballx  <  15 then ballx = 139  :  top_room = move_west[top_room]  :  goto _t_x_adj

	LDA ballx
	CMP #15
     BCS .skipL0136
.condpart22
	LDA #139
	STA ballx
	LDX top_room
	LDA move_west,x
	STA top_room
 jmp ._t_x_adj
.skipL0136
.L0137 ;;line 433;;  if ballx  >  141 then ballx = 17  :  top_room = move_east[top_room]  :  goto _t_x_adj

	LDA #141
	CMP ballx
     BCS .skipL0137
.condpart23
	LDA #17
	STA ballx
	LDX top_room
	LDA move_east,x
	STA top_room
 jmp ._t_x_adj
.skipL0137
.L0138 ;;line 434;;  if bally  <  2 then goto _t_go_north

	LDA bally
	CMP #2
     BCS .skipL0138
.condpart24
 jmp ._t_go_north
.skipL0138
.L0139 ;;line 435;;  if bally  >  46 then goto _t_go_south

	LDA #46
	CMP bally
     BCS .skipL0139
.condpart25
 jmp ._t_go_south
.skipL0139
.
 ;;line 436;; 

.L0140 ;;line 437;;  gosub update_top_dragons bank2

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
.L0141 ;;line 438;;  goto main_loop

 jmp .main_loop
.
 ;;line 439;; 

._t_go_north
 ;;line 440;; _t_go_north

.L0142 ;;line 441;;  asm

   ldx top_room

   lda move_north,x

   sta temp6

   jsr check_g1_temp6

   

   lda r_top_obj_room+6

   cmp top_room

   bne .t_n_done

   lda top_obj_y+6

   cmp #8

   bcs .t_n_done

   lda #53

   sta top_obj_y+6

   lda temp6

   sta w_top_obj_room+6

.t_n_done

   lda #44

   sta bally

   lda temp6

   sta top_room

.L0143 ;;line 463;;  goto _t_y_adj

 jmp ._t_y_adj
.
 ;;line 464;; 

._t_go_south
 ;;line 465;; _t_go_south

.L0144 ;;line 466;;  asm

   ldx top_room

   lda move_south,x

   sta temp6

   jsr check_g1_temp6

   

   lda r_top_obj_room+6

   cmp top_room

   bne .t_s_done

   lda top_obj_y+6

   cmp #44

   bcc .t_s_done

   lda #5

   sta top_obj_y+6

   lda temp6

   sta w_top_obj_room+6

.t_s_done

   lda #3

   sta bally

   lda temp6

   sta top_room

.L0145 ;;line 488;;  goto _t_y_adj

 jmp ._t_y_adj
.
 ;;line 489;; 

._t_x_adj
 ;;line 490;; _t_x_adj

.L0146 ;;line 491;;  bally = r_top_oldy  :  goto _top_room_changed

	LDA r_top_oldy
	STA bally
 jmp ._top_room_changed
._t_y_adj
 ;;line 492;; _t_y_adj

.L0147 ;;line 493;;  ballx = r_top_oldx

	LDA r_top_oldx
	STA ballx
.
 ;;line 494;; 

._top_room_changed
 ;;line 495;; _top_room_changed

.L0148 ;;line 496;;  w_top_oldx = ballx  :  w_top_oldy = bally

	LDA ballx
	STA w_top_oldx
	LDA bally
	STA w_top_oldy
.L0149 ;;line 497;;  asm

   lda top_room

   sta temp6

   jsr check_g1_temp6

   lda temp6

   sta top_room

.L0150 ;;line 504;;  gosub load_top_room

 jsr .load_top_room
.L0151 ;;line 505;;  gosub check_gates bank3

 sta temp7
 lda #>(ret_point9-1)
 pha
 lda #<(ret_point9-1)
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
ret_point9
.
 ;;line 506;; 

.
 ;;line 507;; 

.L0152 ;;line 508;;  asm

   lda #255

   sta top_player1y

   sta flicker_idx

   ldx top_carried_item

   bmi .done_top_tr_sync

   stx flicker_idx

   lda top_room

   sta w_top_obj_room,x

   lda ballx

   clc

   adc r_top_carry_off_x

   sta top_obj_x,x

   sta top_player1x

   lda bally

   clc

   adc r_top_carry_off_y

   sta top_obj_y,x

   sta top_player1y

.done_top_tr_sync

.L0153 ;;line 529;;  goto _draw_now

 jmp ._draw_now
.
 ;;line 530;; 

._odd_frame_logic
 ;;line 531;; _odd_frame_logic

.
 ;;line 532;; 

.L0154 ;;line 533;;  if bot_drag_state{7} then gosub update_bot_dragons bank2  :  goto main_loop

	BIT bot_drag_state
	BPL .skipL0154
.condpart26
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
 jmp .main_loop
.skipL0154
.
 ;;line 534;; 

.L0155 ;;line 535;;  if p2_bally  <  31  ||  p2_bally  >  47 then gosub castle_transitions_bot

	LDA p2_bally
	CMP #31
     BCS .skipL0155
.condpart27
 jmp .condpart28
.skipL0155
	LDA #47
	CMP p2_bally
     BCS .skip6OR
.condpart28
 jsr .castle_transitions_bot
.skip6OR
.L0156 ;;line 536;;  if room_flags{1} then room_flags{1} = 0  :  goto _bot_room_changed

	LDA room_flags
	AND #2
	BEQ .skipL0156
.condpart29
	LDA room_flags
	AND #253
	STA room_flags
 jmp ._bot_room_changed
.skipL0156
.
 ;;line 537;; 

.
 ;;line 538;; 

.L0157 ;;line 539;;  if p2_ballx  <  15 then p2_ballx = 139  :  bottom_room = move_west[bottom_room]  :  goto _b_x_adj

	LDA p2_ballx
	CMP #15
     BCS .skipL0157
.condpart30
	LDA #139
	STA p2_ballx
	LDX bottom_room
	LDA move_west,x
	STA bottom_room
 jmp ._b_x_adj
.skipL0157
.L0158 ;;line 540;;  if p2_ballx  >  141 then p2_ballx = 17  :  bottom_room = move_east[bottom_room]  :  goto _b_x_adj

	LDA #141
	CMP p2_ballx
     BCS .skipL0158
.condpart31
	LDA #17
	STA p2_ballx
	LDX bottom_room
	LDA move_east,x
	STA bottom_room
 jmp ._b_x_adj
.skipL0158
.L0159 ;;line 541;;  if p2_bally  <  2 then goto _b_go_north

	LDA p2_bally
	CMP #2
     BCS .skipL0159
.condpart32
 jmp ._b_go_north
.skipL0159
.L0160 ;;line 542;;  if p2_bally  >  47 then goto _b_go_south

	LDA #47
	CMP p2_bally
     BCS .skipL0160
.condpart33
 jmp ._b_go_south
.skipL0160
.
 ;;line 543;; 

.L0161 ;;line 544;;  gosub update_bot_dragons bank2

 sta temp7
 lda #>(ret_point11-1)
 pha
 lda #<(ret_point11-1)
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
ret_point11
.L0162 ;;line 545;;  goto main_loop

 jmp .main_loop
.
 ;;line 546;; 

._b_go_north
 ;;line 547;; _b_go_north

.L0163 ;;line 548;;  asm

   ldx bottom_room

   lda move_north,x

   sta temp6

   jsr check_g1_temp6

   

   lda r_bot_obj_room+6

   cmp bottom_room

   bne .b_n_done

   lda bot_obj_y+6

   cmp #8

   bcs .b_n_done

   lda #53

   sta bot_obj_y+6

   lda temp6

   sta w_bot_obj_room+6

.b_n_done

   lda #45

   sta p2_bally

   lda temp6

   sta bottom_room

.L0164 ;;line 570;;  goto _b_y_adj

 jmp ._b_y_adj
.
 ;;line 571;; 

._b_go_south
 ;;line 572;; _b_go_south

.L0165 ;;line 573;;  asm

   ldx bottom_room

   lda move_south,x

   sta temp6

   jsr check_g1_temp6

   

   lda r_bot_obj_room+6

   cmp bottom_room

   bne .b_s_done

   lda bot_obj_y+6

   cmp #44

   bcc .b_s_done

   lda #5

   sta bot_obj_y+6

   lda temp6

   sta w_bot_obj_room+6

.b_s_done

   lda #3

   sta p2_bally

   lda temp6

   sta bottom_room

.L0166 ;;line 595;;  goto _b_y_adj

 jmp ._b_y_adj
.
 ;;line 596;; 

._b_x_adj
 ;;line 597;; _b_x_adj

.L0167 ;;line 598;;  p2_bally = r_bottom_oldy  :  goto _bot_room_changed

	LDA r_bottom_oldy
	STA p2_bally
 jmp ._bot_room_changed
._b_y_adj
 ;;line 599;; _b_y_adj

.L0168 ;;line 600;;  p2_ballx = r_bottom_oldx

	LDA r_bottom_oldx
	STA p2_ballx
.
 ;;line 601;; 

._bot_room_changed
 ;;line 602;; _bot_room_changed

.L0169 ;;line 603;;  w_bottom_oldx = p2_ballx  :  w_bottom_oldy = p2_bally

	LDA p2_ballx
	STA w_bottom_oldx
	LDA p2_bally
	STA w_bottom_oldy
.L0170 ;;line 604;;  asm

   lda bottom_room

   sta temp6

   jsr check_g1_temp6

   lda temp6

   sta bottom_room

.L0171 ;;line 611;;  gosub load_bottom_room

 jsr .load_bottom_room
.L0172 ;;line 612;;  gosub check_gates bank3

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
 ;;line 613;; 

.
 ;;line 614;; 

.L0173 ;;line 615;;  asm

   lda #255

   sta bottom_player1y

   sta bot_flicker_idx

   ldx bot_carried_item

   bmi .done_bot_tr_sync

   stx bot_flicker_idx

   lda bottom_room

   sta w_bot_obj_room,x

   lda p2_ballx

   clc

   adc r_bot_carry_off_x

   sta bot_obj_x,x

   sta bottom_player1x

   lda p2_bally

   clc

   adc r_bot_carry_off_y

   sta bot_obj_y,x

   sta bottom_player1y

.done_bot_tr_sync

.L0174 ;;line 636;;  goto _draw_now

 jmp ._draw_now
.
 ;;line 637;; 

.game_won
 ;;line 638;; game_won

.L0175 ;;line 639;;  PF0 = 0

	LDA #0
	STA PF0
.L0176 ;;line 640;;  COLUBK = $06

	LDA #$06
	STA COLUBK
.L0177 ;;line 641;;  CTRLPF = $21

	LDA #$21
	STA CTRLPF
.L0178 ;;line 642;;  NUSIZ0 = 5

	LDA #5
	STA NUSIZ0
.L0179 ;;line 643;;  if switchreset then reboot

 lda #1
 bit SWCHB
	BNE .skipL0179
.condpart34
	JMP ($FFFC)
.skipL0179
.
 ;;line 644;; 

.
 ;;line 645;; 

.L0180 ;;line 646;;  top_colupf = room_color[top_room]

	LDX top_room
	LDA room_color,x
	STA top_colupf
.L0181 ;;line 647;;  bottom_colupf = room_color[bottom_room]

	LDX bottom_room
	LDA room_color,x
	STA bottom_colupf
.L0182 ;;line 648;;  top_colup0 = $02

	LDA #$02
	STA top_colup0
.L0183 ;;line 649;;  bottom_colup0 = $02

	LDA #$02
	STA bottom_colup0
.
 ;;line 650;; 

.
 ;;line 651;; 

.L0184 ;;line 652;;  bat_fedup = bat_fedup  +  2

	LDA bat_fedup
	CLC
	ADC #2
	STA bat_fedup
.
 ;;line 653;; 

.
 ;;line 654;; 

.L0185 ;;line 655;;  if r005 = 1 then top_colupf = bat_fedup  :  top_colup0 = bat_fedup  +  $80

	LDA r005
	CMP #1
     BNE .skipL0185
.condpart35
	LDA bat_fedup
	STA top_colupf
	CLC
	ADC #$80
	STA top_colup0
.skipL0185
.L0186 ;;line 656;;  if r016 = 1 then bottom_colupf = bat_fedup  :  bottom_colup0 = bat_fedup  +  $80

	LDA r016
	CMP #1
     BNE .skipL0186
.condpart36
	LDA bat_fedup
	STA bottom_colupf
	CLC
	ADC #$80
	STA bottom_colup0
.skipL0186
.
 ;;line 657;; 

.
 ;;line 658;; 

.L0187 ;;line 659;;  gosub run_flicker_logic bank2

 sta temp7
 lda #>(ret_point13-1)
 pha
 lda #<(ret_point13-1)
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
ret_point13
.L0188 ;;line 660;;  asm

 lda room_flags

 and #8

 lsr

 tax

 ora #$21

 sta w_bottom_ctrlpf

 txa

 lsr

 ora #5

 sta bot_nusiz0

.L0189 ;;line 672;;  drawscreen

 sta temp7
 lda #>(ret_point14-1)
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
 ldx #4
 jmp BS_jsr
ret_point14
.L0190 ;;line 673;;  goto game_won

 jmp .game_won
.
 ;;line 674;; 

.L0191 ;;line 675;;  asm

check_g1_temp6

   lda gate_state

   cmp #$40

   bcs .cg1_done

   

   

   lda temp6

   cmp #25

   bne .cg1_chk20

   lda #22

   sta temp6

   rts

   

.cg1_chk20

   

   cmp #20

   bne .cg1_chk11

   lda #16

   sta temp6

   rts

   

.cg1_chk11

   

   cmp #11

   bne .cg1_chk29

   lda #28

   sta temp6

   rts

   

.cg1_chk29

   

   cmp #29

   bne .cg1_chk18

   lda #12

   sta temp6

   rts

   

.cg1_chk18

   

   cmp #18

   bne .cg1_chk31

   cpx #22        

   bne .cg1_done

   lda #16

   sta temp6

   rts

   

.cg1_chk31

   

   cmp #31

   bne .cg1_done

   cpx #28        

   bne .cg1_done

   lda #12

   sta temp6

   

.cg1_done

   rts

.
 ;;line 735;; 

.
 ;;line 736;; 

.
 ;;line 737;; 

.
 ;;line 738;; 

.
 ;;line 739;; 

.castle_transitions_top
 ;;line 740;; castle_transitions_top

.L0192 ;;line 741;;  asm

   lda ballx

   sec

   sbc #71

   cmp #15

   bcs .t_ct_done

   lda bally

   cmp #47

   bcs .t_ct_south

   

   

   lda top_room

   cmp #2

   beq .do_t_n

   cmp #23

   beq .do_t_n

   cmp #13

   bne .t_ct_done

.do_t_n

.L0193 ;;line 761;;  top_room = move_north[top_room]  :  ballx = 78  :  bally = 42  :  room_flags{0} = 1  :  return

	LDX top_room
	LDA move_north,x
	STA top_room
	LDA #78
	STA ballx
	LDA #42
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
.L0194 ;;line 762;;  asm

.t_ct_south

   

   lda top_room

   cmp #1

   beq .do_t_s

   cmp #21

   beq .do_t_s

   cmp #12

   bne .t_ct_done

.do_t_s

.L0195 ;;line 774;;  top_room = move_south[top_room]  :  ballx = 78  :  bally = 34  :  room_flags{0} = 1

	LDX top_room
	LDA move_south,x
	STA top_room
	LDA #78
	STA ballx
	LDA #34
	STA bally
	LDA room_flags
	ORA #1
	STA room_flags
.L0196 ;;line 775;;  asm

.t_ct_done

.L0197 ;;line 778;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 779;; 

.castle_transitions_bot
 ;;line 780;; castle_transitions_bot

.L0198 ;;line 781;;  asm

   lda p2_ballx

   sec

   sbc #76

   cmp #15

   bcs .b_ct_done

   lda p2_bally

   cmp #48

   bcs .b_ct_south

   

   

   lda bottom_room

   cmp #2

   beq .do_b_n

   cmp #23

   beq .do_b_n

   cmp #13

   bne .b_ct_done

.do_b_n

.L0199 ;;line 801;;  bottom_room = move_north[bottom_room]  :  p2_ballx = 78  :  p2_bally = 42  :  room_flags{1} = 1  :  return

	LDX bottom_room
	LDA move_north,x
	STA bottom_room
	LDA #78
	STA p2_ballx
	LDA #42
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
.L0200 ;;line 802;;  asm

.b_ct_south

   

   lda bottom_room

   cmp #1

   beq .do_b_s

   cmp #21

   beq .do_b_s

   cmp #12

   bne .b_ct_done

.do_b_s

.L0201 ;;line 814;;  bottom_room = move_south[bottom_room]  :  p2_ballx = 78  :  p2_bally = 33  :  room_flags{1} = 1

	LDX bottom_room
	LDA move_south,x
	STA bottom_room
	LDA #78
	STA p2_ballx
	LDA #33
	STA p2_bally
	LDA room_flags
	ORA #2
	STA room_flags
.L0202 ;;line 815;;  asm

.b_ct_done

.L0203 ;;line 818;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 819;; 

.
 ;;line 820;; 

.
 ;;line 821;; 

.
 ;;line 822;; 

.
 ;;line 823;; 

.
 ;;line 824;; 

.L0204 ;;line 825;;  data move_north

	JMP .skipL0204
move_north
	.byte  0,30,1,2,3,4,32,14,10,9,8,9,11,12,7

	.byte  13,15,5,22,21,18,19,20,21,23,16,25,26,31,28

	.byte  5,17,6,24

.skipL0204
.
 ;;line 830;; 

.L0205 ;;line 831;;  data move_east

	JMP .skipL0205
move_east
	.byte  0,1,2,6,7,3,5,4,9,10,11,8,12,13,15

	.byte  16,14,14,19,18,21,20,22,23,27,26,25,29,28,24

	.byte  30,31,32,33

.skipL0205
.
 ;;line 836;; 

.L0206 ;;line 837;;  data move_south

	JMP .skipL0206
move_south
	.byte  0,2,3,4,5,30,32,14,10,11,8,12,13,15,7

	.byte  16,25,31,20,21,22,23,18,24,33,26,27,33,29,33

	.byte  1,28,6,33

.skipL0206
.
 ;;line 842;; 

.L0207 ;;line 843;;  data move_west

	JMP .skipL0207
move_west
	.byte  0,1,2,5,7,6,3,4,11,8,9,10,12,13,16

	.byte  14,15,16,19,18,21,20,22,23,29,26,25,24,28,27

	.byte  30,31,32,33

.skipL0207
.
 ;;line 848;; 

.L0208 ;;line 849;;  data room_shape

	JMP .skipL0208
room_shape
	.byte  0,5,19,0,1,3,4,2,20,21,22,23,18,19,6,6

	.byte  7,6,13,16,14,17,15,19,12,8,9,10,5,12,15

	.byte  24,24,24

.skipL0208
.
 ;;line 854;; 

.L0209 ;;line 855;;  data room_color

	JMP .skipL0209
room_color
	.byte  $00,$18,$18,$86,$86,$86,$86,$86,$06,$06,$06,$06,$46,$00,$64,$64

	.byte  $64,$64,$38,$38,$38,$38,$38,$0E,$64,$06,$06,$06,$66,$A8,$86

	.byte  $86,$86,$86

.skipL0209
.
 ;;line 860;; 

.
 ;;line 861;; 

.
 ;;line 862;; 

.
 ;;line 863;; 

.load_top_room
 ;;line 864;; load_top_room

.L0210 ;;line 865;;  asm

   ldy top_room

   ldx room_shape,y

   lda room_pointers_lo,x

   sta temp5

   lda room_pointers_hi,x

   sta temp6

   ldy #47

.loopTop

   lda (temp5),y

   sta playfield-128,y

   dey

   lda (temp5),y

   sta playfield-128,y

   dey

   lda (temp5),y

   sta playfield-128,y

   dey

   lda (temp5),y

   sta playfield-128,y

   dey

   bpl .loopTop

.L0211 ;;line 888;;  return otherbank

	JMP BS_return
.
 ;;line 889;; 

.load_bottom_room
 ;;line 890;; load_bottom_room

.L0212 ;;line 891;;  asm

   ldy bottom_room

   ldx room_shape,y

   lda room_pointers_lo,x

   sta temp5

   lda room_pointers_hi,x

   sta temp6

   ldy #47

.loopBot

   lda (temp5),y

   sta playfield-128+48,y

   dey

   lda (temp5),y

   sta playfield-128+48,y

   dey

   lda (temp5),y

   sta playfield-128+48,y

   dey

   lda (temp5),y

   sta playfield-128+48,y

   dey

   bpl .loopBot

.L0213 ;;line 914;;  return otherbank

	JMP BS_return
.
 ;;line 915;; 

.
 ;;line 916;; 

.
 ;;line 917;; 

.
 ;;line 918;; 

.
 ;;line 919;; 

.
 ;;line 920;; 

.L0214 ;;line 921;;  playfield:

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
.
 ;;line 935;; 

.
 ;;line 936;; 

.
 ;;line 937;; 

.L0215 ;;line 938;;  playfield:

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
.
 ;;line 952;; 

.
 ;;line 953;; 

.
 ;;line 954;; 

.L0216 ;;line 955;;  playfield:

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
.
 ;;line 969;; 

.
 ;;line 970;; 

.
 ;;line 971;; 

.L0217 ;;line 972;;  playfield:

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
	.byte %00000000, %00000011
	if (pfwidth>2)
	.byte %00000000, %00000011
 endif
	.byte %00000000, %00000011
	if (pfwidth>2)
	.byte %00000000, %00000011
 endif
	.byte %11001111, %11110011
	if (pfwidth>2)
	.byte %11001111, %11110011
 endif
	.byte %11001111, %11110011
	if (pfwidth>2)
	.byte %11001111, %11110011
 endif
	.byte %11000000, %00110000
	if (pfwidth>2)
	.byte %11000000, %00110000
 endif
	.byte %11000000, %00110000
	if (pfwidth>2)
	.byte %11000000, %00110000
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
pflabel3
	lda PF_data3,x
	sta playfield-128,x
	dex
	bpl pflabel3
.
 ;;line 986;; 

.
 ;;line 987;; 

.
 ;;line 988;; 

.L0218 ;;line 989;;  playfield:

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
.
 ;;line 1003;; 

.
 ;;line 1004;; 

.L0219 ;;line 1005;;  playfield:

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
.
 ;;line 1019;; 

.
 ;;line 1020;; 

.L0220 ;;line 1021;;  playfield:

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
.
 ;;line 1035;; 

.
 ;;line 1036;; 

.
 ;;line 1037;; 

.L0221 ;;line 1038;;  playfield:

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
	.byte %00000000, %00000101
	if (pfwidth>2)
	.byte %00000000, %00001010
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
.
 ;;line 1052;; 

.
 ;;line 1053;; 

.
 ;;line 1054;; 

.L0222 ;;line 1055;;  playfield:

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
.
 ;;line 1069;; 

.
 ;;line 1070;; 

.
 ;;line 1071;; 

.L0223 ;;line 1072;;  playfield:

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
.
 ;;line 1086;; 

.
 ;;line 1087;; 

.
 ;;line 1088;; 

.L0224 ;;line 1089;;  playfield:

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
.
 ;;line 1103;; 

.
 ;;line 1104;; 

.L0225 ;;line 1105;;  playfield:

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
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
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
.
 ;;line 1119;; 

.
 ;;line 1120;; 

.
 ;;line 1121;; 

.L0226 ;;line 1122;;  playfield:

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
	.byte %00011000, %00000110
	if (pfwidth>2)
	.byte %00011000, %00000110
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
.
 ;;line 1136;; 

.
 ;;line 1137;; 

.
 ;;line 1138;; 

.L0227 ;;line 1139;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel13
PF_data13
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
.
 ;;line 1153;; 

.
 ;;line 1154;; 

.
 ;;line 1155;; 

.L0228 ;;line 1156;;  playfield:

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
.
 ;;line 1170;; 

.
 ;;line 1171;; 

.
 ;;line 1172;; 

.L0229 ;;line 1173;;  playfield:

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
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %11000000, %00000000
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
.
 ;;line 1187;; 

.
 ;;line 1188;; 

.
 ;;line 1189;; 

.L0230 ;;line 1190;;  playfield:

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
.
 ;;line 1204;; 

.
 ;;line 1205;; 

.
 ;;line 1206;; 

.L0231 ;;line 1207;;  playfield:

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
.
 ;;line 1221;; 

.
 ;;line 1222;; 

.
 ;;line 1223;; 

.L0232 ;;line 1224;;  playfield:

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
	.byte %11000000, %00001100
	if (pfwidth>2)
	.byte %11000000, %00001100
 endif
	.byte %11000000, %00001100
	if (pfwidth>2)
	.byte %11000000, %00001100
 endif
	.byte %11001111, %00111100
	if (pfwidth>2)
	.byte %11001111, %00111100
 endif
	.byte %11001111, %00111100
	if (pfwidth>2)
	.byte %11001111, %00111100
 endif
	.byte %11001100, %00000000
	if (pfwidth>2)
	.byte %11001100, %00000000
 endif
	.byte %11001100, %00000000
	if (pfwidth>2)
	.byte %11001100, %00000000
 endif
	.byte %11001111, %11111111
	if (pfwidth>2)
	.byte %11001111, %11111111
 endif
	.byte %11001111, %11111111
	if (pfwidth>2)
	.byte %11001111, %11111111
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
pflabel18
	lda PF_data18,x
	sta playfield-128,x
	dex
	bpl pflabel18
.
 ;;line 1238;; 

.
 ;;line 1239;; 

.L0233 ;;line 1240;;  playfield:

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
.
 ;;line 1254;; 

.
 ;;line 1255;; 

.
 ;;line 1256;; 

.L0234 ;;line 1257;;  playfield:

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
.
 ;;line 1271;; 

.
 ;;line 1272;; 

.
 ;;line 1273;; 

.L0235 ;;line 1274;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel21
PF_data21
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111100, %11111111
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %11000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %11001111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %11001111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11001111
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00000000, %00001100
 endif
	.byte %00001100, %00000000
	if (pfwidth>2)
	.byte %00000000, %00001100
 endif
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111100
 endif
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111100
 endif
	.byte %11000000, %00000011
	if (pfwidth>2)
	.byte %00000011, %11000000
 endif
	.byte %11000000, %00000011
	if (pfwidth>2)
	.byte %00000011, %11000000
 endif
	.byte %11111100, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111100
 endif
pflabel21
	lda PF_data21,x
	sta playfield-128,x
	dex
	bpl pflabel21
.
 ;;line 1288;; 

.
 ;;line 1289;; 

.
 ;;line 1290;; 

.L0236 ;;line 1291;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel22
PF_data22
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %00000000, %11000000
	if (pfwidth>2)
	.byte %11000000, %00000000
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11001111, %11111111
 endif
	.byte %11111111, %11001111
	if (pfwidth>2)
	.byte %11001111, %11111111
 endif
	.byte %00000000, %00001100
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %00000000, %00001100
	if (pfwidth>2)
	.byte %00001100, %00000000
 endif
	.byte %11000001, %11111111
	if (pfwidth>2)
	.byte %11111111, %11000011
 endif
	.byte %11000001, %11111111
	if (pfwidth>2)
	.byte %11111111, %11000011
 endif
	.byte %00000001, %11000000
	if (pfwidth>2)
	.byte %11000000, %00000011
 endif
	.byte %00000001, %11000000
	if (pfwidth>2)
	.byte %11000000, %00000011
 endif
	.byte %11001001, %11001100
	if (pfwidth>2)
	.byte %11001100, %00110011
 endif
pflabel22
	lda PF_data22,x
	sta playfield-128,x
	dex
	bpl pflabel22
.
 ;;line 1305;; 

.
 ;;line 1306;; 

.
 ;;line 1307;; 

.L0237 ;;line 1308;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel23
PF_data23
	.byte %11001001, %11001100
	if (pfwidth>2)
	.byte %11001100, %00110011
 endif
	.byte %00001000, %11001100
	if (pfwidth>2)
	.byte %00001100, %00110000
 endif
	.byte %00001000, %11001100
	if (pfwidth>2)
	.byte %00001100, %00110000
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00111111
 endif
	.byte %11111111, %00001111
	if (pfwidth>2)
	.byte %11111111, %00111111
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
.
 ;;line 1322;; 

.
 ;;line 1323;; 

.L0238 ;;line 1324;;  playfield:

  ifconst pfres
	  ldx #(12>pfres)*(pfres*pfwidth-1)+(12<=pfres)*47
  else
	  ldx #((12*pfwidth-1)*((12*pfwidth-1)<47))+(47*((12*pfwidth-1)>=47))
  endif
	jmp pflabel24
PF_data24
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
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
pflabel24
	lda PF_data24,x
	sta playfield-128,x
	dex
	bpl pflabel24
.
 ;;line 1338;; 

.L0239 ;;line 1339;;  asm

room_pointers_lo

 .byte <PF_data0, <PF_data1, <PF_data2, <PF_data3, <PF_data4, <PF_data5, <PF_data6, <PF_data7

 .byte <PF_data8, <PF_data9, <PF_data10, <PF_data11, <PF_data12, <PF_data13, <PF_data14, <PF_data15

 .byte <PF_data16, <PF_data17, <PF_data18, <PF_data19, <PF_data20, <PF_data21, <PF_data22, <PF_data23

 .byte <PF_data24

room_pointers_hi

 .byte >PF_data0, >PF_data1, >PF_data2, >PF_data3, >PF_data4, >PF_data5, >PF_data6, >PF_data7

 .byte >PF_data8, >PF_data9, >PF_data10, >PF_data11, >PF_data12, >PF_data13, >PF_data14, >PF_data15

 .byte >PF_data16, >PF_data17, >PF_data18, >PF_data19, >PF_data20, >PF_data21, >PF_data22, >PF_data23

 .byte >PF_data24

.
 ;;line 1351;; 

.L0240 ;;line 1352;;  bank 2

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
 ;;line 1353;; 

.
 ;;line 1354;; 

.
 ;;line 1355;; 

.
 ;;line 1356;; 

.
 ;;line 1357;; 

.
 ;;line 1358;; 

.
 ;;line 1359;; 

.
 ;;line 1360;; 

.
 ;;line 1361;; 

.
 ;;line 1362;; 

.
 ;;line 1363;; 

.
 ;;line 1364;; 

.
 ;;line 1365;; 

.
 ;;line 1366;; 

.
 ;;line 1367;; 

.
 ;;line 1368;; 

.
 ;;line 1369;; 

.
 ;;line 1370;; 

.
 ;;line 1371;; 

.
 ;;line 1372;; 

.
 ;;line 1373;; 

.L0241 ;;line 1374;;  data init_rooms

	JMP .skipL0241
init_rooms
	.byte              9, 19, 26, 27,  5,  9,  16,  28,  30,   22,  2

.skipL0241
.
 ;;line 1377;; 

.L0242 ;;line 1378;;  data init_x

	JMP .skipL0242
init_x
	.byte            78, 68, 78, 56, 24, 68,  96, 127,  42,  42, 32

.skipL0242
.
 ;;line 1381;; 

.L0243 ;;line 1382;;  data init_y

	JMP .skipL0243
init_y
	.byte            42, 16, 22, 44, 42, 38,  36,  42,  42,  42, 20

.skipL0243
.
 ;;line 1385;; 

.
 ;;line 1386;; 

.L0244 ;;line 1387;;  data move_north_b2

	JMP .skipL0244
move_north_b2
	.byte  0,30,1,2,3,4,0,14,10,9,8,9,11,12,7

	.byte  13,15,5,22,21,18,19,20,21,23,16,25,26,0,28

	.byte  5,17,6,24

.skipL0244
.
 ;;line 1392;; 

.L0245 ;;line 1393;;  data move_east_b2

	JMP .skipL0245
move_east_b2
	.byte  0,1,2,6,7,3,5,4,9,10,11,8,12,13,15

	.byte  16,14,14,19,18,21,20,22,23,27,26,25,29,28,24

	.byte  30,0,0,0

.skipL0245
.
 ;;line 1398;; 

.L0246 ;;line 1399;;  data move_south_b2

	JMP .skipL0246
move_south_b2
	.byte  0,2,3,4,5,30,0,14,10,11,8,12,13,15,7

	.byte  16,25,0,20,21,22,23,18,24,0,26,27,0,29,0

	.byte  1,28,6,0

.skipL0246
.
 ;;line 1404;; 

.L0247 ;;line 1405;;  data move_west_b2

	JMP .skipL0247
move_west_b2
	.byte  0,1,2,5,7,6,3,4,11,8,9,10,12,13,16

	.byte  14,15,16,19,18,21,20,22,23,29,26,25,24,28,27

	.byte  30,0,0,0

.skipL0247
.
 ;;line 1410;; 

.init_level_2
 ;;line 1411;; init_level_2

.L0248 ;;line 1412;;  ballx = 92  :  bally = 38

	LDA #92
	STA ballx
	LDA #38
	STA bally
.L0249 ;;line 1413;;  p2_ballx = 92  :  p2_bally = 38

	LDA #92
	STA p2_ballx
	LDA #38
	STA p2_bally
.L0250 ;;line 1414;;  ballheight = 4

	LDA #4
	STA ballheight
.
 ;;line 1415;; 

.L0251 ;;line 1416;;  top_player0x = 71  :  bottom_player0x = 71

	LDA #71
	STA top_player0x
	STA bottom_player0x
.L0252 ;;line 1417;;  top_player1x = 120  :  bottom_player1x = 120

	LDA #120
	STA top_player1x
	STA bottom_player1x
.L0253 ;;line 1418;;  top_player0y = 255  :  bottom_player0y = 255

	LDA #255
	STA top_player0y
	STA bottom_player0y
.L0254 ;;line 1419;;  top_player1y = 255  :  bottom_player1y = 255

	LDA #255
	STA top_player1y
	STA bottom_player1y
.L0255 ;;line 1420;;  missile0y = 255  :  missile1y = 255

	LDA #255
	STA missile0y
	STA missile1y
.
 ;;line 1421;; 

.L0256 ;;line 1422;;  player0height = 15

	LDA #15
	STA player0height
.L0257 ;;line 1423;;  NUSIZ0 = 5

	LDA #5
	STA NUSIZ0
.
 ;;line 1424;; 

.
 ;;line 1425;; 

.L0258 ;;line 1426;;  top_room = 2  :  bottom_room = 2

	LDA #2
	STA top_room
	STA bottom_room
.
 ;;line 1427;; 

.L0259 ;;line 1428;;  room_flags = 0

	LDA #0
	STA room_flags
.L0260 ;;line 1429;;  top_carried_item = 255  :  bot_carried_item = 255

	LDA #255
	STA top_carried_item
	STA bot_carried_item
.L0261 ;;line 1430;;  gate_state = gate_state  &  $C0  :  drag_dead = 0

	LDA gate_state
	AND #$C0
	STA gate_state
	LDA #0
	STA drag_dead
.
 ;;line 1431;; 

.L0262 ;;line 1432;;  top_drag_state = 3  :  bot_drag_state = 3

	LDA #3
	STA top_drag_state
	STA bot_drag_state
.L0263 ;;line 1433;;  drag_awake = 0

	LDA #0
	STA drag_awake
.
 ;;line 1434;; 

.L0264 ;;line 1435;;  top_bat_state = $4F  :  bot_bat_state = $4F  :  bat_fedup = $66

	LDA #$4F
	STA top_bat_state
	STA bot_bat_state
	LDA #$66
	STA bat_fedup
.L0265 ;;line 1436;;  flicker_idx = 0  :  bot_flicker_idx = 0

	LDA #0
	STA flicker_idx
	STA bot_flicker_idx
.
 ;;line 1437;; 

.
 ;;line 1438;; 

.
 ;;line 1439;; 

.
 ;;line 1440;; 

.
 ;;line 1441;; 

.L0266 ;;line 1442;;  if gate_state = $80 then return otherbank

	LDA gate_state
	CMP #$80
     BNE .skipL0266
.condpart37
	JMP BS_return
.skipL0266
.
 ;;line 1443;; 

.
 ;;line 1444;; 

.L0267 ;;line 1445;;  for temp1 = 0 to 10

	LDA #0
	STA temp1
.L0267fortemp1
.L0268 ;;line 1446;;  if gate_state = $00 then temp2 = init_rooms_g1[temp1] else temp2 = init_rooms[temp1]

	LDA gate_state
	CMP #$00
     BNE .skipL0268
.condpart38
	LDX temp1
	LDA init_rooms_g1,x
	STA temp2
 jmp .skipelse0
.skipL0268
	LDX temp1
	LDA init_rooms,x
	STA temp2
.skipelse0
.L0269 ;;line 1447;;  w_top_obj_room[temp1] = temp2

	LDA temp2
	LDX temp1
	STA w_top_obj_room,x
.L0270 ;;line 1448;;  w_bot_obj_room[temp1] = temp2

	LDA temp2
	LDX temp1
	STA w_bot_obj_room,x
.
 ;;line 1449;; 

.L0271 ;;line 1450;;  if gate_state = $00 then temp2 = init_x_g1[temp1] else temp2 = init_x[temp1]

	LDA gate_state
	CMP #$00
     BNE .skipL0271
.condpart39
	LDX temp1
	LDA init_x_g1,x
	STA temp2
 jmp .skipelse1
.skipL0271
	LDX temp1
	LDA init_x,x
	STA temp2
.skipelse1
.L0272 ;;line 1451;;  top_obj_x[temp1] = temp2

	LDA temp2
	LDX temp1
	STA top_obj_x,x
.L0273 ;;line 1452;;  bot_obj_x[temp1] = temp2

	LDA temp2
	LDX temp1
	STA bot_obj_x,x
.
 ;;line 1453;; 

.L0274 ;;line 1454;;  if gate_state = $00 then temp2 = init_y_g1[temp1] else temp2 = init_y[temp1]

	LDA gate_state
	CMP #$00
     BNE .skipL0274
.condpart40
	LDX temp1
	LDA init_y_g1,x
	STA temp2
 jmp .skipelse2
.skipL0274
	LDX temp1
	LDA init_y,x
	STA temp2
.skipelse2
.L0275 ;;line 1455;;  top_obj_y[temp1] = temp2

	LDA temp2
	LDX temp1
	STA top_obj_y,x
.L0276 ;;line 1456;;  bot_obj_y[temp1] = temp2

	LDA temp2
	LDX temp1
	STA bot_obj_y,x
.L0277 ;;line 1457;;  next

	LDA temp1
	CMP #10
	INC temp1
	bcc .L0267fortemp1
 if ( (((((#>*)&$1f)*256)|(#<.L0267fortemp1))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.L0267fortemp1))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 2 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.L0278 ;;line 1458;;  return otherbank

	JMP BS_return
.
 ;;line 1459;; 

.
 ;;line 1460;; 

.
 ;;line 1461;; 

.
 ;;line 1462;; 

.update_top_dragons
 ;;line 1463;; update_top_dragons

.L0279 ;;line 1464;;  if top_drag_state{7} then gosub top_drag_eaten  :  goto update_top_magnet

	BIT top_drag_state
	BPL .skipL0279
.condpart41
 jsr .top_drag_eaten
 jmp .update_top_magnet
.skipL0279
.L0280 ;;line 1465;;  temp1 = top_drag_state  &  3

	LDA top_drag_state
	AND #3
	STA temp1
.L0281 ;;line 1466;;  if temp1  <  3 then gosub top_drag_roaring  :  goto update_top_magnet

	LDA temp1
	CMP #3
     BCS .skipL0281
.condpart42
 jsr .top_drag_roaring
 jmp .update_top_magnet
.skipL0281
.
 ;;line 1467;; 

.
 ;;line 1468;; 

.L0282 ;;line 1469;;  if r_top_obj_room[0] = top_room then temp1 = 0  :  gosub top_one_dragon  :  if temp4 = 2 then goto update_top_magnet

	LDX #0
	LDA r_top_obj_room,x
	CMP top_room
     BNE .skipL0282
.condpart43
	LDA #0
	STA temp1
 jsr .top_one_dragon
	LDA temp4
	CMP #2
     BNE .skip43then
.condpart44
 jmp .update_top_magnet
.skip43then
.skipL0282
.L0283 ;;line 1470;;  if r_top_obj_room[1] = top_room then temp1 = 1  :  gosub top_one_dragon  :  if temp4 = 2 then goto update_top_magnet

	LDX #1
	LDA r_top_obj_room,x
	CMP top_room
     BNE .skipL0283
.condpart45
	LDA #1
	STA temp1
 jsr .top_one_dragon
	LDA temp4
	CMP #2
     BNE .skip45then
.condpart46
 jmp .update_top_magnet
.skip45then
.skipL0283
.L0284 ;;line 1471;;  if r_top_obj_room[2] = top_room then temp1 = 2  :  gosub top_one_dragon  :  if temp4 = 2 then goto update_top_magnet

	LDX #2
	LDA r_top_obj_room,x
	CMP top_room
     BNE .skipL0284
.condpart47
	LDA #2
	STA temp1
 jsr .top_one_dragon
	LDA temp4
	CMP #2
     BNE .skip47then
.condpart48
 jmp .update_top_magnet
.skip47then
.skipL0284
.
 ;;line 1472;; 

.
 ;;line 1473;; 

.L0285 ;;line 1474;;  if !drag_dead{0} then temp1 = 0  :  gosub top_dragon_offscreen

	LDA drag_dead
	LSR
	BCS .skipL0285
.condpart49
	LDA #0
	STA temp1
 jsr .top_dragon_offscreen
.skipL0285
.L0286 ;;line 1475;;  if !drag_dead{1} then temp1 = 1  :  gosub top_dragon_offscreen

	LDA drag_dead
	AND #2
	BNE .skipL0286
.condpart50
	LDA #1
	STA temp1
 jsr .top_dragon_offscreen
.skipL0286
.L0287 ;;line 1476;;  if !drag_dead{2} then temp1 = 2  :  gosub top_dragon_offscreen

	LDA drag_dead
	AND #4
	BNE .skipL0287
.condpart51
	LDA #2
	STA temp1
 jsr .top_dragon_offscreen
.skipL0287
.L0288 ;;line 1477;;  goto update_top_magnet

 jmp .update_top_magnet
.
 ;;line 1478;; 

.top_drag_eaten
 ;;line 1479;; top_drag_eaten

.L0289 ;;line 1480;;  temp1 = top_drag_state  &  3

	LDA top_drag_state
	AND #3
	STA temp1
.L0290 ;;line 1481;;  if !joy0fire then goto _top_eaten_pos

 bit INPT4
	BPL .skipL0290
.condpart52
 jmp ._top_eaten_pos
.skipL0290
.L0291 ;;line 1482;;  if r_top_obj_room[temp1]  <>  ENTRY_YELLOW then goto _skip_top_d_home

	LDX temp1
	LDA r_top_obj_room,x
	CMP #ENTRY_YELLOW
     BEQ .skipL0291
.condpart53
 jmp ._skip_top_d_home
.skipL0291
.L0292 ;;line 1483;;  if gate_state  <  $40 then temp2 = init_rooms_g1[temp1] else temp2 = init_rooms[temp1]

	LDA gate_state
	CMP #$40
     BCS .skipL0292
.condpart54
	LDX temp1
	LDA init_rooms_g1,x
	STA temp2
 jmp .skipelse3
.skipL0292
	LDX temp1
	LDA init_rooms,x
	STA temp2
.skipelse3
.L0293 ;;line 1484;;  w_top_obj_room[temp1] = temp2

	LDA temp2
	LDX temp1
	STA w_top_obj_room,x
.L0294 ;;line 1485;;  temp2 = bit_mask[temp1]  ^  255

	LDX temp1
	LDA bit_mask,x
	EOR #255
	STA temp2
.L0295 ;;line 1486;;  drag_awake = drag_awake  &  temp2

	LDA drag_awake
	AND temp2
	STA drag_awake
._skip_top_d_home
 ;;line 1487;; _skip_top_d_home

.L0296 ;;line 1488;;  top_drag_state = 3  :  drag_dead = drag_dead  &  %11111000

	LDA #3
	STA top_drag_state
	LDA drag_dead
	AND #%11111000
	STA drag_dead
.L0297 ;;line 1489;;  top_room = ENTRY_YELLOW  :  ballx = 92  :  bally = 38  :  w_top_oldx = 92  :  w_top_oldy = 38

	LDA #ENTRY_YELLOW
	STA top_room
	LDA #92
	STA ballx
	LDA #38
	STA bally
	LDA #92
	STA w_top_oldx
	LDA #38
	STA w_top_oldy
.L0298 ;;line 1490;;  gosub load_top_room bank1  :  gosub check_gates bank3  :  return

 sta temp7
 lda #>(ret_point15-1)
 pha
 lda #<(ret_point15-1)
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
ret_point15
 sta temp7
 lda #>(ret_point16-1)
 pha
 lda #<(ret_point16-1)
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
ret_point16
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
._top_eaten_pos
 ;;line 1491;; _top_eaten_pos

.L0299 ;;line 1492;;  if temp1  <  3 then ballx = top_obj_x[temp1]  +  3  :  bally = top_obj_y[temp1]  -  6

	LDA temp1
	CMP #3
     BCS .skipL0299
.condpart55
	LDX temp1
	LDA top_obj_x,x
	CLC
	ADC #3
	STA ballx
	LDX temp1
	LDA top_obj_y,x
	SEC
	SBC #6
	STA bally
.skipL0299
.L0300 ;;line 1493;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1494;; 

.top_drag_roaring
 ;;line 1495;; top_drag_roaring

.
 ;;line 1496;; 

.L0301 ;;line 1497;;  if r_top_obj_room[temp1]  <>  top_room then top_drag_state = 3  :  return

	LDX temp1
	LDA r_top_obj_room,x
	CMP top_room
     BEQ .skipL0301
.condpart56
	LDA #3
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0301
.L0302 ;;line 1498;;  temp5 = top_obj_x[temp1]  :  temp6 = top_obj_y[temp1]

	LDX temp1
	LDA top_obj_x,x
	STA temp5
	LDX temp1
	LDA top_obj_y,x
	STA temp6
.L0303 ;;line 1499;;  gosub check_top_sword_hit

 jsr .check_top_sword_hit
.L0304 ;;line 1500;;  if temp4 = 1 then drag_dead = drag_dead  |  bit_mask[temp1]  :  top_drag_state = 103  :  return

	LDA temp4
	CMP #1
     BNE .skipL0304
.condpart57
	LDA drag_dead
	LDX temp1
	ORA bit_mask,x
	STA drag_dead
	LDA #103
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0304
.
 ;;line 1501;; 

.
 ;;line 1502;; 

.L0305 ;;line 1503;;  temp2 = ballx  -  temp5

	LDA ballx
	SEC
	SBC temp5
	STA temp2
.L0306 ;;line 1504;;  if temp2  >  7 then goto _skip_top_head_block

	LDA #7
	CMP temp2
     BCS .skipL0306
.condpart58
 jmp ._skip_top_head_block
.skipL0306
.L0307 ;;line 1505;;  temp2 = temp6  -  bally  -  4

; complex statement detected
	LDA temp6
	SEC
	SBC bally
	SEC
	SBC #4
	STA temp2
.L0308 ;;line 1506;;  if temp2  >  15 then goto _skip_top_head_block

	LDA #15
	CMP temp2
     BCS .skipL0308
.condpart59
 jmp ._skip_top_head_block
.skipL0308
.
 ;;line 1507;; 

.
 ;;line 1508;; 

.L0309 ;;line 1509;;  ballx = r_top_oldx  :  bally = r_top_oldy

	LDA r_top_oldx
	STA ballx
	LDA r_top_oldy
	STA bally
.
 ;;line 1510;; 

.
 ;;line 1511;; 

.L0310 ;;line 1512;;  if !top_drag_state{2} then goto _skip_top_head_block

	LDA top_drag_state
	AND #4
	BNE .skipL0310
.condpart60
 jmp ._skip_top_head_block
.skipL0310
.L0311 ;;line 1513;;  if joy0right then ballx = ballx  -  1

 bit SWCHA
	BMI .skipL0311
.condpart61
	DEC ballx
.skipL0311
.L0312 ;;line 1514;;  if joy0left then ballx = ballx  +  1

 bit SWCHA
	BVS .skipL0312
.condpart62
	INC ballx
.skipL0312
.L0313 ;;line 1515;;  if joy0down then bally = bally  -  1

 lda #$20
 bit SWCHA
	BNE .skipL0313
.condpart63
	DEC bally
.skipL0313
.L0314 ;;line 1516;;  if joy0up then bally = bally  +  1

 lda #$10
 bit SWCHA
	BNE .skipL0314
.condpart64
	INC bally
.skipL0314
._skip_top_head_block
 ;;line 1517;; _skip_top_head_block

.
 ;;line 1518;; 

.
 ;;line 1519;; 

.L0315 ;;line 1520;;  temp2 = top_drag_state  +  4

	LDA top_drag_state
	CLC
	ADC #4
	STA temp2
.L0316 ;;line 1521;;  if temp2  <  88 then top_drag_state = temp2  :  return

	LDA temp2
	CMP #88
     BCS .skipL0316
.condpart65
	LDA temp2
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0316
.
 ;;line 1522;; 

.
 ;;line 1523;; 

.L0317 ;;line 1524;;  gosub check_top_ball_hit

 jsr .check_top_ball_hit
.L0318 ;;line 1525;;  if temp4 = 0 then top_drag_state = 3  :  return

	LDA temp4
	CMP #0
     BNE .skipL0318
.condpart66
	LDA #3
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0318
.
 ;;line 1526;; 

.
 ;;line 1527;; 

.L0319 ;;line 1528;;  if DEBUG_NO_SWALLOW = 1 then top_drag_state = 3  :  return

	LDA #DEBUG_NO_SWALLOW
	CMP #1
     BNE .skipL0319
.condpart67
	LDA #3
	STA top_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0319
.L0320 ;;line 1529;;  top_drag_state = temp1  |  188

	LDA temp1
	ORA #188
	STA top_drag_state
.L0321 ;;line 1530;;  top_carried_item = 255

	LDA #255
	STA top_carried_item
.L0322 ;;line 1531;;  ballx = temp5  +  3  :  bally = temp6  -  6

	LDA temp5
	CLC
	ADC #3
	STA ballx
	LDA temp6
	SEC
	SBC #6
	STA bally
.L0323 ;;line 1532;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1533;; 

.top_one_dragon
 ;;line 1534;; top_one_dragon

.L0324 ;;line 1535;;  temp4 = bit_mask[temp1]

	LDX temp1
	LDA bit_mask,x
	STA temp4
.L0325 ;;line 1536;;  drag_awake = drag_awake  |  temp4

	LDA drag_awake
	ORA temp4
	STA drag_awake
.L0326 ;;line 1537;;  temp4 = drag_dead  &  temp4

	LDA drag_dead
	AND temp4
	STA temp4
.L0327 ;;line 1538;;  if temp4  <>  0 then return

	LDA temp4
	CMP #0
     BEQ .skipL0327
.condpart68
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0327
.
 ;;line 1539;; 

.L0328 ;;line 1540;;  temp5 = top_obj_x[temp1]  :  temp6 = top_obj_y[temp1]

	LDX temp1
	LDA top_obj_x,x
	STA temp5
	LDX temp1
	LDA top_obj_y,x
	STA temp6
.L0329 ;;line 1541;;  gosub check_top_sword_hit

 jsr .check_top_sword_hit
.L0330 ;;line 1542;;  if temp4 = 1 then drag_dead = drag_dead  |  bit_mask[temp1]  :  top_drag_state = 103  :  temp4 = 2  :  return

	LDA temp4
	CMP #1
     BNE .skipL0330
.condpart69
	LDA drag_dead
	LDX temp1
	ORA bit_mask,x
	STA drag_dead
	LDA #103
	STA top_drag_state
	LDA #2
	STA temp4
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0330
.
 ;;line 1543;; 

.
 ;;line 1544;; 

.L0331 ;;line 1545;;  if temp1 = 1  &&  r_top_obj_room[7] = top_room then goto _top_flee_key

	LDA temp1
	CMP #1
     BNE .skipL0331
.condpart70
	LDX #7
	LDA r_top_obj_room,x
	CMP top_room
     BNE .skip70then
.condpart71
 jmp ._top_flee_key
.skip70then
.skipL0331
.
 ;;line 1546;; 

.
 ;;line 1547;; 

.L0332 ;;line 1548;;  temp2 = ballx  +  1

	LDA ballx
	CLC
	ADC #1
	STA temp2
.L0333 ;;line 1549;;  temp3 = bally  +  16

	LDA bally
	CLC
	ADC #16
	STA temp3
.L0334 ;;line 1550;;  if temp5  <  temp2 then temp5 = temp5  +  1

	LDA temp5
	CMP temp2
     BCS .skipL0334
.condpart72
	INC temp5
.skipL0334
.L0335 ;;line 1551;;  if temp5  >  temp2 then temp5 = temp5  -  1

	LDA temp2
	CMP temp5
     BCS .skipL0335
.condpart73
	DEC temp5
.skipL0335
.L0336 ;;line 1552;;  if temp6  <  temp3 then temp6 = temp6  +  1

	LDA temp6
	CMP temp3
     BCS .skipL0336
.condpart74
	INC temp6
.skipL0336
.L0337 ;;line 1553;;  if temp6  >  temp3 then temp6 = temp6  -  1

	LDA temp3
	CMP temp6
     BCS .skipL0337
.condpart75
	DEC temp6
.skipL0337
.L0338 ;;line 1554;;  top_obj_x[temp1] = temp5  :  top_obj_y[temp1] = temp6

	LDA temp5
	LDX temp1
	STA top_obj_x,x
	LDA temp6
	LDX temp1
	STA top_obj_y,x
.
 ;;line 1555;; 

.
 ;;line 1556;; 

.L0339 ;;line 1557;;  if temp5 = temp2  &&  temp6 = temp3 then top_drag_state = temp1

	LDA temp5
	CMP temp2
     BNE .skipL0339
.condpart76
	LDA temp6
	CMP temp3
     BNE .skip76then
.condpart77
	LDA temp1
	STA top_drag_state
.skip76then
.skipL0339
.L0340 ;;line 1558;;  temp4 = 2

	LDA #2
	STA temp4
.L0341 ;;line 1559;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1560;; 

._top_flee_key
 ;;line 1561;; _top_flee_key

.L0342 ;;line 1562;;  if temp5  <  top_obj_x[7]  &&  temp5  >  20 then temp5 = temp5  -  1

	LDA temp5
	LDX #7
	CMP top_obj_x,x
     BCS .skipL0342
.condpart78
	LDA #20
	CMP temp5
     BCS .skip78then
.condpart79
	DEC temp5
.skip78then
.skipL0342
.L0343 ;;line 1563;;  if temp5  >=  top_obj_x[7]  &&  temp5  <  130 then temp5 = temp5  +  1

	LDA temp5
	LDX #7
	CMP top_obj_x,x
     BCC .skipL0343
.condpart80
	LDA temp5
	CMP #130
     BCS .skip80then
.condpart81
	INC temp5
.skip80then
.skipL0343
.L0344 ;;line 1564;;  if temp6  <  top_obj_y[7]  &&  temp6  >  18 then temp6 = temp6  -  1

	LDA temp6
	LDX #7
	CMP top_obj_y,x
     BCS .skipL0344
.condpart82
	LDA #18
	CMP temp6
     BCS .skip82then
.condpart83
	DEC temp6
.skip82then
.skipL0344
.L0345 ;;line 1565;;  if temp6  >=  top_obj_y[7]  &&  temp6  <  42 then temp6 = temp6  +  1

	LDA temp6
	LDX #7
	CMP top_obj_y,x
     BCC .skipL0345
.condpart84
	LDA temp6
	CMP #42
     BCS .skip84then
.condpart85
	INC temp6
.skip84then
.skipL0345
.L0346 ;;line 1566;;  top_obj_x[1] = temp5  :  top_obj_y[1] = temp6

	LDA temp5
	LDX #1
	STA top_obj_x,x
	LDA temp6
	LDX #1
	STA top_obj_y,x
.L0347 ;;line 1567;;  temp4 = 2

	LDA #2
	STA temp4
.L0348 ;;line 1568;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1569;; 

.
 ;;line 1570;; 

.
 ;;line 1571;; 

.
 ;;line 1572;; 

.top_dragon_offscreen
 ;;line 1573;; top_dragon_offscreen

.L0349 ;;line 1574;;  asm

   ldy top_room

   bne .t_pursue_go

   rts

.t_pursue_go

   ldx temp1

   lda drag_awake

   and bit_mask,x

   bne .t_pursue_awake

   rts

.t_pursue_awake

   lda r_top_obj_room,x

   sta temp4

   lda top_obj_x,x

   sta temp5

   lda top_obj_y,x

   sta temp6

   ldx temp4



   lda gate_state

   cmp #$40

   bcs .t_std_adj

   cpx #16

   bne .t_g1_22

   cpy #22

   bne .t_std_adj

   jmp ._top_pursue_s

.t_g1_22

   cpx #22

   bne .t_g1_12

   cpy #16

   bne .t_std_adj

   jmp ._top_pursue_n

.t_g1_12

   cpx #12

   bne .t_g1_28

   cpy #28

   bne .t_std_adj

   jmp ._top_pursue_n

.t_g1_28

   cpx #28

   bne .t_std_adj

   cpy #12

   bne .t_std_adj

   jmp ._top_pursue_s



.t_std_adj

   tya

   cmp move_north_b2,x

   bne .t_not_n

   jmp ._top_pursue_n

.t_not_n

   cmp move_south_b2,x

   bne .t_not_s

   jmp ._top_pursue_s

.t_not_s

   cmp move_east_b2,x

   bne .t_not_e

   jmp ._top_pursue_e

.t_not_e

   cmp move_west_b2,x

   bne .t_not_w

   jmp ._top_pursue_w

.t_not_w

   rts

.
 ;;line 1640;; 

._top_pursue_n
 ;;line 1641;; _top_pursue_n

.L0350 ;;line 1642;;  if temp6  >  3 then top_obj_y[temp1] = temp6  -  1  :  return

	LDA #3
	CMP temp6
     BCS .skipL0350
.condpart86
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
.skipL0350
.L0351 ;;line 1643;;  w_top_obj_room[temp1] = top_room  :  top_obj_y[temp1] = bally  +  16  :  top_obj_x[temp1] = ballx  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA bally
	CLC
	ADC #16
	LDX temp1
	STA top_obj_y,x
	LDA ballx
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
 ;;line 1644;; 

._top_pursue_s
 ;;line 1645;; _top_pursue_s

.L0352 ;;line 1646;;  if temp6  <  42 then top_obj_y[temp1] = temp6  +  1  :  return

	LDA temp6
	CMP #42
     BCS .skipL0352
.condpart87
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
.skipL0352
.L0353 ;;line 1647;;  w_top_obj_room[temp1] = top_room  :  top_obj_y[temp1] = 4  :  top_obj_x[temp1] = ballx  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA #4
	LDX temp1
	STA top_obj_y,x
	LDA ballx
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
 ;;line 1648;; 

._top_pursue_e
 ;;line 1649;; _top_pursue_e

.L0354 ;;line 1650;;  if temp5  <  134 then top_obj_x[temp1] = temp5  +  1  :  return

	LDA temp5
	CMP #134
     BCS .skipL0354
.condpart88
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
.skipL0354
.L0355 ;;line 1651;;  w_top_obj_room[temp1] = top_room  :  top_obj_x[temp1] = 18  :  top_obj_y[temp1] = bally  +  16  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA #18
	LDX temp1
	STA top_obj_x,x
	LDA bally
	CLC
	ADC #16
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
 ;;line 1652;; 

._top_pursue_w
 ;;line 1653;; _top_pursue_w

.L0356 ;;line 1654;;  if temp5  >  18 then top_obj_x[temp1] = temp5  -  1  :  return

	LDA #18
	CMP temp5
     BCS .skipL0356
.condpart89
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
.skipL0356
.L0357 ;;line 1655;;  w_top_obj_room[temp1] = top_room  :  top_obj_x[temp1] = 132  :  top_obj_y[temp1] = bally  +  16  :  return

	LDA top_room
	LDX temp1
	STA w_top_obj_room,x
	LDA #132
	LDX temp1
	STA top_obj_x,x
	LDA bally
	CLC
	ADC #16
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
 ;;line 1656;; 

.
 ;;line 1657;; 

.check_top_sword_hit
 ;;line 1658;; check_top_sword_hit

.L0358 ;;line 1659;;  temp4 = 0

	LDA #0
	STA temp4
.L0359 ;;line 1660;;  if r_top_obj_room[4]  <>  top_room then return

	LDX #4
	LDA r_top_obj_room,x
	CMP top_room
     BEQ .skipL0359
.condpart90
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0359
.L0360 ;;line 1661;;  temp2 = temp5  -  top_obj_x[4]  +  7

; complex statement detected
	LDA temp5
	LDX #4
	SEC
	SBC top_obj_x,x
	CLC
	ADC #7
	STA temp2
.L0361 ;;line 1662;;  if temp2  >  14 then return

	LDA #14
	CMP temp2
     BCS .skipL0361
.condpart91
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0361
.L0362 ;;line 1663;;  temp2 = temp6  -  top_obj_y[4]  +  3

; complex statement detected
	LDA temp6
	LDX #4
	SEC
	SBC top_obj_y,x
	CLC
	ADC #3
	STA temp2
.L0363 ;;line 1664;;  if temp2  >  22 then return

	LDA #22
	CMP temp2
     BCS .skipL0363
.condpart92
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0363
.L0364 ;;line 1665;;  temp4 = 1

	LDA #1
	STA temp4
.L0365 ;;line 1666;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1667;; 

.check_top_ball_hit
 ;;line 1668;; check_top_ball_hit

.L0366 ;;line 1669;;  temp4 = 0

	LDA #0
	STA temp4
.
 ;;line 1670;; 

.L0367 ;;line 1671;;  temp2 = temp5  -  ballx  +  1

; complex statement detected
	LDA temp5
	SEC
	SBC ballx
	CLC
	ADC #1
	STA temp2
.L0368 ;;line 1672;;  if temp2  >  5 then return

	LDA #5
	CMP temp2
     BCS .skipL0368
.condpart93
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0368
.L0369 ;;line 1673;;  temp2 = temp6  -  bally  -  13

; complex statement detected
	LDA temp6
	SEC
	SBC bally
	SEC
	SBC #13
	STA temp2
.L0370 ;;line 1674;;  if temp2  >  6 then return

	LDA #6
	CMP temp2
     BCS .skipL0370
.condpart94
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0370
.L0371 ;;line 1675;;  temp4 = 1

	LDA #1
	STA temp4
.L0372 ;;line 1676;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1677;; 

.
 ;;line 1678;; 

.
 ;;line 1679;; 

.
 ;;line 1680;; 

.update_bot_dragons
 ;;line 1681;; update_bot_dragons

.L0373 ;;line 1682;;  if bot_drag_state{7} then gosub bot_drag_eaten  :  goto update_bot_magnet

	BIT bot_drag_state
	BPL .skipL0373
.condpart95
 jsr .bot_drag_eaten
 jmp .update_bot_magnet
.skipL0373
.L0374 ;;line 1683;;  temp1 = bot_drag_state  &  3

	LDA bot_drag_state
	AND #3
	STA temp1
.L0375 ;;line 1684;;  if temp1  <  3 then gosub bot_drag_roaring  :  goto update_bot_magnet

	LDA temp1
	CMP #3
     BCS .skipL0375
.condpart96
 jsr .bot_drag_roaring
 jmp .update_bot_magnet
.skipL0375
.
 ;;line 1685;; 

.
 ;;line 1686;; 

.L0376 ;;line 1687;;  if r_bot_obj_room[0] = bottom_room then temp1 = 0  :  gosub bot_one_dragon  :  if temp4 = 2 then goto update_bot_magnet

	LDX #0
	LDA r_bot_obj_room,x
	CMP bottom_room
     BNE .skipL0376
.condpart97
	LDA #0
	STA temp1
 jsr .bot_one_dragon
	LDA temp4
	CMP #2
     BNE .skip97then
.condpart98
 jmp .update_bot_magnet
.skip97then
.skipL0376
.L0377 ;;line 1688;;  if r_bot_obj_room[1] = bottom_room then temp1 = 1  :  gosub bot_one_dragon  :  if temp4 = 2 then goto update_bot_magnet

	LDX #1
	LDA r_bot_obj_room,x
	CMP bottom_room
     BNE .skipL0377
.condpart99
	LDA #1
	STA temp1
 jsr .bot_one_dragon
	LDA temp4
	CMP #2
     BNE .skip99then
.condpart100
 jmp .update_bot_magnet
.skip99then
.skipL0377
.L0378 ;;line 1689;;  if r_bot_obj_room[2] = bottom_room then temp1 = 2  :  gosub bot_one_dragon  :  if temp4 = 2 then goto update_bot_magnet

	LDX #2
	LDA r_bot_obj_room,x
	CMP bottom_room
     BNE .skipL0378
.condpart101
	LDA #2
	STA temp1
 jsr .bot_one_dragon
	LDA temp4
	CMP #2
     BNE .skip101then
.condpart102
 jmp .update_bot_magnet
.skip101then
.skipL0378
.
 ;;line 1690;; 

.
 ;;line 1691;; 

.L0379 ;;line 1692;;  if !drag_dead{3} then temp1 = 0  :  gosub bot_dragon_offscreen

	LDA drag_dead
	AND #8
	BNE .skipL0379
.condpart103
	LDA #0
	STA temp1
 jsr .bot_dragon_offscreen
.skipL0379
.L0380 ;;line 1693;;  if !drag_dead{4} then temp1 = 1  :  gosub bot_dragon_offscreen

	LDA drag_dead
	AND #16
	BNE .skipL0380
.condpart104
	LDA #1
	STA temp1
 jsr .bot_dragon_offscreen
.skipL0380
.L0381 ;;line 1694;;  if !drag_dead{5} then temp1 = 2  :  gosub bot_dragon_offscreen

	LDA drag_dead
	AND #32
	BNE .skipL0381
.condpart105
	LDA #2
	STA temp1
 jsr .bot_dragon_offscreen
.skipL0381
.L0382 ;;line 1695;;  goto update_bot_magnet

 jmp .update_bot_magnet
.
 ;;line 1696;; 

.bot_drag_eaten
 ;;line 1697;; bot_drag_eaten

.L0383 ;;line 1698;;  temp1 = bot_drag_state  &  3

	LDA bot_drag_state
	AND #3
	STA temp1
.L0384 ;;line 1699;;  if !joy1fire then goto _bot_eaten_pos

 bit INPT5
	BPL .skipL0384
.condpart106
 jmp ._bot_eaten_pos
.skipL0384
.L0385 ;;line 1700;;  if r_bot_obj_room[temp1]  <>  ENTRY_YELLOW then goto _skip_bot_d_home

	LDX temp1
	LDA r_bot_obj_room,x
	CMP #ENTRY_YELLOW
     BEQ .skipL0385
.condpart107
 jmp ._skip_bot_d_home
.skipL0385
.L0386 ;;line 1701;;  if gate_state  <  $40 then temp2 = init_rooms_g1[temp1] else temp2 = init_rooms[temp1]

	LDA gate_state
	CMP #$40
     BCS .skipL0386
.condpart108
	LDX temp1
	LDA init_rooms_g1,x
	STA temp2
 jmp .skipelse4
.skipL0386
	LDX temp1
	LDA init_rooms,x
	STA temp2
.skipelse4
.L0387 ;;line 1702;;  w_bot_obj_room[temp1] = temp2

	LDA temp2
	LDX temp1
	STA w_bot_obj_room,x
.L0388 ;;line 1703;;  temp2 = bot_bit_mask[temp1]  ^  255

	LDX temp1
	LDA bot_bit_mask,x
	EOR #255
	STA temp2
.L0389 ;;line 1704;;  drag_awake = drag_awake  &  temp2

	LDA drag_awake
	AND temp2
	STA drag_awake
._skip_bot_d_home
 ;;line 1705;; _skip_bot_d_home

.L0390 ;;line 1706;;  bot_drag_state = 3  :  drag_dead = drag_dead  &  %11000111

	LDA #3
	STA bot_drag_state
	LDA drag_dead
	AND #%11000111
	STA drag_dead
.L0391 ;;line 1707;;  bottom_room = ENTRY_YELLOW  :  p2_ballx = 92  :  p2_bally = 38  :  w_bottom_oldx = 92  :  w_bottom_oldy = 38

	LDA #ENTRY_YELLOW
	STA bottom_room
	LDA #92
	STA p2_ballx
	LDA #38
	STA p2_bally
	LDA #92
	STA w_bottom_oldx
	LDA #38
	STA w_bottom_oldy
.L0392 ;;line 1708;;  gosub load_bottom_room bank1  :  gosub check_gates bank3  :  return

 sta temp7
 lda #>(ret_point17-1)
 pha
 lda #<(ret_point17-1)
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
ret_point17
 sta temp7
 lda #>(ret_point18-1)
 pha
 lda #<(ret_point18-1)
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
ret_point18
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
._bot_eaten_pos
 ;;line 1709;; _bot_eaten_pos

.L0393 ;;line 1710;;  if temp1  <  3 then p2_ballx = bot_obj_x[temp1]  + 3  :  p2_bally = bot_obj_y[temp1]  -  6

	LDA temp1
	CMP #3
     BCS .skipL0393
.condpart109
	LDX temp1
	LDA bot_obj_x,x
	CLC
	ADC #3
	STA p2_ballx
	LDX temp1
	LDA bot_obj_y,x
	SEC
	SBC #6
	STA p2_bally
.skipL0393
.L0394 ;;line 1711;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1712;; 

.bot_drag_roaring
 ;;line 1713;; bot_drag_roaring

.
 ;;line 1714;; 

.L0395 ;;line 1715;;  if r_bot_obj_room[temp1]  <>  bottom_room then bot_drag_state = 3  :  return

	LDX temp1
	LDA r_bot_obj_room,x
	CMP bottom_room
     BEQ .skipL0395
.condpart110
	LDA #3
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0395
.L0396 ;;line 1716;;  temp5 = bot_obj_x[temp1]  :  temp6 = bot_obj_y[temp1]

	LDX temp1
	LDA bot_obj_x,x
	STA temp5
	LDX temp1
	LDA bot_obj_y,x
	STA temp6
.L0397 ;;line 1717;;  gosub check_bot_sword_hit

 jsr .check_bot_sword_hit
.L0398 ;;line 1718;;  if temp4 = 1 then drag_dead = drag_dead  |  bot_bit_mask[temp1]  :  bot_drag_state = 103  :  return

	LDA temp4
	CMP #1
     BNE .skipL0398
.condpart111
	LDA drag_dead
	LDX temp1
	ORA bot_bit_mask,x
	STA drag_dead
	LDA #103
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0398
.
 ;;line 1719;; 

.
 ;;line 1720;; 

.L0399 ;;line 1721;;  temp2 = p2_ballx  -  temp5

	LDA p2_ballx
	SEC
	SBC temp5
	STA temp2
.L0400 ;;line 1722;;  if temp2  >  7 then goto _skip_bot_head_block

	LDA #7
	CMP temp2
     BCS .skipL0400
.condpart112
 jmp ._skip_bot_head_block
.skipL0400
.L0401 ;;line 1723;;  temp2 = temp6  -  p2_bally  -  4

; complex statement detected
	LDA temp6
	SEC
	SBC p2_bally
	SEC
	SBC #4
	STA temp2
.L0402 ;;line 1724;;  if temp2  >  15 then goto _skip_bot_head_block

	LDA #15
	CMP temp2
     BCS .skipL0402
.condpart113
 jmp ._skip_bot_head_block
.skipL0402
.
 ;;line 1725;; 

.
 ;;line 1726;; 

.L0403 ;;line 1727;;  p2_ballx = r_bottom_oldx  :  p2_bally = r_bottom_oldy

	LDA r_bottom_oldx
	STA p2_ballx
	LDA r_bottom_oldy
	STA p2_bally
.
 ;;line 1728;; 

.
 ;;line 1729;; 

.L0404 ;;line 1730;;  if !bot_drag_state{2} then goto _skip_bot_head_block

	LDA bot_drag_state
	AND #4
	BNE .skipL0404
.condpart114
 jmp ._skip_bot_head_block
.skipL0404
.L0405 ;;line 1731;;  if joy1right then p2_ballx = p2_ballx  -  1

 lda #8
 bit SWCHA
	BNE .skipL0405
.condpart115
	DEC p2_ballx
.skipL0405
.L0406 ;;line 1732;;  if joy1left then p2_ballx = p2_ballx  +  1

 lda #4
 bit SWCHA
	BNE .skipL0406
.condpart116
	INC p2_ballx
.skipL0406
.L0407 ;;line 1733;;  if joy1down then p2_bally = p2_bally  -  1

 lda #2
 bit SWCHA
	BNE .skipL0407
.condpart117
	DEC p2_bally
.skipL0407
.L0408 ;;line 1734;;  if joy1up then p2_bally = p2_bally  +  1

 lda #1
 bit SWCHA
	BNE .skipL0408
.condpart118
	INC p2_bally
.skipL0408
._skip_bot_head_block
 ;;line 1735;; _skip_bot_head_block

.
 ;;line 1736;; 

.
 ;;line 1737;; 

.L0409 ;;line 1738;;  temp2 = bot_drag_state  +  4

	LDA bot_drag_state
	CLC
	ADC #4
	STA temp2
.L0410 ;;line 1739;;  if temp2  <  88 then bot_drag_state = temp2  :  return

	LDA temp2
	CMP #88
     BCS .skipL0410
.condpart119
	LDA temp2
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0410
.
 ;;line 1740;; 

.
 ;;line 1741;; 

.L0411 ;;line 1742;;  gosub check_bot_ball_hit

 jsr .check_bot_ball_hit
.L0412 ;;line 1743;;  if temp4 = 0 then bot_drag_state = 3  :  return

	LDA temp4
	CMP #0
     BNE .skipL0412
.condpart120
	LDA #3
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0412
.
 ;;line 1744;; 

.
 ;;line 1745;; 

.L0413 ;;line 1746;;  if DEBUG_NO_SWALLOW = 1 then bot_drag_state = 3  :  return

	LDA #DEBUG_NO_SWALLOW
	CMP #1
     BNE .skipL0413
.condpart121
	LDA #3
	STA bot_drag_state
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0413
.L0414 ;;line 1747;;  bot_drag_state = temp1  |  188

	LDA temp1
	ORA #188
	STA bot_drag_state
.L0415 ;;line 1748;;  bot_carried_item = 255

	LDA #255
	STA bot_carried_item
.L0416 ;;line 1749;;  p2_ballx = temp5  +  3  :  p2_bally = temp6  -  6

	LDA temp5
	CLC
	ADC #3
	STA p2_ballx
	LDA temp6
	SEC
	SBC #6
	STA p2_bally
.L0417 ;;line 1750;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1751;; 

.bot_one_dragon
 ;;line 1752;; bot_one_dragon

.L0418 ;;line 1753;;  temp4 = bot_bit_mask[temp1]

	LDX temp1
	LDA bot_bit_mask,x
	STA temp4
.L0419 ;;line 1754;;  drag_awake = drag_awake  |  temp4

	LDA drag_awake
	ORA temp4
	STA drag_awake
.L0420 ;;line 1755;;  temp4 = drag_dead  &  temp4

	LDA drag_dead
	AND temp4
	STA temp4
.L0421 ;;line 1756;;  if temp4  <>  0 then return

	LDA temp4
	CMP #0
     BEQ .skipL0421
.condpart122
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0421
.
 ;;line 1757;; 

.L0422 ;;line 1758;;  temp5 = bot_obj_x[temp1]  :  temp6 = bot_obj_y[temp1]

	LDX temp1
	LDA bot_obj_x,x
	STA temp5
	LDX temp1
	LDA bot_obj_y,x
	STA temp6
.L0423 ;;line 1759;;  gosub check_bot_sword_hit

 jsr .check_bot_sword_hit
.L0424 ;;line 1760;;  if temp4 = 1 then drag_dead = drag_dead  |  bot_bit_mask[temp1]  :  bot_drag_state = 103  :  temp4 = 2  :  return

	LDA temp4
	CMP #1
     BNE .skipL0424
.condpart123
	LDA drag_dead
	LDX temp1
	ORA bot_bit_mask,x
	STA drag_dead
	LDA #103
	STA bot_drag_state
	LDA #2
	STA temp4
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0424
.
 ;;line 1761;; 

.
 ;;line 1762;; 

.L0425 ;;line 1763;;  if temp1 = 1  &&  r_bot_obj_room[7] = bottom_room then goto _bot_flee_key

	LDA temp1
	CMP #1
     BNE .skipL0425
.condpart124
	LDX #7
	LDA r_bot_obj_room,x
	CMP bottom_room
     BNE .skip124then
.condpart125
 jmp ._bot_flee_key
.skip124then
.skipL0425
.
 ;;line 1764;; 

.
 ;;line 1765;; 

.L0426 ;;line 1766;;  temp2 = p2_ballx  +  1

	LDA p2_ballx
	CLC
	ADC #1
	STA temp2
.L0427 ;;line 1767;;  temp3 = p2_bally  +  16

	LDA p2_bally
	CLC
	ADC #16
	STA temp3
.L0428 ;;line 1768;;  if temp5  <  temp2 then temp5 = temp5  +  1

	LDA temp5
	CMP temp2
     BCS .skipL0428
.condpart126
	INC temp5
.skipL0428
.L0429 ;;line 1769;;  if temp5  >  temp2 then temp5 = temp5  -  1

	LDA temp2
	CMP temp5
     BCS .skipL0429
.condpart127
	DEC temp5
.skipL0429
.L0430 ;;line 1770;;  if temp6  <  temp3 then temp6 = temp6  +  1

	LDA temp6
	CMP temp3
     BCS .skipL0430
.condpart128
	INC temp6
.skipL0430
.L0431 ;;line 1771;;  if temp6  >  temp3 then temp6 = temp6  -  1

	LDA temp3
	CMP temp6
     BCS .skipL0431
.condpart129
	DEC temp6
.skipL0431
.L0432 ;;line 1772;;  bot_obj_x[temp1] = temp5  :  bot_obj_y[temp1] = temp6

	LDA temp5
	LDX temp1
	STA bot_obj_x,x
	LDA temp6
	LDX temp1
	STA bot_obj_y,x
.
 ;;line 1773;; 

.
 ;;line 1774;; 

.L0433 ;;line 1775;;  if temp5 = temp2  &&  temp6 = temp3 then bot_drag_state = temp1

	LDA temp5
	CMP temp2
     BNE .skipL0433
.condpart130
	LDA temp6
	CMP temp3
     BNE .skip130then
.condpart131
	LDA temp1
	STA bot_drag_state
.skip130then
.skipL0433
.L0434 ;;line 1776;;  temp4 = 2

	LDA #2
	STA temp4
.L0435 ;;line 1777;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1778;; 

._bot_flee_key
 ;;line 1779;; _bot_flee_key

.L0436 ;;line 1780;;  if temp5  <  bot_obj_x[7]  &&  temp5  >  20 then temp5 = temp5  -  1

	LDA temp5
	LDX #7
	CMP bot_obj_x,x
     BCS .skipL0436
.condpart132
	LDA #20
	CMP temp5
     BCS .skip132then
.condpart133
	DEC temp5
.skip132then
.skipL0436
.L0437 ;;line 1781;;  if temp5  >=  bot_obj_x[7]  &&  temp5  <  130 then temp5 = temp5  +  1

	LDA temp5
	LDX #7
	CMP bot_obj_x,x
     BCC .skipL0437
.condpart134
	LDA temp5
	CMP #130
     BCS .skip134then
.condpart135
	INC temp5
.skip134then
.skipL0437
.L0438 ;;line 1782;;  if temp6  <  bot_obj_y[7]  &&  temp6  >  18 then temp6 = temp6  -  1

	LDA temp6
	LDX #7
	CMP bot_obj_y,x
     BCS .skipL0438
.condpart136
	LDA #18
	CMP temp6
     BCS .skip136then
.condpart137
	DEC temp6
.skip136then
.skipL0438
.L0439 ;;line 1783;;  if temp6  >=  bot_obj_y[7]  &&  temp6  <  42 then temp6 = temp6  +  1

	LDA temp6
	LDX #7
	CMP bot_obj_y,x
     BCC .skipL0439
.condpart138
	LDA temp6
	CMP #42
     BCS .skip138then
.condpart139
	INC temp6
.skip138then
.skipL0439
.L0440 ;;line 1784;;  bot_obj_x[1] = temp5  :  bot_obj_y[1] = temp6

	LDA temp5
	LDX #1
	STA bot_obj_x,x
	LDA temp6
	LDX #1
	STA bot_obj_y,x
.L0441 ;;line 1785;;  temp4 = 2

	LDA #2
	STA temp4
.L0442 ;;line 1786;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1787;; 

.
 ;;line 1788;; 

.
 ;;line 1789;; 

.bot_dragon_offscreen
 ;;line 1790;; bot_dragon_offscreen

.L0443 ;;line 1791;;  asm

   ldy bottom_room

   bne .b_pursue_go

   rts

.b_pursue_go

   ldx temp1

   lda drag_awake

   and bot_bit_mask,x

   bne .b_pursue_awake

   rts

.b_pursue_awake

   lda r_bot_obj_room,x

   sta temp4

   lda bot_obj_x,x

   sta temp5

   lda bot_obj_y,x

   sta temp6

   ldx temp4



   lda gate_state

   cmp #$40

   bcs .b_std_adj

   cpx #16

   bne .b_g1_22

   cpy #22

   bne .b_std_adj

   jmp ._bot_pursue_s

.b_g1_22

   cpx #22

   bne .b_g1_12

   cpy #16

   bne .b_std_adj

   jmp ._bot_pursue_n

.b_g1_12

   cpx #12

   bne .b_g1_28

   cpy #28

   bne .b_std_adj

   jmp ._bot_pursue_n

.b_g1_28

   cpx #28

   bne .b_std_adj

   cpy #12

   bne .b_std_adj

   jmp ._bot_pursue_s



.b_std_adj

   tya

   cmp move_north_b2,x

   bne .b_not_n

   jmp ._bot_pursue_n

.b_not_n

   cmp move_south_b2,x

   bne .b_not_s

   jmp ._bot_pursue_s

.b_not_s

   cmp move_east_b2,x

   bne .b_not_e

   jmp ._bot_pursue_e

.b_not_e

   cmp move_west_b2,x

   bne .b_not_w

   jmp ._bot_pursue_w

.b_not_w

   rts

.
 ;;line 1857;; 

._bot_pursue_n
 ;;line 1858;; _bot_pursue_n

.L0444 ;;line 1859;;  if temp6  >  3 then bot_obj_y[temp1] = temp6  -  1  :  return

	LDA #3
	CMP temp6
     BCS .skipL0444
.condpart140
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
.skipL0444
.L0445 ;;line 1860;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_y[temp1] = p2_bally  +  16  :  bot_obj_x[temp1] = p2_ballx  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA p2_bally
	CLC
	ADC #16
	LDX temp1
	STA bot_obj_y,x
	LDA p2_ballx
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
 ;;line 1861;; 

._bot_pursue_s
 ;;line 1862;; _bot_pursue_s

.L0446 ;;line 1863;;  if temp6  <  42 then bot_obj_y[temp1] = temp6  +  1  :  return

	LDA temp6
	CMP #42
     BCS .skipL0446
.condpart141
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
.skipL0446
.L0447 ;;line 1864;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_y[temp1] = 4  :  bot_obj_x[temp1] = p2_ballx  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA #4
	LDX temp1
	STA bot_obj_y,x
	LDA p2_ballx
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
 ;;line 1865;; 

._bot_pursue_e
 ;;line 1866;; _bot_pursue_e

.L0448 ;;line 1867;;  if temp5  <  134 then bot_obj_x[temp1] = temp5  +  1  :  return

	LDA temp5
	CMP #134
     BCS .skipL0448
.condpart142
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
.skipL0448
.L0449 ;;line 1868;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_x[temp1] = 18  :  bot_obj_y[temp1] = p2_bally  +  16  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA #18
	LDX temp1
	STA bot_obj_x,x
	LDA p2_bally
	CLC
	ADC #16
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
 ;;line 1869;; 

._bot_pursue_w
 ;;line 1870;; _bot_pursue_w

.L0450 ;;line 1871;;  if temp5  >  18 then bot_obj_x[temp1] = temp5  -  1  :  return

	LDA #18
	CMP temp5
     BCS .skipL0450
.condpart143
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
.skipL0450
.L0451 ;;line 1872;;  w_bot_obj_room[temp1] = bottom_room  :  bot_obj_x[temp1] = 132  :  bot_obj_y[temp1] = p2_bally  +  16  :  return

	LDA bottom_room
	LDX temp1
	STA w_bot_obj_room,x
	LDA #132
	LDX temp1
	STA bot_obj_x,x
	LDA p2_bally
	CLC
	ADC #16
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
 ;;line 1873;; 

.
 ;;line 1874;; 

.check_bot_sword_hit
 ;;line 1875;; check_bot_sword_hit

.L0452 ;;line 1876;;  temp4 = 0

	LDA #0
	STA temp4
.L0453 ;;line 1877;;  if r_bot_obj_room[4]  <>  bottom_room then return

	LDX #4
	LDA r_bot_obj_room,x
	CMP bottom_room
     BEQ .skipL0453
.condpart144
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0453
.L0454 ;;line 1878;;  temp2 = temp5  -  bot_obj_x[4]  +  7

; complex statement detected
	LDA temp5
	LDX #4
	SEC
	SBC bot_obj_x,x
	CLC
	ADC #7
	STA temp2
.L0455 ;;line 1879;;  if temp2  >  14 then return

	LDA #14
	CMP temp2
     BCS .skipL0455
.condpart145
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0455
.L0456 ;;line 1880;;  temp2 = temp6  -  bot_obj_y[4]  +  3

; complex statement detected
	LDA temp6
	LDX #4
	SEC
	SBC bot_obj_y,x
	CLC
	ADC #3
	STA temp2
.L0457 ;;line 1881;;  if temp2  >  22 then return

	LDA #22
	CMP temp2
     BCS .skipL0457
.condpart146
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0457
.L0458 ;;line 1882;;  temp4 = 1

	LDA #1
	STA temp4
.L0459 ;;line 1883;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1884;; 

.check_bot_ball_hit
 ;;line 1885;; check_bot_ball_hit

.L0460 ;;line 1886;;  temp4 = 0

	LDA #0
	STA temp4
.
 ;;line 1887;; 

.L0461 ;;line 1888;;  temp2 = temp5  -  p2_ballx  +  1

; complex statement detected
	LDA temp5
	SEC
	SBC p2_ballx
	CLC
	ADC #1
	STA temp2
.L0462 ;;line 1889;;  if temp2  >  5 then return

	LDA #5
	CMP temp2
     BCS .skipL0462
.condpart147
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0462
.L0463 ;;line 1890;;  temp2 = temp6  -  p2_bally  -  13

; complex statement detected
	LDA temp6
	SEC
	SBC p2_bally
	SEC
	SBC #13
	STA temp2
.L0464 ;;line 1891;;  if temp2  >  6 then return

	LDA #6
	CMP temp2
     BCS .skipL0464
.condpart148
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0464
.L0465 ;;line 1892;;  temp4 = 1

	LDA #1
	STA temp4
.L0466 ;;line 1893;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 1894;; 

.L0467 ;;line 1895;;  data bit_mask

	JMP .skipL0467
bit_mask
	.byte  1, 2, 4

.skipL0467
.
 ;;line 1898;; 

.L0468 ;;line 1899;;  data bot_bit_mask

	JMP .skipL0468
bot_bit_mask
	.byte  8, 16, 32

.skipL0468
.
 ;;line 1902;; 

.
 ;;line 1903;; 

.
 ;;line 1904;; 

.
 ;;line 1905;; 

.update_top_magnet
 ;;line 1906;; update_top_magnet

.L0469 ;;line 1907;;  asm

   lda r_top_obj_room+3

   cmp top_room

   beq .do_mag_top

   jmp .done_mag_top

.do_mag_top

   lda top_obj_x+3

   sta temp5

   lda top_obj_y+3

   clc

   adc #8

   cmp #43

   bcc .mag_y_top_ok

   lda #42

.mag_y_top_ok

   sta temp6

   lda top_bat_state

   and #15

   sta temp2

   ldx #9

.loop_mag_top

   lda r_top_obj_room,x

   cmp top_room

   bne .next_mag_top

   

   cpx top_carried_item

   beq .next_mag_top

   

   cpx temp2

   beq .next_mag_top

   

   lda top_obj_x,x

   cmp temp5

   beq .y_mag_top

   bcc .inc_x_mag_top

   dec top_obj_x,x

   jmp .y_mag_top

.inc_x_mag_top

   inc top_obj_x,x

.y_mag_top

   lda top_obj_y,x

   cmp temp6

   beq .done_mag_top

   bcc .inc_y_mag_top

   dec top_obj_y,x

   jmp .done_mag_top

.inc_y_mag_top

   inc top_obj_y,x

   jmp .done_mag_top

.next_mag_top

   dex

   cpx #3

   bne .loop_mag_top

.done_mag_top

.L0470 ;;line 1962;;  return otherbank

	JMP BS_return
.
 ;;line 1963;; 

.update_bot_magnet
 ;;line 1964;; update_bot_magnet

.L0471 ;;line 1965;;  asm

   lda r_bot_obj_room+3

   cmp bottom_room

   beq .do_mag_bot

   jmp .done_mag_bot

.do_mag_bot

   lda bot_obj_x+3

   sta temp5

   lda bot_obj_y+3

   clc

   adc #8

   cmp #43

   bcc .mag_y_bot_ok

   lda #42

.mag_y_bot_ok

   sta temp6

   lda bot_bat_state

   and #15

   sta temp2

   ldx #9

.loop_mag_bot

   lda r_bot_obj_room,x

   cmp bottom_room

   bne .next_mag_bot

   

   cpx bot_carried_item

   beq .next_mag_bot

   

   cpx temp2

   beq .next_mag_bot

   

   lda bot_obj_x,x

   cmp temp5

   beq .y_mag_bot

   bcc .inc_x_mag_bot

   dec bot_obj_x,x

   jmp .y_mag_bot

.inc_x_mag_bot

   inc bot_obj_x,x

.y_mag_bot

   lda bot_obj_y,x

   cmp temp6

   beq .done_mag_bot

   bcc .inc_y_mag_bot

   dec bot_obj_y,x

   jmp .done_mag_bot

.inc_y_mag_bot

   inc bot_obj_y,x

   jmp .done_mag_bot

.next_mag_bot

   dex

   cpx #3

   bne .loop_mag_bot

.done_mag_bot

.L0472 ;;line 2020;;  return otherbank

	JMP BS_return
.
 ;;line 2021;; 

.
 ;;line 2022;; 

.run_flicker_logic
 ;;line 2023;; run_flicker_logic

.L0473 ;;line 2024;;  asm

   lda #0

   sta top_nusiz1

   sta w_bottom_nusiz1



   

   ldx flicker_idx

   ldy #11

.loop_top_flicker

   dex

   bpl .top_idx_ok

   ldx #10

.top_idx_ok

   lda r_top_obj_room,x

   cmp top_room

   beq .found_top_obj

   dey

   bne .loop_top_flicker

   

   

   lda #255

   sta flicker_idx

   sta top_player1y

   jmp .done_top_flicker



.found_top_obj

   stx flicker_idx

   lda top_obj_x,x

   sta top_player1x

   lda top_obj_y,x

   sta top_player1y

   lda obj_colors,x

   sta top_colup1

   cpx #6                  

   bne .done_top_flicker

   lda #5                  

   sta top_nusiz1



.done_top_flicker

   

   ldx bot_flicker_idx

   ldy #11

.loop_bot_flicker

   dex

   bpl .bot_idx_ok

   ldx #10

.bot_idx_ok

   lda r_bot_obj_room,x

   cmp bottom_room

   beq .found_bot_obj

   dey

   bne .loop_bot_flicker

   

   lda #255

   sta bot_flicker_idx

   sta bottom_player1y

   jmp .done_bot_flicker



.found_bot_obj

   stx bot_flicker_idx

   lda bot_obj_x,x

   sta bottom_player1x

   lda bot_obj_y,x

   sta bottom_player1y

   lda obj_colors,x

   sta bottom_colup1

   cpx #6                  

   bne .done_bot_flicker

   lda #5                  

   sta w_bottom_nusiz1



.done_bot_flicker

.L0474 ;;line 2097;;  return otherbank

	JMP BS_return
.
 ;;line 2098;; 

.
 ;;line 2099;; 

.L0475 ;;line 2100;;  data obj_colors

	JMP .skipL0475
obj_colors
	.byte  $44, $1E, $C4, $00, $1E, $1E, $44, $1E, $0E, $00, $00

.skipL0475
.
 ;;line 2103;; 

.
 ;;line 2104;; 

.
 ;;line 2105;; 

.
 ;;line 2106;; 

.
 ;;line 2107;; 

.
 ;;line 2108;; 

.
 ;;line 2109;; 

.
 ;;line 2110;; 

.
 ;;line 2111;; 

.
 ;;line 2112;; 

.
 ;;line 2113;; 

.
 ;;line 2114;; 

.
 ;;line 2115;; 

.
 ;;line 2116;; 

.
 ;;line 2117;; 

.
 ;;line 2118;; 

.
 ;;line 2119;; 

.
 ;;line 2120;; 

.
 ;;line 2121;; 

.
 ;;line 2122;; 

.
 ;;line 2123;; 

.
 ;;line 2124;; 

.
 ;;line 2125;; 

.
 ;;line 2126;; 

.
 ;;line 2127;; 

.
 ;;line 2128;; 

.L0476 ;;line 2129;;  data init_rooms_g1

	JMP .skipL0476
init_rooms_g1
	.byte           14, 13, 22, 12,  5, 28,  22,  30,  99,    1, 99

.skipL0476
.
 ;;line 2132;; 

.L0477 ;;line 2133;;  data init_x_g1

	JMP .skipL0477
init_x_g1
	.byte           28,  50, 112, 112, 24,  27,  96,  111,   0,  127,  0

.skipL0477
.
 ;;line 2136;; 

.L0478 ;;line 2137;;  data init_y_g1

	JMP .skipL0478
init_y_g1
	.byte           42,  12,  42, 28, 42,  16,  36,  42,   0,   8,  0

.skipL0478
.
 ;;line 2140;; 

.L0479 ;;line 2141;;  bank 3

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
 ;;line 2142;; 

._title_screen
 ;;line 2143;; _title_screen

.L0480 ;;line 2144;;  gate_state = 0  :  temp5 = 0

	LDA #0
	STA gate_state
	STA temp5
.
 ;;line 2145;; 

._title_loop
 ;;line 2146;; _title_loop

.
 ;;line 2147;; 

.L0481 ;;line 2148;;  if top_room = 1 then goto _title_check_release

	LDA top_room
	CMP #1
     BNE .skipL0481
.condpart149
 jmp ._title_check_release
.skipL0481
.
 ;;line 2149;; 

.L0482 ;;line 2150;;  if joy0left then goto _title_move_left

 bit SWCHA
	BVS .skipL0482
.condpart150
 jmp ._title_move_left
.skipL0482
.L0483 ;;line 2151;;  if joy0right then goto _title_move_right

 bit SWCHA
	BMI .skipL0483
.condpart151
 jmp ._title_move_right
.skipL0483
.L0484 ;;line 2152;;  goto _title_skip_joy

 jmp ._title_skip_joy
.
 ;;line 2153;; 

._title_move_left
 ;;line 2154;; _title_move_left

.L0485 ;;line 2155;;  if gate_state = $00 then goto _title_skip_joy

	LDA gate_state
	CMP #$00
     BNE .skipL0485
.condpart152
 jmp ._title_skip_joy
.skipL0485
.L0486 ;;line 2156;;  gate_state = gate_state  -  $40

	LDA gate_state
	SEC
	SBC #$40
	STA gate_state
.L0487 ;;line 2157;;  top_room = 1

	LDA #1
	STA top_room
.L0488 ;;line 2158;;  goto _title_skip_joy

 jmp ._title_skip_joy
.
 ;;line 2159;; 

._title_move_right
 ;;line 2160;; _title_move_right

.L0489 ;;line 2161;;  if gate_state = $80 then goto _title_skip_joy

	LDA gate_state
	CMP #$80
     BNE .skipL0489
.condpart153
 jmp ._title_skip_joy
.skipL0489
.L0490 ;;line 2162;;  gate_state = gate_state  +  $40

	LDA gate_state
	CLC
	ADC #$40
	STA gate_state
.L0491 ;;line 2163;;  top_room = 1

	LDA #1
	STA top_room
.L0492 ;;line 2164;;  goto _title_skip_joy

 jmp ._title_skip_joy
.
 ;;line 2165;; 

._title_check_release
 ;;line 2166;; _title_check_release

.L0493 ;;line 2167;;  if !joy0left  &&  !joy0right then top_room = 0

 bit SWCHA
	BVC .skipL0493
.condpart154
 bit SWCHA
	BPL .skip154then
.condpart155
	LDA #0
	STA top_room
.skip154then
.skipL0493
.
 ;;line 2168;; 

._title_skip_joy
 ;;line 2169;; _title_skip_joy

.
 ;;line 2170;; 

.
 ;;line 2171;; 

.L0494 ;;line 2172;;  if !joy0fire then goto _title_draw

 bit INPT4
	BPL .skipL0494
.condpart156
 jmp ._title_draw
.skipL0494
.
 ;;line 2173;; 

.L0495 ;;line 2174;;  gosub init_level_2 bank2

 sta temp7
 lda #>(ret_point19-1)
 pha
 lda #<(ret_point19-1)
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
ret_point19
.L0496 ;;line 2175;;  if gate_state = $80 then gosub init_game_3

	LDA gate_state
	CMP #$80
     BNE .skipL0496
.condpart157
 jsr .init_game_3
.skipL0496
.L0497 ;;line 2176;;  gosub load_top_room bank1

 sta temp7
 lda #>(ret_point20-1)
 pha
 lda #<(ret_point20-1)
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
ret_point20
.L0498 ;;line 2177;;  gosub load_bottom_room bank1

 sta temp7
 lda #>(ret_point21-1)
 pha
 lda #<(ret_point21-1)
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
ret_point21
.L0499 ;;line 2178;;  gosub check_gates bank3

 sta temp7
 lda #>(ret_point22-1)
 pha
 lda #<(ret_point22-1)
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
ret_point22
.L0500 ;;line 2179;;  goto main_loop bank1

 sta temp7
 lda #>(.main_loop-1)
 pha
 lda #<(.main_loop-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #1
 jmp BS_jsr
.
 ;;line 2180;; 

._title_draw
 ;;line 2181;; _title_draw

.
 ;;line 2182;; 

.L0501 ;;line 2183;;  gosub drawlogo

 jsr .drawlogo
.L0502 ;;line 2184;;  goto _title_loop

 jmp ._title_loop
.
 ;;line 2185;; 

.
 ;;line 2186;; 

.
 ;;line 2187;; 

.L0503 ;;line 2188;;  inline title.asm

 include title.asm
.
 ;;line 2189;; 

.
 ;;line 2190;; 

.
 ;;line 2191;; 

.
 ;;line 2192;; 

.
 ;;line 2193;; 

.init_game_3
 ;;line 2194;; init_game_3

.
 ;;line 2195;; 

.L0504 ;;line 2196;;  aux5 = 0  :  aux6 = 0

	LDA #0
	STA aux5
	STA aux6
.L0505 ;;line 2197;;  temp1 = 10

	LDA #10
	STA temp1
.
 ;;line 2198;; 

._g3_loop_top
 ;;line 2199;; _g3_loop_top

._g3_repick_top
 ;;line 2200;; _g3_repick_top

.L0506 ;;line 2201;;  temp2 = rand  &  15

 sta temp7
 lda #>(ret_point23-1)
 pha
 lda #<(ret_point23-1)
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
ret_point23
	AND #15
	STA temp2
.L0507 ;;line 2202;;  temp3 = g3_rooms[temp2]

	LDX temp2
	LDA g3_rooms,x
	STA temp3
.
 ;;line 2203;; 

.
 ;;line 2204;; 

.L0508 ;;line 2205;;  if temp1 = 5 then if temp2 = 11 then goto _g3_repick_top

	LDA temp1
	CMP #5
     BNE .skipL0508
.condpart158
	LDA temp2
	CMP #11
     BNE .skip158then
.condpart159
 jmp ._g3_repick_top
.skip158then
.skipL0508
.
 ;;line 2206;; 

.
 ;;line 2207;; 

.L0509 ;;line 2208;;  if temp1 = 6 then if temp2  >=  10 then goto _g3_repick_top

	LDA temp1
	CMP #6
     BNE .skipL0509
.condpart160
	LDA temp2
	CMP #10
     BCC .skip160then
.condpart161
 jmp ._g3_repick_top
.skip160then
.skipL0509
.L0510 ;;line 2209;;  if temp1 = 7 then if temp2  >=  10 then goto _g3_repick_top

	LDA temp1
	CMP #7
     BNE .skipL0510
.condpart162
	LDA temp2
	CMP #10
     BCC .skip162then
.condpart163
 jmp ._g3_repick_top
.skip162then
.skipL0510
.
 ;;line 2210;; 

.
 ;;line 2211;; 

.L0511 ;;line 2212;;  if temp1 = 8 then goto _g3_chk_wht_t

	LDA temp1
	CMP #8
     BNE .skipL0511
.condpart164
 jmp ._g3_chk_wht_t
.skipL0511
.L0512 ;;line 2213;;  if temp1 = 9 then goto _g3_chk_blk_t

	LDA temp1
	CMP #9
     BNE .skipL0512
.condpart165
 jmp ._g3_chk_blk_t
.skipL0512
.L0513 ;;line 2214;;  goto _g3_unique_top

 jmp ._g3_unique_top
.
 ;;line 2215;; 

._g3_chk_wht_t
 ;;line 2216;; _g3_chk_wht_t

.
 ;;line 2217;; 

.L0514 ;;line 2218;;  if temp2 = 14 then goto _g3_repick_top

	LDA temp2
	CMP #14
     BNE .skipL0514
.condpart166
 jmp ._g3_repick_top
.skipL0514
.
 ;;line 2219;; 

.L0515 ;;line 2220;;  if w_top_obj_room[9]  <>  21 then goto _g3_unique_top

	LDX #9
	LDA w_top_obj_room,x
	CMP #21
     BEQ .skipL0515
.condpart167
 jmp ._g3_unique_top
.skipL0515
.L0516 ;;line 2221;;  if temp2 = 12 then goto _g3_repick_top

	LDA temp2
	CMP #12
     BNE .skipL0516
.condpart168
 jmp ._g3_repick_top
.skipL0516
.L0517 ;;line 2222;;  if temp2 = 13 then goto _g3_repick_top

	LDA temp2
	CMP #13
     BNE .skipL0517
.condpart169
 jmp ._g3_repick_top
.skipL0517
.L0518 ;;line 2223;;  if temp2 = 15 then goto _g3_repick_top

	LDA temp2
	CMP #15
     BNE .skipL0518
.condpart170
 jmp ._g3_repick_top
.skipL0518
.L0519 ;;line 2224;;  goto _g3_unique_top

 jmp ._g3_unique_top
.
 ;;line 2225;; 

._g3_chk_blk_t
 ;;line 2226;; _g3_chk_blk_t

.
 ;;line 2227;; 

.L0520 ;;line 2228;;  if temp2 = 12 then goto _g3_repick_top

	LDA temp2
	CMP #12
     BNE .skipL0520
.condpart171
 jmp ._g3_repick_top
.skipL0520
.L0521 ;;line 2229;;  if temp2 = 13 then goto _g3_repick_top

	LDA temp2
	CMP #13
     BNE .skipL0521
.condpart172
 jmp ._g3_repick_top
.skipL0521
.L0522 ;;line 2230;;  if temp2 = 15 then goto _g3_repick_top

	LDA temp2
	CMP #15
     BNE .skipL0522
.condpart173
 jmp ._g3_repick_top
.skipL0522
.L0523 ;;line 2231;;  goto _g3_unique_top

 jmp ._g3_unique_top
.
 ;;line 2232;; 

._g3_unique_top
 ;;line 2233;; _g3_unique_top

.L0524 ;;line 2234;;  if temp2  >=  8 then goto _g3_hi_top

	LDA temp2
	CMP #8
     BCC .skipL0524
.condpart174
 jmp ._g3_hi_top
.skipL0524
.L0525 ;;line 2235;;  temp5 = bit_mask_8[temp2]

	LDX temp2
	LDA bit_mask_8,x
	STA temp5
.L0526 ;;line 2236;;  temp6 = aux5  &  temp5

	LDA aux5
	AND temp5
	STA temp6
.L0527 ;;line 2237;;  if temp6  <>  0 then goto _g3_repick_top

	LDA temp6
	CMP #0
     BEQ .skipL0527
.condpart175
 jmp ._g3_repick_top
.skipL0527
.L0528 ;;line 2238;;  aux5 = aux5  |  temp5

	LDA aux5
	ORA temp5
	STA aux5
.L0529 ;;line 2239;;  goto _g3_place_top

 jmp ._g3_place_top
._g3_hi_top
 ;;line 2240;; _g3_hi_top

.L0530 ;;line 2241;;  temp4 = temp2  -  8

	LDA temp2
	SEC
	SBC #8
	STA temp4
.L0531 ;;line 2242;;  temp5 = bit_mask_8[temp4]

	LDX temp4
	LDA bit_mask_8,x
	STA temp5
.L0532 ;;line 2243;;  temp6 = aux6  &  temp5

	LDA aux6
	AND temp5
	STA temp6
.L0533 ;;line 2244;;  if temp6  <>  0 then goto _g3_repick_top

	LDA temp6
	CMP #0
     BEQ .skipL0533
.condpart176
 jmp ._g3_repick_top
.skipL0533
.L0534 ;;line 2245;;  aux6 = aux6  |  temp5

	LDA aux6
	ORA temp5
	STA aux6
.
 ;;line 2246;; 

._g3_place_top
 ;;line 2247;; _g3_place_top

.L0535 ;;line 2248;;  w_top_obj_room[temp1] = temp3

	LDA temp3
	LDX temp1
	STA w_top_obj_room,x
.L0536 ;;line 2249;;  temp7 = rand  &  3

 sta temp7
 lda #>(ret_point24-1)
 pha
 lda #<(ret_point24-1)
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
ret_point24
	AND #3
	STA temp7
.L0537 ;;line 2250;;  temp4 = g3_corner_x[temp7]

	LDX temp7
	LDA g3_corner_x,x
	STA temp4
.L0538 ;;line 2251;;  top_obj_x[temp1] = temp4

	LDA temp4
	LDX temp1
	STA top_obj_x,x
.L0539 ;;line 2252;;  temp4 = g3_corner_y[temp7]

	LDX temp7
	LDA g3_corner_y,x
	STA temp4
.L0540 ;;line 2253;;  top_obj_y[temp1] = temp4

	LDA temp4
	LDX temp1
	STA top_obj_y,x
.
 ;;line 2254;; 

.L0541 ;;line 2255;;  if temp1 = 0 then goto _g3_start_bot

	LDA temp1
	CMP #0
     BNE .skipL0541
.condpart177
 jmp ._g3_start_bot
.skipL0541
.L0542 ;;line 2256;;  temp1 = temp1  -  1

	DEC temp1
.L0543 ;;line 2257;;  goto _g3_loop_top

 jmp ._g3_loop_top
.
 ;;line 2258;; 

._g3_start_bot
 ;;line 2259;; _g3_start_bot

.
 ;;line 2260;; 

.L0544 ;;line 2261;;  aux5 = 0  :  aux6 = 0

	LDA #0
	STA aux5
	STA aux6
.L0545 ;;line 2262;;  temp1 = 10

	LDA #10
	STA temp1
.
 ;;line 2263;; 

._g3_loop_bot
 ;;line 2264;; _g3_loop_bot

._g3_repick_bot
 ;;line 2265;; _g3_repick_bot

.L0546 ;;line 2266;;  temp2 = rand  &  15

 sta temp7
 lda #>(ret_point25-1)
 pha
 lda #<(ret_point25-1)
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
ret_point25
	AND #15
	STA temp2
.L0547 ;;line 2267;;  temp3 = g3_rooms[temp2]

	LDX temp2
	LDA g3_rooms,x
	STA temp3
.
 ;;line 2268;; 

.
 ;;line 2269;; 

.L0548 ;;line 2270;;  if temp1 = 5 then if temp2 = 11 then goto _g3_repick_bot

	LDA temp1
	CMP #5
     BNE .skipL0548
.condpart178
	LDA temp2
	CMP #11
     BNE .skip178then
.condpart179
 jmp ._g3_repick_bot
.skip178then
.skipL0548
.
 ;;line 2271;; 

.
 ;;line 2272;; 

.L0549 ;;line 2273;;  if temp1 = 6 then if temp2  >=  10 then goto _g3_repick_bot

	LDA temp1
	CMP #6
     BNE .skipL0549
.condpart180
	LDA temp2
	CMP #10
     BCC .skip180then
.condpart181
 jmp ._g3_repick_bot
.skip180then
.skipL0549
.L0550 ;;line 2274;;  if temp1 = 7 then if temp2  >=  10 then goto _g3_repick_bot

	LDA temp1
	CMP #7
     BNE .skipL0550
.condpart182
	LDA temp2
	CMP #10
     BCC .skip182then
.condpart183
 jmp ._g3_repick_bot
.skip182then
.skipL0550
.
 ;;line 2275;; 

.
 ;;line 2276;; 

.L0551 ;;line 2277;;  if temp1 = 8 then goto _g3_chk_wht_b

	LDA temp1
	CMP #8
     BNE .skipL0551
.condpart184
 jmp ._g3_chk_wht_b
.skipL0551
.L0552 ;;line 2278;;  if temp1 = 9 then goto _g3_chk_blk_b

	LDA temp1
	CMP #9
     BNE .skipL0552
.condpart185
 jmp ._g3_chk_blk_b
.skipL0552
.L0553 ;;line 2279;;  goto _g3_unique_bot

 jmp ._g3_unique_bot
.
 ;;line 2280;; 

._g3_chk_wht_b
 ;;line 2281;; _g3_chk_wht_b

.L0554 ;;line 2282;;  if temp2 = 14 then goto _g3_repick_bot

	LDA temp2
	CMP #14
     BNE .skipL0554
.condpart186
 jmp ._g3_repick_bot
.skipL0554
.L0555 ;;line 2283;;  if w_bot_obj_room[9]  <>  21 then goto _g3_unique_bot

	LDX #9
	LDA w_bot_obj_room,x
	CMP #21
     BEQ .skipL0555
.condpart187
 jmp ._g3_unique_bot
.skipL0555
.L0556 ;;line 2284;;  if temp2 = 12 then goto _g3_repick_bot

	LDA temp2
	CMP #12
     BNE .skipL0556
.condpart188
 jmp ._g3_repick_bot
.skipL0556
.L0557 ;;line 2285;;  if temp2 = 13 then goto _g3_repick_bot

	LDA temp2
	CMP #13
     BNE .skipL0557
.condpart189
 jmp ._g3_repick_bot
.skipL0557
.L0558 ;;line 2286;;  if temp2 = 15 then goto _g3_repick_bot

	LDA temp2
	CMP #15
     BNE .skipL0558
.condpart190
 jmp ._g3_repick_bot
.skipL0558
.L0559 ;;line 2287;;  goto _g3_unique_bot

 jmp ._g3_unique_bot
.
 ;;line 2288;; 

._g3_chk_blk_b
 ;;line 2289;; _g3_chk_blk_b

.L0560 ;;line 2290;;  if temp2 = 12 then goto _g3_repick_bot

	LDA temp2
	CMP #12
     BNE .skipL0560
.condpart191
 jmp ._g3_repick_bot
.skipL0560
.L0561 ;;line 2291;;  if temp2 = 13 then goto _g3_repick_bot

	LDA temp2
	CMP #13
     BNE .skipL0561
.condpart192
 jmp ._g3_repick_bot
.skipL0561
.L0562 ;;line 2292;;  if temp2 = 15 then goto _g3_repick_bot

	LDA temp2
	CMP #15
     BNE .skipL0562
.condpart193
 jmp ._g3_repick_bot
.skipL0562
.L0563 ;;line 2293;;  goto _g3_unique_bot

 jmp ._g3_unique_bot
.
 ;;line 2294;; 

._g3_unique_bot
 ;;line 2295;; _g3_unique_bot

.L0564 ;;line 2296;;  if temp2  >=  8 then goto _g3_hi_bot

	LDA temp2
	CMP #8
     BCC .skipL0564
.condpart194
 jmp ._g3_hi_bot
.skipL0564
.L0565 ;;line 2297;;  temp5 = bit_mask_8[temp2]

	LDX temp2
	LDA bit_mask_8,x
	STA temp5
.L0566 ;;line 2298;;  temp6 = aux5  &  temp5

	LDA aux5
	AND temp5
	STA temp6
.L0567 ;;line 2299;;  if temp6  <>  0 then goto _g3_repick_bot

	LDA temp6
	CMP #0
     BEQ .skipL0567
.condpart195
 jmp ._g3_repick_bot
.skipL0567
.L0568 ;;line 2300;;  aux5 = aux5  |  temp5

	LDA aux5
	ORA temp5
	STA aux5
.L0569 ;;line 2301;;  goto _g3_place_bot

 jmp ._g3_place_bot
._g3_hi_bot
 ;;line 2302;; _g3_hi_bot

.L0570 ;;line 2303;;  temp4 = temp2  -  8

	LDA temp2
	SEC
	SBC #8
	STA temp4
.L0571 ;;line 2304;;  temp5 = bit_mask_8[temp4]

	LDX temp4
	LDA bit_mask_8,x
	STA temp5
.L0572 ;;line 2305;;  temp6 = aux6  &  temp5

	LDA aux6
	AND temp5
	STA temp6
.L0573 ;;line 2306;;  if temp6  <>  0 then goto _g3_repick_bot

	LDA temp6
	CMP #0
     BEQ .skipL0573
.condpart196
 jmp ._g3_repick_bot
.skipL0573
.L0574 ;;line 2307;;  aux6 = aux6  |  temp5

	LDA aux6
	ORA temp5
	STA aux6
.
 ;;line 2308;; 

._g3_place_bot
 ;;line 2309;; _g3_place_bot

.L0575 ;;line 2310;;  w_bot_obj_room[temp1] = temp3

	LDA temp3
	LDX temp1
	STA w_bot_obj_room,x
.L0576 ;;line 2311;;  temp7 = rand  &  3

 sta temp7
 lda #>(ret_point26-1)
 pha
 lda #<(ret_point26-1)
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
ret_point26
	AND #3
	STA temp7
.L0577 ;;line 2312;;  temp4 = g3_corner_x[temp7]

	LDX temp7
	LDA g3_corner_x,x
	STA temp4
.L0578 ;;line 2313;;  bot_obj_x[temp1] = temp4

	LDA temp4
	LDX temp1
	STA bot_obj_x,x
.L0579 ;;line 2314;;  temp4 = g3_corner_y[temp7]

	LDX temp7
	LDA g3_corner_y,x
	STA temp4
.L0580 ;;line 2315;;  bot_obj_y[temp1] = temp4

	LDA temp4
	LDX temp1
	STA bot_obj_y,x
.
 ;;line 2316;; 

.L0581 ;;line 2317;;  if temp1 = 0 then goto _g3_done

	LDA temp1
	CMP #0
     BNE .skipL0581
.condpart197
 jmp ._g3_done
.skipL0581
.L0582 ;;line 2318;;  temp1 = temp1  -  1

	DEC temp1
.L0583 ;;line 2319;;  goto _g3_loop_bot

 jmp ._g3_loop_bot
.
 ;;line 2320;; 

._g3_done
 ;;line 2321;; _g3_done

.L0584 ;;line 2322;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2323;; 

.
 ;;line 2324;; 

.L0585 ;;line 2325;;  data bit_mask_8

	JMP .skipL0585
bit_mask_8
	.byte  1, 2, 4, 8, 16, 32, 64, 128

.skipL0585
.
 ;;line 2328;; 

.
 ;;line 2329;; 

.
 ;;line 2330;; 

.
 ;;line 2331;; 

.
 ;;line 2332;; 

.
 ;;line 2333;; 

.
 ;;line 2334;; 

.L0586 ;;line 2335;;  data g3_rooms

	JMP .skipL0586
g3_rooms
	.byte  2, 4, 5, 9, 11, 13, 14, 16, 27, 28, 30, 1, 12, 19, 21, 22

.skipL0586
.
 ;;line 2338;; 

.
 ;;line 2339;; 

.L0587 ;;line 2340;;  data g3_corner_x

	JMP .skipL0587
g3_corner_x
	.byte  32, 118, 32, 118

.skipL0587
.L0588 ;;line 2343;;  data g3_corner_y

	JMP .skipL0588
g3_corner_y
	.byte  16, 16, 40, 40

.skipL0588
.
 ;;line 2346;; 

.apply_graphics
 ;;line 2347;; apply_graphics

.
 ;;line 2348;; 

.L0589 ;;line 2349;;  gosub update_audio

 jsr .update_audio
.
 ;;line 2350;; 

.
 ;;line 2351;; 

.L0590 ;;line 2352;;  if !room_flags{3} then gosub _gfx_gate  :  goto _set_bot_p0_ptr

	LDA room_flags
	AND #8
	BNE .skipL0590
.condpart198
 jsr ._gfx_gate
 jmp ._set_bot_p0_ptr
.skipL0590
.L0591 ;;line 2353;;  if p2_ballx  <  33 then bottom_player0x = 13  :  goto _bot_t_y

	LDA p2_ballx
	CMP #33
     BCS .skipL0591
.condpart199
	LDA #13
	STA bottom_player0x
 jmp ._bot_t_y
.skipL0591
.L0592 ;;line 2354;;  if p2_ballx  >  131 then bottom_player0x = 112  :  goto _bot_t_y

	LDA #131
	CMP p2_ballx
     BCS .skipL0592
.condpart200
	LDA #112
	STA bottom_player0x
 jmp ._bot_t_y
.skipL0592
.L0593 ;;line 2355;;  bottom_player0x = p2_ballx  -  20

	LDA p2_ballx
	SEC
	SBC #20
	STA bottom_player0x
._bot_t_y
 ;;line 2356;; _bot_t_y

.L0594 ;;line 2357;;  bottom_player0y = p2_bally  +  5

	LDA p2_bally
	CLC
	ADC #5
	STA bottom_player0y
.L0595 ;;line 2358;;  gosub _gfx_torch

 jsr ._gfx_torch
._set_bot_p0_ptr
 ;;line 2359;; _set_bot_p0_ptr

.L0596 ;;line 2360;;  bottom_p0_ptr_lo = top_p0_ptr_lo

	LDA top_p0_ptr_lo
	STA bottom_p0_ptr_lo
.L0597 ;;line 2361;;  bottom_p0_ptr_hi = top_p0_ptr_hi

	LDA top_p0_ptr_hi
	STA bottom_p0_ptr_hi
.
 ;;line 2362;; 

.
 ;;line 2363;; 

.L0598 ;;line 2364;;  if !room_flags{2} then gosub _gfx_gate  :  goto _skip_top_pos

	LDA room_flags
	AND #4
	BNE .skipL0598
.condpart201
 jsr ._gfx_gate
 jmp ._skip_top_pos
.skipL0598
.L0599 ;;line 2365;;  if ballx  <  33 then top_player0x = 13  :  goto _top_t_y

	LDA ballx
	CMP #33
     BCS .skipL0599
.condpart202
	LDA #13
	STA top_player0x
 jmp ._top_t_y
.skipL0599
.L0600 ;;line 2366;;  if ballx  >  131 then top_player0x = 112  :  goto _top_t_y

	LDA #131
	CMP ballx
     BCS .skipL0600
.condpart203
	LDA #112
	STA top_player0x
 jmp ._top_t_y
.skipL0600
.L0601 ;;line 2367;;  top_player0x = ballx  -  20

	LDA ballx
	SEC
	SBC #20
	STA top_player0x
._top_t_y
 ;;line 2368;; _top_t_y

.L0602 ;;line 2369;;  top_player0y = bally  +  5

	LDA bally
	CLC
	ADC #5
	STA top_player0y
.L0603 ;;line 2370;;  gosub _gfx_torch

 jsr ._gfx_torch
._skip_top_pos
 ;;line 2371;; _skip_top_pos

.
 ;;line 2372;; 

.
 ;;line 2373;; 

.L0604 ;;line 2374;;  temp3 = bot_flicker_idx  :  temp4 = bot_drag_state  :  temp2 = drag_dead  /  8  :  gosub set_sprite_pointers

	LDA bot_flicker_idx
	STA temp3
	LDA bot_drag_state
	STA temp4
	LDA drag_dead
	lsr
	lsr
	lsr
	STA temp2
 jsr .set_sprite_pointers
.L0605 ;;line 2375;;  bottom_p1_ptr_lo = top_p1_ptr_lo

	LDA top_p1_ptr_lo
	STA bottom_p1_ptr_lo
.L0606 ;;line 2376;;  bottom_p1_ptr_hi = top_p1_ptr_hi

	LDA top_p1_ptr_hi
	STA bottom_p1_ptr_hi
.
 ;;line 2377;; 

.
 ;;line 2378;; 

.L0607 ;;line 2379;;  temp3 = flicker_idx  :  temp4 = top_drag_state  :  temp2 = drag_dead  &  7  :  gosub set_sprite_pointers

	LDA flicker_idx
	STA temp3
	LDA top_drag_state
	STA temp4
	LDA drag_dead
	AND #7
	STA temp2
 jsr .set_sprite_pointers
.
 ;;line 2380;; 

.
 ;;line 2381;; 

.L0608 ;;line 2382;;  if !joy0fire then goto _top_try_pickup

 bit INPT4
	BPL .skipL0608
.condpart204
 jmp ._top_try_pickup
.skipL0608
.
 ;;line 2383;; 

.L0609 ;;line 2384;;  if top_carried_item = 255 then goto _check_bot_pickup

	LDA top_carried_item
	CMP #255
     BNE .skipL0609
.condpart205
 jmp ._check_bot_pickup
.skipL0609
.
 ;;line 2385;; 

.L0610 ;;line 2386;;  top_carried_item = 255

	LDA #255
	STA top_carried_item
.L0611 ;;line 2387;;  if top_drag_state = 3 then top_drag_state = 19

	LDA top_drag_state
	CMP #3
     BNE .skipL0611
.condpart206
	LDA #19
	STA top_drag_state
.skipL0611
.L0612 ;;line 2388;;  goto _check_bot_pickup

 jmp ._check_bot_pickup
.
 ;;line 2389;; 

._top_try_pickup
 ;;line 2390;; _top_try_pickup

.L0613 ;;line 2391;;  temp1 = flicker_idx

	LDA flicker_idx
	STA temp1
.L0614 ;;line 2392;;  if temp1  <  3  ||  temp1 = 255 then goto _check_bot_pickup

	LDA temp1
	CMP #3
     BCS .skipL0614
.condpart207
 jmp .condpart208
.skipL0614
	LDA temp1
	CMP #255
     BNE .skip20OR
.condpart208
 jmp ._check_bot_pickup
.skip20OR
.L0615 ;;line 2393;;  if temp1 = top_carried_item then goto _check_bot_pickup

	LDA temp1
	CMP top_carried_item
     BNE .skipL0615
.condpart209
 jmp ._check_bot_pickup
.skipL0615
.L0616 ;;line 2394;;  if top_carried_item = 3  &&  top_obj_x[3] = top_player1x then goto _check_bot_pickup

	LDA top_carried_item
	CMP #3
     BNE .skipL0616
.condpart210
	LDX #3
	LDA top_obj_x,x
	CMP top_player1x
     BNE .skip210then
.condpart211
 jmp ._check_bot_pickup
.skip210then
.skipL0616
.
 ;;line 2395;; 

.L0617 ;;line 2396;;  if temp1 = 6 then goto _top_bridge_pickup

	LDA temp1
	CMP #6
     BNE .skipL0617
.condpart212
 jmp ._top_bridge_pickup
.skipL0617
.
 ;;line 2397;; 

.
 ;;line 2398;; 

.L0618 ;;line 2399;;  temp5 = ballx  +  4

	LDA ballx
	CLC
	ADC #4
	STA temp5
.L0619 ;;line 2400;;  temp6 = top_player1x  +  10

	LDA top_player1x
	CLC
	ADC #10
	STA temp6
.L0620 ;;line 2401;;  if temp5  <  top_player1x then goto _check_bot_pickup

	LDA temp5
	CMP top_player1x
     BCS .skipL0620
.condpart213
 jmp ._check_bot_pickup
.skipL0620
.L0621 ;;line 2402;;  if ballx  >  temp6 then goto _check_bot_pickup

	LDA temp6
	CMP ballx
     BCS .skipL0621
.condpart214
 jmp ._check_bot_pickup
.skipL0621
.
 ;;line 2403;; 

.
 ;;line 2404;; 

.L0622 ;;line 2405;;  temp5 = bally  +  20

	LDA bally
	CLC
	ADC #20
	STA temp5
.L0623 ;;line 2406;;  temp2 = temp1  -  3

	LDA temp1
	SEC
	SBC #3
	STA temp2
.
 ;;line 2407;; 

.L0624 ;;line 2408;;  temp6 = top_player1y  +  item_hitbox_top[temp2]

	LDA top_player1y
	LDX temp2
	CLC
	ADC item_hitbox_top,x
	STA temp6
.L0625 ;;line 2409;;  if temp5  <  temp6 then goto _check_bot_pickup

	LDA temp5
	CMP temp6
     BCS .skipL0625
.condpart215
 jmp ._check_bot_pickup
.skipL0625
.
 ;;line 2410;; 

.L0626 ;;line 2411;;  temp6 = top_player1y  +  item_hitbox_bot[temp2]

	LDA top_player1y
	LDX temp2
	CLC
	ADC item_hitbox_bot,x
	STA temp6
.L0627 ;;line 2412;;  if temp5  >  temp6 then goto _check_bot_pickup

	LDA temp6
	CMP temp5
     BCS .skipL0627
.condpart216
 jmp ._check_bot_pickup
.skipL0627
.
 ;;line 2413;; 

.L0628 ;;line 2414;;  goto _do_pickup_top

 jmp ._do_pickup_top
.
 ;;line 2415;; 

._top_bridge_pickup
 ;;line 2416;; _top_bridge_pickup

.L0629 ;;line 2417;;  asm

   

   lda bally

   sec

   sbc top_player1y

   clc

   adc #18

   cmp #22

   bcs .t_br_rej

   

   

   lda ballx

   sec

   sbc top_player1x

   clc

   adc #4

   cmp #24

   bcs .t_br_rej

   

   

   lda ballx

   sec

   sbc top_player1x

   cmp #6       

   bcc .t_br_acc

   cmp #13      

   bcs .t_br_acc

   

   

.t_br_rej

.L0630 ;;line 2448;;  goto _check_bot_pickup

 jmp ._check_bot_pickup
.
 ;;line 2449;; 

.L0631 ;;line 2450;;  asm

.t_br_acc

.
 ;;line 2453;; 

.
 ;;line 2454;; 

._do_pickup_top
 ;;line 2455;; _do_pickup_top

.L0632 ;;line 2456;;  top_carried_item = temp1

	LDA temp1
	STA top_carried_item
.L0633 ;;line 2457;;  if top_drag_state = 3 then top_drag_state = 39

	LDA top_drag_state
	CMP #3
     BNE .skipL0633
.condpart217
	LDA #39
	STA top_drag_state
.skipL0633
.L0634 ;;line 2458;;  temp2 = top_bat_state  &  15

	LDA top_bat_state
	AND #15
	STA temp2
.L0635 ;;line 2459;;  if temp2 = temp1 then top_bat_state = top_bat_state  |  15  :  bat_fedup =  ( bat_fedup  &  $F0 )   |  6

	LDA temp2
	CMP temp1
     BNE .skipL0635
.condpart218
	LDA top_bat_state
	ORA #15
	STA top_bat_state
; complex statement detected
	LDA bat_fedup
	AND #$F0
	ORA #6
	STA bat_fedup
.skipL0635
.L0636 ;;line 2460;;  w_top_carry_off_x = top_obj_x[temp1]  -  r_top_oldx

	LDX temp1
	LDA top_obj_x,x
	SEC
	SBC r_top_oldx
	STA w_top_carry_off_x
.L0637 ;;line 2461;;  w_top_carry_off_y = top_obj_y[temp1]  -  r_top_oldy

	LDX temp1
	LDA top_obj_y,x
	SEC
	SBC r_top_oldy
	STA w_top_carry_off_y
.
 ;;line 2462;; 

._check_bot_pickup
 ;;line 2463;; _check_bot_pickup

.
 ;;line 2464;; 

.L0638 ;;line 2465;;  if !joy1fire then goto _bot_try_pickup

 bit INPT5
	BPL .skipL0638
.condpart219
 jmp ._bot_try_pickup
.skipL0638
.
 ;;line 2466;; 

.L0639 ;;line 2467;;  if bot_carried_item = 255 then return otherbank

	LDA bot_carried_item
	CMP #255
     BNE .skipL0639
.condpart220
	JMP BS_return
.skipL0639
.
 ;;line 2468;; 

.L0640 ;;line 2469;;  bot_carried_item = 255

	LDA #255
	STA bot_carried_item
.L0641 ;;line 2470;;  if bot_drag_state = 3 then bot_drag_state = 19

	LDA bot_drag_state
	CMP #3
     BNE .skipL0641
.condpart221
	LDA #19
	STA bot_drag_state
.skipL0641
.L0642 ;;line 2471;;  return otherbank

	JMP BS_return
.
 ;;line 2472;; 

._bot_try_pickup
 ;;line 2473;; _bot_try_pickup

.L0643 ;;line 2474;;  temp1 = bot_flicker_idx

	LDA bot_flicker_idx
	STA temp1
.L0644 ;;line 2475;;  if temp1  <  3  ||  temp1 = 255 then return otherbank

	LDA temp1
	CMP #3
     BCS .skipL0644
.condpart222
 jmp .condpart223
.skipL0644
	LDA temp1
	CMP #255
     BNE .skip22OR
.condpart223
	JMP BS_return
.skip22OR
.L0645 ;;line 2476;;  if temp1 = bot_carried_item then return otherbank

	LDA temp1
	CMP bot_carried_item
     BNE .skipL0645
.condpart224
	JMP BS_return
.skipL0645
.L0646 ;;line 2477;;  if bot_carried_item = 3  &&  bot_obj_x[3] = bottom_player1x then return otherbank

	LDA bot_carried_item
	CMP #3
     BNE .skipL0646
.condpart225
	LDX #3
	LDA bot_obj_x,x
	CMP bottom_player1x
     BNE .skip225then
.condpart226
	JMP BS_return
.skip225then
.skipL0646
.
 ;;line 2478;; 

.L0647 ;;line 2479;;  if temp1 = 6 then goto _bot_bridge_pickup

	LDA temp1
	CMP #6
     BNE .skipL0647
.condpart227
 jmp ._bot_bridge_pickup
.skipL0647
.
 ;;line 2480;; 

.
 ;;line 2481;; 

.L0648 ;;line 2482;;  temp5 = p2_ballx  +  4

	LDA p2_ballx
	CLC
	ADC #4
	STA temp5
.L0649 ;;line 2483;;  temp6 = bottom_player1x  +  8

	LDA bottom_player1x
	CLC
	ADC #8
	STA temp6
.L0650 ;;line 2484;;  if temp5  <  bottom_player1x then return otherbank

	LDA temp5
	CMP bottom_player1x
     BCS .skipL0650
.condpart228
	JMP BS_return
.skipL0650
.L0651 ;;line 2485;;  if p2_ballx  >  temp6 then return otherbank

	LDA temp6
	CMP p2_ballx
     BCS .skipL0651
.condpart229
	JMP BS_return
.skipL0651
.
 ;;line 2486;; 

.
 ;;line 2487;; 

.L0652 ;;line 2488;;  temp5 = p2_bally  +  20

	LDA p2_bally
	CLC
	ADC #20
	STA temp5
.L0653 ;;line 2489;;  temp2 = temp1  -  3

	LDA temp1
	SEC
	SBC #3
	STA temp2
.
 ;;line 2490;; 

.L0654 ;;line 2491;;  temp6 = bottom_player1y  +  item_hitbox_top[temp2]

	LDA bottom_player1y
	LDX temp2
	CLC
	ADC item_hitbox_top,x
	STA temp6
.L0655 ;;line 2492;;  if temp5  <  temp6 then return otherbank

	LDA temp5
	CMP temp6
     BCS .skipL0655
.condpart230
	JMP BS_return
.skipL0655
.
 ;;line 2493;; 

.L0656 ;;line 2494;;  temp6 = bottom_player1y  +  item_hitbox_bot[temp2]

	LDA bottom_player1y
	LDX temp2
	CLC
	ADC item_hitbox_bot,x
	STA temp6
.L0657 ;;line 2495;;  if temp5  >  temp6 then return otherbank

	LDA temp6
	CMP temp5
     BCS .skipL0657
.condpart231
	JMP BS_return
.skipL0657
.
 ;;line 2496;; 

.L0658 ;;line 2497;;  goto _do_pickup_bot

 jmp ._do_pickup_bot
.
 ;;line 2498;; 

._bot_bridge_pickup
 ;;line 2499;; _bot_bridge_pickup

.L0659 ;;line 2500;;  asm

   

   lda p2_bally

   sec

   sbc bottom_player1y

   clc

   adc #18

   cmp #22

   bcs .b_br_rej

   

   

   lda p2_ballx

   sec

   sbc bottom_player1x

   clc

   adc #4

   cmp #24

   bcs .b_br_rej

   

   

   lda p2_ballx

   sec

   sbc bottom_player1x

   cmp #6       

   bcc .b_br_acc

   cmp #13      

   bcs .b_br_acc

   

   

.b_br_rej

.L0660 ;;line 2531;;  return otherbank

	JMP BS_return
.
 ;;line 2532;; 

.L0661 ;;line 2533;;  asm

.b_br_acc

.L0662 ;;line 2536;;  goto _do_pickup_bot

 jmp ._do_pickup_bot
.
 ;;line 2537;; 

._do_pickup_bot
 ;;line 2538;; _do_pickup_bot

.L0663 ;;line 2539;;  bot_carried_item = temp1

	LDA temp1
	STA bot_carried_item
.L0664 ;;line 2540;;  if bot_drag_state = 3 then bot_drag_state = 39

	LDA bot_drag_state
	CMP #3
     BNE .skipL0664
.condpart232
	LDA #39
	STA bot_drag_state
.skipL0664
.L0665 ;;line 2541;;  temp2 = bot_bat_state  &  15

	LDA bot_bat_state
	AND #15
	STA temp2
.L0666 ;;line 2542;;  if temp2 = temp1 then bot_bat_state = bot_bat_state  |  15  :  bat_fedup =  ( bat_fedup  &  $0F )   |  $60

	LDA temp2
	CMP temp1
     BNE .skipL0666
.condpart233
	LDA bot_bat_state
	ORA #15
	STA bot_bat_state
; complex statement detected
	LDA bat_fedup
	AND #$0F
	ORA #$60
	STA bat_fedup
.skipL0666
.L0667 ;;line 2543;;  w_bot_carry_off_x = bot_obj_x[temp1]  -  r_bottom_oldx

	LDX temp1
	LDA bot_obj_x,x
	SEC
	SBC r_bottom_oldx
	STA w_bot_carry_off_x
.L0668 ;;line 2544;;  w_bot_carry_off_y = bot_obj_y[temp1]  -  r_bottom_oldy

	LDX temp1
	LDA bot_obj_y,x
	SEC
	SBC r_bottom_oldy
	STA w_bot_carry_off_y
.L0669 ;;line 2545;;  return otherbank

	JMP BS_return
.
 ;;line 2546;; 

.
 ;;line 2547;; 

.L0670 ;;line 2548;;  data item_hitbox_top

	JMP .skipL0670
item_hitbox_top
	.byte   11,       14,      10,        2,        15,     15,     15,     6

.skipL0670
.
 ;;line 2551;; 

.L0671 ;;line 2552;;  data item_hitbox_bot

	JMP .skipL0671
item_hitbox_bot
	.byte   25,       25,      27,        25,       25,     25,     25,     22

.skipL0671
.
 ;;line 2555;; 

.
 ;;line 2556;; 

.
 ;;line 2557;; 

.
 ;;line 2558;; 

.update_audio
 ;;line 2559;; update_audio

.
 ;;line 2560;; 

.L0672 ;;line 2561;;  if r005 = 1 then goto _play_win_sfx

	LDA r005
	CMP #1
     BNE .skipL0672
.condpart234
 jmp ._play_win_sfx
.skipL0672
.L0673 ;;line 2562;;  if r016 = 1 then goto _play_win_sfx

	LDA r016
	CMP #1
     BNE .skipL0673
.condpart235
 jmp ._play_win_sfx
.skipL0673
.L0674 ;;line 2563;;  goto _audio_top_check

 jmp ._audio_top_check
.
 ;;line 2564;; 

._play_win_sfx
 ;;line 2565;; _play_win_sfx

.
 ;;line 2566;; 

.L0675 ;;line 2567;;  if top_drag_state  <  255 then top_drag_state = top_drag_state  +  1

	LDA top_drag_state
	CMP #255
     BCS .skipL0675
.condpart236
	INC top_drag_state
.skipL0675
.L0676 ;;line 2568;;  if top_drag_state  >  127 then AUDV0 = 0  :  AUDV1 = 0  :  return

	LDA #127
	CMP top_drag_state
     BCS .skipL0676
.condpart237
	LDA #0
	STA AUDV0
	STA AUDV1
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0676
.
 ;;line 2569;; 

.
 ;;line 2570;; 

.L0677 ;;line 2571;;  temp1 =  ( top_drag_state  /  16 )   &  7

; complex statement detected
	LDA top_drag_state
	lsr
	lsr
	lsr
	lsr
	AND #7
	STA temp1
.L0678 ;;line 2572;;  AUDC0 = 4  :  AUDF0 = win_freq[temp1]  :  AUDV0 = 8

	LDA #4
	STA AUDC0
	LDX temp1
	LDA win_freq,x
	STA AUDF0
	LDA #8
	STA AUDV0
.L0679 ;;line 2573;;  AUDC1 = 4  :  AUDF1 = win_freq[temp1]  :  AUDV1 = 8

	LDA #4
	STA AUDC1
	LDX temp1
	LDA win_freq,x
	STA AUDF1
	LDA #8
	STA AUDV1
.L0680 ;;line 2574;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2575;; 

._audio_top_check
 ;;line 2576;; _audio_top_check

.
 ;;line 2577;; 

.L0681 ;;line 2578;;  temp1 =  ( top_drag_state  &  124 )   /  4

; complex statement detected
	LDA top_drag_state
	AND #124
	lsr
	lsr
	STA temp1
.L0682 ;;line 2579;;  if !top_drag_state{7} then goto _top_not_eaten_sfx

	BIT top_drag_state
	BMI .skipL0682
.condpart238
 jmp ._top_not_eaten_sfx
.skipL0682
.L0683 ;;line 2580;;  if temp1 = 0 then AUDV0 = 0  :  goto _audio_bot_check

	LDA temp1
	CMP #0
     BNE .skipL0683
.condpart239
	LDA #0
	STA AUDV0
 jmp ._audio_bot_check
.skipL0683
.
 ;;line 2581;; 

.
 ;;line 2582;; 

.L0684 ;;line 2583;;  AUDC0 = 15  :  AUDV0 = temp1

	LDA #15
	STA AUDC0
	LDA temp1
	STA AUDV0
.L0685 ;;line 2584;;  temp2 = 31  -  temp1

	LDA #31
	SEC
	SBC temp1
	STA temp2
.L0686 ;;line 2585;;  if room_flags{7} then temp2 = temp2  -  4

	BIT room_flags
	BPL .skipL0686
.condpart240
	LDA temp2
	SEC
	SBC #4
	STA temp2
.skipL0686
.L0687 ;;line 2586;;  AUDF0 = temp2

	LDA temp2
	STA AUDF0
.
 ;;line 2587;; 

.L0688 ;;line 2588;;  if !room_flags{7} then top_drag_state = top_drag_state  -  4

	BIT room_flags
	BMI .skipL0688
.condpart241
	LDA top_drag_state
	SEC
	SBC #4
	STA top_drag_state
.skipL0688
.L0689 ;;line 2589;;  goto _audio_bot_check

 jmp ._audio_bot_check
.
 ;;line 2590;; 

._top_not_eaten_sfx
 ;;line 2591;; _top_not_eaten_sfx

.L0690 ;;line 2592;;  temp2 = top_drag_state  &  3

	LDA top_drag_state
	AND #3
	STA temp2
.L0691 ;;line 2593;;  if temp2  <  3 then goto _top_play_roar

	LDA temp2
	CMP #3
     BCS .skipL0691
.condpart242
 jmp ._top_play_roar
.skipL0691
.L0692 ;;line 2594;;  if temp1 = 0 then AUDV0 = 0  :  goto _audio_bot_check

	LDA temp1
	CMP #0
     BNE .skipL0692
.condpart243
	LDA #0
	STA AUDV0
 jmp ._audio_bot_check
.skipL0692
.
 ;;line 2595;; 

.
 ;;line 2596;; 

.L0693 ;;line 2597;;  AUDC0 = sfx_audc[temp1]

	LDX temp1
	LDA sfx_audc,x
	STA AUDC0
.L0694 ;;line 2598;;  AUDF0 = sfx_audf[temp1]

	LDX temp1
	LDA sfx_audf,x
	STA AUDF0
.L0695 ;;line 2599;;  AUDV0 = sfx_audv[temp1]

	LDX temp1
	LDA sfx_audv,x
	STA AUDV0
.L0696 ;;line 2600;;  if room_flags{7} then goto _audio_bot_check

	BIT room_flags
	BPL .skipL0696
.condpart244
 jmp ._audio_bot_check
.skipL0696
.L0697 ;;line 2601;;  top_drag_state = top_drag_state  -  4

	LDA top_drag_state
	SEC
	SBC #4
	STA top_drag_state
.L0698 ;;line 2602;;  if temp1 = 1 then top_drag_state = 3

	LDA temp1
	CMP #1
     BNE .skipL0698
.condpart245
	LDA #3
	STA top_drag_state
.skipL0698
.L0699 ;;line 2603;;  if temp1 = 6 then top_drag_state = 3

	LDA temp1
	CMP #6
     BNE .skipL0699
.condpart246
	LDA #3
	STA top_drag_state
.skipL0699
.L0700 ;;line 2604;;  if temp1 = 11 then top_drag_state = 3

	LDA temp1
	CMP #11
     BNE .skipL0700
.condpart247
	LDA #3
	STA top_drag_state
.skipL0700
.L0701 ;;line 2605;;  goto _audio_bot_check

 jmp ._audio_bot_check
.
 ;;line 2606;; 

._top_play_roar
 ;;line 2607;; _top_play_roar

.
 ;;line 2608;; 

.L0702 ;;line 2609;;  if temp1{0} then AUDC0 = 8 else AUDC0 = 3

	LDA temp1
	LSR
	BCC .skipL0702
.condpart248
	LDA #8
	STA AUDC0
 jmp .skipelse5
.skipL0702
	LDA #3
	STA AUDC0
.skipelse5
.L0703 ;;line 2610;;  AUDF0 = $1F

	LDA #$1F
	STA AUDF0
.L0704 ;;line 2611;;  temp3 = temp1  /  2

	LDA temp1
	lsr
	STA temp3
.L0705 ;;line 2612;;  AUDV0 = 15  -  temp3

	LDA #15
	SEC
	SBC temp3
	STA AUDV0
.
 ;;line 2613;; 

._audio_bot_check
 ;;line 2614;; _audio_bot_check

.
 ;;line 2615;; 

.L0706 ;;line 2616;;  temp1 =  ( bot_drag_state  &  124 )   /  4

; complex statement detected
	LDA bot_drag_state
	AND #124
	lsr
	lsr
	STA temp1
.L0707 ;;line 2617;;  if !bot_drag_state{7} then goto _bot_not_eaten_sfx

	BIT bot_drag_state
	BMI .skipL0707
.condpart249
 jmp ._bot_not_eaten_sfx
.skipL0707
.L0708 ;;line 2618;;  if temp1 = 0 then AUDV1 = 0  :  return

	LDA temp1
	CMP #0
     BNE .skipL0708
.condpart250
	LDA #0
	STA AUDV1
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0708
.
 ;;line 2619;; 

.
 ;;line 2620;; 

.L0709 ;;line 2621;;  AUDC1 = 15  :  AUDV1 = temp1

	LDA #15
	STA AUDC1
	LDA temp1
	STA AUDV1
.L0710 ;;line 2622;;  temp2 = 31  -  temp1

	LDA #31
	SEC
	SBC temp1
	STA temp2
.L0711 ;;line 2623;;  if room_flags{7} then temp2 = temp2  -  4

	BIT room_flags
	BPL .skipL0711
.condpart251
	LDA temp2
	SEC
	SBC #4
	STA temp2
.skipL0711
.L0712 ;;line 2624;;  AUDF1 = temp2

	LDA temp2
	STA AUDF1
.
 ;;line 2625;; 

.L0713 ;;line 2626;;  if room_flags{7} then bot_drag_state = bot_drag_state  -  4

	BIT room_flags
	BPL .skipL0713
.condpart252
	LDA bot_drag_state
	SEC
	SBC #4
	STA bot_drag_state
.skipL0713
.L0714 ;;line 2627;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2628;; 

._bot_not_eaten_sfx
 ;;line 2629;; _bot_not_eaten_sfx

.L0715 ;;line 2630;;  temp2 = bot_drag_state  &  3

	LDA bot_drag_state
	AND #3
	STA temp2
.L0716 ;;line 2631;;  if temp2  <  3 then goto _bot_play_roar

	LDA temp2
	CMP #3
     BCS .skipL0716
.condpart253
 jmp ._bot_play_roar
.skipL0716
.L0717 ;;line 2632;;  if temp1 = 0 then AUDV1 = 0  :  return

	LDA temp1
	CMP #0
     BNE .skipL0717
.condpart254
	LDA #0
	STA AUDV1
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0717
.
 ;;line 2633;; 

.
 ;;line 2634;; 

.L0718 ;;line 2635;;  AUDC1 = sfx_audc[temp1]

	LDX temp1
	LDA sfx_audc,x
	STA AUDC1
.L0719 ;;line 2636;;  AUDF1 = sfx_audf[temp1]

	LDX temp1
	LDA sfx_audf,x
	STA AUDF1
.L0720 ;;line 2637;;  AUDV1 = sfx_audv[temp1]

	LDX temp1
	LDA sfx_audv,x
	STA AUDV1
.L0721 ;;line 2638;;  if !room_flags{7} then return

	BIT room_flags
	BMI .skipL0721
.condpart255
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0721
.L0722 ;;line 2639;;  bot_drag_state = bot_drag_state  -  4

	LDA bot_drag_state
	SEC
	SBC #4
	STA bot_drag_state
.L0723 ;;line 2640;;  if temp1 = 1 then bot_drag_state = 3

	LDA temp1
	CMP #1
     BNE .skipL0723
.condpart256
	LDA #3
	STA bot_drag_state
.skipL0723
.L0724 ;;line 2641;;  if temp1 = 6 then bot_drag_state = 3

	LDA temp1
	CMP #6
     BNE .skipL0724
.condpart257
	LDA #3
	STA bot_drag_state
.skipL0724
.L0725 ;;line 2642;;  if temp1 = 11 then bot_drag_state = 3

	LDA temp1
	CMP #11
     BNE .skipL0725
.condpart258
	LDA #3
	STA bot_drag_state
.skipL0725
.L0726 ;;line 2643;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2644;; 

._bot_play_roar
 ;;line 2645;; _bot_play_roar

.L0727 ;;line 2646;;  if temp1{0} then AUDC1 = 8 else AUDC1 = 3

	LDA temp1
	LSR
	BCC .skipL0727
.condpart259
	LDA #8
	STA AUDC1
 jmp .skipelse6
.skipL0727
	LDA #3
	STA AUDC1
.skipelse6
.L0728 ;;line 2647;;  AUDF1 = $1F

	LDA #$1F
	STA AUDF1
.L0729 ;;line 2648;;  temp3 = temp1  /  2

	LDA temp1
	lsr
	STA temp3
.L0730 ;;line 2649;;  AUDV1 = 15  -  temp3

	LDA #15
	SEC
	SBC temp3
	STA AUDV1
.L0731 ;;line 2650;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2651;; 

.
 ;;line 2652;; 

.L0732 ;;line 2653;;  data win_freq

	JMP .skipL0732
win_freq
	.byte   15, 12, 10, 8, 15, 12, 10, 8

.skipL0732
.
 ;;line 2656;; 

.
 ;;line 2657;; 

.L0733 ;;line 2658;;  data sfx_audc

	JMP .skipL0733
sfx_audc
	.byte   0,  4, 4, 4, 4,  0,  4, 4, 4, 4,  0,  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4

.skipL0733
.
 ;;line 2661;; 

.
 ;;line 2662;; 

.L0734 ;;line 2663;;  data sfx_audf

	JMP .skipL0734
sfx_audf
	.byte   0,  15, 12, 9, 6,  0,  6, 9, 12, 15,  0,  $1E,$1D,$1C,$1B,$1A,$19,$18,$17,$16,$15,$14,$13,$12,$11,$10

.skipL0734
.
 ;;line 2666;; 

.L0735 ;;line 2667;;  data sfx_audv

	JMP .skipL0735
sfx_audv
	.byte   0,  8, 8, 8, 8,  0,  8, 8, 8, 8,  0,  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

.skipL0735
.
 ;;line 2670;; 

.set_sprite_pointers
 ;;line 2671;; set_sprite_pointers

.L0736 ;;line 2672;;  if temp3 = 255 then return

	LDA temp3
	CMP #255
     BNE .skipL0736
.condpart260
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0736
.
 ;;line 2673;; 

.L0737 ;;line 2674;;  on temp3 goto _select_dragon_pose _select_dragon_pose _select_dragon_pose _gfx_magnet _gfx_sword _gfx_chalice _gfx_bridge _gfx_key _gfx_key _gfx_key _check_bat_anim

	LDX temp3
	LDA .L0737jumptablehi,x
	PHA
	LDA .L0737jumptablelo,x
	PHA
	RTS
.L0737jumptablehi
	.byte >(._select_dragon_pose-1)
	.byte >(._select_dragon_pose-1)
	.byte >(._select_dragon_pose-1)
	.byte >(._gfx_magnet-1)
	.byte >(._gfx_sword-1)
	.byte >(._gfx_chalice-1)
	.byte >(._gfx_bridge-1)
	.byte >(._gfx_key-1)
	.byte >(._gfx_key-1)
	.byte >(._gfx_key-1)
	.byte >(._check_bat_anim-1)
.L0737jumptablelo
	.byte <(._select_dragon_pose-1)
	.byte <(._select_dragon_pose-1)
	.byte <(._select_dragon_pose-1)
	.byte <(._gfx_magnet-1)
	.byte <(._gfx_sword-1)
	.byte <(._gfx_chalice-1)
	.byte <(._gfx_bridge-1)
	.byte <(._gfx_key-1)
	.byte <(._gfx_key-1)
	.byte <(._gfx_key-1)
	.byte <(._check_bat_anim-1)
.
 ;;line 2675;; 

._check_bat_anim
 ;;line 2676;; _check_bat_anim

.L0738 ;;line 2677;;  if room_flags{6} then goto _gfx_bat

	BIT room_flags
	BVC .skipL0738
.condpart261
 jmp ._gfx_bat
.skipL0738
.L0739 ;;line 2678;;  goto _gfx_bat2

 jmp ._gfx_bat2
.
 ;;line 2679;; 

._select_dragon_pose
 ;;line 2680;; _select_dragon_pose

.
 ;;line 2681;; 

.L0740 ;;line 2682;;  temp2 = temp2  &  bit_mask_b3[temp3]

	LDA temp2
	LDX temp3
	AND bit_mask_b3,x
	STA temp2
.L0741 ;;line 2683;;  if temp2  <>  0 then goto _gfx_dragon_dead

	LDA temp2
	CMP #0
     BEQ .skipL0741
.condpart262
 jmp ._gfx_dragon_dead
.skipL0741
.
 ;;line 2684;; 

.L0742 ;;line 2685;;  if temp4{7} then goto _gfx_dragon

	BIT temp4
	BPL .skipL0742
.condpart263
 jmp ._gfx_dragon
.skipL0742
.
 ;;line 2686;; 

.L0743 ;;line 2687;;  temp2 = temp4  &  3

	LDA temp4
	AND #3
	STA temp2
.L0744 ;;line 2688;;  if temp2 = temp3 then goto _gfx_dragon_roar

	LDA temp2
	CMP temp3
     BNE .skipL0744
.condpart264
 jmp ._gfx_dragon_roar
.skipL0744
.L0745 ;;line 2689;;  goto _gfx_dragon

 jmp ._gfx_dragon
.
 ;;line 2690;; 

.L0746 ;;line 2691;;  data bit_mask_b3

	JMP .skipL0746
bit_mask_b3
	.byte  1, 2, 4

.skipL0746
.
 ;;line 2694;; 

._gfx_dragon
 ;;line 2695;; _gfx_dragon

.L0747 ;;line 2696;;  player1:

	LDX #<playerL0747_1
	STX player1pointerlo
	LDA #>playerL0747_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0748 ;;line 2723;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2724;; 

._gfx_dragon_roar
 ;;line 2725;; _gfx_dragon_roar

.L0749 ;;line 2726;;  player1:

	LDX #<playerL0749_1
	STX player1pointerlo
	LDA #>playerL0749_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0750 ;;line 2753;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2754;; 

._gfx_dragon_dead
 ;;line 2755;; _gfx_dragon_dead

.L0751 ;;line 2756;;  player1:

	LDX #<playerL0751_1
	STX player1pointerlo
	LDA #>playerL0751_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0752 ;;line 2783;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2784;; 

._gfx_magnet
 ;;line 2785;; _gfx_magnet

.L0753 ;;line 2786;;  player1:

	LDX #<playerL0753_1
	STX player1pointerlo
	LDA #>playerL0753_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0754 ;;line 2813;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2814;; 

._gfx_sword
 ;;line 2815;; _gfx_sword

.L0755 ;;line 2816;;  player1:

	LDX #<playerL0755_1
	STX player1pointerlo
	LDA #>playerL0755_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0756 ;;line 2843;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2844;; 

._gfx_chalice
 ;;line 2845;; _gfx_chalice

.L0757 ;;line 2846;;  player1:

	LDX #<playerL0757_1
	STX player1pointerlo
	LDA #>playerL0757_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0758 ;;line 2873;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2874;; 

._gfx_bridge
 ;;line 2875;; _gfx_bridge

.L0759 ;;line 2876;;  player1:

	LDX #<playerL0759_1
	STX player1pointerlo
	LDA #>playerL0759_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0760 ;;line 2903;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2904;; 

._gfx_key
 ;;line 2905;; _gfx_key

.L0761 ;;line 2906;;  player1:

	LDX #<playerL0761_1
	STX player1pointerlo
	LDA #>playerL0761_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0762 ;;line 2933;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2934;; 

._gfx_bat
 ;;line 2935;; _gfx_bat

.L0763 ;;line 2936;;  player1:

	LDX #<playerL0763_1
	STX player1pointerlo
	LDA #>playerL0763_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0764 ;;line 2963;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2964;; 

._gfx_bat2
 ;;line 2965;; _gfx_bat2

.L0765 ;;line 2966;;  player1:

	LDX #<playerL0765_1
	STX player1pointerlo
	LDA #>playerL0765_1
	STA player1pointerhi
	LDA #24
	STA player1height
.L0766 ;;line 2993;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 2994;; 

.
 ;;line 2995;; 

.check_gates
 ;;line 2996;; check_gates

.L0767 ;;line 2997;;  top_player0y = 255

	LDA #255
	STA top_player0y
.L0768 ;;line 2998;;  bottom_player0y = 255

	LDA #255
	STA bottom_player0y
.L0769 ;;line 2999;;  room_flags = room_flags  &  %11110011

	LDA room_flags
	AND #%11110011
	STA room_flags
.
 ;;line 3000;; 

.
 ;;line 3001;; 

.L0770 ;;line 3002;;  if bottom_room  >=  8 then if bottom_room  <=  11 then room_flags{3} = 1  :  goto _check_top_gates

	LDA bottom_room
	CMP #8
     BCC .skipL0770
.condpart265
	LDA #11
	CMP bottom_room
     BCC .skip265then
.condpart266
	LDA room_flags
	ORA #8
	STA room_flags
 jmp ._check_top_gates
.skip265then
.skipL0770
.L0771 ;;line 3003;;  if bottom_room  >=  25 then if bottom_room  <=  27 then room_flags{3} = 1  :  goto _check_top_gates

	LDA bottom_room
	CMP #25
     BCC .skipL0771
.condpart267
	LDA #27
	CMP bottom_room
     BCC .skip267then
.condpart268
	LDA room_flags
	ORA #8
	STA room_flags
 jmp ._check_top_gates
.skip267then
.skipL0771
.
 ;;line 3004;; 

.L0772 ;;line 3005;;  bottom_player0x = 71

	LDA #71
	STA bottom_player0x
.L0773 ;;line 3006;;  if bottom_room = ENTRY_YELLOW  &&  !gate_state{3} then bottom_player0y = 30

	LDA bottom_room
	CMP #ENTRY_YELLOW
     BNE .skipL0773
.condpart269
	LDA gate_state
	AND #8
	BNE .skip269then
.condpart270
	LDA #30
	STA bottom_player0y
.skip269then
.skipL0773
.L0774 ;;line 3007;;  if bottom_room = ENTRY_WHITE  &&  !gate_state{4} then bottom_player0y = 30

	LDA bottom_room
	CMP #ENTRY_WHITE
     BNE .skipL0774
.condpart271
	LDA gate_state
	AND #16
	BNE .skip271then
.condpart272
	LDA #30
	STA bottom_player0y
.skip271then
.skipL0774
.L0775 ;;line 3008;;  if bottom_room = ENTRY_BLACK  &&  !gate_state{5} then bottom_player0y = 30

	LDA bottom_room
	CMP #ENTRY_BLACK
     BNE .skipL0775
.condpart273
	LDA gate_state
	AND #32
	BNE .skip273then
.condpart274
	LDA #30
	STA bottom_player0y
.skip273then
.skipL0775
.
 ;;line 3009;; 

._check_top_gates
 ;;line 3010;; _check_top_gates

.
 ;;line 3011;; 

.L0776 ;;line 3012;;  if top_room  >=  8 then if top_room  <=  11 then room_flags{2} = 1  :  return otherbank

	LDA top_room
	CMP #8
     BCC .skipL0776
.condpart275
	LDA #11
	CMP top_room
     BCC .skip275then
.condpart276
	LDA room_flags
	ORA #4
	STA room_flags
	JMP BS_return
.skip275then
.skipL0776
.L0777 ;;line 3013;;  if top_room  >=  25 then if top_room  <=  27 then room_flags{2} = 1  :  return otherbank

	LDA top_room
	CMP #25
     BCC .skipL0777
.condpart277
	LDA #27
	CMP top_room
     BCC .skip277then
.condpart278
	LDA room_flags
	ORA #4
	STA room_flags
	JMP BS_return
.skip277then
.skipL0777
.
 ;;line 3014;; 

.L0778 ;;line 3015;;  top_player0x = 71

	LDA #71
	STA top_player0x
.L0779 ;;line 3016;;  if top_room = ENTRY_YELLOW  &&  !gate_state{0} then top_player0y = 31

	LDA top_room
	CMP #ENTRY_YELLOW
     BNE .skipL0779
.condpart279
	LDA gate_state
	LSR
	BCS .skip279then
.condpart280
	LDA #31
	STA top_player0y
.skip279then
.skipL0779
.L0780 ;;line 3017;;  if top_room = ENTRY_WHITE  &&  !gate_state{1} then top_player0y = 31

	LDA top_room
	CMP #ENTRY_WHITE
     BNE .skipL0780
.condpart281
	LDA gate_state
	AND #2
	BNE .skip281then
.condpart282
	LDA #31
	STA top_player0y
.skip281then
.skipL0780
.L0781 ;;line 3018;;  if top_room = ENTRY_BLACK  &&  !gate_state{2} then top_player0y = 31

	LDA top_room
	CMP #ENTRY_BLACK
     BNE .skipL0781
.condpart283
	LDA gate_state
	AND #4
	BNE .skip283then
.condpart284
	LDA #31
	STA top_player0y
.skip283then
.skipL0781
.L0782 ;;line 3019;;  return otherbank

	JMP BS_return
.
 ;;line 3020;; 

.
 ;;line 3021;; 

.
 ;;line 3022;; 

.
 ;;line 3023;; 

.
 ;;line 3024;; 

.
 ;;line 3025;; 

.
 ;;line 3026;; 

.
 ;;line 3027;; 

.
 ;;line 3028;; 

.
 ;;line 3029;; 

.
 ;;line 3030;; 

.
 ;;line 3031;; 

.
 ;;line 3032;; 

.
 ;;line 3033;; 

.
 ;;line 3034;; 

.
 ;;line 3035;; 

.
 ;;line 3036;; 

.
 ;;line 3037;; 

.
 ;;line 3038;; 

.
 ;;line 3039;; 

.
 ;;line 3040;; 

.
 ;;line 3041;; 

.
 ;;line 3042;; 

.
 ;;line 3043;; 

.
 ;;line 3044;; 

.
 ;;line 3045;; 

.
 ;;line 3046;; 

.
 ;;line 3047;; 

.
 ;;line 3048;; 

._gfx_gate
 ;;line 3049;; _gfx_gate

.L0783 ;;line 3050;;  player0:

	LDX #<playerL0783_0
	STX player0pointerlo
	LDA #>playerL0783_0
	STA player0pointerhi
	LDA #15
	STA player0height
.L0784 ;;line 3068;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 3069;; 

._gfx_torch
 ;;line 3070;; _gfx_torch

.L0785 ;;line 3071;;  player0:

	LDX #<playerL0785_0
	STX player0pointerlo
	LDA #>playerL0785_0
	STA player0pointerhi
	LDA #15
	STA player0height
.L0786 ;;line 3089;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 3090;; 

.L0787 ;;line 3091;;  bank 4

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
.
 ;;line 3092;; 

.
 ;;line 3093;; 

.
 ;;line 3094;; 

.
 ;;line 3095;; 

.
 ;;line 3096;; 

.
 ;;line 3097;; 

.L0788 ;;line 3098;;  vblank

vblank_bB_code
.L0789 ;;line 3099;;  if bally = 255 then return

	LDA bally
	CMP #255
     BNE .skipL0789
.condpart285
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0789
.L0790 ;;line 3100;;  gosub apply_graphics bank3

 sta temp7
 lda #>(ret_point27-1)
 pha
 lda #<(ret_point27-1)
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
ret_point27
.
 ;;line 3101;; 

.
 ;;line 3102;; 

.L0791 ;;line 3103;;  asm

   ldx top_carried_item

   bmi .skip_top_carry

   lda top_room

   sta w_top_obj_room,x

   

   

   lda ballx

   clc

   adc r_top_carry_off_x

   cmp #200       

   bcs .t_chk_x_min

   cmp #16

   bcc .t_chk_x_min

   cmp #138

   bcc .t_sav_x

   lda #137

   .byte $2C      

.t_chk_x_min

   lda #16

.t_sav_x

   sta top_obj_x,x

   

   

   lda bally

   clc

   adc r_top_carry_off_y

   bmi .t_chk_y_min 

   cmp #1

   bcc .t_chk_y_min

   cmp #54

   bcc .t_sav_y

   lda #53

   .byte $2C

.t_chk_y_min

   lda #1

.t_sav_y

   sta top_obj_y,x

.skip_top_carry



   ldx bot_carried_item

   bmi .skip_bot_carry

   lda bottom_room

   sta w_bot_obj_room,x

   

   

   lda p2_ballx

   clc

   adc r_bot_carry_off_x

   cmp #200       

   bcs .b_chk_x_min

   cmp #16

   bcc .b_chk_x_min

   cmp #138

   bcc .b_sav_x

   lda #137

   .byte $2C

.b_chk_x_min

   lda #16

.b_sav_x

   sta bot_obj_x,x

   

   

   lda p2_bally

   clc

   adc r_bot_carry_off_y

   bmi .b_chk_y_min 

   cmp #1

   bcc .b_chk_y_min

   cmp #54

   bcc .b_sav_y

   lda #53

   .byte $2C

.b_chk_y_min

   lda #1

.b_sav_y

   sta bot_obj_y,x

.skip_bot_carry

.
 ;;line 3182;; 

.L0792 ;;line 3183;;  if r005 = 1  ||  r016 = 1 then return

	LDA r005
	CMP #1
     BNE .skipL0792
.condpart286
 jmp .condpart287
.skipL0792
	LDA r016
	CMP #1
     BNE .skip30OR
.condpart287
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skip30OR
.L0793 ;;line 3184;;  asm

   lda gate_state

   cmp #$40

   bcc .skip_bat_g1

.L0794 ;;line 3189;;  if !room_flags{7} then room_flags =  ( room_flags  +  $10 )   &  $7F  :  goto update_top_bat

	BIT room_flags
	BMI .skipL0794
.condpart288
; complex statement detected
	LDA room_flags
	CLC
	ADC #$10
	AND #$7F
	STA room_flags
 jmp .update_top_bat
.skipL0794
.L0795 ;;line 3190;;  goto update_bot_bat

 jmp .update_bot_bat
.L0796 ;;line 3191;;  asm

.skip_bat_g1

.L0797 ;;line 3194;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 3195;; 

.
 ;;line 3196;; 

.
 ;;line 3197;; 

.
 ;;line 3198;; 

.
 ;;line 3199;; 

.update_top_bat
 ;;line 3200;; update_top_bat

.L0798 ;;line 3201;;  temp6 = r_top_obj_room[10]

	LDX #10
	LDA r_top_obj_room,x
	STA temp6
.L0799 ;;line 3202;;  temp4 = top_obj_x[10]  :  temp5 = top_obj_y[10]

	LDX #10
	LDA top_obj_x,x
	STA temp4
	LDX #10
	LDA top_obj_y,x
	STA temp5
.L0800 ;;line 3203;;  temp2 = top_bat_state  &  15

	LDA top_bat_state
	AND #15
	STA temp2
.L0801 ;;line 3204;;  temp1 = top_bat_state  /  16

	LDA top_bat_state
	lsr
	lsr
	lsr
	lsr
	STA temp1
.
 ;;line 3205;; 

.
 ;;line 3206;; 

.L0802 ;;line 3207;;  if top_carried_item = 10 then temp6 = top_room  :  w_top_obj_room[10] = temp6  :  goto _top_bat_sync_item

	LDA top_carried_item
	CMP #10
     BNE .skipL0802
.condpart289
	LDA top_room
	STA temp6
	LDA temp6
	LDX #10
	STA w_top_obj_room,x
 jmp ._top_bat_sync_item
.skipL0802
.
 ;;line 3208;; 

.
 ;;line 3209;; 

.L0803 ;;line 3210;;  temp3 = bat_fedup  &  15

	LDA bat_fedup
	AND #15
	STA temp3
.L0804 ;;line 3211;;  if temp3 = 0 then goto _top_bat_seek

	LDA temp3
	CMP #0
     BNE .skipL0804
.condpart290
 jmp ._top_bat_seek
.skipL0804
.L0805 ;;line 3212;;  if rand  <  64 then temp3 = temp3  -  1  :  bat_fedup =  ( bat_fedup  &  $F0 )   |  temp3

	LDA rand
	CMP #64
     BCS .skipL0805
.condpart291
	DEC temp3
; complex statement detected
	LDA bat_fedup
	AND #$F0
	ORA temp3
	STA bat_fedup
.skipL0805
.L0806 ;;line 3213;;  goto _top_bat_wander

 jmp ._top_bat_wander
.
 ;;line 3214;; 

._top_bat_seek
 ;;line 3215;; _top_bat_seek

.L0807 ;;line 3216;;  asm

   ldx #9

.bat_scan_top

   cpx temp2

   beq .bat_next_top

   lda r_top_obj_room,x

   cmp temp6

   beq .bat_found_top

.bat_next_top

   dex

   bpl .bat_scan_top

   ldx #255

.bat_found_top

   stx temp3

.L0808 ;;line 3231;;  if temp3 = 255 then goto _top_bat_wander

	LDA temp3
	CMP #255
     BNE .skipL0808
.condpart292
 jmp ._top_bat_wander
.skipL0808
.
 ;;line 3232;; 

.
 ;;line 3233;; 

.L0809 ;;line 3234;;  temp7 = top_obj_x[temp3]

	LDX temp3
	LDA top_obj_x,x
	STA temp7
.L0810 ;;line 3235;;  if temp4  <  temp7 then temp4 = temp4  +  1

	LDA temp4
	CMP temp7
     BCS .skipL0810
.condpart293
	INC temp4
.skipL0810
.L0811 ;;line 3236;;  if temp4  >  temp7 then temp4 = temp4  -  1

	LDA temp7
	CMP temp4
     BCS .skipL0811
.condpart294
	DEC temp4
.skipL0811
.L0812 ;;line 3237;;  temp7 = top_obj_y[temp3]

	LDX temp3
	LDA top_obj_y,x
	STA temp7
.L0813 ;;line 3238;;  if temp5  <  temp7 then temp5 = temp5  +  1

	LDA temp5
	CMP temp7
     BCS .skipL0813
.condpart295
	INC temp5
.skipL0813
.L0814 ;;line 3239;;  if temp5  >  temp7 then temp5 = temp5  -  1

	LDA temp7
	CMP temp5
     BCS .skipL0814
.condpart296
	DEC temp5
.skipL0814
.
 ;;line 3240;; 

.
 ;;line 3241;; 

.L0815 ;;line 3242;;  temp7 = top_obj_x[temp3]  -  temp4  +  6

; complex statement detected
	LDX temp3
	LDA top_obj_x,x
	SEC
	SBC temp4
	CLC
	ADC #6
	STA temp7
.L0816 ;;line 3243;;  if temp7  >  12 then goto _top_bat_bounds

	LDA #12
	CMP temp7
     BCS .skipL0816
.condpart297
 jmp ._top_bat_bounds
.skipL0816
.L0817 ;;line 3244;;  temp7 = top_obj_y[temp3]  -  temp5  +  6

; complex statement detected
	LDX temp3
	LDA top_obj_y,x
	SEC
	SBC temp5
	CLC
	ADC #6
	STA temp7
.L0818 ;;line 3245;;  if temp7  >  12 then goto _top_bat_bounds

	LDA #12
	CMP temp7
     BCS .skipL0818
.condpart298
 jmp ._top_bat_bounds
.skipL0818
.
 ;;line 3246;; 

.
 ;;line 3247;; 

.L0819 ;;line 3248;;  temp2 = temp3

	LDA temp3
	STA temp2
.L0820 ;;line 3249;;  if top_carried_item = temp2 then top_carried_item = 255

	LDA top_carried_item
	CMP temp2
     BNE .skipL0820
.condpart299
	LDA #255
	STA top_carried_item
.skipL0820
.L0821 ;;line 3250;;  if temp6 = top_room  &&  top_drag_state = 3 then top_drag_state = 39

	LDA temp6
	CMP top_room
     BNE .skipL0821
.condpart300
	LDA top_drag_state
	CMP #3
     BNE .skip300then
.condpart301
	LDA #39
	STA top_drag_state
.skip300then
.skipL0821
.L0822 ;;line 3251;;  bat_fedup =  ( bat_fedup  &  $F0 )   |  12

; complex statement detected
	LDA bat_fedup
	AND #$F0
	ORA #12
	STA bat_fedup
.L0823 ;;line 3252;;  temp1 = rand  &  7

 jsr randomize
	AND #7
	STA temp1
.L0824 ;;line 3253;;  goto _top_bat_bounds

 jmp ._top_bat_bounds
.
 ;;line 3254;; 

._top_bat_wander
 ;;line 3255;; _top_bat_wander

.L0825 ;;line 3256;;  if rand  <  8 then temp1 = rand  &  7

	LDA rand
	CMP #8
     BCS .skipL0825
.condpart302
 jsr randomize
	AND #7
	STA temp1
.skipL0825
.L0826 ;;line 3257;;  temp4 = temp4  +  bat_dx[temp1]

	LDA temp4
	LDX temp1
	CLC
	ADC bat_dx,x
	STA temp4
.L0827 ;;line 3258;;  temp5 = temp5  +  bat_dy[temp1]

	LDA temp5
	LDX temp1
	CLC
	ADC bat_dy,x
	STA temp5
.
 ;;line 3259;; 

._top_bat_bounds
 ;;line 3260;; _top_bat_bounds

.L0828 ;;line 3261;;  if temp5  >=  3 then goto _top_bat_chk_s

	LDA temp5
	CMP #3
     BCC .skipL0828
.condpart303
 jmp ._top_bat_chk_s
.skipL0828
.L0829 ;;line 3262;;  temp3 = bat_move_north[temp6]

	LDX temp6
	LDA bat_move_north,x
	STA temp3
.L0830 ;;line 3263;;  if temp3 = 0 then temp5 = 4  :  temp1 = 4  :  goto _top_bat_chk_w

	LDA temp3
	CMP #0
     BNE .skipL0830
.condpart304
	LDA #4
	STA temp5
	STA temp1
 jmp ._top_bat_chk_w
.skipL0830
.L0831 ;;line 3264;;  temp5 = 44  :  temp6 = temp3

	LDA #44
	STA temp5
	LDA temp3
	STA temp6
._top_bat_chk_s
 ;;line 3265;; _top_bat_chk_s

.L0832 ;;line 3266;;  if temp5  <=  44 then goto _top_bat_chk_w

	LDA #44
	CMP temp5
     BCC .skipL0832
.condpart305
 jmp ._top_bat_chk_w
.skipL0832
.L0833 ;;line 3267;;  temp3 = bat_move_south[temp6]

	LDX temp6
	LDA bat_move_south,x
	STA temp3
.L0834 ;;line 3268;;  if temp3 = 0 then temp5 = 43  :  temp1 = 0  :  goto _top_bat_chk_w

	LDA temp3
	CMP #0
     BNE .skipL0834
.condpart306
	LDA #43
	STA temp5
	LDA #0
	STA temp1
 jmp ._top_bat_chk_w
.skipL0834
.L0835 ;;line 3269;;  temp5 = 3  :  temp6 = temp3

	LDA #3
	STA temp5
	LDA temp3
	STA temp6
._top_bat_chk_w
 ;;line 3270;; _top_bat_chk_w

.L0836 ;;line 3271;;  if temp4  >=  17 then goto _top_bat_chk_e

	LDA temp4
	CMP #17
     BCC .skipL0836
.condpart307
 jmp ._top_bat_chk_e
.skipL0836
.L0837 ;;line 3272;;  temp3 = bat_move_west[temp6]

	LDX temp6
	LDA bat_move_west,x
	STA temp3
.L0838 ;;line 3273;;  if temp3 = 0 then temp4 = 18  :  temp1 = 2  :  goto _top_bat_save

	LDA temp3
	CMP #0
     BNE .skipL0838
.condpart308
	LDA #18
	STA temp4
	LDA #2
	STA temp1
 jmp ._top_bat_save
.skipL0838
.L0839 ;;line 3274;;  temp4 = 139  :  temp6 = temp3

	LDA #139
	STA temp4
	LDA temp3
	STA temp6
._top_bat_chk_e
 ;;line 3275;; _top_bat_chk_e

.L0840 ;;line 3276;;  if temp4  <=  139 then goto _top_bat_save

	LDA #139
	CMP temp4
     BCC .skipL0840
.condpart309
 jmp ._top_bat_save
.skipL0840
.L0841 ;;line 3277;;  temp3 = bat_move_east[temp6]

	LDX temp6
	LDA bat_move_east,x
	STA temp3
.L0842 ;;line 3278;;  if temp3 = 0 then temp4 = 138  :  temp1 = 6  :  goto _top_bat_save

	LDA temp3
	CMP #0
     BNE .skipL0842
.condpart310
	LDA #138
	STA temp4
	LDA #6
	STA temp1
 jmp ._top_bat_save
.skipL0842
.L0843 ;;line 3279;;  temp4 = 17  :  temp6 = temp3

	LDA #17
	STA temp4
	LDA temp3
	STA temp6
.
 ;;line 3280;; 

._top_bat_save
 ;;line 3281;; _top_bat_save

.L0844 ;;line 3282;;  w_top_obj_room[10] = temp6  :  top_obj_x[10] = temp4  :  top_obj_y[10] = temp5

	LDA temp6
	LDX #10
	STA w_top_obj_room,x
	LDA temp4
	LDX #10
	STA top_obj_x,x
	LDA temp5
	LDX #10
	STA top_obj_y,x
.L0845 ;;line 3283;;  asm

   lda temp1

   asl

   asl

   asl

   asl

   ora temp2

   sta top_bat_state

.
 ;;line 3292;; 

._top_bat_sync_item
 ;;line 3293;; _top_bat_sync_item

.L0846 ;;line 3294;;  if temp2  >  9 then return

	LDA #9
	CMP temp2
     BCS .skipL0846
.condpart311
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0846
.L0847 ;;line 3295;;  w_top_obj_room[temp2] = temp6

	LDA temp6
	LDX temp2
	STA w_top_obj_room,x
.L0848 ;;line 3296;;  top_obj_x[temp2] = temp4  +  8

	LDA temp4
	CLC
	ADC #8
	LDX temp2
	STA top_obj_x,x
.L0849 ;;line 3297;;  if temp2  <  3 then top_obj_y[temp2] = temp5  +  12  :  return

	LDA temp2
	CMP #3
     BCS .skipL0849
.condpart312
	LDA temp5
	CLC
	ADC #12
	LDX temp2
	STA top_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0849
.L0850 ;;line 3298;;  top_obj_y[temp2] = temp5  +  2

	LDA temp5
	CLC
	ADC #2
	LDX temp2
	STA top_obj_y,x
.L0851 ;;line 3299;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 3300;; 

.update_bot_bat
 ;;line 3301;; update_bot_bat

.L0852 ;;line 3302;;  temp6 = r_bot_obj_room[10]

	LDX #10
	LDA r_bot_obj_room,x
	STA temp6
.L0853 ;;line 3303;;  temp4 = bot_obj_x[10]  :  temp5 = bot_obj_y[10]

	LDX #10
	LDA bot_obj_x,x
	STA temp4
	LDX #10
	LDA bot_obj_y,x
	STA temp5
.L0854 ;;line 3304;;  temp2 = bot_bat_state  &  15

	LDA bot_bat_state
	AND #15
	STA temp2
.L0855 ;;line 3305;;  temp1 = bot_bat_state  /  16

	LDA bot_bat_state
	lsr
	lsr
	lsr
	lsr
	STA temp1
.
 ;;line 3306;; 

.
 ;;line 3307;; 

.L0856 ;;line 3308;;  if bot_carried_item = 10 then temp6 = bottom_room  :  w_bot_obj_room[10] = temp6  :  goto _bot_bat_sync_item

	LDA bot_carried_item
	CMP #10
     BNE .skipL0856
.condpart313
	LDA bottom_room
	STA temp6
	LDA temp6
	LDX #10
	STA w_bot_obj_room,x
 jmp ._bot_bat_sync_item
.skipL0856
.
 ;;line 3309;; 

.
 ;;line 3310;; 

.L0857 ;;line 3311;;  temp3 = bat_fedup  &  $F0

	LDA bat_fedup
	AND #$F0
	STA temp3
.L0858 ;;line 3312;;  if temp3 = 0 then goto _bot_bat_seek

	LDA temp3
	CMP #0
     BNE .skipL0858
.condpart314
 jmp ._bot_bat_seek
.skipL0858
.L0859 ;;line 3313;;  if rand  <  64 then bat_fedup = bat_fedup  -  16

	LDA rand
	CMP #64
     BCS .skipL0859
.condpart315
	LDA bat_fedup
	SEC
	SBC #16
	STA bat_fedup
.skipL0859
.L0860 ;;line 3314;;  goto _bot_bat_wander

 jmp ._bot_bat_wander
.
 ;;line 3315;; 

._bot_bat_seek
 ;;line 3316;; _bot_bat_seek

.L0861 ;;line 3317;;  asm

   ldx #9

.bat_scan_bot

   cpx temp2

   beq .bat_next_bot

   lda r_bot_obj_room,x

   cmp temp6

   beq .bat_found_bot

.bat_next_bot

   dex

   bpl .bat_scan_bot

   ldx #255

.bat_found_bot

   stx temp3

.L0862 ;;line 3332;;  if temp3 = 255 then goto _bot_bat_wander

	LDA temp3
	CMP #255
     BNE .skipL0862
.condpart316
 jmp ._bot_bat_wander
.skipL0862
.
 ;;line 3333;; 

.
 ;;line 3334;; 

.L0863 ;;line 3335;;  temp7 = bot_obj_x[temp3]

	LDX temp3
	LDA bot_obj_x,x
	STA temp7
.L0864 ;;line 3336;;  if temp4  <  temp7 then temp4 = temp4  +  1

	LDA temp4
	CMP temp7
     BCS .skipL0864
.condpart317
	INC temp4
.skipL0864
.L0865 ;;line 3337;;  if temp4  >  temp7 then temp4 = temp4  -  1

	LDA temp7
	CMP temp4
     BCS .skipL0865
.condpart318
	DEC temp4
.skipL0865
.L0866 ;;line 3338;;  temp7 = bot_obj_y[temp3]

	LDX temp3
	LDA bot_obj_y,x
	STA temp7
.L0867 ;;line 3339;;  if temp5  <  temp7 then temp5 = temp5  +  1

	LDA temp5
	CMP temp7
     BCS .skipL0867
.condpart319
	INC temp5
.skipL0867
.L0868 ;;line 3340;;  if temp5  >  temp7 then temp5 = temp5  -  1

	LDA temp7
	CMP temp5
     BCS .skipL0868
.condpart320
	DEC temp5
.skipL0868
.
 ;;line 3341;; 

.
 ;;line 3342;; 

.L0869 ;;line 3343;;  temp7 = bot_obj_x[temp3]  -  temp4  +  6

; complex statement detected
	LDX temp3
	LDA bot_obj_x,x
	SEC
	SBC temp4
	CLC
	ADC #6
	STA temp7
.L0870 ;;line 3344;;  if temp7  >  12 then goto _bot_bat_bounds

	LDA #12
	CMP temp7
     BCS .skipL0870
.condpart321
 jmp ._bot_bat_bounds
.skipL0870
.L0871 ;;line 3345;;  temp7 = bot_obj_y[temp3]  -  temp5  +  6

; complex statement detected
	LDX temp3
	LDA bot_obj_y,x
	SEC
	SBC temp5
	CLC
	ADC #6
	STA temp7
.L0872 ;;line 3346;;  if temp7  >  12 then goto _bot_bat_bounds

	LDA #12
	CMP temp7
     BCS .skipL0872
.condpart322
 jmp ._bot_bat_bounds
.skipL0872
.
 ;;line 3347;; 

.
 ;;line 3348;; 

.L0873 ;;line 3349;;  temp2 = temp3

	LDA temp3
	STA temp2
.L0874 ;;line 3350;;  if bot_carried_item = temp2 then bot_carried_item = 255

	LDA bot_carried_item
	CMP temp2
     BNE .skipL0874
.condpart323
	LDA #255
	STA bot_carried_item
.skipL0874
.L0875 ;;line 3351;;  if temp6 = bottom_room  &&  bot_drag_state = 3 then bot_drag_state = 39

	LDA temp6
	CMP bottom_room
     BNE .skipL0875
.condpart324
	LDA bot_drag_state
	CMP #3
     BNE .skip324then
.condpart325
	LDA #39
	STA bot_drag_state
.skip324then
.skipL0875
.L0876 ;;line 3352;;  bat_fedup =  ( bat_fedup  &  $0F )   |  $C0

; complex statement detected
	LDA bat_fedup
	AND #$0F
	ORA #$C0
	STA bat_fedup
.L0877 ;;line 3353;;  temp1 = rand  &  7

 jsr randomize
	AND #7
	STA temp1
.L0878 ;;line 3354;;  goto _bot_bat_bounds

 jmp ._bot_bat_bounds
.
 ;;line 3355;; 

._bot_bat_wander
 ;;line 3356;; _bot_bat_wander

.L0879 ;;line 3357;;  if rand  <  8 then temp1 = rand  &  7

	LDA rand
	CMP #8
     BCS .skipL0879
.condpart326
 jsr randomize
	AND #7
	STA temp1
.skipL0879
.L0880 ;;line 3358;;  temp4 = temp4  +  bat_dx[temp1]

	LDA temp4
	LDX temp1
	CLC
	ADC bat_dx,x
	STA temp4
.L0881 ;;line 3359;;  temp5 = temp5  +  bat_dy[temp1]

	LDA temp5
	LDX temp1
	CLC
	ADC bat_dy,x
	STA temp5
.
 ;;line 3360;; 

._bot_bat_bounds
 ;;line 3361;; _bot_bat_bounds

.L0882 ;;line 3362;;  if temp5  >=  3 then goto _bot_bat_chk_s

	LDA temp5
	CMP #3
     BCC .skipL0882
.condpart327
 jmp ._bot_bat_chk_s
.skipL0882
.L0883 ;;line 3363;;  temp3 = bat_move_north[temp6]

	LDX temp6
	LDA bat_move_north,x
	STA temp3
.L0884 ;;line 3364;;  if temp3 = 0 then temp5 = 4  :  temp1 = 4  :  goto _bot_bat_chk_w

	LDA temp3
	CMP #0
     BNE .skipL0884
.condpart328
	LDA #4
	STA temp5
	STA temp1
 jmp ._bot_bat_chk_w
.skipL0884
.L0885 ;;line 3365;;  temp5 = 45  :  temp6 = temp3

	LDA #45
	STA temp5
	LDA temp3
	STA temp6
._bot_bat_chk_s
 ;;line 3366;; _bot_bat_chk_s

.L0886 ;;line 3367;;  if temp5  <=  45 then goto _bot_bat_chk_w

	LDA #45
	CMP temp5
     BCC .skipL0886
.condpart329
 jmp ._bot_bat_chk_w
.skipL0886
.L0887 ;;line 3368;;  temp3 = bat_move_south[temp6]

	LDX temp6
	LDA bat_move_south,x
	STA temp3
.L0888 ;;line 3369;;  if temp3 = 0 then temp5 = 44  :  temp1 = 0  :  goto _bot_bat_chk_w

	LDA temp3
	CMP #0
     BNE .skipL0888
.condpart330
	LDA #44
	STA temp5
	LDA #0
	STA temp1
 jmp ._bot_bat_chk_w
.skipL0888
.L0889 ;;line 3370;;  temp5 = 3  :  temp6 = temp3

	LDA #3
	STA temp5
	LDA temp3
	STA temp6
._bot_bat_chk_w
 ;;line 3371;; _bot_bat_chk_w

.L0890 ;;line 3372;;  if temp4  >=  17 then goto _bot_bat_chk_e

	LDA temp4
	CMP #17
     BCC .skipL0890
.condpart331
 jmp ._bot_bat_chk_e
.skipL0890
.L0891 ;;line 3373;;  temp3 = bat_move_west[temp6]

	LDX temp6
	LDA bat_move_west,x
	STA temp3
.L0892 ;;line 3374;;  if temp3 = 0 then temp4 = 18  :  temp1 = 2  :  goto _bot_bat_save

	LDA temp3
	CMP #0
     BNE .skipL0892
.condpart332
	LDA #18
	STA temp4
	LDA #2
	STA temp1
 jmp ._bot_bat_save
.skipL0892
.L0893 ;;line 3375;;  temp4 = 139  :  temp6 = temp3

	LDA #139
	STA temp4
	LDA temp3
	STA temp6
._bot_bat_chk_e
 ;;line 3376;; _bot_bat_chk_e

.L0894 ;;line 3377;;  if temp4  <=  139 then goto _bot_bat_save

	LDA #139
	CMP temp4
     BCC .skipL0894
.condpart333
 jmp ._bot_bat_save
.skipL0894
.L0895 ;;line 3378;;  temp3 = bat_move_east[temp6]

	LDX temp6
	LDA bat_move_east,x
	STA temp3
.L0896 ;;line 3379;;  if temp3 = 0 then temp4 = 138  :  temp1 = 6  :  goto _bot_bat_save

	LDA temp3
	CMP #0
     BNE .skipL0896
.condpart334
	LDA #138
	STA temp4
	LDA #6
	STA temp1
 jmp ._bot_bat_save
.skipL0896
.L0897 ;;line 3380;;  temp4 = 17  :  temp6 = temp3

	LDA #17
	STA temp4
	LDA temp3
	STA temp6
.
 ;;line 3381;; 

._bot_bat_save
 ;;line 3382;; _bot_bat_save

.L0898 ;;line 3383;;  w_bot_obj_room[10] = temp6  :  bot_obj_x[10] = temp4  :  bot_obj_y[10] = temp5

	LDA temp6
	LDX #10
	STA w_bot_obj_room,x
	LDA temp4
	LDX #10
	STA bot_obj_x,x
	LDA temp5
	LDX #10
	STA bot_obj_y,x
.L0899 ;;line 3384;;  asm

   lda temp1

   asl

   asl

   asl

   asl

   ora temp2

   sta bot_bat_state

.
 ;;line 3393;; 

._bot_bat_sync_item
 ;;line 3394;; _bot_bat_sync_item

.L0900 ;;line 3395;;  if temp2  >  9 then return

	LDA #9
	CMP temp2
     BCS .skipL0900
.condpart335
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0900
.L0901 ;;line 3396;;  w_bot_obj_room[temp2] = temp6

	LDA temp6
	LDX temp2
	STA w_bot_obj_room,x
.L0902 ;;line 3397;;  bot_obj_x[temp2] = temp4  +  8

	LDA temp4
	CLC
	ADC #8
	LDX temp2
	STA bot_obj_x,x
.L0903 ;;line 3398;;  if temp2  <  3 then bot_obj_y[temp2] = temp5  +  12  :  return

	LDA temp2
	CMP #3
     BCS .skipL0903
.condpart336
	LDA temp5
	CLC
	ADC #12
	LDX temp2
	STA bot_obj_y,x
	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.skipL0903
.L0904 ;;line 3399;;  bot_obj_y[temp2] = temp5  +  2

	LDA temp5
	CLC
	ADC #2
	LDX temp2
	STA bot_obj_y,x
.L0905 ;;line 3400;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 3401;; 

.
 ;;line 3402;; 

.
 ;;line 3403;; 

.
 ;;line 3404;; 

.gate_collide_top
 ;;line 3405;; gate_collide_top

.L0906 ;;line 3406;;  temp1 = top_carried_item

	LDA top_carried_item
	STA temp1
.L0907 ;;line 3407;;  if top_room = ENTRY_YELLOW  &&  temp1 = 7 then gate_state{0} = 1  :  goto _unlock_top_gate

	LDA top_room
	CMP #ENTRY_YELLOW
     BNE .skipL0907
.condpart337
	LDA temp1
	CMP #7
     BNE .skip337then
.condpart338
	LDA gate_state
	ORA #1
	STA gate_state
 jmp ._unlock_top_gate
.skip337then
.skipL0907
.L0908 ;;line 3408;;  if top_room = ENTRY_WHITE  &&  temp1 = 8 then gate_state{1} = 1  :  goto _unlock_top_gate

	LDA top_room
	CMP #ENTRY_WHITE
     BNE .skipL0908
.condpart339
	LDA temp1
	CMP #8
     BNE .skip339then
.condpart340
	LDA gate_state
	ORA #2
	STA gate_state
 jmp ._unlock_top_gate
.skip339then
.skipL0908
.L0909 ;;line 3409;;  if top_room = ENTRY_BLACK  &&  temp1 = 9 then gate_state{2} = 1  :  goto _unlock_top_gate

	LDA top_room
	CMP #ENTRY_BLACK
     BNE .skipL0909
.condpart341
	LDA temp1
	CMP #9
     BNE .skip341then
.condpart342
	LDA gate_state
	ORA #4
	STA gate_state
 jmp ._unlock_top_gate
.skip341then
.skipL0909
.L0910 ;;line 3410;;  ballx = r_top_oldx  :  bally = r_top_oldy

	LDA r_top_oldx
	STA ballx
	LDA r_top_oldy
	STA bally
.L0911 ;;line 3411;;  temp5 = 1

	LDA #1
	STA temp5
.L0912 ;;line 3412;;  return otherbank

	JMP BS_return
._unlock_top_gate
 ;;line 3413;; _unlock_top_gate

.L0913 ;;line 3414;;  if top_drag_state = 3 then top_drag_state = 39

	LDA top_drag_state
	CMP #3
     BNE .skipL0913
.condpart343
	LDA #39
	STA top_drag_state
.skipL0913
.L0914 ;;line 3415;;  top_player0y = 255  :  return otherbank

	LDA #255
	STA top_player0y
	JMP BS_return
.
 ;;line 3416;; 

.gate_collide_bot
 ;;line 3417;; gate_collide_bot

.L0915 ;;line 3418;;  temp1 = bot_carried_item

	LDA bot_carried_item
	STA temp1
.L0916 ;;line 3419;;  if bottom_room = ENTRY_YELLOW  &&  temp1 = 7 then gate_state{3} = 1  :  goto _unlock_bot_gate

	LDA bottom_room
	CMP #ENTRY_YELLOW
     BNE .skipL0916
.condpart344
	LDA temp1
	CMP #7
     BNE .skip344then
.condpart345
	LDA gate_state
	ORA #8
	STA gate_state
 jmp ._unlock_bot_gate
.skip344then
.skipL0916
.L0917 ;;line 3420;;  if bottom_room = ENTRY_WHITE  &&  temp1 = 8 then gate_state{4} = 1  :  goto _unlock_bot_gate

	LDA bottom_room
	CMP #ENTRY_WHITE
     BNE .skipL0917
.condpart346
	LDA temp1
	CMP #8
     BNE .skip346then
.condpart347
	LDA gate_state
	ORA #16
	STA gate_state
 jmp ._unlock_bot_gate
.skip346then
.skipL0917
.L0918 ;;line 3421;;  if bottom_room = ENTRY_BLACK  &&  temp1 = 9 then gate_state{5} = 1  :  goto _unlock_bot_gate

	LDA bottom_room
	CMP #ENTRY_BLACK
     BNE .skipL0918
.condpart348
	LDA temp1
	CMP #9
     BNE .skip348then
.condpart349
	LDA gate_state
	ORA #32
	STA gate_state
 jmp ._unlock_bot_gate
.skip348then
.skipL0918
.L0919 ;;line 3422;;  p2_ballx = r_bottom_oldx  :  p2_bally = r_bottom_oldy

	LDA r_bottom_oldx
	STA p2_ballx
	LDA r_bottom_oldy
	STA p2_bally
.L0920 ;;line 3423;;  temp6 = 1

	LDA #1
	STA temp6
.L0921 ;;line 3424;;  return otherbank

	JMP BS_return
._unlock_bot_gate
 ;;line 3425;; _unlock_bot_gate

.L0922 ;;line 3426;;  if bot_drag_state = 3 then bot_drag_state = 39

	LDA bot_drag_state
	CMP #3
     BNE .skipL0922
.condpart350
	LDA #39
	STA bot_drag_state
.skipL0922
.L0923 ;;line 3427;;  bottom_player0y = 255  :  return otherbank

	LDA #255
	STA bottom_player0y
	JMP BS_return
.
 ;;line 3428;; 

.
 ;;line 3429;; 

.
 ;;line 3430;; 

.
 ;;line 3431;; 

.bridge_pf_check_top
 ;;line 3432;; bridge_pf_check_top

.L0924 ;;line 3433;;  asm

   

   lda r_top_obj_room+6

   cmp top_room

   bne .top_bridge_bounce

   lda top_carried_item

   cmp #6

   beq .top_bridge_bounce

   

   

   lda ballx

   sec

   sbc var6

   cmp #2

   bcc .top_bridge_bounce

   cmp #13

   bcs .top_bridge_bounce

   

   

   lda bally

   clc

   adc #18

   cmp var17

   bcc .top_bridge_bounce

   

   lda var17

   clc

   adc #2

   cmp bally

   bcs .top_bridge_safe

.top_bridge_bounce

.L0925 ;;line 3465;;  temp5 = 1

	LDA #1
	STA temp5
.L0926 ;;line 3466;;  goto _do_top_pf_knockback

 jmp ._do_top_pf_knockback
.
 ;;line 3467;; 

.L0927 ;;line 3468;;  asm

.top_bridge_safe

.L0928 ;;line 3471;;  return otherbank

	JMP BS_return
.
 ;;line 3472;; 

.
 ;;line 3473;; 

.
 ;;line 3474;; 

.
 ;;line 3475;; 

.
 ;;line 3476;; 

.
 ;;line 3477;; 

.
 ;;line 3478;; 

.
 ;;line 3479;; 

.
 ;;line 3480;; 

.
 ;;line 3481;; 

.
 ;;line 3482;; 

.
 ;;line 3483;; 

._do_top_pf_knockback
 ;;line 3484;; _do_top_pf_knockback

.L0929 ;;line 3485;;  asm

   lda r_top_oldx

   sta ballx

   lda r_top_oldy

   sta bally

.L0930 ;;line 3491;;  return otherbank

	JMP BS_return
.
 ;;line 3492;; 

.bridge_pf_check_bot
 ;;line 3493;; bridge_pf_check_bot

.L0931 ;;line 3494;;  asm

   

   lda r_bot_obj_room+6

   cmp bottom_room

   bne .bot_bridge_bounce

   lda bot_carried_item

   cmp #6

   beq .bot_bridge_bounce

   

   

   lda p2_ballx

   sec

   sbc var28

   cmp #2

   bcc .bot_bridge_bounce

   cmp #13

   bcs .bot_bridge_bounce

   

   

   lda p2_bally

   clc

   adc #18

   cmp var39

   bcc .bot_bridge_bounce

   

   lda var39

   clc

   adc #2

   cmp p2_bally

   bcs .bot_bridge_safe

.bot_bridge_bounce

.L0932 ;;line 3526;;  temp6 = 1

	LDA #1
	STA temp6
.L0933 ;;line 3527;;  goto _do_bot_pf_knockback

 jmp ._do_bot_pf_knockback
.
 ;;line 3528;; 

.L0934 ;;line 3529;;  asm

.bot_bridge_safe

.L0935 ;;line 3532;;  return otherbank

	JMP BS_return
.
 ;;line 3533;; 

._do_bot_pf_knockback
 ;;line 3534;; _do_bot_pf_knockback

.L0936 ;;line 3535;;  asm

   lda r_bottom_oldx

   sta p2_ballx

   lda r_bottom_oldy

   sta p2_bally

.L0937 ;;line 3541;;  return otherbank

	JMP BS_return
.
 ;;line 3542;; 

.L0938 ;;line 3543;;  data bat_dx

	JMP .skipL0938
bat_dx
	.byte  0, 1, 1, 1, 0, 255, 255, 255

.skipL0938
.
 ;;line 3546;; 

.L0939 ;;line 3547;;  data bat_dy

	JMP .skipL0939
bat_dy
	.byte  255, 255, 0, 1, 1, 1, 0, 255

.skipL0939
.
 ;;line 3550;; 

.
 ;;line 3551;; 

.L0940 ;;line 3552;;  data bat_move_north

	JMP .skipL0940
bat_move_north
	.byte  0,30,0,2,3,4,0,14,10,9,8,9,11,0,7

	.byte  13,15,5,22,21,18,19,20,21,0,16,25,26,0,28

	.byte  5,17,6,24

.skipL0940
.
 ;;line 3557;; 

.L0941 ;;line 3558;;  data bat_move_east

	JMP .skipL0941
bat_move_east
	.byte  0,1,2,6,7,3,5,4,9,10,11,8,12,13,15

	.byte  16,14,14,19,18,21,20,22,23,27,26,25,29,28,24

	.byte  30,0,0,0

.skipL0941
.
 ;;line 3563;; 

.L0942 ;;line 3564;;  data bat_move_south

	JMP .skipL0942
bat_move_south
	.byte  0,2,3,4,5,30,0,14,10,11,8,12,13,15,7

	.byte  16,25,0,20,21,22,23,18,24,0,26,27,0,29,0

	.byte  1,28,6,0

.skipL0942
.
 ;;line 3569;; 

.L0943 ;;line 3570;;  data bat_move_west

	JMP .skipL0943
bat_move_west
	.byte  0,1,2,5,7,6,3,4,11,8,9,10,12,13,16

	.byte  14,15,16,19,18,21,20,22,23,29,26,25,24,28,27

	.byte  30,0,0,0

.skipL0943
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0747_1
	.byte  %00111111
	.byte  %11100001
	.byte  %10001111
	.byte  %00001000
	.byte  %00111100
	.byte  %11111111
	.byte  %11000111
	.byte  %11000011
	.byte  %11000011
	.byte  %11100011
	.byte  %01111111
	.byte  %00111111
	.byte  %00011110
	.byte  %00000100
	.byte  %00000100
	.byte  %00001110
	.byte  %11111110
	.byte  %11110011
	.byte  %00001111
	.byte  %00000110
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0749_1
	.byte  %11100000
	.byte  %10000000
	.byte  %11111000
	.byte  %00001000
	.byte  %00111100
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
	.byte  %11111111
	.byte  %01111111
	.byte  %00111111
	.byte  %00011110
	.byte  %10000100
	.byte  %01000100
	.byte  %00101110
	.byte  %00011110
	.byte  %00010011
	.byte  %00101111
	.byte  %01000110
	.byte  %10000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0751_1
	.byte  %01111111
	.byte  %01000001
	.byte  %01101111
	.byte  %00100000
	.byte  %01111100
	.byte  %01111110
	.byte  %11111110
	.byte  %11111111
	.byte  %11111111
	.byte  %11111110
	.byte  %10000000
	.byte  %11001110
	.byte  %01111111
	.byte  %00011011
	.byte  %00001110
	.byte  %00001100
	.byte  %00001100
	.byte  %00001100
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0753_1
	.byte  %11000011
	.byte  %11000011
	.byte  %11000011
	.byte  %11000011
	.byte  %11000011
	.byte  %11100111
	.byte  %01111110
	.byte  %00111100
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0755_1
	.byte  %00100000
	.byte  %01000000
	.byte  %11111111
	.byte  %01000000
	.byte  %00100000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0757_1
	.byte  %01111110
	.byte  %00011000
	.byte  %00011000
	.byte  %00111100
	.byte  %01111110
	.byte  %01111110
	.byte  %11000011
	.byte  %10000001
	.byte  %10000001
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0759_1
	.byte  %11000011
	.byte  %11000011
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %01000010
	.byte  %11000011
	.byte  %11000011
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0761_1
	.byte  %10100111
	.byte  %11111101
	.byte  %00000111
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0763_1
	.byte  %10000001
	.byte  %10000001
	.byte  %10000001
	.byte  %11000011
	.byte  %01100110
	.byte  %01011010
	.byte  %00111100
	.byte  %10000000
	.byte  %00000001
	.byte  %10000000
	.byte  %00000001
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+24))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0765_1
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %01100110
	.byte  %01011010
	.byte  %11111111
	.byte  %11000011
	.byte  %11000011
	.byte  %10000001
	.byte  %10000001
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+15))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0783_0
	.byte  %00000000
	.byte  %01010101
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01010101
	.byte  %01111111
	.byte  %01010101
	.byte  %01010101
	.byte  %01111111
 if (<*) > (<(*+15))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0785_0
	.byte  %00000000
	.byte  %00000000
	.byte  %00011110
	.byte  %00011110
	.byte  %00111111
	.byte  %00111111
	.byte  %00111111
	.byte  %00111111
	.byte  %00111111
	.byte  %00111111
	.byte  %00111111
	.byte  %00111111
	.byte  %00011110
	.byte  %00011110
	.byte  %00000000
	.byte  %00000000
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left in bank 4")
 endif 
ECHOFIRST = 1
 
 
 
