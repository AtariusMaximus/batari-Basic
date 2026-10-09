 set kernel split 
 set romsize 16kSC

 ; Supported Resolutions for the Split kernel are 12, 24, and 32.
 ; Setting one of them will automatically update the split screen to support that resolution.
 ; If you do not specify pfres, it will default to 12.
 ;const pfres = 12 
 ;const pfres = 24  
 ;const pfres = 32 

 dim p2_player0y = a        ; Bottom screen player 0 Y coordinate
 dim p2_player0x = b        ; Bottom screen player 0 X coordinate
 dim p2_colupf = c          ; Bottom screen playfield color

 dim p0_room = d            ; Current room index for the top screen
 dim p1_room = e            ; Current room index for the bottom screen

 dim p0_oldx = f            ; Top screen player X position before movement 
 dim p0_oldy = g            ; Top screen player Y position before movement 
 
 dim p1_oldx = h            ; Bottom screen player X position before movement 
 dim p1_oldy = i            ; Bottom screen player Y position before movement

 dim p2_player1y = j        ; Bottom screen player 1 Y coordinate
 dim p2_player1x = k        ; Bottom screen player 1 X coordinate
 
 dim p2_player0pointerlo = l  ; Low byte of player 0 graphic address for the bottom screen
 dim p2_player0pointerhi = m  ; High byte of player 0 graphic address for the bottom screen

 dim p2_player1pointerlo = n  ; Low byte of player 1 graphic address for the bottom screen
 dim p2_player1pointerhi = o  ; High byte of player 1 graphic address for the bottom screen

 dim p2_colup0 = p          ; Bottom screen Player 0 Color

 ; Start positions
 player0x = 92 : player0y = 25
 p2_player0x = 92 : p2_player0y = 25
 p0_room = 19 : p1_room = 19

 ; Load the initial rooms
 gosub load_p0_room
 gosub load_p1_room

 ; Define the BOTTOM graphic using the native command
 player0:
 %01101100
 %00101000
 %00111000
 %11111110
 %00111000
 %00111000
end

 ; Save the pointers for the bottom screen
 p2_player0pointerlo = player0pointerlo
 p2_player0pointerhi = player0pointerhi

 ; Copy Player 1 over normally
 p2_player1pointerlo = player1pointerlo
 p2_player1pointerhi = player1pointerhi

main_loop

 ; Define the TOP graphic.
 ; When the loop hits this, it overwrites player0pointer with the top graphic.
 player0:
 %01101100
 %00101000
 %00111000
 %01111100
 %00010000
 %00111000
end

 COLUBK = $00    
 CTRLPF = $21    ; CTRLPF must be $x1 for this kernel
 COLUP0 = $1E    
 p2_colup0 = $44 ; Player 0 Color BOTTOM (Red)

 ; Store Position Rollback
 p0_oldx = player0x : p0_oldy = player0y
 p1_oldx = p2_player0x : p1_oldy = p2_player0y

 ; Player 0 (Top Screen / Joy 0)
 if joy0up then player0y = player0y - 1
 if joy0down then player0y = player0y + 1
 if joy0left then player0x = player0x - 1
 if joy0right then player0x = player0x + 1

 ; Player 1 (Bottom Screen / Joy 1)
 if joy1up then p2_player0y = p2_player0y - 1
 if joy1down then p2_player0y = p2_player0y + 1
 if joy1left then p2_player0x = p2_player0x - 1
 if joy1right then p2_player0x = p2_player0x + 1

 ; Player 0 Screen Wrap / Room Transition
 if player0y < 8 then player0y = 42 : p0_room = move_north[p0_room] : gosub load_p0_room
 if player0y > 44 then player0y = 8 : p0_room = move_south[p0_room] : gosub load_p0_room
 if player0x < 16 then player0x = 136 : p0_room = move_west[p0_room] : gosub load_p0_room
 if player0x > 138 then player0x = 24 : p0_room = move_east[p0_room] : gosub load_p0_room

 ; Player 1 Screen Wrap / Room Transition
 if p2_player0y < 6 then p2_player0y = 42 : p1_room = move_north[p1_room] : gosub load_p1_room
 if p2_player0y > 44 then p2_player0y = 8 : p1_room = move_south[p1_room] : gosub load_p1_room
 if p2_player0x < 16 then p2_player0x = 138 : p1_room = move_west[p1_room] : gosub load_p1_room
 if p2_player0x > 138 then p2_player0x = 24 : p1_room = move_east[p1_room] : gosub load_p1_room
 
 COLUPF = room_color[p0_room]
 p2_colupf = room_color[p1_room]

 drawscreen

 if collision(player0, playfield) then gosub knock_back

 goto main_loop

knock_back
 player0x = p0_oldx
 player0y = p0_oldy
 p2_player0x = p1_oldx
 p2_player0y = p1_oldy
 return

; -----------------------------------------------------------
; ROOM LOADING SUBROUTINES 
; -----------------------------------------------------------
load_p0_room
 temp1 = room_shape[p0_room]
 COLUPF = room_color[p0_room]
 asm
   ldx temp1
   lda room_pointers_lo,x
   sta temp5
   lda room_pointers_hi,x
   sta temp6
   
   ldy #(split_ram_offset - 1)  ; Auto-adjusts loop size (63, 47, or 23)
.loopTop
   lda (temp5),y
   sta playfield-128,y
   dey
   bpl .loopTop
end
 return

load_p1_room
 temp1 = room_shape[p1_room]
 p2_colupf = room_color[p1_room]
 asm
   ldx temp1
   lda room_pointers_lo,x
   sta temp5
   lda room_pointers_hi,x
   sta temp6
   
   ldy #(split_ram_offset - 1)  ; Auto-adjusts loop size
.loopBot
   lda (temp5),y
   sta playfield-128+split_ram_offset,y  ; Auto-shifts the bottom RAM buffer
   dey
   bpl .loopBot
end
 return

; -----------------------------------------------------------
; DATA TABLES
; -----------------------------------------------------------
 data room_shape
 7,11,4,1,2,9,10,3,9,12,8,4,15,6,5,3,13
 11,10,3,5,15,0,1,1,14,8,4,15,14,10,2,12,14
end

 data move_north
 0,0,0,0,5,2,4,8,9,0,11,12,0,0,0,14,0,0
 3,21,0,0,20,0,0,22,23,28,0,27,24,32,0,31
end

 data move_east
 1,0,3,4,0,0,7,10,0,0,0,13,0,14,0,17,15,0
 19,20,0,0,24,22,23,0,0,26,0,0,31,0,0,0
end

 data move_south
 2,0,5,18,6,4,0,0,7,8,0,10,11,0,15,0,0,0
 0,0,22,19,25,26,30,0,0,29,27,0,0,33,31,0
end

 data move_west
 0,0,0,2,3,0,0,6,0,0,7,0,0,11,13,16,0,15
 0,18,19,0,23,24,22,0,27,0,0,0,0,30,0,0
end

 data room_color
 $80,$82,$84,$86,$C2,$C4,$62,$66,$68
 $76,$08,$06,$04,$02,$44,$46,$48
 $AA,$BC,$CC,$3C,$34,$38,$54,$56,$24
 $2E,$26,$28,$F4,$F6,$F8,$E4,$A8
end

 asm
room_pointers_lo
 .byte <PF_data0, <PF_data1, <PF_data2, <PF_data3, <PF_data4, <PF_data5, <PF_data6, <PF_data7
 .byte <PF_data8, <PF_data9, <PF_data10, <PF_data11, <PF_data12, <PF_data13, <PF_data14, <PF_data15
room_pointers_hi
 .byte >PF_data0, >PF_data1, >PF_data2, >PF_data3, >PF_data4, >PF_data5, >PF_data6, >PF_data7
 .byte >PF_data8, >PF_data9, >PF_data10, >PF_data11, >PF_data12, >PF_data13, >PF_data14, >PF_data15
end

; -----------------------------------------------------------
; ROOM DEFINITIONS
; -----------------------------------------------------------
draw_room_shape_0
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 ................................
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_1
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 ................................
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_2
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 ..............................XX
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_3
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 ................................
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_4
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 XX..............................
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_5
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 ..............................XX
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_6
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 ................................
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_7
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 XX..............................
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_8
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 ..............................XX
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_9
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 XX............................XX
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_10
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 XX..............................
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_11
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 ..............................XX
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_12
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 XX............................XX
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_13
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX............................XX
 XX..............................
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_14
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 XX............................XX
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 return

draw_room_shape_15
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX....XXXXX..XXXXXX..XXXXX....XX
 XX....XXXXXXXX....XXXXXXXX....XX
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
end
 return