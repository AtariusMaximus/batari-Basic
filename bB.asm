game
.
 ;;line 1;; 

.
 ;;line 2;; 

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

.L00 ;;line 9;;  rem

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

.L01 ;;line 23;;  set romsize 16kSC

.L02 ;;line 24;;  set kernel_options pfheights

.
 ;;line 25;; 

.init
 ;;line 26;; init

.
 ;;line 27;; 

.
 ;;line 28;; 

.
 ;;line 29;; 

.L03 ;;line 30;;  dim enemy_hit_x = a

.L04 ;;line 31;;  dim ball_x = b

.L05 ;;line 32;;  dim enemy_hp = c

.L06 ;;line 33;;  dim enemy_dir = d

.L07 ;;line 34;;  dim scroll_timer = e

.L08 ;;line 35;;  dim road_offset = f

.L09 ;;line 36;;  dim road_accel = g

.L010 ;;line 37;;  dim powerup_flag = h

.L011 ;;line 38;;  dim road_speed = i

.L012 ;;line 39;;  dim mis_frac = j

.L013 ;;line 40;;  dim mis_int = k

.L014 ;;line 41;;  dim rand_car = l

.L015 ;;line 42;;  dim scroll_int = m

.L016 ;;line 43;;  dim scroll_frac = n

.L017 ;;line 44;;  dim player_y = p

.L018 ;;line 45;;  dim player_fire_timer = q

.L019 ;;line 46;;  dim pause_timer = r

.L020 ;;line 47;;  dim title_anim = s

.L021 ;;line 48;;  dim scroll_counter = t

.L022 ;;line 49;;  dim enemy_x = u

.L023 ;;line 50;;  dim rand_val = v

.L024 ;;line 51;;  dim color_flag = w

.L025 ;;line 52;;  dim player_x = x

.L026 ;;line 53;;  dim color_cycler = y

.L027 ;;line 54;;  dim enemy_hit_flag = z

.
 ;;line 55;; 

.
 ;;line 56;; 

.L028 ;;line 57;;  dim enemy_y = m.n

.L029 ;;line 58;;  dim missile1_y = k.j

.
 ;;line 59;; 

.
 ;;line 60;; 

.
 ;;line 61;; 

.
 ;;line 62;; 

;PARSED_DEFINE: .game_started. = .var0{0}.
.L030 ;;line 63;;  def game_started = var0{0}

.L031 ;;line 64;;  dim m1_x_pos = aux3

.
 ;;line 65;; 

.L032 ;;line 66;;  enemy_hit_x = 0

	LDA #0
	STA enemy_hit_x
.L033 ;;line 67;;  ball_x = 82

	LDA #82
	STA ball_x
.L034 ;;line 68;;  enemy_hp = 0

	LDA #0
	STA enemy_hp
.L035 ;;line 69;;  enemy_dir = 0

	LDA #0
	STA enemy_dir
.L036 ;;line 70;;  scroll_timer = 0

	LDA #0
	STA scroll_timer
.L037 ;;line 71;;  road_offset = 0

	LDA #0
	STA road_offset
.L038 ;;line 72;;  road_accel = 0

	LDA #0
	STA road_accel
.L039 ;;line 73;;  powerup_flag = 0

	LDA #0
	STA powerup_flag
.L040 ;;line 74;;  road_speed = 25

	LDA #25
	STA road_speed
.L041 ;;line 75;;  mis_frac = 0

	LDA #0
	STA mis_frac
.L042 ;;line 76;;  mis_int = 0

	LDA #0
	STA mis_int
.L043 ;;line 77;;  m = 0

	LDA #0
	STA m
.L044 ;;line 78;;  n = 0

	LDA #0
	STA n
.L045 ;;line 79;;  player_y = 89

	LDA #89
	STA player_y
.L046 ;;line 80;;  player_fire_timer = 0

	LDA #0
	STA player_fire_timer
.L047 ;;line 81;;  pause_timer = 0

	LDA #0
	STA pause_timer
.L048 ;;line 82;;  title_anim = 30

	LDA #30
	STA title_anim
.L049 ;;line 83;;  scroll_counter = 0

	LDA #0
	STA scroll_counter
.L050 ;;line 84;;  enemy_x = 70

	LDA #70
	STA enemy_x
.L051 ;;line 85;;  color_flag = 0

	LDA #0
	STA color_flag
.L052 ;;line 86;;  player_x = 75

	LDA #75
	STA player_x
.L053 ;;line 87;;  color_cycler = 16

	LDA #16
	STA color_cycler
.L054 ;;line 88;;  enemy_hit_flag = 0

	LDA #0
	STA enemy_hit_flag
.L055 ;;line 89;;  enemy_y = 1.0

	LDX #0
	STX n
	LDA #1
	STA enemy_y
.L056 ;;line 90;;  missile1_y = 0.0

	LDX #0
	STX j
	LDA #0
	STA missile1_y
.L057 ;;line 91;;  missile0x = 0 : missile0y = 0

	LDA #0
	STA missile0x
	STA missile0y
.L058 ;;line 92;;  missile1x = 0 : missile1y = 0

	LDA #0
	STA missile1x
	STA missile1y
.L059 ;;line 93;;  COLUP1 = 208 : COLUP0 = 0

	LDA #208
	STA COLUP1
	LDA #0
	STA COLUP0
.
 ;;line 94;; 

.L060 ;;line 95;;  pfheights:

 lda # 3
 sta playfieldpos
 ifconst pfres
 lda #>(pfcolorlabel18-pfres-9)
 else
 lda #>(pfcolorlabel18-21)
 endif
 sta pfcolortable+1
 ifconst pfres
 lda #<(pfcolorlabel18-pfres-9)
 else
 lda #<(pfcolorlabel18-21)
 endif
 sta pfcolortable
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

.L061 ;;line 113;;  COLUPF = $28

	LDA #$28
	STA COLUPF
.L062 ;;line 114;;  COLUBK = 0

	LDA #0
	STA COLUBK
.L063 ;;line 115;;  CTRLPF = $00

	LDA #$00
	STA CTRLPF
.L064 ;;line 116;;  scorecolor = 246

	LDA #246
	STA scorecolor
.L065 ;;line 117;;  pfclear : drawscreen

	LDA #0
 sta temp7
 lda #>(ret_point1-1)
 pha
 lda #<(ret_point1-1)
 pha
 lda #>(pfclear-1)
 pha
 lda #<(pfclear-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point1
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
 ;;line 118;; 

.
 ;;line 119;; 

.
 ;;line 120;; 

.
 ;;line 121;; 

.
 ;;line 122;; 

.intro
 ;;line 123;; intro

.L066 ;;line 124;;  color_cycler = color_cycler + 1

	INC color_cycler
.L067 ;;line 125;;  if color_cycler < 17 then color_cycler = 16

	LDA color_cycler
	CMP #17
     BCS .skipL067
.condpart0
	LDA #16
	STA color_cycler
.skipL067
.L068 ;;line 126;;  if color_cycler > 29 then color_cycler = 16

	LDA #29
	CMP color_cycler
     BCS .skipL068
.condpart1
	LDA #16
	STA color_cycler
.skipL068
.
 ;;line 127;; 

.L069 ;;line 128;;  COLUP0 = 64

	LDA #64
	STA COLUP0
.L070 ;;line 129;;  COLUP1 = color_cycler

	LDA color_cycler
	STA COLUP1
.L071 ;;line 130;;  NUSIZ1 = $05

	LDA #$05
	STA NUSIZ1
.L072 ;;line 131;;  NUSIZ0 = $27

	LDA #$27
	STA NUSIZ0
.L073 ;;line 132;;  AUDV0 = 0 : AUDV1 = 0

	LDA #0
	STA AUDV0
	STA AUDV1
.
 ;;line 133;; 

.L074 ;;line 134;;  player1:

	LDX #<playerL074_1
	STX player1pointerlo
	LDA #>playerL074_1
	STA player1pointerhi
	LDA #72
	STA player1height
.L075 ;;line 209;;  player0:

	LDX #<playerL075_0
	STX player0pointerlo
	LDA #>playerL075_0
	STA player0pointerhi
	LDA #9
	STA player0height
.L076 ;;line 221;;  drawscreen

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
.
 ;;line 222;; 

.L077 ;;line 223;;  player0x = 78

	LDA #78
	STA player0x
.L078 ;;line 224;;  player0y = 83

	LDA #83
	STA player0y
.L079 ;;line 225;;  player1x = 52

	LDA #52
	STA player1x
.L080 ;;line 226;;  player1y = 82

	LDA #82
	STA player1y
.L081 ;;line 227;;  missile0height = 2

	LDA #2
	STA missile0height
.
 ;;line 228;; 

.L082 ;;line 229;;  scroll_timer = scroll_timer + 1

	INC scroll_timer
.L083 ;;line 230;;  missile0x = 94 : missile0y = title_anim

	LDA #94
	STA missile0x
	LDA title_anim
	STA missile0y
.L084 ;;line 231;;  if title_anim > 52 then title_anim = 30

	LDA #52
	CMP title_anim
     BCS .skipL084
.condpart2
	LDA #30
	STA title_anim
.skipL084
.L085 ;;line 232;;  if scroll_timer = 2 then title_anim = title_anim + 1 : scroll_timer = 0

	LDA scroll_timer
	CMP #2
     BNE .skipL085
.condpart3
	INC title_anim
	LDA #0
	STA scroll_timer
.skipL085
.
 ;;line 233;; 

.L086 ;;line 234;;  scroll_counter = 0

	LDA #0
	STA scroll_counter
.L087 ;;line 235;;  if game_started then goto main

	LDA var0
	LSR
	BCC .skipL087
.condpart4
 jmp .main
.skipL087
.
 ;;line 236;; 

.
 ;;line 237;; 

.L088 ;;line 238;;  if joy0down then game_started = 1  :  score = 0  :  goto intro2

 lda #$20
 bit SWCHA
	BNE .skipL088
.condpart5
	LDA var0
	ORA #1
	STA var0
	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
 jmp .intro2
.skipL088
.L089 ;;line 239;;  if switchreset then game_started = 1  :  score = 0  :  goto intro2

 lda #1
 bit SWCHB
	BNE .skipL089
.condpart6
	LDA var0
	ORA #1
	STA var0
	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
 jmp .intro2
.skipL089
.L090 ;;line 240;;  if joy0fire then game_started = 1 :  score = 0  :  goto intro2

 bit INPT4
	BMI .skipL090
.condpart7
	LDA var0
	ORA #1
	STA var0
	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
 jmp .intro2
.skipL090
.
 ;;line 241;; 

.L091 ;;line 242;;  if joy0fire then

 bit INPT4
	BMI .skipL091
.condpart8
.L092 ;;line 243;;  game_started = 1

	LDA var0
	ORA #1
	STA var0
.L093 ;;line 244;;  score = 0

	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
.L094 ;;line 245;;  goto intro2

 jmp .intro2
.L095 ;;line 246;;  endif

.skipL091
.
 ;;line 247;; 

.L096 ;;line 248;;  goto intro

 jmp .intro
.
 ;;line 249;; 

.intro2
 ;;line 250;; intro2

.L097 ;;line 251;;  gosub mnc1

 jsr .mnc1
.L098 ;;line 252;;  title_anim = 0

	LDA #0
	STA title_anim
.L099 ;;line 253;;  scroll_timer = 0

	LDA #0
	STA scroll_timer
.
 ;;line 254;; 

.
 ;;line 255;; 

.L0100 ;;line 256;;  road_offset = 3

	LDA #3
	STA road_offset
.L0101 ;;line 257;;  road_accel = 100

	LDA #100
	STA road_accel
.L0102 ;;line 258;;  missile0x = 0 : missile0y = 0

	LDA #0
	STA missile0x
	STA missile0y
.L0103 ;;line 259;;  enemy_y = 16.0

	LDX #0
	STX n
	LDA #16
	STA enemy_y
.
 ;;line 260;; 

.
 ;;line 261;; 

.
 ;;line 262;; 

.
 ;;line 263;; 

.
 ;;line 264;; 

.main
 ;;line 265;; main

.L0104 ;;line 266;;  CTRLPF = $35

	LDA #$35
	STA CTRLPF
.L0105 ;;line 267;;  color_cycler = color_cycler + 1

	INC color_cycler
.L0106 ;;line 268;;  if color_cycler > 250 then color_cycler = 1

	LDA #250
	CMP color_cycler
     BCS .skipL0106
.condpart9
	LDA #1
	STA color_cycler
.skipL0106
.L0107 ;;line 269;;  if enemy_hp < 1 then enemy_hp = 1

	LDA enemy_hp
	CMP #1
     BCS .skipL0107
.condpart10
	LDA #1
	STA enemy_hp
.skipL0107
.L0108 ;;line 270;;  if switchbw then enemy_hp = 0  : 

 lda #8
 bit SWCHB
	BNE .skipL0108
.condpart11
	LDA #0
	STA enemy_hp
.skipL0108
.L0109 ;;line 271;;  if joy0up then goto audskip

 lda #$10
 bit SWCHA
	BNE .skipL0109
.condpart12
 jmp .audskip
.skipL0109
.L0110 ;;line 272;;  if joy0down then goto audskip

 lda #$20
 bit SWCHA
	BNE .skipL0110
.condpart13
 jmp .audskip
.skipL0110
.L0111 ;;line 273;;  AUDF0 = 18 : AUDC0 = 14 : AUDV0 = 10

	LDA #18
	STA AUDF0
	LDA #14
	STA AUDC0
	LDA #10
	STA AUDV0
.L0112 ;;line 274;;  if scroll_counter > 240 then scroll_counter = 31

	LDA #240
	CMP scroll_counter
     BCS .skipL0112
.condpart14
	LDA #31
	STA scroll_counter
.skipL0112
.
 ;;line 275;; 

.audskip
 ;;line 276;; audskip

.
 ;;line 277;; 

.L0113 ;;line 278;;  if m  >  96 then color_flag = 0  :  powerup_flag = 0  :  enemy_hit_flag = 0  :  enemy_dir = 0

	LDA #96
	CMP m
     BCS .skipL0113
.condpart15
	LDA #0
	STA color_flag
	STA powerup_flag
	STA enemy_hit_flag
	STA enemy_dir
.skipL0113
.L0114 ;;line 279;;  if m  >  96 then enemy_x = 70

	LDA #96
	CMP m
     BCS .skipL0114
.condpart16
	LDA #70
	STA enemy_x
.skipL0114
.
 ;;line 280;; 

.L0115 ;;line 281;;  scroll_timer = scroll_timer + 1

	INC scroll_timer
.L0116 ;;line 282;;  if scroll_timer = 2 then if scroll_counter  <  10 then scroll_timer = 0 : goto skipscroll

	LDA scroll_timer
	CMP #2
     BNE .skipL0116
.condpart17
	LDA scroll_counter
	CMP #10
     BCS .skip16then
.condpart18
	LDA #0
	STA scroll_timer
 jmp .skipscroll
.skip16then
.skipL0116
.
 ;;line 283;; 

.L0117 ;;line 284;;  if m  <  97 then enemy_y = enemy_y + 1.0 else enemy_y = 16.0  :  scroll_counter = scroll_counter + 1

	LDA m
	CMP #97
     BCS .skipL0117
.condpart19
	LDA n
	CLC 
	ADC #0
	STA n
	LDA enemy_y
	ADC #1
	STA enemy_y
 jmp .skipelse0
.skipL0117
	LDX #0
	STX n
	LDA #16
	STA enemy_y
	INC scroll_counter
.skipelse0
.L0118 ;;line 285;;  if m  <  97 then if scroll_counter  >  35 then enemy_y = enemy_y + 0.9  :  missile1_y = missile1_y + 0.9

	LDA m
	CMP #97
     BCS .skipL0118
.condpart20
	LDA #35
	CMP scroll_counter
     BCS .skip19then
.condpart21
	LDA n
	CLC 
	ADC #230
	STA n
	LDA enemy_y
	ADC #0
	STA enemy_y
	LDA j
	CLC 
	ADC #230
	STA j
	LDA missile1_y
	ADC #0
	STA missile1_y
.skip19then
.skipL0118
.
 ;;line 286;; 

.skipscroll
 ;;line 287;; skipscroll

.
 ;;line 288;; 

.L0119 ;;line 289;;  if powerup_flag  >  0 then goto skip_scale

	LDA #0
	CMP powerup_flag
     BCS .skipL0119
.condpart22
 jmp .skip_scale
.skipL0119
.L0120 ;;line 290;;  gosub ScaleEnemyCar

 jsr .ScaleEnemyCar
.skip_scale
 ;;line 291;; skip_scale

.
 ;;line 292;; 

.
 ;;line 293;; 

.
 ;;line 294;; 

.
 ;;line 295;; 

.
 ;;line 296;; 

.L0121 ;;line 297;;  rand_val = rand

 sta temp7
 lda #>(ret_point4-1)
 pha
 lda #<(ret_point4-1)
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
ret_point4
	STA rand_val
.L0122 ;;line 298;;  if scroll_counter  >  30 then skipmv

	LDA #30
	CMP scroll_counter
	bcc .skipmv
 if ( (((((#>*)&$1f)*256)|(#<.skipmv))>=bankswitch_hotspot) && (((((#>*)&$1f)*256)|(#<.skipmv))<=(bankswitch_hotspot+bs_mask)) )
   echo "WARNING: branch near the end of bank 1 may accidentally trigger a bankswitch. Reposition code there if bad things happen."
 endif
.L0123 ;;line 299;;  if scroll_counter  <  8 then goto skipmv

	LDA scroll_counter
	CMP #8
     BCS .skipL0123
.condpart23
 jmp .skipmv
.skipL0123
.L0124 ;;line 300;;  if scroll_counter  >  20 then if rand_val  <  35 then enemy_x = enemy_x + 1

	LDA #20
	CMP scroll_counter
     BCS .skipL0124
.condpart24
	LDA rand_val
	CMP #35
     BCS .skip23then
.condpart25
	INC enemy_x
.skip23then
.skipL0124
.skipmv
 ;;line 301;; skipmv

.
 ;;line 302;; 

.
 ;;line 303;; 

.L0125 ;;line 304;;  if m  <=  86 then goto skip_ball_spawn

	LDA #86
	CMP m
     BCC .skipL0125
.condpart26
 jmp .skip_ball_spawn
.skipL0125
.L0126 ;;line 305;;  if rand_val = 2 then ball_x = 75

	LDA rand_val
	CMP #2
     BNE .skipL0126
.condpart27
	LDA #75
	STA ball_x
.skipL0126
.L0127 ;;line 306;;  if rand_val = 234 then ball_x = 105

	LDA rand_val
	CMP #234
     BNE .skipL0127
.condpart28
	LDA #105
	STA ball_x
.skipL0127
.L0128 ;;line 307;;  if rand_val = 112 then ball_x = 89

	LDA rand_val
	CMP #112
     BNE .skipL0128
.condpart29
	LDA #89
	STA ball_x
.skipL0128
.L0129 ;;line 308;;  if rand_val = 50 then ball_x = 81

	LDA rand_val
	CMP #50
     BNE .skipL0129
.condpart30
	LDA #81
	STA ball_x
.skipL0129
.L0130 ;;line 309;;  if rand_val = 188 then ball_x = 115

	LDA rand_val
	CMP #188
     BNE .skipL0130
.condpart31
	LDA #115
	STA ball_x
.skipL0130
.L0131 ;;line 310;;  if rand_val = 166 then ball_x = 79

	LDA rand_val
	CMP #166
     BNE .skipL0131
.condpart32
	LDA #79
	STA ball_x
.skipL0131
.L0132 ;;line 311;;  if rand_val = 132 then ball_x = 95

	LDA rand_val
	CMP #132
     BNE .skipL0132
.condpart33
	LDA #95
	STA ball_x
.skipL0132
.L0133 ;;line 312;;  if rand_val = 176 then ball_x = 111

	LDA rand_val
	CMP #176
     BNE .skipL0133
.condpart34
	LDA #111
	STA ball_x
.skipL0133
.skip_ball_spawn
 ;;line 313;; skip_ball_spawn

.
 ;;line 314;; 

.L0134 ;;line 315;;  if rand_val  <  10 then enemy_x = enemy_x + 1

	LDA rand_val
	CMP #10
     BCS .skipL0134
.condpart35
	INC enemy_x
.skipL0134
.L0135 ;;line 316;;  if rand_val  >  245 then enemy_x = enemy_x - 2  :  if enemy_dir > 0 then COLUP1 = 22

	LDA #245
	CMP rand_val
     BCS .skipL0135
.condpart36
	LDA enemy_x
	SEC
	SBC #2
	STA enemy_x
	LDA #0
	CMP enemy_dir
     BCS .skip35then
.condpart37
	LDA #22
	STA COLUP1
.skip35then
.skipL0135
.L0136 ;;line 317;;  if scroll_counter > 20 then if scroll_counter < 36 then COLUP1 = 104

	LDA #20
	CMP scroll_counter
     BCS .skipL0136
.condpart38
	LDA scroll_counter
	CMP #36
     BCS .skip37then
.condpart39
	LDA #104
	STA COLUP1
.skip37then
.skipL0136
.L0137 ;;line 318;;  if scroll_counter > 35 then COLUP1 = 68

	LDA #35
	CMP scroll_counter
     BCS .skipL0137
.condpart40
	LDA #68
	STA COLUP1
.skipL0137
.
 ;;line 319;; 

.
 ;;line 320;; 

.L0138 ;;line 321;;  if rand_val  <  6 then enemy_dir = 0

	LDA rand_val
	CMP #6
     BCS .skipL0138
.condpart41
	LDA #0
	STA enemy_dir
.skipL0138
.
 ;;line 322;; 

.L0139 ;;line 323;;  if enemy_dir = 1 then enemy_x = enemy_x + 1

	LDA enemy_dir
	CMP #1
     BNE .skipL0139
.condpart42
	INC enemy_x
.skipL0139
.L0140 ;;line 324;;  if enemy_dir = 2 then enemy_x = enemy_x - 1

	LDA enemy_dir
	CMP #2
     BNE .skipL0140
.condpart43
	DEC enemy_x
.skipL0140
.
 ;;line 325;; 

.
 ;;line 326;; 

.
 ;;line 327;; 

.L0141 ;;line 328;;  if m  >  95 then temp1 = 6  :  goto skip_bcheck

	LDA #95
	CMP m
     BCS .skipL0141
.condpart44
	LDA #6
	STA temp1
 jmp .skip_bcheck
.skipL0141
.L0142 ;;line 329;;  if m  >  79 then temp1 = 5  :  goto skip_bcheck

	LDA #79
	CMP m
     BCS .skipL0142
.condpart45
	LDA #5
	STA temp1
 jmp .skip_bcheck
.skipL0142
.L0143 ;;line 330;;  if m  >  63 then temp1 = 4  :  goto skip_bcheck

	LDA #63
	CMP m
     BCS .skipL0143
.condpart46
	LDA #4
	STA temp1
 jmp .skip_bcheck
.skipL0143
.L0144 ;;line 331;;  if m  >  47 then temp1 = 3  :  goto skip_bcheck

	LDA #47
	CMP m
     BCS .skipL0144
.condpart47
	LDA #3
	STA temp1
 jmp .skip_bcheck
.skipL0144
.L0145 ;;line 332;;  if m  >  31 then temp1 = 2  :  goto skip_bcheck

	LDA #31
	CMP m
     BCS .skipL0145
.condpart48
	LDA #2
	STA temp1
 jmp .skip_bcheck
.skipL0145
.L0146 ;;line 333;;  if m  >  15 then temp1 = 1  :  goto skip_bcheck

	LDA #15
	CMP m
     BCS .skipL0146
.condpart49
	LDA #1
	STA temp1
 jmp .skip_bcheck
.skipL0146
.L0147 ;;line 334;;  temp1 = 0

	LDA #0
	STA temp1
.skip_bcheck
 ;;line 335;; skip_bcheck

.
 ;;line 336;; 

.L0148 ;;line 337;;  temp2 = BoundsLeft[temp1]

	LDX temp1
	LDA BoundsLeft,x
	STA temp2
.L0149 ;;line 338;;  temp3 = BoundsRight[temp1]

	LDX temp1
	LDA BoundsRight,x
	STA temp3
.
 ;;line 339;; 

.
 ;;line 340;; 

.L0150 ;;line 341;;  temp4 = 12

	LDA #12
	STA temp4
.L0151 ;;line 342;;  if enemy_hit_flag  >  0 then temp4 = 4

	LDA #0
	CMP enemy_hit_flag
     BCS .skipL0151
.condpart50
	LDA #4
	STA temp4
.skipL0151
.L0152 ;;line 343;;  temp5 = enemy_x  +  temp4

	LDA enemy_x
	CLC
	ADC temp4
	STA temp5
.
 ;;line 344;; 

.
 ;;line 345;; 

.L0153 ;;line 346;;  if temp5  <  temp2 then enemy_x = temp2  -  temp4  :  enemy_dir = 1

	LDA temp5
	CMP temp2
     BCS .skipL0153
.condpart51
	LDA temp2
	SEC
	SBC temp4
	STA enemy_x
	LDA #1
	STA enemy_dir
.skipL0153
.L0154 ;;line 347;;  if temp5  >  temp3 then enemy_x = temp3  -  temp4  :  enemy_dir = 2

	LDA temp3
	CMP temp5
     BCS .skipL0154
.condpart52
	LDA temp3
	SEC
	SBC temp4
	STA enemy_x
	LDA #2
	STA enemy_dir
.skipL0154
.
 ;;line 348;; 

.
 ;;line 349;; 

.L0155 ;;line 350;;  if m  <  26 then enemy_dir = 0

	LDA m
	CMP #26
     BCS .skipL0155
.condpart53
	LDA #0
	STA enemy_dir
.skipL0155
.L0156 ;;line 351;;  if m  <  26 then if enemy_hit_flag = 0 then enemy_x = 70

	LDA m
	CMP #26
     BCS .skipL0156
.condpart54
	LDA enemy_hit_flag
	CMP #0
     BNE .skip53then
.condpart55
	LDA #70
	STA enemy_x
.skip53then
.skipL0156
.
 ;;line 352;; 

.
 ;;line 353;; 

.L0157 ;;line 354;;  if enemy_hit_flag = 0 then NUSIZ1 = $01 else NUSIZ1 = $00

	LDA enemy_hit_flag
	CMP #0
     BNE .skipL0157
.condpart56
	LDA #$01
	STA NUSIZ1
 jmp .skipelse1
.skipL0157
	LDA #$00
	STA NUSIZ1
.skipelse1
.
 ;;line 355;; 

.L0158 ;;line 356;;  NUSIZ0 = $05

	LDA #$05
	STA NUSIZ0
.
 ;;line 357;; 

.L0159 ;;line 358;;  player1y = enemy_y  :  player1x = enemy_x

	LDA enemy_y
	STA player1y
	LDA enemy_x
	STA player1x
.
 ;;line 359;; 

.skiplrm
 ;;line 360;; skiplrm

.
 ;;line 361;; 

.
 ;;line 362;; 

.
 ;;line 363;; 

.L0160 ;;line 364;;  temp1 = road_offset  &  1

	LDA road_offset
	AND #1
	STA temp1
.L0161 ;;line 365;;  if temp1 = 1 then goto p0_frame2

	LDA temp1
	CMP #1
     BNE .skipL0161
.condpart57
 jmp .p0_frame2
.skipL0161
.
 ;;line 366;; 

.p0_frame1
 ;;line 367;; p0_frame1

.L0162 ;;line 368;;  player0:

	LDX #<playerL0162_0
	STX player0pointerlo
	LDA #>playerL0162_0
	STA player0pointerhi
	LDA #5
	STA player0height
.L0163 ;;line 376;;  goto draw_road_engine

 jmp .draw_road_engine
.
 ;;line 377;; 

.p0_frame2
 ;;line 378;; p0_frame2

.L0164 ;;line 379;;  player0:

	LDX #<playerL0164_0
	STX player0pointerlo
	LDA #>playerL0164_0
	STA player0pointerhi
	LDA #5
	STA player0height
.
 ;;line 387;; 

.draw_road_engine
 ;;line 388;; draw_road_engine

.
 ;;line 389;; 

.
 ;;line 390;; 

.
 ;;line 391;; 

.L0165 ;;line 392;;  road_speed = 25

	LDA #25
	STA road_speed
.
 ;;line 393;; 

.
 ;;line 394;; 

.L0166 ;;line 395;;  if joy0up then road_speed = 60

 lda #$10
 bit SWCHA
	BNE .skipL0166
.condpart58
	LDA #60
	STA road_speed
.skipL0166
.L0167 ;;line 396;;  if joy0down then road_speed = 10

 lda #$20
 bit SWCHA
	BNE .skipL0167
.condpart59
	LDA #10
	STA road_speed
.skipL0167
.
 ;;line 397;; 

.
 ;;line 398;; 

.L0168 ;;line 399;;  road_accel = road_accel  +  road_speed

	LDA road_accel
	CLC
	ADC road_speed
	STA road_accel
.L0169 ;;line 400;;  if road_accel  <  100 then goto skip_road_move

	LDA road_accel
	CMP #100
     BCS .skipL0169
.condpart60
 jmp .skip_road_move
.skipL0169
.L0170 ;;line 401;;  road_accel = road_accel  -  100

	LDA road_accel
	SEC
	SBC #100
	STA road_accel
.
 ;;line 402;; 

.
 ;;line 403;; 

.L0171 ;;line 404;;  pfclear

	LDA #0
 sta temp7
 lda #>(ret_point5-1)
 pha
 lda #<(ret_point5-1)
 pha
 lda #>(pfclear-1)
 pha
 lda #<(pfclear-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point5
.
 ;;line 405;; 

.
 ;;line 406;; 

.L0172 ;;line 407;;  road_offset = road_offset  +  1  :  if road_offset  >  3 then road_offset = 0

	INC road_offset
	LDA #3
	CMP road_offset
     BCS .skipL0172
.condpart61
	LDA #0
	STA road_offset
.skipL0172
.
 ;;line 408;; 

.L0173 ;;line 409;;  var44 = road_offset  +  2

	LDA road_offset
	CLC
	ADC #2
	STA var44
.L0174 ;;line 410;;  var45 = RoadLeftX[var44]  :  var46 = RoadRightX[var44]  :  var47 = var44  +  1

	LDX var44
	LDA RoadLeftX,x
	STA var45
	LDX var44
	LDA RoadRightX,x
	STA var46
	LDA var44
	CLC
	ADC #1
	STA var47
.L0175 ;;line 411;;  pfpixel var45 var47 on  :  pfpixel var46 var47 on

	LDX #0
	LDY var47
	LDA var45
 sta temp7
 lda #>(ret_point6-1)
 pha
 lda #<(ret_point6-1)
 pha
 lda #>(pfpixel-1)
 pha
 lda #<(pfpixel-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point6
	LDX #0
	LDY var47
	LDA var46
 sta temp7
 lda #>(ret_point7-1)
 pha
 lda #<(ret_point7-1)
 pha
 lda #>(pfpixel-1)
 pha
 lda #<(pfpixel-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point7
.
 ;;line 412;; 

.L0176 ;;line 413;;  var44 = road_offset  +  6

	LDA road_offset
	CLC
	ADC #6
	STA var44
.L0177 ;;line 414;;  var45 = RoadLeftX[var44]  :  var46 = RoadRightX[var44]  :  var47 = var44  +  1

	LDX var44
	LDA RoadLeftX,x
	STA var45
	LDX var44
	LDA RoadRightX,x
	STA var46
	LDA var44
	CLC
	ADC #1
	STA var47
.L0178 ;;line 415;;  pfpixel var45 var47 on  :  pfpixel var46 var47 on

	LDX #0
	LDY var47
	LDA var45
 sta temp7
 lda #>(ret_point8-1)
 pha
 lda #<(ret_point8-1)
 pha
 lda #>(pfpixel-1)
 pha
 lda #<(pfpixel-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point8
	LDX #0
	LDY var47
	LDA var46
 sta temp7
 lda #>(ret_point9-1)
 pha
 lda #<(ret_point9-1)
 pha
 lda #>(pfpixel-1)
 pha
 lda #<(pfpixel-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point9
.
 ;;line 416;; 

.skip_road_move
 ;;line 417;; skip_road_move

.
 ;;line 418;; 

.L0179 ;;line 419;;  if enemy_hp  <  11 then COLUP0 = 128

	LDA enemy_hp
	CMP #11
     BCS .skipL0179
.condpart62
	LDA #128
	STA COLUP0
.skipL0179
.L0180 ;;line 420;;  if enemy_hp  >  10 then if enemy_hp  <  21 then COLUP0 = 60

	LDA #10
	CMP enemy_hp
     BCS .skipL0180
.condpart63
	LDA enemy_hp
	CMP #21
     BCS .skip62then
.condpart64
	LDA #60
	STA COLUP0
.skip62then
.skipL0180
.L0181 ;;line 421;;  if enemy_hp  >  20 then if enemy_hp  <  31 then COLUP0 = 30

	LDA #20
	CMP enemy_hp
     BCS .skipL0181
.condpart65
	LDA enemy_hp
	CMP #31
     BCS .skip64then
.condpart66
	LDA #30
	STA COLUP0
.skip64then
.skipL0181
.L0182 ;;line 422;;  if enemy_hp  >  30 then if enemy_hp  <  41 then COLUP0 = 64

	LDA #30
	CMP enemy_hp
     BCS .skipL0182
.condpart67
	LDA enemy_hp
	CMP #41
     BCS .skip66then
.condpart68
	LDA #64
	STA COLUP0
.skip66then
.skipL0182
.L0183 ;;line 423;;  if enemy_hp  >  40 then if enemy_hp  <  61 then COLUP0 = color_cycler

	LDA #40
	CMP enemy_hp
     BCS .skipL0183
.condpart69
	LDA enemy_hp
	CMP #61
     BCS .skip68then
.condpart70
	LDA color_cycler
	STA COLUP0
.skip68then
.skipL0183
.
 ;;line 424;; 

.L0184 ;;line 425;;  player0x = player_x  :  player0y = player_y

	LDA player_x
	STA player0x
	LDA player_y
	STA player0y
.
 ;;line 426;; 

.L0185 ;;line 427;;  drawscreen

 sta temp7
 lda #>(ret_point10-1)
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
 ldx #4
 jmp BS_jsr
ret_point10
.
 ;;line 428;; 

.L0186 ;;line 429;;  if switchrightb then ballx = 0 : bally = 0 : goto skipb

 bit SWCHB
	BMI .skipL0186
.condpart71
	LDA #0
	STA ballx
	STA bally
 jmp .skipb
.skipL0186
.L0187 ;;line 430;;  ballx = ball_x  :  bally = m + 15  :  ballheight = 2

	LDA ball_x
	STA ballx
	LDA m
	CLC
	ADC #15
	STA bally
	LDA #2
	STA ballheight
.skipb
 ;;line 431;; skipb

.
 ;;line 432;; 

.L0188 ;;line 433;;  if joy0left then player_x = player_x - 1

 bit SWCHA
	BVS .skipL0188
.condpart72
	DEC player_x
.skipL0188
.L0189 ;;line 434;;  if joy0right then player_x = player_x + 1

 bit SWCHA
	BMI .skipL0189
.condpart73
	INC player_x
.skipL0189
.L0190 ;;line 435;;  if joy0up then enemy_y = enemy_y + 0.3  :  score = score + 10  :  AUDF0 = 12 : AUDC0 = 14 : AUDV0 = 10

 lda #$10
 bit SWCHA
	BNE .skipL0190
.condpart74
	LDA n
	CLC 
	ADC #76
	STA n
	LDA enemy_y
	ADC #0
	STA enemy_y
	SED
	CLC
	LDA score+2
	ADC #$10
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
	LDA #12
	STA AUDF0
	LDA #14
	STA AUDC0
	LDA #10
	STA AUDV0
.skipL0190
.L0191 ;;line 436;;  if joy0down then if m  >= 1 then enemy_y = enemy_y - 0.3  :  score = score - 10 :  AUDF0 = 24 : AUDC0 = 14 : AUDV0 = 10

 lda #$20
 bit SWCHA
	BNE .skipL0191
.condpart75
	LDA m
	CMP #1
     BCC .skip74then
.condpart76
	LDA n
	SEC 
	SBC #76
	STA n
	LDA enemy_y
	SBC #0
	STA enemy_y
	SED
	SEC
	LDA score+2
	SBC #$10
	STA score+2
	LDA score+1
	SBC #$00
	STA score+1
	LDA score
	SBC #$00
	STA score
	CLD
	LDA #24
	STA AUDF0
	LDA #14
	STA AUDC0
	LDA #10
	STA AUDV0
.skip74then
.skipL0191
.
 ;;line 437;; 

.L0192 ;;line 438;;  if joy0fire then if player_fire_timer < 1 then AUDF1 = 8 : AUDC1 = 1 : AUDV1 = 15  :  goto playerfires

 bit INPT4
	BMI .skipL0192
.condpart77
	LDA player_fire_timer
	CMP #1
     BCS .skip76then
.condpart78
	LDA #8
	STA AUDF1
	LDA #1
	STA AUDC1
	LDA #15
	STA AUDV1
 jmp .playerfires
.skip76then
.skipL0192
.
 ;;line 439;; 

.
 ;;line 440;; 

.L0193 ;;line 441;;  if player_fire_timer > 0 then player_fire_timer = player_fire_timer - 2  :  missile0y = player_fire_timer

	LDA #0
	CMP player_fire_timer
     BCS .skipL0193
.condpart79
	LDA player_fire_timer
	SEC
	SBC #2
	STA player_fire_timer
	LDA player_fire_timer
	STA missile0y
.skipL0193
.L0194 ;;line 442;;  if player_fire_timer > 0 then if missile0x  <  76 then missile0x = missile0x + 1

	LDA #0
	CMP player_fire_timer
     BCS .skipL0194
.condpart80
	LDA missile0x
	CMP #76
     BCS .skip79then
.condpart81
	INC missile0x
.skip79then
.skipL0194
.L0195 ;;line 443;;  if player_fire_timer > 0 then if missile0x  >  76 then missile0x = missile0x - 1

	LDA #0
	CMP player_fire_timer
     BCS .skipL0195
.condpart82
	LDA #76
	CMP missile0x
     BCS .skip81then
.condpart83
	DEC missile0x
.skip81then
.skipL0195
.L0196 ;;line 444;;  if player_fire_timer > 50 then AUDV1 = 0

	LDA #50
	CMP player_fire_timer
     BCS .skipL0196
.condpart84
	LDA #0
	STA AUDV1
.skipL0196
.
 ;;line 445;; 

.
 ;;line 446;; 

.L0197 ;;line 447;;  if powerup_flag = 1 then missile1_y = 0.0 :  missile1y = 0 :  missile1x = 0 :  goto skip_m1

	LDA powerup_flag
	CMP #1
     BNE .skipL0197
.condpart85
	LDX #0
	STX j
	LDA #0
	STA missile1_y
	LDA #0
	STA missile1y
	STA missile1x
 jmp .skip_m1
.skipL0197
.
 ;;line 448;; 

.
 ;;line 449;; 

.L0198 ;;line 450;;  if mis_int  >  0 then goto process_m1

	LDA #0
	CMP mis_int
     BCS .skipL0198
.condpart86
 jmp .process_m1
.skipL0198
.L0199 ;;line 451;;  if enemy_hit_flag  >  0 then goto skip_m1

	LDA #0
	CMP enemy_hit_flag
     BCS .skipL0199
.condpart87
 jmp .skip_m1
.skipL0199
.L0200 ;;line 452;;  if m  <  32 then goto skip_m1

	LDA m
	CMP #32
     BCS .skipL0200
.condpart88
 jmp .skip_m1
.skipL0200
.L0201 ;;line 453;;  if m  >  35 then goto skip_m1

	LDA #35
	CMP m
     BCS .skipL0201
.condpart89
 jmp .skip_m1
.skipL0201
.
 ;;line 454;; 

.
 ;;line 455;; 

.L0202 ;;line 456;;  if mis_int = 0 then missile1_y = enemy_y  :  m1_x_pos = enemy_x  +  4  :  AUDF1 = 13 : AUDC1 = 1 : AUDV1 = 9

	LDA mis_int
	CMP #0
     BNE .skipL0202
.condpart90
	LDX n
	STX j
	LDA enemy_y
	STA missile1_y
	LDA enemy_x
	CLC
	ADC #4
	STA m1_x_pos
	LDA #13
	STA AUDF1
	LDA #1
	STA AUDC1
	LDA #9
	STA AUDV1
.skipL0202
.
 ;;line 457;; 

.process_m1
 ;;line 458;; process_m1

.L0203 ;;line 459;;  if mis_int  >  48 then AUDV1 = 0

	LDA #48
	CMP mis_int
     BCS .skipL0203
.condpart91
	LDA #0
	STA AUDV1
.skipL0203
.
 ;;line 460;; 

.L0204 ;;line 461;;  if mis_int  >  100 then missile1_y = 0.0  :  missile1y = 0  :  missile1x = 0  :  goto skip_m1

	LDA #100
	CMP mis_int
     BCS .skipL0204
.condpart92
	LDX #0
	STX j
	LDA #0
	STA missile1_y
	LDA #0
	STA missile1y
	STA missile1x
 jmp .skip_m1
.skipL0204
.
 ;;line 462;; 

.
 ;;line 463;; 

.L0205 ;;line 464;;  missile1y = missile1_y  :  missile1x = m1_x_pos  :  missile1height = 6

	LDA missile1_y
	STA missile1y
	LDA m1_x_pos
	STA missile1x
	LDA #6
	STA missile1height
.L0206 ;;line 465;;  missile1_y = missile1_y  +  2.0

	LDA j
	CLC 
	ADC #0
	STA j
	LDA missile1_y
	ADC #2
	STA missile1_y
.
 ;;line 466;; 

.skip_m1
 ;;line 467;; skip_m1

.L0207 ;;line 468;;  temp1 = color_cycler  &  1

	LDA color_cycler
	AND #1
	STA temp1
.L0208 ;;line 469;;  if temp1 = 1 then goto main

	LDA temp1
	CMP #1
     BNE .skipL0208
.condpart93
 jmp .main
.skipL0208
.
 ;;line 470;; 

.
 ;;line 471;; 

.
 ;;line 472;; 

.
 ;;line 473;; 

.
 ;;line 474;; 

.L0209 ;;line 475;;  if player_x  <  18 then player_x = player_x  +  2  :  if m  >= 1 then enemy_y = enemy_y - 0.5

	LDA player_x
	CMP #18
     BCS .skipL0209
.condpart94
	LDA player_x
	CLC
	ADC #2
	STA player_x
	LDA m
	CMP #1
     BCC .skip93then
.condpart95
	LDA n
	SEC 
	SBC #128
	STA n
	LDA enemy_y
	SBC #0
	STA enemy_y
.skip93then
.skipL0209
.L0210 ;;line 476;;  if player_x  >  134 then player_x = player_x  -  2  :  if m  >= 1 then enemy_y = enemy_y - 0.5

	LDA #134
	CMP player_x
     BCS .skipL0210
.condpart96
	LDA player_x
	SEC
	SBC #2
	STA player_x
	LDA m
	CMP #1
     BCC .skip95then
.condpart97
	LDA n
	SEC 
	SBC #128
	STA n
	LDA enemy_y
	SBC #0
	STA enemy_y
.skip95then
.skipL0210
.
 ;;line 477;; 

.
 ;;line 478;; 

.L0211 ;;line 479;;  if !collision(player1,player0) then goto skip_p1p0_col

	bit 	CXPPMM
	BMI .skipL0211
.condpart98
 jmp .skip_p1p0_col
.skipL0211
.L0212 ;;line 480;;  if color_flag = 1 then gosub addhitpoints  :  goto damageskip

	LDA color_flag
	CMP #1
     BNE .skipL0212
.condpart99
 jsr .addhitpoints
 jmp .damageskip
.skipL0212
.L0213 ;;line 481;;  enemy_hp = enemy_hp + 1  :  if enemy_hp = 60 then pause_timer = 120 :  goto thisisit

	INC enemy_hp
	LDA enemy_hp
	CMP #60
     BNE .skipL0213
.condpart100
	LDA #120
	STA pause_timer
 jmp .thisisit
.skipL0213
.L0214 ;;line 482;;  if m  >=  1 then enemy_y = enemy_y - 1.5

	LDA m
	CMP #1
     BCC .skipL0214
.condpart101
	LDA n
	SEC 
	SBC #128
	STA n
	LDA enemy_y
	SBC #1
	STA enemy_y
.skipL0214
.L0215 ;;line 483;;  goto damageskip

 jmp .damageskip
.skip_p1p0_col
 ;;line 484;; skip_p1p0_col

.
 ;;line 485;; 

.
 ;;line 486;; 

.L0216 ;;line 487;;  if collision(player1,missile0) then missile0y = 1  :  goto carhit

	bit 	CXM0P
	BPL .skipL0216
.condpart102
	LDA #1
	STA missile0y
 jmp .carhit
.skipL0216
.
 ;;line 488;; 

.
 ;;line 489;; 

.L0217 ;;line 490;;  if !collision(player0,missile1) then goto skip_m1p0_col

	bit 	CXM1P
	BMI .skipL0217
.condpart103
 jmp .skip_m1p0_col
.skipL0217
.L0218 ;;line 491;;  enemy_hp = enemy_hp + 1

	INC enemy_hp
.L0219 ;;line 492;;  if player_x  >  75 then player_x = player_x - 2 else player_x = player_x + 2

	LDA #75
	CMP player_x
     BCS .skipL0219
.condpart104
	LDA player_x
	SEC
	SBC #2
	STA player_x
 jmp .skipelse2
.skipL0219
	LDA player_x
	CLC
	ADC #2
	STA player_x
.skipelse2
.L0220 ;;line 493;;  if enemy_hp = 60 then pause_timer = 160 :  goto thisisit

	LDA enemy_hp
	CMP #60
     BNE .skipL0220
.condpart105
	LDA #160
	STA pause_timer
 jmp .thisisit
.skipL0220
.skip_m1p0_col
 ;;line 494;; skip_m1p0_col

.
 ;;line 495;; 

.damageskip
 ;;line 496;; damageskip

.
 ;;line 497;; 

.L0221 ;;line 498;;  if !collision(player0,ball) then goto skip_ball_col

	bit 	CXP0FB
	BVS .skipL0221
.condpart106
 jmp .skip_ball_col
.skipL0221
.L0222 ;;line 499;;  if enemy_x  >  90 then player_x = player_x - 6 else player_x = player_x + 6

	LDA #90
	CMP enemy_x
     BCS .skipL0222
.condpart107
	LDA player_x
	SEC
	SBC #6
	STA player_x
 jmp .skipelse3
.skipL0222
	LDA player_x
	CLC
	ADC #6
	STA player_x
.skipelse3
.skip_ball_col
 ;;line 500;; skip_ball_col

.
 ;;line 501;; 

.L0223 ;;line 502;;  score = score + 20

	SED
	CLC
	LDA score+2
	ADC #$20
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.L0224 ;;line 503;;  goto main

 jmp .main
.
 ;;line 504;; 

.playerfires
 ;;line 505;; playerfires

.L0225 ;;line 506;;  if !switchleftb then missile0x = player_x + 10 else missile0x = player_x + 4

 bit SWCHB
	BVC .skipL0225
.condpart108
	LDA player_x
	CLC
	ADC #10
	STA missile0x
 jmp .skipelse4
.skipL0225
	LDA player_x
	CLC
	ADC #4
	STA missile0x
.skipelse4
.L0226 ;;line 507;;  player_fire_timer = 80  :  missile0y = 75

	LDA #80
	STA player_fire_timer
	LDA #75
	STA missile0y
.L0227 ;;line 508;;  missile0height = 6

	LDA #6
	STA missile0height
.L0228 ;;line 509;;  goto main

 jmp .main
.
 ;;line 510;; 

.thisisit
 ;;line 511;; thisisit

.L0229 ;;line 512;;  AUDV0 = 0

	LDA #0
	STA AUDV0
.L0230 ;;line 513;;  goto eog

 jmp .eog
.
 ;;line 514;; 

.carhit
 ;;line 515;; carhit

.
 ;;line 516;; 

.L0231 ;;line 517;;  if enemy_hit_flag = 1 then goto both_cars_dead

	LDA enemy_hit_flag
	CMP #1
     BNE .skipL0231
.condpart109
 jmp .both_cars_dead
.skipL0231
.
 ;;line 518;; 

.L0232 ;;line 519;;  score = score  +  1000  :  missile0y = 0  :  player_fire_timer = 0

	SED
	CLC
	LDA score+1
	ADC #$10
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
	LDA #0
	STA missile0y
	STA player_fire_timer
.L0233 ;;line 520;;  enemy_hit_flag = 1

	LDA #1
	STA enemy_hit_flag
.
 ;;line 521;; 

.
 ;;line 522;; 

.L0234 ;;line 523;;  temp1 = enemy_x  +  8

	LDA enemy_x
	CLC
	ADC #8
	STA temp1
.L0235 ;;line 524;;  if missile0x  <  temp1 then enemy_x = enemy_x  +  16

	LDA missile0x
	CMP temp1
     BCS .skipL0235
.condpart110
	LDA enemy_x
	CLC
	ADC #16
	STA enemy_x
.skipL0235
.
 ;;line 525;; 

.L0236 ;;line 526;;  temp1 = rand

 sta temp7
 lda #>(ret_point11-1)
 pha
 lda #<(ret_point11-1)
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
ret_point11
	STA temp1
.L0237 ;;line 527;;  if joy0up then goto no_powerup

 lda #$10
 bit SWCHA
	BNE .skipL0237
.condpart111
 jmp .no_powerup
.skipL0237
.L0238 ;;line 528;;  if temp1  >  40 then goto no_powerup

	LDA #40
	CMP temp1
     BCS .skipL0238
.condpart112
 jmp .no_powerup
.skipL0238
.L0239 ;;line 529;;  if m  <=  1 then goto no_powerup

	LDA #1
	CMP m
     BCC .skipL0239
.condpart113
 jmp .no_powerup
.skipL0239
.
 ;;line 530;; 

.L0240 ;;line 531;;  gosub powerup

 jsr .powerup
.L0241 ;;line 532;;  color_flag = 1

	LDA #1
	STA color_flag
.L0242 ;;line 533;;  goto main

 jmp .main
.
 ;;line 534;; 

.both_cars_dead
 ;;line 535;; both_cars_dead

.L0243 ;;line 536;;  score = score  +  1000  :  missile0y = 0  :  player_fire_timer = 0

	SED
	CLC
	LDA score+1
	ADC #$10
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
	LDA #0
	STA missile0y
	STA player_fire_timer
.L0244 ;;line 537;;  enemy_hit_flag = 2

	LDA #2
	STA enemy_hit_flag
.L0245 ;;line 538;;  goto main

 jmp .main
.
 ;;line 539;; 

.no_powerup
 ;;line 540;; no_powerup

.L0246 ;;line 541;;  goto main

 jmp .main
.
 ;;line 542;; 

.eog
 ;;line 543;; eog

.L0247 ;;line 544;;  if pause_timer < 1 then pause_timer = 88 : goto eog2

	LDA pause_timer
	CMP #1
     BCS .skipL0247
.condpart114
	LDA #88
	STA pause_timer
 jmp .eog2
.skipL0247
.L0248 ;;line 545;;  pause_timer = pause_timer - 1

	DEC pause_timer
.L0249 ;;line 546;;  gosub explode

 jsr .explode
.L0250 ;;line 547;;  COLUPF = pause_timer

	LDA pause_timer
	STA COLUPF
.L0251 ;;line 548;;  AUDF0 = 160 - pause_timer : AUDC0 = 1 : AUDV0 = 6

	LDA #160
	SEC
	SBC pause_timer
	STA AUDF0
	LDA #1
	STA AUDC0
	LDA #6
	STA AUDV0
.L0252 ;;line 549;;  drawscreen

 sta temp7
 lda #>(ret_point12-1)
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
 ldx #4
 jmp BS_jsr
ret_point12
.L0253 ;;line 550;;  goto eog

 jmp .eog
.
 ;;line 551;; 

.eog2
 ;;line 552;; eog2

.L0254 ;;line 553;;  COLUP0 = 68

	LDA #68
	STA COLUP0
.L0255 ;;line 554;;  AUDV0 = 0

	LDA #0
	STA AUDV0
.L0256 ;;line 555;;  pause_timer = pause_timer - 1

	DEC pause_timer
.L0257 ;;line 556;;  scroll_timer = scroll_timer + 1

	INC scroll_timer
.L0258 ;;line 557;;  if scroll_timer = 2 then scroll_timer = 0

	LDA scroll_timer
	CMP #2
     BNE .skipL0258
.condpart115
	LDA #0
	STA scroll_timer
.skipL0258
.L0259 ;;line 558;;  player0y = pause_timer

	LDA pause_timer
	STA player0y
.L0260 ;;line 559;;  player1y = 0

	LDA #0
	STA player1y
.L0261 ;;line 560;;  missile0y = 0

	LDA #0
	STA missile0y
.L0262 ;;line 561;;  missile1y = 0

	LDA #0
	STA missile1y
.L0263 ;;line 562;;  COLUPF = 160

	LDA #160
	STA COLUPF
.L0264 ;;line 563;;  drawscreen

 sta temp7
 lda #>(ret_point13-1)
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
 ldx #4
 jmp BS_jsr
ret_point13
.L0265 ;;line 564;;  if pause_timer < 1 then pfclear : goto init

	LDA pause_timer
	CMP #1
     BCS .skipL0265
.condpart116
	LDA #0
 sta temp7
 lda #>(ret_point14-1)
 pha
 lda #<(ret_point14-1)
 pha
 lda #>(pfclear-1)
 pha
 lda #<(pfclear-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #4
 jmp BS_jsr
ret_point14
 jmp .init
.skipL0265
.L0266 ;;line 565;;  ballx = 0 : bally = 0

	LDA #0
	STA ballx
	STA bally
.L0267 ;;line 566;;  enemy_y = 0.0

	LDX #0
	STX n
	LDA #0
	STA enemy_y
.L0268 ;;line 567;;  scroll_counter = 0

	LDA #0
	STA scroll_counter
.L0269 ;;line 568;;  goto eog2

 jmp .eog2
.
 ;;line 569;; 

.
 ;;line 570;; 

.
 ;;line 571;; 

.
 ;;line 572;; 

.ScaleEnemyCar
 ;;line 573;; ScaleEnemyCar

.
 ;;line 574;; 

.L0270 ;;line 575;;  if enemy_hit_flag = 2 then goto mnc_blank

	LDA enemy_hit_flag
	CMP #2
     BNE .skipL0270
.condpart117
 jmp .mnc_blank
.skipL0270
.
 ;;line 576;; 

.L0271 ;;line 577;;  if m  >  80 then goto mnc6

	LDA #80
	CMP m
     BCS .skipL0271
.condpart118
 jmp .mnc6
.skipL0271
.L0272 ;;line 578;;  if m  >  64 then goto mnc5

	LDA #64
	CMP m
     BCS .skipL0272
.condpart119
 jmp .mnc5
.skipL0272
.L0273 ;;line 579;;  if m  >  48 then goto mnc4

	LDA #48
	CMP m
     BCS .skipL0273
.condpart120
 jmp .mnc4
.skipL0273
.L0274 ;;line 580;;  if m  >  32 then goto mnc3

	LDA #32
	CMP m
     BCS .skipL0274
.condpart121
 jmp .mnc3
.skipL0274
.L0275 ;;line 581;;  if m  >  16 then goto mnc2

	LDA #16
	CMP m
     BCS .skipL0275
.condpart122
 jmp .mnc2
.skipL0275
.L0276 ;;line 582;;  goto mnc1

 jmp .mnc1
.
 ;;line 583;; 

.mnc_blank
 ;;line 584;; mnc_blank

.L0277 ;;line 585;;  player1:

	LDX #<playerL0277_1
	STX player1pointerlo
	LDA #>playerL0277_1
	STA player1pointerhi
	LDA #7
	STA player1height
.L0278 ;;line 595;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 596;; 

.mnc1
 ;;line 597;; mnc1

.L0279 ;;line 598;;  player1:

	LDX #<playerL0279_1
	STX player1pointerlo
	LDA #>playerL0279_1
	STA player1pointerhi
	LDA #7
	STA player1height
.L0280 ;;line 608;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 609;; 

.mnc2
 ;;line 610;; mnc2

.L0281 ;;line 611;;  player1:

	LDX #<playerL0281_1
	STX player1pointerlo
	LDA #>playerL0281_1
	STA player1pointerhi
	LDA #7
	STA player1height
.L0282 ;;line 621;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 622;; 

.mnc3
 ;;line 623;; mnc3

.L0283 ;;line 624;;  player1:

	LDX #<playerL0283_1
	STX player1pointerlo
	LDA #>playerL0283_1
	STA player1pointerhi
	LDA #7
	STA player1height
.L0284 ;;line 634;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 635;; 

.mnc4
 ;;line 636;; mnc4

.L0285 ;;line 637;;  player1:

	LDX #<playerL0285_1
	STX player1pointerlo
	LDA #>playerL0285_1
	STA player1pointerhi
	LDA #7
	STA player1height
.L0286 ;;line 647;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 648;; 

.mnc5
 ;;line 649;; mnc5

.L0287 ;;line 650;;  player1:

	LDX #<playerL0287_1
	STX player1pointerlo
	LDA #>playerL0287_1
	STA player1pointerhi
	LDA #7
	STA player1height
.L0288 ;;line 660;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 661;; 

.mnc6
 ;;line 662;; mnc6

.L0289 ;;line 663;;  player1:

	LDX #<playerL0289_1
	STX player1pointerlo
	LDA #>playerL0289_1
	STA player1pointerhi
	LDA #7
	STA player1height
.L0290 ;;line 673;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 674;; 

.powerup
 ;;line 675;; powerup

.L0291 ;;line 676;;  powerup_flag = 1

	LDA #1
	STA powerup_flag
.L0292 ;;line 677;;  missile0y = 0 :  player_fire_timer = 0

	LDA #0
	STA missile0y
	STA player_fire_timer
.L0293 ;;line 678;;  player1:                

	LDX #<playerL0293_1
	STX player1pointerlo
	LDA #>playerL0293_1
	STA player1pointerhi
	LDA #9
	STA player1height
.L0294 ;;line 690;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 691;; 

.addhitpoints
 ;;line 692;; addhitpoints

.L0295 ;;line 693;;  if powerup_flag = 1 then enemy_hp = enemy_hp - 1

	LDA powerup_flag
	CMP #1
     BNE .skipL0295
.condpart123
	DEC enemy_hp
.skipL0295
.L0296 ;;line 694;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 695;; 

.explode
 ;;line 696;; explode

.L0297 ;;line 697;;  COLUPF = 70

	LDA #70
	STA COLUPF
.L0298 ;;line 698;;  COLUP0 = 64

	LDA #64
	STA COLUP0
.L0299 ;;line 699;;  player0:

	LDX #<playerL0299_0
	STX player0pointerlo
	LDA #>playerL0299_0
	STA player0pointerhi
	LDA #9
	STA player0height
.L0300 ;;line 711;;  return

	tsx
	lda 2,x ; check return address
	eor #(>*) ; vs. current PCH
	and #$E0 ;  mask off all but top 3 bits
	beq *+5 ; if equal, do normal return
	JMP BS_return
	RTS
.
 ;;line 712;; 

.
 ;;line 713;; 

.
 ;;line 714;; 

.
 ;;line 715;; 

.L0301 ;;line 716;;  data RoadLeftX

	JMP .skipL0301
RoadLeftX
	.byte  15, 14, 13, 11, 9, 7, 5, 3, 1, 0

.skipL0301
.
 ;;line 719;; 

.L0302 ;;line 720;;  data RoadRightX

	JMP .skipL0302
RoadRightX
	.byte  16, 17, 18, 20, 22, 24, 26, 28, 30, 31

.skipL0302
.
 ;;line 723;; 

.
 ;;line 724;; 

.
 ;;line 725;; 

.
 ;;line 726;; 

.L0303 ;;line 727;;  data BoundsLeft

	JMP .skipL0303
BoundsLeft
	.byte  74, 70, 64, 56, 48, 40, 32, 24, 18, 16

.skipL0303
.
 ;;line 730;; 

.L0304 ;;line 731;;  data BoundsRight

	JMP .skipL0304
BoundsRight
	.byte  78, 82, 88, 96, 104, 112, 120, 128, 134, 136

.skipL0304
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
 ifconst pfres
 if (<*) > 235-pfres
	repeat (265+pfres-<*)
	.byte 0
	repend
	endif
   if (<*) < (pfres+9)
	repeat ((pfres+9)-(<*))
	.byte 0
	repend
   endif
 else
   if (<*) > 223
	repeat (277-<*)
	.byte 0
	repend
   endif
   if (<*) < 21
	repeat (21-(<*))
	.byte 0
	repend
   endif
 endif
pfcolorlabel18
 .byte  4
 .byte  5
 .byte  6
 .byte  7
 .byte  8
 .byte  9
 .byte  10
 .byte  11
 .byte  12
 .byte  13
 if (<*) > (<(*+72))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL074_1
	.byte  %00100011
	.byte  %00100100
	.byte  %00111110
	.byte  %00100001
	.byte  %00111110
	.byte  %00000000
	.byte  %00000000
	.byte  %00011111
	.byte  %00100000
	.byte  %00111100
	.byte  %00100000
	.byte  %00011111
	.byte  %00000000
	.byte  %00000000
	.byte  %00000100
	.byte  %00000100
	.byte  %00000100
	.byte  %00111111
	.byte  %00000000
	.byte  %00000000
	.byte  %00111111
	.byte  %00000001
	.byte  %00111111
	.byte  %00100000
	.byte  %00111111
	.byte  %00000000
	.byte  %00000000
	.byte  %00100001
	.byte  %00111111
	.byte  %00100001
	.byte  %00011110
	.byte  %00000000
	.byte  %00000000
	.byte  %00111111
	.byte  %00100000
	.byte  %00100000
	.byte  %00100000
	.byte  %00000000
	.byte  %00000000
	.byte  %00111110
	.byte  %00100001
	.byte  %00111110
	.byte  %00100001
	.byte  %00111110
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00111110
	.byte  %00100001
	.byte  %00100001
	.byte  %00111110
	.byte  %00000000
	.byte  %00000000
	.byte  %00100001
	.byte  %00111111
	.byte  %00100001
	.byte  %00011110
	.byte  %00000000
	.byte  %00000000
	.byte  %00111111
	.byte  %00100001
	.byte  %00100001
	.byte  %00111111
	.byte  %00000000
	.byte  %00000000
	.byte  %00100011
	.byte  %00100100
	.byte  %00111110
	.byte  %00100001
	.byte  %00111110
 if (<*) > (<(*+9))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL075_0
	.byte  %01011001
	.byte  %10111110
	.byte  %01111101
	.byte  %10111110
	.byte  %01111101
	.byte  %10111110
	.byte  %01111101
	.byte  %10011010
	.byte  %01111110
	.byte  %01011010
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0162_0
	.byte  %01111101
	.byte  %10111110
	.byte  %01111101
	.byte  %10011010
	.byte  %01111110
	.byte  %01011010
 if (<*) > (<(*+5))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0164_0
	.byte  %10111110
	.byte  %01111101
	.byte  %10111110
	.byte  %01011001
	.byte  %01111110
	.byte  %01011010
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0277_1
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0279_1
	.byte  %00000000
	.byte  %00000000
	.byte  %00011000
	.byte  %00011000
	.byte  %00011000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0281_1
	.byte  %00000000
	.byte  %00011000
	.byte  %00011000
	.byte  %00011000
	.byte  %00011000
	.byte  %00011000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0283_1
	.byte  %00011000
	.byte  %00111100
	.byte  %00011000
	.byte  %00111100
	.byte  %00111100
	.byte  %00011000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0285_1
	.byte  %00011000
	.byte  %01111110
	.byte  %00011000
	.byte  %00111100
	.byte  %01111110
	.byte  %00011000
	.byte  %00011000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0287_1
	.byte  %00011000
	.byte  %11111111
	.byte  %00011000
	.byte  %00111100
	.byte  %11111111
	.byte  %00011000
	.byte  %00011000
	.byte  %00000000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0289_1
	.byte  %10011001
	.byte  %11111111
	.byte  %10011001
	.byte  %00011000
	.byte  %10111101
	.byte  %11111111
	.byte  %10011001
	.byte  %00111100
 if (<*) > (<(*+9))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0293_1
	.byte  %11111111 
	.byte  %10000001
	.byte  %10011001 
	.byte  %10011001 
	.byte  %10111101
	.byte  %10111101 
	.byte  %10011001 
	.byte  %10011001 
	.byte  %10000001
	.byte  %11111111
 if (<*) > (<(*+9))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL0299_0
	.byte  %01111110
	.byte  %01000010
	.byte  %00111100
	.byte  %10100101
	.byte  %11110111
	.byte  %00111000
	.byte  %10001100
	.byte  %10011001
	.byte  %01101110
	.byte  %00000000
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left in bank 4")
 endif 
ECHOFIRST = 1
 
 
 
