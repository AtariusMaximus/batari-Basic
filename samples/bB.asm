game
.L00 ;;line 1;;  include fixed_point_math.asm

.L01 ;;line 2;;  rem Zombie Chase

.L02 ;;line 3;;  rem A fun game that may help you learn batari Basic!

.L03 ;;line 4;;  rem

.
 ;;line 5;; 

.L04 ;;line 6;;  rem timed game, 16 levels

.L05 ;;line 7;;  rem Each level lasts about one minute

.L06 ;;line 8;;  rem you must score 1000 points to move on

.L07 ;;line 9;;  rem COLOR/BW switch selects joystick or DC

.L08 ;;line 10;;  rem left difficulty A=stop on collision; B=slow down on collision

.L09 ;;line 11;;  rem right difficulty A=L/R border; B=no border

.
 ;;line 12;; 

.L010 ;;line 13;;  set kernel_options no_blank_lines player1colors

.L011 ;;line 14;;  playfieldpos = 4

	LDA #4
	STA playfieldpos
.L012 ;;line 15;;  set smartbranching on

.
 ;;line 16;; 

.L013 ;;line 17;;  dim carpos = a

.L014 ;;line 18;;  dim turndelay = b

.L015 ;;line 19;;  dim collcount = b

.L016 ;;line 20;;  dim carframe = c

.L017 ;;line 21;;  dim gamebits = e

.L018 ;;line 22;;  dim velocity = f.f

.L019 ;;line 23;;  dim xvelocity = g.g

.L020 ;;line 24;;  dim yvelocity = h.h

.L021 ;;line 25;;  dim tempvel = i.i

.L022 ;;line 26;;  dim finalxvelocity = l.l

.L023 ;;line 27;;  dim finalyvelocity = m.m

.
 ;;line 28;; 

.L024 ;;line 29;;  dim p0x = player0x.j

.L025 ;;line 30;;  dim p0y = player0y.k

.L026 ;;line 31;;  dim last = n

.
 ;;line 32;; 

.L027 ;;line 33;;  dim scadd = o

.L028 ;;line 34;;  dim timer1 = p

.L029 ;;line 35;;  dim timer2 = q

.L030 ;;line 36;;  dim level = q

.L031 ;;line 37;;  dim testvar = u

.L032 ;;line 38;;  rem level bits

.L033 ;;line 39;;  rem bit 0: zombie speed (slow/fast)

.L034 ;;line 40;;  rem bit 1: zombie movement (random/run away)

.L035 ;;line 41;;  rem bit 2: car speed (slow/fast)

.L036 ;;line 42;;  rem bit 3: road surface (pavement/ice)

.
 ;;line 43;; 

.L037 ;;line 44;;  dim tempvel8 = temp1.temp2

.
 ;;line 45;; 

.L038 ;;line 46;;  dim zombievel = temp5.temp6

.L039 ;;line 47;;  dim zombiexvel = r

.L040 ;;line 48;;  dim zombieyvel = s

.L041 ;;line 49;;  dim zombiefinalxvel = t

.L042 ;;line 50;;  dim zombiefinalyvel = u

.L043 ;;line 51;;  dim zombiexpos = player1x.v

.L044 ;;line 52;;  dim zombieypos = player1y.w

.
 ;;line 53;; 

.L045 ;;line 54;;  dim sc1 = score

.L046 ;;line 55;;  dim sc2 = score + 1

.
 ;;line 56;; 

.L047 ;;line 57;;  rem 

.L048 ;;line 58;;  rem velocity doesn't change when direction changes

.L049 ;;line 59;;  rem xvelocity and yvelocity change

.L050 ;;line 60;;  rem they change instantly when velocity <= 0.5 max

.L051 ;;line 61;;  rem they change gradually when velocity > 0.5 max

.
 ;;line 62;; 

.L052 ;;line 63;;  carpos = 4

	LDA #4
	STA carpos
.L053 ;;line 64;;  rem turndelay = 0

.L054 ;;line 65;;  player0x = 40  :  player0y = 40

	LDA #40
	STA player0x
	STA player0y
.startLoop
 ;;line 66;; startLoop

.L055 ;;line 67;;  if turndelay{1} then player1: 

	LDA turndelay
	AND #2
	BEQ .skipL055
.condpart0
	LDX #<player0then_1
	STX player1pointerlo
	LDA #>player0then_1
	STA player1pointerhi
	LDA #7
	STA player1height
.skipL055
.L056 ;;line 77;;  if !turndelay{1} then player1:

	LDA turndelay
	AND #2
	BNE .skipL056
.condpart1
	LDX #<player1then_1
	STX player1pointerlo
	LDA #>player1then_1
	STA player1pointerhi
	LDA #7
	STA player1height
.skipL056
.
 ;;line 87;; 

.L057 ;;line 88;;  player1color:

	LDX #<playercolorL057_1
	STX player1color
	LDA #>playercolorL057_1
	STA player1color+1
.L058 ;;line 98;;  scorecolor = 30

	LDA #30
	STA scorecolor
.L059 ;;line 99;;  if switchreset then reboot

 lda #1
 bit SWCHB
	BNE .skipL059
.condpart2
	JMP ($FFFC)
.skipL059
.L060 ;;line 100;;  if switchrightb then PF0 = 0 else PF0 = 63

 bit SWCHB
	BMI .skipL060
.condpart3
	LDA #0
	STA PF0
 jmp .skipelse0
.skipL060
	LDA #63
	STA PF0
.skipelse0
.L061 ;;line 101;;  COLUPF =  ( level  *  4  *  4 )  ^ 244

; complex statement detected
	LDA level
	asl
	asl
	asl
	asl
	EOR #244
	STA COLUPF
.L062 ;;line 102;;  if gamebits{7} then gamerunning

	BIT gamebits
 if ((* - .gamerunning) < 127) && ((* - .gamerunning) > -128)
	bmi .gamerunning
 else
	bpl .0skipgamerunning
	jmp .gamerunning
.0skipgamerunning
 endif
.
 ;;line 103;; 

.L063 ;;line 104;;  if !joy0fire then

 bit INPT4
	BPL .skipL063
.condpart4
.L064 ;;line 105;;  timer1 = timer1 + 1

	INC timer1
.L065 ;;line 106;;  else

	jmp .skipblockend1
.skipL063
.L066 ;;line 107;;  COLUBK = $44

	LDA #$44
	STA COLUBK
.L067 ;;line 108;;  endif

.skipblockend1
.
 ;;line 109;; 

.L068 ;;line 110;;  if timer1 = 0 then nostartgame

	LDA timer1
	CMP #0
 if ((* - .nostartgame) < 127) && ((* - .nostartgame) > -128)
	BEQ .nostartgame
 else
	bne .1skipnostartgame
	jmp .nostartgame
.1skipnostartgame
 endif
.L069 ;;line 111;;  if joy0fire then score = 0 : timer1 = 0 : timer2 = 0 : gamebits{7} = 1 : pfclear

 bit INPT4
	BMI .skipL069
.condpart5
	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$00
	STA score
	LDA #0
	STA timer1
	STA timer2
	LDA gamebits
	ORA #128
	STA gamebits
	LDA #0
 jsr pfclear
.skipL069
.nostartgame
 ;;line 112;; nostartgame

.L070 ;;line 113;;  AUDV0 = 0 : AUDV1 = 0 : goto hitwall

	LDA #0
	STA AUDV0
	STA AUDV1
 jmp .hitwall
.gamerunning
 ;;line 114;; gamerunning

.L071 ;;line 115;;  timer1 = timer1 + 1 : if timer1 = 0 then timer2 = timer2 + $10

	INC timer1
	LDA timer1
	CMP #0
     BNE .skipL071
.condpart6
	LDA timer2
	CLC
	ADC #$10
	STA timer2
.skipL071
.L072 ;;line 116;;  if timer2 < $C0 then notendlevel

	LDA timer2
	CMP #$C0
 if ((* - .notendlevel) < 127) && ((* - .notendlevel) > -128)
	bcc .notendlevel
 else
	bcs .2skipnotendlevel
	jmp .notendlevel
.2skipnotendlevel
 endif
.L073 ;;line 117;;  temp1 = level  &  $0F

	LDA level
	AND #$0F
	STA temp1
.L074 ;;line 118;;  temp2 = sc1 * 4 * 4 + sc2 / 4 / 4

; complex statement detected
	LDA sc1
	asl
	asl
	asl
	asl
	PHA
	LDA sc2
	lsr
	lsr
	lsr
	lsr
	TSX
	INX
	TXS
	CLC
	ADC $0,x
	STA temp2
.L075 ;;line 119;;  temp1 = level  &  $0F

	LDA level
	AND #$0F
	STA temp1
.L076 ;;line 120;;  if temp2 < gonextlevel[temp1]  &&  timer1{5} then scorecolor = 64

	LDA temp2
	LDX temp1
	CMP gonextlevel,x
     BCS .skipL076
.condpart7
	LDA timer1
	AND #32
	BEQ .skip6then
.condpart8
	LDA #64
	STA scorecolor
.skip6then
.skipL076
.L077 ;;line 121;;  if timer2 < $F0 then notendlevel

	LDA timer2
	CMP #$F0
 if ((* - .notendlevel) < 127) && ((* - .notendlevel) > -128)
	bcc .notendlevel
 else
	bcs .3skipnotendlevel
	jmp .notendlevel
.3skipnotendlevel
 endif
.L078 ;;line 122;;  if temp2 >= gonextlevel[temp1] then level = level + $11 : pfclear else gamebits{7} = 0

	LDA temp2
	LDX temp1
	CMP gonextlevel,x
     BCC .skipL078
.condpart9
	LDA level
	CLC
	ADC #$11
	STA level
	LDA #0
 jsr pfclear
 jmp .skipelse2
.skipL078
	LDA gamebits
	AND #127
	STA gamebits
.skipelse2
.notendlevel
 ;;line 123;; notendlevel

.L079 ;;line 124;;  gosub movezombie

 jsr .movezombie
.L080 ;;line 125;;  if collcount < 16 then skipcrashsound

	LDA collcount
	CMP #16
 if ((* - .skipcrashsound) < 127) && ((* - .skipcrashsound) > -128)
	bcc .skipcrashsound
 else
	bcs .4skipskipcrashsound
	jmp .skipcrashsound
.4skipskipcrashsound
 endif
.L081 ;;line 126;;  collcount = collcount - 16

	LDA collcount
	SEC
	SBC #16
	STA collcount
.L082 ;;line 127;;  AUDV0 = collcount / 4 / 4

; complex statement detected
	LDA collcount
	lsr
	lsr
	lsr
	lsr
	STA AUDV0
.L083 ;;line 128;;  AUDC0 = 8

	LDA #8
	STA AUDC0
.L084 ;;line 129;;  if collcount{3} then AUDF0 =  ( collcount & rand )  / 8 else AUDF0 = 17

	LDA collcount
	AND #8
	BEQ .skipL084
.condpart10
; complex statement detected
	LDA collcount
	AND rand
	lsr
	lsr
	lsr
	STA AUDF0
 jmp .skipelse3
.skipL084
	LDA #17
	STA AUDF0
.skipelse3
.L085 ;;line 130;;  goto skipenginesound

 jmp .skipenginesound
.skipcrashsound
 ;;line 131;; skipcrashsound

.L086 ;;line 132;;  collcount{3} = 0

	LDA collcount
	AND #247
	STA collcount
.L087 ;;line 133;;  AUDV0 = 10 : AUDC0 = 2

	LDA #10
	STA AUDV0
	LDA #2
	STA AUDC0
.L088 ;;line 134;;  AUDF0 = 18 - f / 4 : if f > 67 then AUDF0 = 1

; complex statement detected
	LDA #18
	PHA
	LDA f
	lsr
	lsr
	TSX
	STA $0,x
	PLA
	SEC
	SBC $0,x
	STA AUDF0
	LDA #67
	CMP f
     BCS .skipL088
.condpart11
	LDA #1
	STA AUDF0
.skipL088
.skipenginesound
 ;;line 135;; skipenginesound

.
 ;;line 136;; 

.L089 ;;line 137;;  if joy0fire then velocity = velocity + 0.0625 : goto nomove1

 bit INPT4
	BMI .skipL089
.condpart12
	CLC
	LDA velocity
	ADC #1
	STA velocity
 jmp .nomove1
.skipL089
.L090 ;;line 138;;  gamebits = gamebits ^ %00000100

	LDA gamebits
	EOR #%00000100
	STA gamebits
.L091 ;;line 139;;  if gamebits{2} then nomove1

	LDA gamebits
	AND #4
 if ((* - .nomove1) < 127) && ((* - .nomove1) > -128)
	BNE .nomove1
 else
	beq .5skipnomove1
	jmp .nomove1
.5skipnomove1
 endif
.L092 ;;line 140;;  velocity = velocity - 0.0625

	SEC
	LDA velocity
	SBC #1
	STA velocity
.nomove1
 ;;line 141;; nomove1

.L093 ;;line 142;;  if level{2} then temp1 = 96 else temp1 = 64

	LDA level
	AND #4
	BEQ .skipL093
.condpart13
	LDA #96
	STA temp1
 jmp .skipelse4
.skipL093
	LDA #64
	STA temp1
.skipelse4
.L094 ;;line 143;;  if gamebits{4} then temp1 = 16

	LDA gamebits
	AND #16
	BEQ .skipL094
.condpart14
	LDA #16
	STA temp1
.skipL094
.L095 ;;line 144;;  if velocity  >  temp1  &&  velocity  <  192 then velocity = velocity - 0.0625

	LDA temp1
	CMP velocity
     BCS .skipL095
.condpart15
	LDA velocity
	CMP #192
     BCS .skip14then
.condpart16
	SEC
	LDA velocity
	SBC #1
	STA velocity
.skip14then
.skipL095
.L096 ;;line 145;;  if velocity > 240 then velocity = 0

	LDA #240
	CMP velocity
     BCS .skipL096
.condpart17
	LDA #0
  ASL
  ASL
  ASL
  ASL
	STA velocity
.skipL096
.
 ;;line 146;; 

.L097 ;;line 147;;  if !level{3} then COLUBK = 0 else COLUBK = 154

	LDA level
	AND #8
	BNE .skipL097
.condpart18
	LDA #0
	STA COLUBK
 jmp .skipelse5
.skipL097
	LDA #154
	STA COLUBK
.skipelse5
.
 ;;line 148;; 

.L098 ;;line 149;;  on carpos goto a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15

	LDX carpos
	LDA .L098jumptablehi,x
	PHA
	LDA .L098jumptablelo,x
	PHA
	RTS
.L098jumptablehi
	.byte >(.a0-1)
	.byte >(.a1-1)
	.byte >(.a2-1)
	.byte >(.a3-1)
	.byte >(.a4-1)
	.byte >(.a5-1)
	.byte >(.a6-1)
	.byte >(.a7-1)
	.byte >(.a8-1)
	.byte >(.a9-1)
	.byte >(.a10-1)
	.byte >(.a11-1)
	.byte >(.a12-1)
	.byte >(.a13-1)
	.byte >(.a14-1)
	.byte >(.a15-1)
.L098jumptablelo
	.byte <(.a0-1)
	.byte <(.a1-1)
	.byte <(.a2-1)
	.byte <(.a3-1)
	.byte <(.a4-1)
	.byte <(.a5-1)
	.byte <(.a6-1)
	.byte <(.a7-1)
	.byte <(.a8-1)
	.byte <(.a9-1)
	.byte <(.a10-1)
	.byte <(.a11-1)
	.byte <(.a12-1)
	.byte <(.a13-1)
	.byte <(.a14-1)
	.byte <(.a15-1)
.a0 ;;line 150;; a0 rem 0 (due north, or up)

.L099 ;;line 151;;  xvelocity = 0 : yvelocity = 0 - velocity

	LDA #0
  ASL
  ASL
  ASL
  ASL
	STA xvelocity
	LDA #0
	SEC
	SBC velocity
	STA yvelocity
.L0100 ;;line 152;;  goto skipskid

 jmp .skipskid
.a1 ;;line 153;; a1 rem 22.5

.L0101 ;;line 154;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0102 ;;line 155;;  xvelocity = tempvel : yvelocity = tempvel - velocity

	LDA tempvel
	STA xvelocity
	LDA tempvel
	SEC
	SBC velocity
	STA yvelocity
.L0103 ;;line 156;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0104 ;;line 157;;  xvelocity = xvelocity + tempvel

	LDA xvelocity
	CLC
	ADC tempvel
	STA xvelocity
.L0105 ;;line 158;;  goto skipskid

 jmp .skipskid
.a2 ;;line 159;; a2 rem 45

.L0106 ;;line 160;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0107 ;;line 161;;  xvelocity = velocity / 2

	LDA velocity
	lsr
	STA xvelocity
.L0108 ;;line 162;;  if xvelocity{7} then xvelocity = xvelocity  |  %10000000

	BIT xvelocity
	BPL .skipL0108
.condpart19
	LDA xvelocity
	ORA #%10000000
	STA xvelocity
.skipL0108
.L0109 ;;line 163;;  xvelocity = xvelocity + tempvel : yvelocity = 0 - xvelocity

	LDA xvelocity
	CLC
	ADC tempvel
	STA xvelocity
	LDA #0
	SEC
	SBC xvelocity
	STA yvelocity
.L0110 ;;line 164;;  goto skipskid

 jmp .skipskid
.a3 ;;line 165;; a3 rem 67.5

.L0111 ;;line 166;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0112 ;;line 167;;  xvelocity = velocity - tempvel : yvelocity = 0 - tempvel

	LDA velocity
	SEC
	SBC tempvel
	STA xvelocity
	LDA #0
	SEC
	SBC tempvel
	STA yvelocity
.L0113 ;;line 168;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0114 ;;line 169;;  yvelocity = yvelocity - tempvel

	LDA yvelocity
	SEC
	SBC tempvel
	STA yvelocity
.L0115 ;;line 170;;  goto skipskid

 jmp .skipskid
.a4 ;;line 171;; a4 rem 90

.L0116 ;;line 172;;  xvelocity = velocity : yvelocity = 0

	LDA velocity
	STA xvelocity
	LDA #0
  ASL
  ASL
  ASL
  ASL
	STA yvelocity
.L0117 ;;line 173;;  goto skipskid

 jmp .skipskid
.a5 ;;line 174;; a5 rem 112.5

.L0118 ;;line 175;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0119 ;;line 176;;  xvelocity = velocity - tempvel : yvelocity = tempvel

	LDA velocity
	SEC
	SBC tempvel
	STA xvelocity
	LDA tempvel
	STA yvelocity
.L0120 ;;line 177;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0121 ;;line 178;;  yvelocity = yvelocity + tempvel

	LDA yvelocity
	CLC
	ADC tempvel
	STA yvelocity
.L0122 ;;line 179;;  goto skipskid

 jmp .skipskid
.a6 ;;line 180;; a6 rem 135

.L0123 ;;line 181;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0124 ;;line 182;;  xvelocity = velocity / 2

	LDA velocity
	lsr
	STA xvelocity
.L0125 ;;line 183;;  if xvelocity{7} then xvelocity = xvelocity  |  %10000000

	BIT xvelocity
	BPL .skipL0125
.condpart20
	LDA xvelocity
	ORA #%10000000
	STA xvelocity
.skipL0125
.L0126 ;;line 184;;  xvelocity = xvelocity + tempvel : yvelocity = xvelocity

	LDA xvelocity
	CLC
	ADC tempvel
	STA xvelocity
	LDA xvelocity
	STA yvelocity
.L0127 ;;line 185;;  goto skipskid

 jmp .skipskid
.a7 ;;line 186;; a7 rem 157.5

.L0128 ;;line 187;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0129 ;;line 188;;  xvelocity = tempvel : yvelocity = velocity - tempvel

	LDA tempvel
	STA xvelocity
	LDA velocity
	SEC
	SBC tempvel
	STA yvelocity
.L0130 ;;line 189;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0131 ;;line 190;;  xvelocity = xvelocity + tempvel

	LDA xvelocity
	CLC
	ADC tempvel
	STA xvelocity
.L0132 ;;line 191;;  goto skipskid

 jmp .skipskid
.a8 ;;line 192;; a8 rem 180

.L0133 ;;line 193;;  xvelocity = 0 : yvelocity = velocity

	LDA #0
  ASL
  ASL
  ASL
  ASL
	STA xvelocity
	LDA velocity
	STA yvelocity
.L0134 ;;line 194;;  goto skipskid

 jmp .skipskid
.a9 ;;line 195;; a9 rem 202.5

.L0135 ;;line 196;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0136 ;;line 197;;  xvelocity = 0 - tempvel : yvelocity = velocity - tempvel

	LDA #0
	SEC
	SBC tempvel
	STA xvelocity
	LDA velocity
	SEC
	SBC tempvel
	STA yvelocity
.L0137 ;;line 198;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0138 ;;line 199;;  xvelocity = xvelocity - tempvel

	LDA xvelocity
	SEC
	SBC tempvel
	STA xvelocity
.L0139 ;;line 200;;  goto skipskid

 jmp .skipskid
.a10 ;;line 201;; a10 rem 225

.L0140 ;;line 202;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0141 ;;line 203;;  xvelocity = velocity / 2

	LDA velocity
	lsr
	STA xvelocity
.L0142 ;;line 204;;  yvelocity = tempvel + xvelocity : xvelocity = 0 - xvelocity

	LDA tempvel
	CLC
	ADC xvelocity
	STA yvelocity
	LDA #0
	SEC
	SBC xvelocity
	STA xvelocity
.L0143 ;;line 205;;  goto skipskid

 jmp .skipskid
.a11 ;;line 206;; a11 rem 247.5

.L0144 ;;line 207;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0145 ;;line 208;;  xvelocity = tempvel - velocity : yvelocity = tempvel

	LDA tempvel
	SEC
	SBC velocity
	STA xvelocity
	LDA tempvel
	STA yvelocity
.L0146 ;;line 209;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0147 ;;line 210;;  yvelocity = yvelocity + tempvel

	LDA yvelocity
	CLC
	ADC tempvel
	STA yvelocity
.L0148 ;;line 211;;  goto skipskid

 jmp .skipskid
.a12 ;;line 212;; a12 rem 270

.L0149 ;;line 213;;  xvelocity = 0 - velocity : yvelocity = 0

	LDA #0
	SEC
	SBC velocity
	STA xvelocity
	LDA #0
  ASL
  ASL
  ASL
  ASL
	STA yvelocity
.L0150 ;;line 214;;  goto skipskid

 jmp .skipskid
.a13 ;;line 215;; a13 rem 292.5

.L0151 ;;line 216;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0152 ;;line 217;;  xvelocity = tempvel - velocity : yvelocity = 0 - tempvel

	LDA tempvel
	SEC
	SBC velocity
	STA xvelocity
	LDA #0
	SEC
	SBC tempvel
	STA yvelocity
.L0153 ;;line 218;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0154 ;;line 219;;  yvelocity = yvelocity - tempvel

	LDA yvelocity
	SEC
	SBC tempvel
	STA yvelocity
.L0155 ;;line 220;;  goto skipskid

 jmp .skipskid
.a14 ;;line 221;; a14 rem 315

.L0156 ;;line 222;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0157 ;;line 223;;  xvelocity = velocity / 2

	LDA velocity
	lsr
	STA xvelocity
.L0158 ;;line 224;;  xvelocity = tempvel + xvelocity : xvelocity = 0 - xvelocity : yvelocity = xvelocity

	LDA tempvel
	CLC
	ADC xvelocity
	STA xvelocity
	LDA #0
	SEC
	SBC xvelocity
	STA xvelocity
	LDA xvelocity
	STA yvelocity
.L0159 ;;line 225;;  goto skipskid

 jmp .skipskid
.a15 ;;line 226;; a15 rem 337.5 

.L0160 ;;line 227;;  tempvel = velocity / 8

	LDA velocity
	lsr
	lsr
	lsr
	STA tempvel
.L0161 ;;line 228;;  xvelocity = 0 - tempvel : yvelocity = tempvel - velocity

	LDA #0
	SEC
	SBC tempvel
	STA xvelocity
	LDA tempvel
	SEC
	SBC velocity
	STA yvelocity
.L0162 ;;line 229;;  tempvel = velocity / 4

	LDA velocity
	lsr
	lsr
	STA tempvel
.L0163 ;;line 230;;  xvelocity = xvelocity - tempvel

	LDA xvelocity
	SEC
	SBC tempvel
	STA xvelocity
.
 ;;line 231;; 

.
 ;;line 232;; 

.skipskid
 ;;line 233;; skipskid

.L0164 ;;line 234;;  if velocity{7} then reboot

	BIT velocity
	BPL .skipL0164
.condpart21
	JMP ($FFFC)
.skipL0164
.L0165 ;;line 235;;  if !gamebits{0} then finalxvelocity = xvelocity : finalyvelocity = yvelocity : AUDV1 = 0 : goto noskid else skid

	LDA gamebits
	LSR
	BCS .skipL0165
.condpart22
	LDA xvelocity
	STA finalxvelocity
	LDA yvelocity
	STA finalyvelocity
	LDA #0
	STA AUDV1
 jmp .noskid
.skipL0165
 jmp .skid
.skipelse6
.L0166 ;;line 236;;  if velocity < 32 then finalxvelocity = xvelocity : finalyvelocity = yvelocity : AUDV1 = 0 : goto noskid

	LDA velocity
	CMP #32
     BCS .skipL0166
.condpart23
	LDA xvelocity
	STA finalxvelocity
	LDA yvelocity
	STA finalyvelocity
	LDA #0
	STA AUDV1
 jmp .noskid
.skipL0166
.L0167 ;;line 237;;  if finalxvelocity = xvelocity  &&  finalyvelocity = yvelocity then AUDV1 = 0 : goto noskid

	LDA finalxvelocity
	CMP xvelocity
     BNE .skipL0167
.condpart24
	LDA finalyvelocity
	CMP yvelocity
     BNE .skip23then
.condpart25
	LDA #0
	STA AUDV1
 jmp .noskid
.skip23then
.skipL0167
.
 ;;line 238;; 

.skid
 ;;line 239;; skid

.L0168 ;;line 240;;  rem lost traction...skid

.L0169 ;;line 241;;  gamebits{5} = 0

	LDA gamebits
	AND #223
	STA gamebits
.L0170 ;;line 242;;  gamebits{6} = 0

	LDA gamebits
	AND #191
	STA gamebits
.
 ;;line 243;; 

.L0171 ;;line 244;;  if xvelocity > 127  &&  finalxvelocity > 127 then bothxneg

	LDA #127
	CMP xvelocity
     BCS .skipL0171
.condpart26
	LDA #127
	CMP finalxvelocity
 if ((* - .bothxneg) < 127) && ((* - .bothxneg) > -128)
	bcc .bothxneg
 else
	bcs .6skipbothxneg
	jmp .bothxneg
.6skipbothxneg
 endif
.skipL0171
.L0172 ;;line 245;;  if xvelocity < 128  &&  finalxvelocity < 128 then bothxpos

	LDA xvelocity
	CMP #128
     BCS .skipL0172
.condpart27
	LDA finalxvelocity
	CMP #128
 if ((* - .bothxpos) < 127) && ((* - .bothxpos) > -128)
	bcc .bothxpos
 else
	bcs .7skipbothxpos
	jmp .bothxpos
.7skipbothxpos
 endif
.skipL0172
.L0173 ;;line 246;;  if xvelocity > 127 then subx else addx

	LDA #127
	CMP xvelocity
 if ((* - .subx) < 127) && ((* - .subx) > -128)
	bcc .subx
 else
	bcs .8skipsubx
	jmp .subx
.8skipsubx
 endif
 jmp .addx
.skipelse7
.bothxneg
 ;;line 247;; bothxneg

.L0174 ;;line 248;;  temp1 =  ( finalxvelocity  ^  xvelocity )   &  %11111100

; complex statement detected
	LDA finalxvelocity
	EOR xvelocity
	AND #%11111100
	STA temp1
.L0175 ;;line 249;;  if temp1 = 0 then finalxvelocity = xvelocity : gamebits{5} = 1 : goto checky

	LDA temp1
	CMP #0
     BNE .skipL0175
.condpart28
	LDA xvelocity
	STA finalxvelocity
	LDA gamebits
	ORA #32
	STA gamebits
 jmp .checky
.skipL0175
.L0176 ;;line 250;;  if finalxvelocity < xvelocity then addx

	LDA finalxvelocity
	CMP xvelocity
 if ((* - .addx) < 127) && ((* - .addx) > -128)
	bcc .addx
 else
	bcs .9skipaddx
	jmp .addx
.9skipaddx
 endif
.subx
 ;;line 251;; subx

.L0177 ;;line 252;;  if level{3} then finalxvelocity = finalxvelocity - 0.0625 else finalxvelocity = finalxvelocity - 0.3

	LDA level
	AND #8
	BEQ .skipL0177
.condpart29
	SEC
	LDA finalxvelocity
	SBC #1
	STA finalxvelocity
 jmp .skipelse8
.skipL0177
	SEC
	LDA finalxvelocity
	SBC #4
	STA finalxvelocity
.skipelse8
.L0178 ;;line 253;;  goto checky

 jmp .checky
.
 ;;line 254;; 

.bothxpos
 ;;line 255;; bothxpos

.L0179 ;;line 256;;  temp1 =  ( finalxvelocity  ^  xvelocity )   &  %11111100

; complex statement detected
	LDA finalxvelocity
	EOR xvelocity
	AND #%11111100
	STA temp1
.L0180 ;;line 257;;  if temp1 = 0 then finalxvelocity = xvelocity : gamebits{5} = 1 : goto checky

	LDA temp1
	CMP #0
     BNE .skipL0180
.condpart30
	LDA xvelocity
	STA finalxvelocity
	LDA gamebits
	ORA #32
	STA gamebits
 jmp .checky
.skipL0180
.L0181 ;;line 258;;  if finalxvelocity > xvelocity then subx

	LDA xvelocity
	CMP finalxvelocity
 if ((* - .subx) < 127) && ((* - .subx) > -128)
	bcc .subx
 else
	bcs .10skipsubx
	jmp .subx
.10skipsubx
 endif
.addx
 ;;line 259;; addx

.L0182 ;;line 260;;  if level{3} then finalxvelocity = finalxvelocity + 0.0625 else finalxvelocity = finalxvelocity + 0.3

	LDA level
	AND #8
	BEQ .skipL0182
.condpart31
	CLC
	LDA finalxvelocity
	ADC #1
	STA finalxvelocity
 jmp .skipelse9
.skipL0182
	CLC
	LDA finalxvelocity
	ADC #4
	STA finalxvelocity
.skipelse9
.
 ;;line 261;; 

.
 ;;line 262;; 

.checky
 ;;line 263;; checky

.L0183 ;;line 264;;  if yvelocity > 127  &&  finalyvelocity > 127 then bothyneg

	LDA #127
	CMP yvelocity
     BCS .skipL0183
.condpart32
	LDA #127
	CMP finalyvelocity
 if ((* - .bothyneg) < 127) && ((* - .bothyneg) > -128)
	bcc .bothyneg
 else
	bcs .11skipbothyneg
	jmp .bothyneg
.11skipbothyneg
 endif
.skipL0183
.L0184 ;;line 265;;  if yvelocity < 128  &&  finalyvelocity < 128 then bothypos

	LDA yvelocity
	CMP #128
     BCS .skipL0184
.condpart33
	LDA finalyvelocity
	CMP #128
 if ((* - .bothypos) < 127) && ((* - .bothypos) > -128)
	bcc .bothypos
 else
	bcs .12skipbothypos
	jmp .bothypos
.12skipbothypos
 endif
.skipL0184
.L0185 ;;line 266;;  if yvelocity > 127 then suby else addy

	LDA #127
	CMP yvelocity
 if ((* - .suby) < 127) && ((* - .suby) > -128)
	bcc .suby
 else
	bcs .13skipsuby
	jmp .suby
.13skipsuby
 endif
 jmp .addy
.skipelse10
.bothyneg
 ;;line 267;; bothyneg

.L0186 ;;line 268;;  temp1 =  ( finalyvelocity  ^  yvelocity )   &  %11111100

; complex statement detected
	LDA finalyvelocity
	EOR yvelocity
	AND #%11111100
	STA temp1
.L0187 ;;line 269;;  if temp1 = 0 then finalyvelocity = yvelocity : gamebits{6} = 1 : goto doneskid

	LDA temp1
	CMP #0
     BNE .skipL0187
.condpart34
	LDA yvelocity
	STA finalyvelocity
	LDA gamebits
	ORA #64
	STA gamebits
 jmp .doneskid
.skipL0187
.L0188 ;;line 270;;  if finalyvelocity < yvelocity then addy

	LDA finalyvelocity
	CMP yvelocity
 if ((* - .addy) < 127) && ((* - .addy) > -128)
	bcc .addy
 else
	bcs .14skipaddy
	jmp .addy
.14skipaddy
 endif
.suby
 ;;line 271;; suby

.L0189 ;;line 272;;  if level{3} then finalyvelocity = finalyvelocity - 0.0625 else finalyvelocity = finalyvelocity - 0.3

	LDA level
	AND #8
	BEQ .skipL0189
.condpart35
	SEC
	LDA finalyvelocity
	SBC #1
	STA finalyvelocity
 jmp .skipelse11
.skipL0189
	SEC
	LDA finalyvelocity
	SBC #4
	STA finalyvelocity
.skipelse11
.L0190 ;;line 273;;  goto doneskid

 jmp .doneskid
.
 ;;line 274;; 

.bothypos
 ;;line 275;; bothypos

.L0191 ;;line 276;;  temp1 =  ( finalyvelocity  ^  yvelocity )   &  %11111100

; complex statement detected
	LDA finalyvelocity
	EOR yvelocity
	AND #%11111100
	STA temp1
.L0192 ;;line 277;;  if temp1 = 0 then finalyvelocity = yvelocity : gamebits{6} = 1 : goto doneskid

	LDA temp1
	CMP #0
     BNE .skipL0192
.condpart36
	LDA yvelocity
	STA finalyvelocity
	LDA gamebits
	ORA #64
	STA gamebits
 jmp .doneskid
.skipL0192
.L0193 ;;line 278;;  if finalyvelocity > yvelocity then suby

	LDA yvelocity
	CMP finalyvelocity
 if ((* - .suby) < 127) && ((* - .suby) > -128)
	bcc .suby
 else
	bcs .15skipsuby
	jmp .suby
.15skipsuby
 endif
.addy
 ;;line 279;; addy

.L0194 ;;line 280;;  if level{3} then finalyvelocity = finalyvelocity + 0.0625 else finalyvelocity = finalyvelocity + 0.3

	LDA level
	AND #8
	BEQ .skipL0194
.condpart37
	CLC
	LDA finalyvelocity
	ADC #1
	STA finalyvelocity
 jmp .skipelse12
.skipL0194
	CLC
	LDA finalyvelocity
	ADC #4
	STA finalyvelocity
.skipelse12
.
 ;;line 281;; 

.doneskid
 ;;line 282;; doneskid

.L0195 ;;line 283;;  if gamebits{5}  &&  gamebits{6} then gamebits{0} = 0 : AUDV1 = 0 : goto noskid

	LDA gamebits
	AND #32
	BEQ .skipL0195
.condpart38
	BIT gamebits
	BVC .skip37then
.condpart39
	LDA gamebits
	AND #254
	STA gamebits
	LDA #0
	STA AUDV1
 jmp .noskid
.skip37then
.skipL0195
.
 ;;line 284;; 

.L0196 ;;line 285;;  rem skid sound

.L0197 ;;line 286;;  temp6 = rand

 jsr randomize
	STA temp6
.L0198 ;;line 287;;  if temp1{6} then AUDV1 = 9

	BIT temp1
	BVC .skipL0198
.condpart40
	LDA #9
	STA AUDV1
.skipL0198
.
 ;;line 288;; 

.L0199 ;;line 289;;  rem if temp6{0} then AUDC1=3:AUDF1=0 else AUDC1=3:AUDF1=1

.L0200 ;;line 290;;  rem AUDV1=temp6&3

.L0201 ;;line 291;;  if level{3} then temp1 = 8 else temp1 = 20

	LDA level
	AND #8
	BEQ .skipL0201
.condpart41
	LDA #8
	STA temp1
 jmp .skipelse13
.skipL0201
	LDA #20
	STA temp1
.skipelse13
.L0202 ;;line 292;;  AUDC1 = temp1

	LDA temp1
	STA AUDC1
.L0203 ;;line 293;;  if temp6{0} then AUDF1 = temp1 + 4 else AUDF1 = temp1 + 5

	LDA temp6
	LSR
	BCC .skipL0203
.condpart42
	LDA temp1
	CLC
	ADC #4
	STA AUDF1
 jmp .skipelse14
.skipL0203
	LDA temp1
	CLC
	ADC #5
	STA AUDF1
.skipelse14
.
 ;;line 294;; 

.
 ;;line 295;; 

.noskid
 ;;line 296;; noskid

.L0204 ;;line 297;;  rem gamebits=gamebits^%00000010

.L0205 ;;line 298;;  rem if gamebits{1} then donotadd

.
 ;;line 299;; 

.L0206 ;;line 300;;  tempvel8 = finalxvelocity

	LDA finalxvelocity
  JSR Assign44to88
  STX temp2
	STA tempvel8
.L0207 ;;line 301;;  asm

 lda temp1

 asl

 ror temp1

 ror temp2

.L0208 ;;line 307;;  p0x = p0x + tempvel8

	LDA j
	CLC 
	ADC temp2
	STA j
	LDA p0x
	ADC tempvel8
	STA p0x
.
 ;;line 308;; 

.L0209 ;;line 309;;  tempvel8 = finalyvelocity

	LDA finalyvelocity
  JSR Assign44to88
  STX temp2
	STA tempvel8
.L0210 ;;line 310;;  asm

 lda temp1

 asl

 ror temp1

 ror temp2

.
 ;;line 316;; 

.L0211 ;;line 317;;  p0y = p0y + tempvel8

	LDA k
	CLC 
	ADC temp2
	STA k
	LDA p0y
	ADC tempvel8
	STA p0y
.donotadd
 ;;line 318;; donotadd

.
 ;;line 319;; 

.L0212 ;;line 320;;  if player0x > 200 then player0x = 159 : goto wrap

	LDA #200
	CMP player0x
     BCS .skipL0212
.condpart43
	LDA #159
	STA player0x
 jmp .wrap
.skipL0212
.L0213 ;;line 321;;  if player0x > 159 then player0x = 0

	LDA #159
	CMP player0x
     BCS .skipL0213
.condpart44
	LDA #0
	STA player0x
.skipL0213
.wrap
 ;;line 322;; wrap

.L0214 ;;line 323;;  if player0y > 200 then player0y = 96

	LDA #200
	CMP player0y
     BCS .skipL0214
.condpart45
	LDA #96
	STA player0y
.skipL0214
.L0215 ;;line 324;;  if player0y > 96 then player0y = 0

	LDA #96
	CMP player0y
     BCS .skipL0215
.condpart46
	LDA #0
	STA player0y
.skipL0215
.
 ;;line 325;; 

.L0216 ;;line 326;;  if switchbw then driving

 lda #8
 bit SWCHB
 if ((* - .driving) < 127) && ((* - .driving) > -128)
	BEQ .driving
 else
	bne .16skipdriving
	jmp .driving
.16skipdriving
 endif
.L0217 ;;line 327;;  turndelay = turndelay  +  1

	INC turndelay
.L0218 ;;line 328;;  turndelay = turndelay  &  %11111011

	LDA turndelay
	AND #%11111011
	STA turndelay
.L0219 ;;line 329;;  temp1 = turndelay & 3

	LDA turndelay
	AND #3
	STA temp1
.L0220 ;;line 330;;  if temp1  <>  0 then goto SameFrame

	LDA temp1
	CMP #0
     BEQ .skipL0220
.condpart47
 jmp .SameFrame
.skipL0220
.
 ;;line 331;; 

.
 ;;line 332;; 

.L0221 ;;line 333;;  if joy0left then carpos = carpos - 1 : gamebits{0} = 1

 bit SWCHA
	BVS .skipL0221
.condpart48
	DEC carpos
	LDA gamebits
	ORA #1
	STA gamebits
.skipL0221
.L0222 ;;line 334;;  if joy0right then carpos = carpos + 1 : gamebits{0} = 1

 bit SWCHA
	BMI .skipL0222
.condpart49
	INC carpos
	LDA gamebits
	ORA #1
	STA gamebits
.skipL0222
.L0223 ;;line 335;;  goto nodriving

 jmp .nodriving
.
 ;;line 336;; 

.driving ;;line 337;; driving rem read driving controller

.L0224 ;;line 338;;  temp1 = SWCHA  &  %00110000

	LDA SWCHA
	AND #%00110000
	STA temp1
.L0225 ;;line 339;;  temp1 = temp1 / 4 / 4

; complex statement detected
	LDA temp1
	lsr
	lsr
	lsr
	lsr
	STA temp1
.L0226 ;;line 340;;  on last goto d00 d01 d10 d11

	LDX last
	LDA .L0226jumptablehi,x
	PHA
	LDA .L0226jumptablelo,x
	PHA
	RTS
.L0226jumptablehi
	.byte >(.d00-1)
	.byte >(.d01-1)
	.byte >(.d10-1)
	.byte >(.d11-1)
.L0226jumptablelo
	.byte <(.d00-1)
	.byte <(.d01-1)
	.byte <(.d10-1)
	.byte <(.d11-1)
.d00 ;;line 341;; d00 on temp1 goto nomove left right nomove

	LDX temp1
	LDA .d00jumptablehi,x
	PHA
	LDA .d00jumptablelo,x
	PHA
	RTS
.d00jumptablehi
	.byte >(.nomove-1)
	.byte >(.left-1)
	.byte >(.right-1)
	.byte >(.nomove-1)
.d00jumptablelo
	.byte <(.nomove-1)
	.byte <(.left-1)
	.byte <(.right-1)
	.byte <(.nomove-1)
.d01 ;;line 342;; d01 on temp1 goto right nomove nomove left

	LDX temp1
	LDA .d01jumptablehi,x
	PHA
	LDA .d01jumptablelo,x
	PHA
	RTS
.d01jumptablehi
	.byte >(.right-1)
	.byte >(.nomove-1)
	.byte >(.nomove-1)
	.byte >(.left-1)
.d01jumptablelo
	.byte <(.right-1)
	.byte <(.nomove-1)
	.byte <(.nomove-1)
	.byte <(.left-1)
.d11 ;;line 343;; d11 on temp1 goto nomove right left nomove

	LDX temp1
	LDA .d11jumptablehi,x
	PHA
	LDA .d11jumptablelo,x
	PHA
	RTS
.d11jumptablehi
	.byte >(.nomove-1)
	.byte >(.right-1)
	.byte >(.left-1)
	.byte >(.nomove-1)
.d11jumptablelo
	.byte <(.nomove-1)
	.byte <(.right-1)
	.byte <(.left-1)
	.byte <(.nomove-1)
.d10 ;;line 344;; d10 on temp1 goto left nomove nomove right

	LDX temp1
	LDA .d10jumptablehi,x
	PHA
	LDA .d10jumptablelo,x
	PHA
	RTS
.d10jumptablehi
	.byte >(.left-1)
	.byte >(.nomove-1)
	.byte >(.nomove-1)
	.byte >(.right-1)
.d10jumptablelo
	.byte <(.left-1)
	.byte <(.nomove-1)
	.byte <(.nomove-1)
	.byte <(.right-1)
.L0227 ;;line 345;;  rem done with reading code

.left ;;line 346;; left carpos = carpos - 1 : gamebits{0} = 1

	DEC carpos
	LDA gamebits
	ORA #1
	STA gamebits
.L0228 ;;line 347;;  goto nomove

 jmp .nomove
.right ;;line 348;; right carpos = carpos + 1 : gamebits{0} = 1

	INC carpos
	LDA gamebits
	ORA #1
	STA gamebits
.nomove
 ;;line 349;; nomove

.L0229 ;;line 350;;  last = temp1

	LDA temp1
	STA last
.nodriving
 ;;line 351;; nodriving

.L0230 ;;line 352;;  carpos = carpos  &  15

	LDA carpos
	AND #15
	STA carpos
.
 ;;line 353;; 

.L0231 ;;line 354;;  gosub carFrame

 jsr .carFrame
.
 ;;line 355;; 

.SameFrame
 ;;line 356;; SameFrame

.L0232 ;;line 357;;  COLUP0 = 14

	LDA #14
	STA COLUP0
.L0233 ;;line 358;;  REFP0 = gamebits

	LDA gamebits
	STA REFP0
.L0234 ;;line 359;;  if scadd > 0 then scadd = scadd - 1 : score = score + 1

	LDA #0
	CMP scadd
     BCS .skipL0234
.condpart50
	DEC scadd
	SED
	CLC
	LDA score+2
	ADC #$01
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
.skipL0234
.
 ;;line 360;; 

.L0235 ;;line 361;;  if !collision(player0,player1) then nohitzombie

	bit 	CXPPMM
 if ((* - .nohitzombie) < 127) && ((* - .nohitzombie) > -128)
	bpl .nohitzombie
 else
	bmi .17skipnohitzombie
	jmp .nohitzombie
.17skipnohitzombie
 endif
.L0236 ;;line 362;;  scadd = scadd + f

	LDA scadd
	CLC
	ADC f
	STA scadd
.L0237 ;;line 363;;  collcount = collcount | $F8

	LDA collcount
	ORA #$F8
	STA collcount
.L0238 ;;line 364;;  if player1x < 16  ||  player1x > 143 then notombstone

	LDA player1x
	CMP #16
 if ((* - .notombstone) < 127) && ((* - .notombstone) > -128)
	bcc .notombstone
 else
	bcs .18skipnotombstone
	jmp .notombstone
.18skipnotombstone
 endif
	LDA #143
	CMP player1x
 if ((* - .notombstone) < 127) && ((* - .notombstone) > -128)
	bcc .notombstone
 else
	bcs .19skipnotombstone
	jmp .notombstone
.19skipnotombstone
 endif
.L0239 ;;line 365;;  temp1 =  ( player1x - 16 )  / 4 : temp2 =  ( player1y - 4 )  / 8

; complex statement detected
	LDA player1x
	SEC
	SBC #16
	lsr
	lsr
	STA temp1
; complex statement detected
	LDA player1y
	SEC
	SBC #4
	lsr
	lsr
	lsr
	STA temp2
.L0240 ;;line 366;;  pfpixel temp1 temp2 on

	LDX #0
	LDY temp2
	LDA temp1
 jsr pfpixel
.notombstone
 ;;line 367;; notombstone

.L0241 ;;line 368;;  player1x = rand & 63 + 48 : if player1x{0} then player1y = 0 else player1y = 90

; complex statement detected
 jsr randomize
	PHA
	LDA #63
	CLC
	ADC #48
	TSX
	INX
	TXS
	AND $0,x
	STA player1x
	LDA player1x
	LSR
	BCC .skipL0241
.condpart51
	LDA #0
	STA player1y
 jmp .skipelse15
.skipL0241
	LDA #90
	STA player1y
.skipelse15
.
 ;;line 369;; 

.nohitzombie
 ;;line 370;; nohitzombie

.L0242 ;;line 371;;  if gamebits{4} then insidewall

	LDA gamebits
	AND #16
 if ((* - .insidewall) < 127) && ((* - .insidewall) > -128)
	BNE .insidewall
 else
	beq .20skipinsidewall
	jmp .insidewall
.20skipinsidewall
 endif
.L0243 ;;line 372;;  if collcount > 16 then hitwall

	LDA #16
	CMP collcount
 if ((* - .hitwall) < 127) && ((* - .hitwall) > -128)
	bcc .hitwall
 else
	bcs .21skiphitwall
	jmp .hitwall
.21skiphitwall
 endif
.L0244 ;;line 373;;  if !collision(player0,playfield) then insidewall

	bit 	CXP0FB
 if ((* - .insidewall) < 127) && ((* - .insidewall) > -128)
	bpl .insidewall
 else
	bmi .22skipinsidewall
	jmp .insidewall
.22skipinsidewall
 endif
.L0245 ;;line 374;;  if !switchleftb then velocity = 0

 bit SWCHB
	BVC .skipL0245
.condpart52
	LDA #0
  ASL
  ASL
  ASL
  ASL
	STA velocity
.skipL0245
.L0246 ;;line 375;;  gamebits{4} = 1 : collcount = collcount  |  $F0 : collcount{3} = 0 : goto hitwall

	LDA gamebits
	ORA #16
	STA gamebits
	LDA collcount
	ORA #$F0
	STA collcount
	LDA collcount
	AND #247
	STA collcount
 jmp .hitwall
.insidewall
 ;;line 376;; insidewall

.L0247 ;;line 377;;  if !collision(player0,playfield) then gamebits{4} = 0 : goto hitwall

	bit 	CXP0FB
	BMI .skipL0247
.condpart53
	LDA gamebits
	AND #239
	STA gamebits
 jmp .hitwall
.skipL0247
.L0248 ;;line 378;;  if velocity > 16 then velocity = velocity - 0.1875

	LDA #16
	CMP velocity
     BCS .skipL0248
.condpart54
	SEC
	LDA velocity
	SBC #3
	STA velocity
.skipL0248
.
 ;;line 379;; 

.hitwall
 ;;line 380;; hitwall

.L0249 ;;line 381;;  drawscreen

 jsr drawscreen
.
 ;;line 382;; 

.L0250 ;;line 383;;  goto startLoop

 jmp .startLoop
.
 ;;line 384;; 

.
 ;;line 385;; 

.carFrame
 ;;line 386;; carFrame

.
 ;;line 387;; 

.
 ;;line 388;; 

.L0251 ;;line 389;;  carframe = 0

	LDA #0
	STA carframe
.L0252 ;;line 390;;  if carpos  <  9 then carframe = carpos  :  gamebits{3} = 0

	LDA carpos
	CMP #9
     BCS .skipL0252
.condpart55
	LDA carpos
	STA carframe
	LDA gamebits
	AND #247
	STA gamebits
.skipL0252
.L0253 ;;line 391;;  if carpos  >=  9 then carframe = 16  -  carpos  :  gamebits{3} = 1

	LDA carpos
	CMP #9
     BCC .skipL0253
.condpart56
	LDA #16
	SEC
	SBC carpos
	STA carframe
	LDA gamebits
	ORA #8
	STA gamebits
.skipL0253
.
 ;;line 392;; 

.
 ;;line 393;; 

.
 ;;line 394;; 

.
 ;;line 395;; 

.L0254 ;;line 396;;  on carframe goto 5 10 20 30 40 50 60 70 80

	LDX carframe
	LDA .L0254jumptablehi,x
	PHA
	LDA .L0254jumptablelo,x
	PHA
	RTS
.L0254jumptablehi
	.byte >(.5-1)
	.byte >(.10-1)
	.byte >(.20-1)
	.byte >(.30-1)
	.byte >(.40-1)
	.byte >(.50-1)
	.byte >(.60-1)
	.byte >(.70-1)
	.byte >(.80-1)
.L0254jumptablelo
	.byte <(.5-1)
	.byte <(.10-1)
	.byte <(.20-1)
	.byte <(.30-1)
	.byte <(.40-1)
	.byte <(.50-1)
	.byte <(.60-1)
	.byte <(.70-1)
	.byte <(.80-1)
.
 ;;line 397;; 

.
 ;;line 398;; 

.
 ;;line 399;; 

.
 ;;line 400;; 

.
 ;;line 401;; 

.5 ;;line 402;; 5 player0:

	LDX #<player5_0
	STX player0pointerlo
	LDA #>player5_0
	STA player0pointerhi
	LDA #7
	STA player0height
.L0255 ;;line 412;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 413;; 

.10 ;;line 414;; 10 player0:

	LDX #<player10_0
	STX player0pointerlo
	LDA #>player10_0
	STA player0pointerhi
	LDA #8
	STA player0height
.L0256 ;;line 425;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 426;; 

.20 ;;line 427;; 20 player0:

	LDX #<player20_0
	STX player0pointerlo
	LDA #>player20_0
	STA player0pointerhi
	LDA #7
	STA player0height
.L0257 ;;line 437;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 438;; 

.30 ;;line 439;; 30 player0:

	LDX #<player30_0
	STX player0pointerlo
	LDA #>player30_0
	STA player0pointerhi
	LDA #7
	STA player0height
.L0258 ;;line 449;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 450;; 

.40 ;;line 451;; 40 player0:

	LDX #<player40_0
	STX player0pointerlo
	LDA #>player40_0
	STA player0pointerhi
	LDA #7
	STA player0height
.L0259 ;;line 461;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 462;; 

.50 ;;line 463;; 50 player0:

	LDX #<player50_0
	STX player0pointerlo
	LDA #>player50_0
	STA player0pointerhi
	LDA #7
	STA player0height
.L0260 ;;line 473;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 474;; 

.60 ;;line 475;; 60 player0:

	LDX #<player60_0
	STX player0pointerlo
	LDA #>player60_0
	STA player0pointerhi
	LDA #7
	STA player0height
.L0261 ;;line 485;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 486;; 

.70 ;;line 487;; 70 player0:

	LDX #<player70_0
	STX player0pointerlo
	LDA #>player70_0
	STA player0pointerhi
	LDA #7
	STA player0height
.L0262 ;;line 497;;  goto doneSetFrame

 jmp .doneSetFrame
.
 ;;line 498;; 

.80 ;;line 499;; 80 player0:

	LDX #<player80_0
	STX player0pointerlo
	LDA #>player80_0
	STA player0pointerhi
	LDA #7
	STA player0height
.doneSetFrame
 ;;line 509;; doneSetFrame

.
 ;;line 510;; 

.L0263 ;;line 511;;  return

	RTS
.
 ;;line 512;; 

.movezombie
 ;;line 513;; movezombie

.L0264 ;;line 514;;  temp1 = zombiexvel & 252 : temp2 = zombieyvel & 252 : temp3 = zombiefinalxvel & 252 : temp4 = zombiefinalyvel & 252

	LDA zombiexvel
	AND #252
	STA temp1
	LDA zombieyvel
	AND #252
	STA temp2
	LDA zombiefinalxvel
	AND #252
	STA temp3
	LDA zombiefinalyvel
	AND #252
	STA temp4
.L0265 ;;line 515;;  if temp1 <> temp3 then check24

	LDA temp1
	CMP temp3
 if ((* - .check24) < 127) && ((* - .check24) > -128)
	BNE .check24
 else
	beq .23skipcheck24
	jmp .check24
.23skipcheck24
 endif
.L0266 ;;line 516;;  zombiefinalxvel = rand

 jsr randomize
	STA zombiefinalxvel
.L0267 ;;line 517;;  if level{1} then temp1 = player1x - player0x : zombiefinalxvel{7} = temp1{7}

	LDA level
	AND #2
	BEQ .skipL0267
.condpart57
	LDA player1x
	SEC
	SBC player0x
	STA temp1
	LDA temp1
	AND #128
  PHP
	LDA zombiefinalxvel
	AND #127
  PLP
	.byte $F0, $02
	ORA #128
	STA zombiefinalxvel
.skipL0267
.check24
 ;;line 518;; check24

.L0268 ;;line 519;;  if temp2 <> temp4 then donecheck24

	LDA temp2
	CMP temp4
 if ((* - .donecheck24) < 127) && ((* - .donecheck24) > -128)
	BNE .donecheck24
 else
	beq .24skipdonecheck24
	jmp .donecheck24
.24skipdonecheck24
 endif
.L0269 ;;line 520;;  zombiefinalyvel = rand

 jsr randomize
	STA zombiefinalyvel
.L0270 ;;line 521;;  if level{1} then temp1 = player1y - player0y : zombiefinalyvel{7} = temp1{7}

	LDA level
	AND #2
	BEQ .skipL0270
.condpart58
	LDA player1y
	SEC
	SBC player0y
	STA temp1
	LDA temp1
	AND #128
  PHP
	LDA zombiefinalyvel
	AND #127
  PLP
	.byte $F0, $02
	ORA #128
	STA zombiefinalyvel
.skipL0270
.donecheck24
 ;;line 522;; donecheck24

.L0271 ;;line 523;;  if zombiexvel{7}  &&  !zombiefinalxvel{7} then zombiexvel = zombiexvel + 1 : goto donex

	BIT zombiexvel
	BPL .skipL0271
.condpart59
	BIT zombiefinalxvel
	BMI .skip58then
.condpart60
	INC zombiexvel
 jmp .donex
.skip58then
.skipL0271
.L0272 ;;line 524;;  if !zombiexvel{7}  &&  zombiefinalxvel{7} then zombiexvel = zombiexvel - 1 : goto donex

	BIT zombiexvel
	BMI .skipL0272
.condpart61
	BIT zombiefinalxvel
	BPL .skip60then
.condpart62
	DEC zombiexvel
 jmp .donex
.skip60then
.skipL0272
.L0273 ;;line 525;;  if zombiexvel > zombiefinalxvel then zombiexvel = zombiexvel - 1 else zombiexvel = zombiexvel + 1

	LDA zombiefinalxvel
	CMP zombiexvel
     BCS .skipL0273
.condpart63
	DEC zombiexvel
 jmp .skipelse16
.skipL0273
	INC zombiexvel
.skipelse16
.donex
 ;;line 526;; donex

.L0274 ;;line 527;;  if zombieyvel{7}  &&  !zombiefinalyvel{7} then zombieyvel = zombieyvel + 1 : goto doney

	BIT zombieyvel
	BPL .skipL0274
.condpart64
	BIT zombiefinalyvel
	BMI .skip63then
.condpart65
	INC zombieyvel
 jmp .doney
.skip63then
.skipL0274
.L0275 ;;line 528;;  if !zombieyvel{7}  &&  zombiefinalyvel{7} then zombieyvel = zombieyvel - 1 : goto doney

	BIT zombieyvel
	BMI .skipL0275
.condpart66
	BIT zombiefinalyvel
	BPL .skip65then
.condpart67
	DEC zombieyvel
 jmp .doney
.skip65then
.skipL0275
.L0276 ;;line 529;;  if zombieyvel > zombiefinalyvel then zombieyvel = zombieyvel - 1 else zombieyvel = zombieyvel + 1

	LDA zombiefinalyvel
	CMP zombieyvel
     BCS .skipL0276
.condpart68
	DEC zombieyvel
 jmp .skipelse17
.skipL0276
	INC zombieyvel
.skipelse17
.doney
 ;;line 530;; doney

.L0277 ;;line 531;;  temp5 = 0

	LDA #0
	STA temp5
.L0278 ;;line 532;;  if zombiexvel{7} then temp5 = 255

	BIT zombiexvel
	BPL .skipL0278
.condpart69
	LDA #255
	STA temp5
.skipL0278
.L0279 ;;line 533;;  temp3 = 0

	LDA #0
	STA temp3
.L0280 ;;line 534;;  if zombieyvel{7} then temp3 = 255

	BIT zombieyvel
	BPL .skipL0280
.condpart70
	LDA #255
	STA temp3
.skipL0280
.L0281 ;;line 535;;  temp6 = zombiexvel : temp4 = zombieyvel

	LDA zombiexvel
	STA temp6
	LDA zombieyvel
	STA temp4
.L0282 ;;line 536;;  zombiexpos = zombiexpos + zombievel

	LDA v
	CLC 
	ADC temp6
	STA v
	LDA zombiexpos
	ADC zombievel
	STA zombiexpos
.L0283 ;;line 537;;  temp6 = temp4 : temp5 = temp3

	LDA temp4
	STA temp6
	LDA temp3
	STA temp5
.L0284 ;;line 538;;  zombieypos = zombieypos + zombievel

	LDA w
	CLC 
	ADC temp6
	STA w
	LDA zombieypos
	ADC zombievel
	STA zombieypos
.L0285 ;;line 539;;  if player1y > 100 then player1y = 0

	LDA #100
	CMP player1y
     BCS .skipL0285
.condpart71
	LDA #0
	STA player1y
.skipL0285
.L0286 ;;line 540;;  if player1y > $50 then zombiefinalyvel =  ( zombiefinalyvel ^ 127 )  | 128 : zombieyvel =  ( zombieyvel ^ 127 )  | 128

	LDA #$50
	CMP player1y
     BCS .skipL0286
.condpart72
; complex statement detected
	LDA zombiefinalyvel
	EOR #127
	ORA #128
	STA zombiefinalyvel
; complex statement detected
	LDA zombieyvel
	EOR #127
	ORA #128
	STA zombieyvel
.skipL0286
.L0287 ;;line 541;;  if player1y < 10 then zombiefinalyvel =  ( zombiefinalyvel ^ 127 )  & 127 : zombieyvel =  ( zombieyvel ^ 127 )  & 127

	LDA player1y
	CMP #10
     BCS .skipL0287
.condpart73
; complex statement detected
	LDA zombiefinalyvel
	EOR #127
	AND #127
	STA zombiefinalyvel
; complex statement detected
	LDA zombieyvel
	EOR #127
	AND #127
	STA zombieyvel
.skipL0287
.L0288 ;;line 542;;  if player1x > 200 then player1x = player1x + 160

	LDA #200
	CMP player1x
     BCS .skipL0288
.condpart74
	LDA player1x
	CLC
	ADC #160
	STA player1x
.skipL0288
.L0289 ;;line 543;;  if player1x > 160 then player1x = player1x - 160

	LDA #160
	CMP player1x
     BCS .skipL0289
.condpart75
	LDA player1x
	SEC
	SBC #160
	STA player1x
.skipL0289
.L0290 ;;line 544;;  REFP1 = zombiexvel / 4 / 4

; complex statement detected
	LDA zombiexvel
	lsr
	lsr
	lsr
	lsr
	STA REFP1
.L0291 ;;line 545;;  return

	RTS
.
 ;;line 546;; 

.L0292 ;;line 547;;  data gonextlevel

	JMP .skipL0292
gonextlevel
	.byte  1,2,3,4,5,6,7,8,9,$10,$11,$12,$13,$14,$15,$99

.skipL0292
.
 ;;line 550;; 

.L0293 ;;line 551;;  vblank

vblank_bB_code
.L0294 ;;line 552;;  if gamebits{7}  &&  level{0} then gosub movezombie

	BIT gamebits
	BPL .skipL0294
.condpart76
	LDA level
	LSR
	BCC .skip75then
.condpart77
 jsr .movezombie
.skip75then
.skipL0294
.L0295 ;;line 553;;  return

	RTS
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player0then_1
	.byte     %00100100
	.byte         %00010100
	.byte         %00011000
	.byte         %00010000
	.byte         %00111000
	.byte         %00010000
	.byte         %00011000
	.byte         %00011000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player1then_1
	.byte         %00011000
	.byte         %00010000
	.byte         %00010000
	.byte         %00010000
	.byte         %00111000
	.byte         %00010000
	.byte         %00011000
	.byte         %00011000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playercolorL057_1
	.byte  $F4
	.byte  $E4
	.byte  $EA
	.byte  $EA
	.byte  $16
	.byte  $16
	.byte  $4C
	.byte  $4C
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player5_0
	.byte   %11000011
	.byte   %11111111
	.byte   %11011011
	.byte   %00011000
	.byte   %11011011
	.byte   %11111111
	.byte   %11011011
	.byte   %00011000
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player10_0
	.byte  %00000110
	.byte  %00111110
	.byte  %11110000
	.byte  %11011011
	.byte  %00011111
	.byte  %11111000
	.byte  %11001100
	.byte  %00000100
	.byte 
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player20_0
	.byte  %00001100
	.byte  %00001100
	.byte  %00110011
	.byte  %00111011
	.byte  %11011100
	.byte  %11001100
	.byte  %00110010
	.byte  %00110000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player30_0
	.byte  %00110110
	.byte  %00110110
	.byte  %01100100
	.byte  %01111110
	.byte  %01011110
	.byte  %11001011
	.byte  %11011000
	.byte  %00011000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player40_0
	.byte  %11101110
	.byte  %11101110
	.byte  %01000100
	.byte  %01111111
	.byte  %01111111
	.byte  %01000100
	.byte  %11101110
	.byte  %11101110
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player50_0
	.byte  %00011000
	.byte  %11011000
	.byte  %11001011
	.byte  %01011110
	.byte  %01111110
	.byte  %01100100
	.byte  %00110110
	.byte  %00110110
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player60_0
	.byte  %00110000
	.byte  %00110010
	.byte  %11001100
	.byte  %11011100
	.byte  %00111011
	.byte  %00110011
	.byte  %00001100
	.byte  %00001100
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player70_0
	.byte  %00000100
	.byte  %11001100
	.byte  %11111000
	.byte  %00011111
	.byte  %11011011
	.byte  %11110000
	.byte  %00111110
	.byte  %00000110
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player80_0
	.byte   %00011000
	.byte   %11011011
	.byte   %11111111
	.byte   %11011011
	.byte   %00011000
	.byte   %11011011
	.byte   %11111111
	.byte   %11000011
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
