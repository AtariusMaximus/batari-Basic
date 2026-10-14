 set kernel split 
 set romsize 16kSC

 ; 24 Playfield Rows (12 Top, 12 Bottom) -> Frees w000-w031 / r000-r031
 const pfres = 24
 const noscore = 1     ; Skips 11-line score kernel (+836 cycles in Overscan!)
 const split_color = $A0

 ; =========================================================
 ; DEBUG OPTIONS
 ; =========================================================
 ; Set to 1 to prevent Dragons from swallowing players during testing.
 ; Set to 0 for normal gameplay (Dragons swallow player; Fire respawns).
 const DEBUG_NO_SWALLOW = 1

 ; =========================================================
 ; TOP SCREEN ALIASES (Using dim for DASM symbol visibility)
 ; =========================================================
 dim top_player0x  = player0x
 dim top_player0y  = player0y
 dim top_player1x  = player1x
 dim top_player1y  = player1y
 dim top_colup0    = COLUP0
 dim top_colup1    = COLUP1
 dim top_colupf    = COLUPF
 dim top_p0_ptr_lo = player0pointerlo
 dim top_p0_ptr_hi = player0pointerhi
 dim top_p1_ptr_lo = player1pointerlo
 dim top_p1_ptr_hi = player1pointerhi

 ; =========================================================
 ; CONSTANTS
 ; =========================================================
 const OBJ_RED_DRAGON = 0
 const OBJ_YEL_DRAGON = 1
 const OBJ_GRN_DRAGON = 2
 const OBJ_MAGNET     = 3
 const OBJ_SWORD      = 4
 const OBJ_CHALICE    = 5
 const OBJ_BRIDGE     = 6
 const OBJ_YEL_KEY    = 7
 const OBJ_WHT_KEY    = 8
 const OBJ_BLK_KEY    = 9
 const OBJ_BAT        = 10

 const ENTRY_YELLOW  = 2
 const ENTRY_WHITE   = 23
 const ENTRY_BLACK   = 13
 const CASTLE_YELLOW = 1
 const CASTLE_WHITE  = 21
 const CASTLE_BLACK  = 12

 ; =========================================================
 ; SUPERCHIP RAM ALLOCATION (w000-w031 / r000-r031)
 ; =========================================================
 ; Write Aliases (Use on LEFT side of =)
 dim w_top_obj_room     = w000 ; Uses w000 - w010 (11 bytes: Top object rooms)
 dim w_bot_obj_room     = w011 ; Uses w011 - w021 (11 bytes: Bottom object rooms)
 dim w_top_oldx         = w022
 dim w_top_oldy         = w023
 dim w_bottom_oldx      = w024
 dim w_bottom_oldy      = w025
 dim w_top_carry_off_x  = w026
 dim w_top_carry_off_y  = w027
 dim w_bot_carry_off_x  = w028
 dim w_bot_carry_off_y  = w029
 dim w_top_obj_hit      = w030
 dim w_bot_obj_hit      = w031

 ; Read Aliases (Use in IF checks, array indices, and RIGHT side of =)
 dim r_top_obj_room     = r000 ; Uses r000 - r010 (11 bytes: Top object rooms)
 dim r_bot_obj_room     = r011 ; Uses r011 - r021 (11 bytes: Bottom object rooms)
 dim r_top_oldx         = r022
 dim r_top_oldy         = r023
 dim r_bottom_oldx      = r024
 dim r_bottom_oldy      = r025
 dim r_top_carry_off_x  = r026
 dim r_top_carry_off_y  = r027
 dim r_bot_carry_off_x  = r028
 dim r_bot_carry_off_y  = r029
 dim r_top_obj_hit      = r030
 dim r_bot_obj_hit      = r031

 ; =========================================================
 ; ZERO-PAGE VAR0-VAR47 ALLOCATION (Independent X/Y Arrays)
 ; =========================================================
 dim top_obj_x       = var0  ; Uses var0  - var10 (11 bytes: Top object X)
 dim top_obj_y       = var11 ; Uses var11 - var21 (11 bytes: Top object Y)
 dim bot_obj_x       = var22 ; Uses var22 - var32 (11 bytes: Bottom object X)
 dim bot_obj_y       = var33 ; Uses var33 - var43 (11 bytes: Bottom object Y)
 dim room_flags      = var44 ; Bit 0=Load Top, Bit 1=Load Bot, Bit 7=Frame Skip Toggle
 dim bot_flicker_idx = var45 ; Bottom screen round-robin flicker cursor
 dim flicker_idx     = var46 ; Top screen round-robin flicker cursor
 dim top_cxp1fb      = var47 ; Cache: Did top ball hit Player 1?

 ; =========================================================
 ; REQUIRED BOTTOM SCREEN KERNEL & GAME VARIABLES (a-z)
 ; =========================================================
 dim bottom_colup0    = a  ; (OPTIONAL) Bottom P0 Color
 dim bottom_colup1    = b  ; (OPTIONAL) Bottom P1 Color
 dim bottom_player0y  = c  ; (REQUIRED) Bottom P0 Y coordinate
 dim bottom_player0x  = d  ; (REQUIRED) Bottom P0 X coordinate
 dim bottom_colupf    = e  ; (REQUIRED) Bottom playfield color
 dim top_room         = f  ; Current room index for the top screen
 dim bottom_room      = g  ; Current room index for the bottom screen
 dim top_carried_item = h  ; Top player carried item (255 = empty)
 dim bot_carried_item = i  ; Bottom player carried item (255 = empty)
 dim gate_state       = j  ; Bits 0-2: Top Gates (Y/W/B), Bits 3-5: Bot Gates (Y/W/B)
 dim top_drag_state   = k  ; Bits 0-1: Roar ID (3=None), Bits 2-6: Roar Timer (0..22), Bit 7: Eaten
 dim bottom_player1y  = l  ; (REQUIRED) Bottom P1 Y coordinate
 dim bottom_player1x  = m  ; (REQUIRED) Bottom P1 X coordinate
 dim bottom_p0_ptr_lo = n  ; (REQUIRED) Bottom P0 graphic low byte
 dim bottom_p0_ptr_hi = o  ; (REQUIRED) Bottom P0 graphic high byte
 dim bottom_p1_ptr_lo = p  ; (REQUIRED) Bottom P1 graphic low byte
 dim bottom_p1_ptr_hi = q  ; (REQUIRED) Bottom P1 graphic high byte
 dim bot_drag_state   = r  ; Bits 0-1: Roar ID (3=None), Bits 2-6: Roar Timer (0..22), Bit 7: Eaten
 dim drag_dead        = s  ; Bits 0-2: Top Dragons 0-2 Dead, Bits 3-5: Bot Dragons 0-2 Dead
 ; FREE: t, u (2 bytes open!)
 dim p2_ballx         = v  ; Bottom screen ball X coordinate
 dim p2_bally         = w  ; Bottom screen ball Y coordinate
 ; FREE: x (1 byte open!)
 dim top_cxblpf       = y  ; Cache: Did top ball hit playfield?
 dim top_cxp0fb       = z  ; Cache: Did top ball hit Player 0?

 ; =========================================================
 ; INITIALIZATION
 ; =========================================================
 ballx = 92 : bally = 38
 p2_ballx = 92 : p2_bally = 38
 ballheight = 4

 ; Castle Gate X positions never change - set once here!
 top_player0x = 71 : top_player0y = 255
 bottom_player0x = 76 : bottom_player0y = 255
 
 top_player1x = 120 : top_player1y = 255        
 bottom_player1x = 120 : bottom_player1y = 255    

 missile0y = 255 : missile1y = 255

 ; Set the permanent shape for the Castle Gate (Player 0)
 player0:
 %01111111
 %01010101
 %01111111
 %01010101
 %01111111
 %01010101
 %01111111
 %01010101
 %01111111
 %01010101
 %01111111
 %01010101
 %01111111
 %01010101
 %01111111
end

 bottom_p0_ptr_lo = top_p0_ptr_lo
 bottom_p0_ptr_hi = top_p0_ptr_hi
 player0height = 15
 NUSIZ0 = 5

 top_room = 2 : bottom_room = 2
 room_flags = 0
 gosub init_level_2 bank2
 gosub load_top_room
 gosub load_bottom_room
 gosub check_gates bank3

main_loop
 ; =========================================================
 ; 1. FAST 60HZ MOVEMENT & ROLLBACK (~200 cycles)
 ; =========================================================
 PF0 = 0         ; Ensure PF0 is always cleared to prevent edge bars
 COLUBK = $04    
 CTRLPF = $21    ; Enables PF Priority/Reflection and sets Ball width to 4 pixels
 NUSIZ0 = 5      ; Double-width Player 0 for Castle Gates
 top_colup0 = $02
 bottom_colup0 = $02

 ; Toggle Frame Skip bit (Bit 7: 0 = Even Frame, 1 = Odd Frame)
 room_flags = room_flags ^ $80

 ; Store Position Rollback in Superchip RAM
 w_top_oldx = ballx : w_top_oldy = bally
 w_bottom_oldx = p2_ballx : w_bottom_oldy = p2_bally

 ; Top Screen Ball / Joy 0 (60 Hz - Disabled if eaten by Dragon)
 if top_drag_state{7} then goto _skip_top_move
 if joy0up then bally = bally - 1
 if joy0down then bally = bally + 1
 if joy0left then ballx = ballx - 1
 if joy0right then ballx = ballx + 1
_skip_top_move

 ; Bottom Screen Ball / Joy 1 (60 Hz - Disabled if eaten by Dragon)
 if bot_drag_state{7} then goto _skip_bot_move
 if joy1up then p2_bally = p2_bally - 1
 if joy1down then p2_bally = p2_bally + 1
 if joy1left then p2_ballx = p2_ballx - 1
 if joy1right then p2_ballx = p2_ballx + 1
_skip_bot_move

 top_colupf = room_color[top_room]
 bottom_colupf = room_color[bottom_room]

 ; --- Keep Top Carried Item Attached (Top World Only) ---
 temp1 = top_carried_item
 if temp1 <> 255 then w_top_obj_room[temp1] = top_room : top_obj_x[temp1] = ballx + r_top_carry_off_x : top_obj_y[temp1] = bally + r_top_carry_off_y

 ; --- Keep Bottom Carried Item Attached (Bottom World Only) ---
 temp1 = bot_carried_item
 if temp1 <> 255 then w_bot_obj_room[temp1] = bottom_room : bot_obj_x[temp1] = p2_ballx + r_bot_carry_off_x : bot_obj_y[temp1] = p2_bally + r_bot_carry_off_y

 ; Fast ASM Flicker sets player1x before drawscreen's RESP1 positioning
 gosub run_flicker_logic bank2

 drawscreen

 ; =========================================================
 ; 2. 60HZ HARDWARE COLLISION KNOCKBACK (MUST RUN BEFORE TRANSITIONS!)
 ; =========================================================
 if top_cxp0fb{6} then gosub gate_collide_top bank3
 if top_cxblpf{7} && !top_drag_state{7} then ballx = r_top_oldx : bally = r_top_oldy
 
 if collision(player0, ball) then gosub gate_collide_bot bank3
 if collision(ball, playfield) && !bot_drag_state{7} then p2_ballx = r_bottom_oldx : p2_bally = r_bottom_oldy

 ; =========================================================
 ; 3. FRAME-SKIPPED BOUNDARY & AI LOGIC (Runs AFTER Knockback!)
 ; =========================================================
 ; 3-byte trampoline guarantees a 16-bit JMP so this branch never goes out of range
 if !room_flags{7} then goto _even_frame_logic
 goto _odd_frame_logic

_even_frame_logic
 ; --- EVEN FRAME: Top Screen Room, Castle & Dragon AI ---
 if bally < 32 || bally > 44 then gosub castle_transitions_top bank3

 if bally < 3 then bally = 44 : w_top_oldy = 44 : top_room = move_north[top_room] : room_flags{0} = 1
 if bally > 44 then bally = 3 : w_top_oldy = 3 : top_room = move_south[top_room] : room_flags{0} = 1
 if ballx < 17 then ballx = 139 : w_top_oldx = 139 : top_room = move_west[top_room] : room_flags{0} = 1
 if ballx > 139 then ballx = 17 : w_top_oldx = 17 : top_room = move_east[top_room] : room_flags{0} = 1

 gosub update_top_dragons bank2
 goto main_loop

_odd_frame_logic
 ; --- ODD FRAME: Bottom Screen Room, Castle & Dragon AI ---
 if p2_bally < 31 || p2_bally > 45 then gosub castle_transitions_bot bank3

 if p2_bally < 3 then p2_bally = 45 : w_bottom_oldy = 45 : bottom_room = move_north[bottom_room] : room_flags{1} = 1
 if p2_bally > 45 then p2_bally = 3 : w_bottom_oldy = 3 : bottom_room = move_south[bottom_room] : room_flags{1} = 1
 if p2_ballx < 17 then p2_ballx = 139 : w_bottom_oldx = 139 : bottom_room = move_west[bottom_room] : room_flags{1} = 1
 if p2_ballx > 139 then p2_ballx = 17 : w_bottom_oldx = 17 : bottom_room = move_east[bottom_room] : room_flags{1} = 1

 gosub update_bot_dragons bank2
 goto main_loop

; -----------------------------------------------------------
; DATA TABLES (Adventure Game 24 Shapes, 31 Rooms)
; -----------------------------------------------------------
 data move_north
 0,0,1,2,3,4,0,0,10,0,8,9,11,12,7,13
 0,5,0,0,18,19,20,21,23,16,25,26,0,28,5
end

 data move_east
 0,0,0,6,7,3,5,4,9,10,11,8,0,0,15,16
 14,14,19,18,21,0,0,0,27,26,25,29,0,24,0
end

 data move_south
 0,2,3,4,5,30,0,14,10,11,8,12,13,15,0,0
 25,0,20,21,22,23,0,24,24,26,27,0,29,29,0
end

 data move_west
 0,0,0,5,7,6,3,4,11,8,9,10,0,0,16,14
 15,16,19,18,21,0,0,0,29,26,25,24,0,27,0
end

 data room_shape
 0,5,19,0,1,3,4,2,20,21,22,23,18,19,6,6
 7,6,13,16,14,17,15,19,12,8,9,10,5,12,15
end

 data room_color
 $00,$18,$18,$86,$86,$86,$86,$86,$38,$38,$38,$38,$46,$02,$64,$64
 $64,$64,$38,$38,$38,$38,$38,$1A,$64,$38,$38,$38,$66,$A8,$86
end

; -----------------------------------------------------------
; ROOM LOADING SUBROUTINES (Called from VBlank when dirty!)
; -----------------------------------------------------------
load_top_room
 temp1 = room_shape[top_room]
 top_colupf = room_color[top_room]
 asm
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
end
 return otherbank

load_bottom_room
 temp1 = room_shape[bottom_room]
 bottom_colupf = room_color[bottom_room]
 asm
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
end
 return otherbank

; -----------------------------------------------------------
; ROOM DEFINITIONS (12 Rows Each for pfres = 24)
; -----------------------------------------------------------
 ;Blue Maze Top
room_0
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXX........................XXXX
 XXXX........................XXXX
 XXXX..XXXXXXXXXXXXXXXXXXXX..XXXX
 XXXX..XXXXXXXXXXXXXXXXXXXX..XXXX
 ......XX................XX......
 ......XX................XX......
 XXXXXXXX..XXXX....XXXX..XXXXXXXX
end
 return

 ;Blue Maze Dead Center 
room_1
 playfield:
 XXXXXXXX..XXXX....XXXX..XXXXXXXX
 ......XX....XX....XX....XX......
 ......XX....XX....XX....XX......
 XXXXXXXXXX..XX....XX..XXXXXXXXXX
 XXXXXXXXXX..XX....XX..XXXXXXXXXX
 ............XX....XX............
 ............XX....XX............
 XXXXXXXXXXXXXX....XXXXXXXXXXXXXX
 XXXXXXXXXXXXXX....XXXXXXXXXXXXXX
 ....XX....................XX....
 ....XX....................XX....
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 ;Blue Maze Middle Right
room_2
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXX..XXXXXXXXX..XXXXXXXXX..XXXX
 XXXX..XXXXXXXXX..XXXXXXXXX..XXXX
 .............XX..XX.............
 .............XX..XX.............
 XXXX..XXXXXXXXX..XXXXXXXXX..XXXX
 XXXX..XXXXXXXXX..XXXXXXXXX..XXXX
 ......XX................XX......
 ......XX................XX......
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 ;Blue Maze Middle Bottom 
room_3
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ..........XX........XX..........
 ..........XX........XX..........
 XX..XXXXXXXX........XXXXXXXX..XX
 XX..XXXXXXXX........XXXXXXXX..XX
 XX............................XX
 XX............................XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ....XX....................XX....
 ....XX....................XX....
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 ;Blue Maze Bottom Left
room_4
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ..............XXXX..............
 ..............XXXX..............
 XXXXXXXXXXXX..XXXX..XXXXXXXXXXXX
 XXXXXXXXXXXX..XXXX..XXXXXXXXXXXX
 XX............XXXX............XX
 XX............XXXX............XX
 XX..XXXXXXXX..XXXX..XXXXXXXX..XX
 XX..XXXXXXXX..XXXX..XXXXXXXX..XX
 ....XXXXXXXX........XXXXXXXX....
 ....XXXXXXXX........XXXXXXXX....
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 return

room_5
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX...XX..................XX...XX
 XX...XX..................XX...XX
 XX........XX........XX........XX
 XX........XX........XX........XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX........XX........XX........XX
 XX........XX........XX........XX
 XX...XX..................XX...XX
 XX...XX..................XX...XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

room_6
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ..XX...........XX...........XX..
 ..XX...........XX...........XX..
 ..XX...........XX...........XX..
 ..XX...........XX...........XX..
 ..XX...........XX...........XX..
 ..XX.....XX..........XX.....XX..
 ..XX.....XX..........XX.....XX..
 .........XX..........XX.........
 .........XX..........XX.........
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 return

 ; Corridor Right
room_7
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ........X.X.........X.X.........
 ....X...X.X...X.X...X.X...X.....
 ....X...X.X...X.X...X.X...X.....
 ..X.X.........X.X.........X.X...
 ..X.X.........X.X.........X.X...
 ..X.X.....................X.X...
 ..X.X.....................X.X...
 ..X.X.....................X.X...
 ................................
 ................................
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 ;Top Invis
room_8
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ......XX......XXXX......XX......
 ......XX......XXXX......XX......
 XXXX..XX..XX..XXXX..XX..XX..XXXX
 XXXX..XX..XX..XXXX..XX..XX..XXXX
 ......XX..XX..XXXX..XX..XX......
 ......XX..XX..XXXX..XX..XX......
 XXXXXXXX..XX..XXXX..XX..XXXXXXXX
end
 return

 ;Middle Invis
room_9
 playfield:
 XXXXXXXX..XX..XXXX..XX..XXXXXXXX
 ..........XX..XXXX..XX..........
 ..........XX..XXXX..XX..........
 XXXXXXXXXXXX..XXXX..XXXXXXXXXXXX
 XXXXXXXXXXXX..XXXX..XXXXXXXXXXXX
 ........X..............X........
 ........X..............X........
 XXXXXX..X..XXXXXXXXXX..X..XXXXXX
 XXXXXX..X..XXXXXXXXXX..X..XXXXXX
 .....X..X..X........X..X..X.....
 .....X..X..X........X..X..X.....
 XXX..X..X..X..XXXX..X..X..X..XXX
end
 return

 ;Bottom Invis
room_10
 playfield:
 XXX..X..X..X..XXXX..X..X..X..XXX
 ..X..X.....X..XXXX..X.....X..X..
 ..X..X.....X..XXXX..X.....X..X..
 ..X..XXXXXXX..XXXX..XXXXXXX..X..
 ..X..XXXXXXX..XXXX..XXXXXXX..X..
 ..X...........XXXX...........X..
 ..X...........XXXX...........X..
 ..X..XXXXXXX..XXXX..XXXXXXX..X..
 ..X..XXXXXXX..XXXX..XXXXXXX..X..
 ........X.....XXXX.....X........
 ........X.....XXXX.....X........
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 return

room_11
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XX.......XXX........XXX.......XX
 XX.......XXX........XXX.......XX
 XXX..XXXXXXX........XXXXXXX..XXX
 XXX..XXXXXXX........XXXXXXX..XXX
 X..............................X
 X..............................X
 XXX..XXXXXXX........XXXXXXX..XXX
 XXX..XXXXXXX........XXXXXXX..XXX
 XX.......XXX........XXX.......XX
 XX.......XXX........XXX.......XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 ; Corridor Left and Middle
room_12
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ...XX....XX..........XX....XX...
 ...XX....XX....XX....XX....XX...
 ..XX....XX.....XX.....XX....XX..
 ..XX....XX.....XX.....XX....XX..
 ...............XX...............
 ...............XX...............
 ..XX....XX.....XX.....XX....XX..
 ..XX....XX.....XX.....XX....XX..
 ..XX....XX.....XX.....XX....XX..
 ..XX....XX.....XX.....XX....XX..
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 return

 ;Red Top Left
room_13
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ...........X..XXXX..X...........
 ...........X..XXXX..X...........
 XXXXXXXXX..X..XXXX..X..XXXXXXXXX
 XXXXXXXXX..X..XXXX..X..XXXXXXXXX
 XX......X..X..XXXX..X..X......XX
 XX......X..X..XXXX..X..X......XX
 XX..XX..XXXX..XXXX..XXXX..XX..XX
end
 return

 ;Red Left Middle
room_14
 playfield:
 XX..XX..XXXX..XXXX..XXXX..XX..XX
 XX...X........XXXX........X...XX
 XX...X........XXXX........X...XX
 XXXXXX..XXXXXXXXXXXXXXXX..XXXXXX
 XXXXXX..XXXXXXXXXXXXXXXX..XXXXXX
 .....X..X..............X..X.....
 .....X..X..............X..X.....
 XX..XX..XXXX........XXXX..XX..XX
 XX..XX..XXXX........XXXX..XX..XX
 ....X......X........X......X....
 ....X......X........X......X....
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 ;Red Bottom Left
room_15
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX.......XXX........XXX.......XX
 XX.......XXX........XXX.......XX
 XXX..XXXXXXX........XXXXXXX..XXX
 XXX..XXXXXXX........XXXXXXX..XXX
 X..............................X
 X..............................X
 XXX..XXXXXXX........XXXXXXX..XXX
 XXX..XXXXXXX........XXXXXXX..XXX
 XX.......XXX........XXX.......XX
 XX.......XXX........XXX.......XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 return

 ;Red Top Right
room_16
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ..............XXXX..............
 ..............XXXX..............
 XXXXXXXXXXXX..XXXX..XXXXXXXXXXXX
 XXXXXXXXXXXX..XXXX..XXXXXXXXXXXX
 ......XX......XXXX......XX......
 ......XX......XXXX......XX......
 XXXX..XX..XXXXXXXXXXXX..XX..XXXX
 XXXX..XX..XXXXXXXXXXXX..XX..XXXX
 XXXX..XX................XX..XXXX
 XXXX..XX................XX..XXXX
 XXXX..XXXXXX........XXXXXX..XXXX
end
 return

 ;Red Middle Right
room_17
 playfield:
 XXXX..XXXXXX........XXXXXX..XXXX
 XXXX........................XXXX
 XXXX........................XXXX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 ;Black Castle Maze Entry
room_18
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 XX............................XX
 XX............................XX
 XX............................XX
 XX............................XX
 XX............................XX
 XXXXXXXXXXX..........XXXXXXXXXXX
 XX.......XX..........XX.......XX
 XX.......XX..........XX.......XX
 XX.......XX..........XX.......XX
 XX.......XX..........XX.......XX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 return

room_19
 playfield:
 XXXXXXX.X.X.X......X.X.X.XXXXXXX
 XX....XXXXXXX......XXXXXXX....XX
 XX....XXXXXXXXXXXXXXXXXXXX....XX
 XX....XXXXXXXXXXXXXXXXXXXX....XX
 XX....XXXXXXXX....XXXXXXXX....XX
 XX......XXXXXX....XXXXXX......XX
 XX......XXXXXX....XXXXXX......XX
 XX......XXXXXX....XXXXXX......XX
 XX............................XX
 XX............................XX
 XX............................XX
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

room_20
 ; Black Castle Maze Top Left
 playfield:
 XXXXXX..XXXXXXXXXXXXXXXX..XXXXXX
 ........XX............XX........
 ........XX............XX........
 XXXXXXXXXX............XXXXXXXXXX
 XXXXXXXXXX............XXXXXXXXXX
 ................................
 ................................
 XX..XXXXXXXXXXXXXXXXXXXXXXXX..XX
 XX..XXXXXXXXXXXXXXXXXXXXXXXX..XX
 ....XX....................XX....
 ....XX....................XX....
 XXXXXX..XXXXXXXXXXXXXXXX..XXXXXX
end
 return

room_21
 ; Black Castle Maze Top Right
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

room_22
 ; Black Castle Maze Bottom Left
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

room_23
 ; Black Castle Maze Bottom Right
 playfield:
 XXXXXXXXXXXX........XXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 XXXXXXXXXXXX........XXXXXXXXXXXX
end
 return

 asm
room_pointers_lo
 .byte <PF_data0, <PF_data1, <PF_data2, <PF_data3, <PF_data4, <PF_data5, <PF_data6, <PF_data7
 .byte <PF_data8, <PF_data9, <PF_data10, <PF_data11, <PF_data12, <PF_data13, <PF_data14, <PF_data15
 .byte <PF_data16, <PF_data17, <PF_data18, <PF_data19, <PF_data20, <PF_data21, <PF_data22, <PF_data23
room_pointers_hi
 .byte >PF_data0, >PF_data1, >PF_data2, >PF_data3, >PF_data4, >PF_data5, >PF_data6, >PF_data7
 .byte >PF_data8, >PF_data9, >PF_data10, >PF_data11, >PF_data12, >PF_data13, >PF_data14, >PF_data15
 .byte >PF_data16, >PF_data17, >PF_data18, >PF_data19, >PF_data20, >PF_data21, >PF_data22, >PF_data23
end

 bank 2

 ; =====================================================================
 ; OBJECT PLACEMENT GUIDE (BANK 2)
 ; =====================================================================
 ; All 11 objects (IDs 0 to 10) are initialized from the three data
 ; tables below: init_rooms, init_x, and init_y.
 ; Because init_level_2 loops from 0 to 10, changing a value in these
 ; tables automatically updates the starting position for BOTH the Top
 ; and Bottom worlds!
 ;
 ; Index | Object Constant | Description     | Current Starting Room
 ; ------+-----------------+-----------------+--------------------------
 ;   0   | OBJ_RED_DRAGON  | Red Dragon      | Room 8  (Top Invis Maze)
 ;   1   | OBJ_YEL_DRAGON  | Yellow Dragon   | Room 19 (Black Castle Entry)
 ;   2   | OBJ_GRN_DRAGON  | Green Dragon    | Room 26 (Maze)
 ;   3   | OBJ_MAGNET      | Magnet          | Room 16 (Red Top Right)
 ;   4   | OBJ_SWORD       | Sword           | Room 1  (Yellow Castle Int.)
 ;   5   | OBJ_CHALICE     | Enchanted Chal. | Room 14 (Red Left Middle)
 ;   6   | OBJ_BRIDGE      | Magic Bridge    | Room 11 (Maze)
 ;   7   | OBJ_YEL_KEY     | Yellow Key      | Room 2  (Yellow Castle Entry)
 ;   8   | OBJ_WHT_KEY     | White Key       | Room 5  (Maze)
 ;   9   | OBJ_BLK_KEY     | Black Key       | Room 24 (Maze)
 ;  10   | OBJ_BAT         | Black Bat       | Room 8  (Top Invis Maze)
 ; =====================================================================

 ;Index:   0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10
 data init_rooms
           8, 19, 26, 16,  1, 14, 11,  2,  5, 24,  8
end

 data init_x
          30, 50, 70, 90, 30, 50, 70, 40, 70, 100, 70
end

 data init_y
          20, 20, 20, 20, 20, 20, 20, 25, 25,  25, 25
end

 ; Local Room Adjacency Tables for Cross-Room AI Pursuit in Bank 2
 data move_north_b2
 0,0,1,2,3,4,0,0,10,0,8,9,11,12,7,13
 0,5,0,0,18,19,20,21,23,16,25,26,0,28,5
end

 data move_east_b2
 0,0,0,6,7,3,5,4,9,10,11,8,0,0,15,16
 14,14,19,18,21,0,0,0,27,26,25,29,0,24,0
end

 data move_south_b2
 0,2,3,4,5,30,0,14,10,11,8,12,13,15,0,0
 25,0,20,21,22,23,0,24,24,26,27,0,29,29,0
end

 data move_west_b2
 0,0,0,5,7,6,3,4,11,8,9,10,0,0,16,14
 15,16,19,18,21,0,0,0,29,26,25,24,0,27,0
end

init_level_2
 top_carried_item = 255 : bot_carried_item = 255
 gate_state = 0 : drag_dead = 0
 ; Bits 0-1 = 3 (%00000011) means "No Dragon Currently Roaring"
 top_drag_state = 3 : bot_drag_state = 3
 flicker_idx = 0 : bot_flicker_idx = 0

 ; Populate both Top and Bottom worlds independently from ROM tables
 for temp1 = 0 to 10
   temp2 = init_rooms[temp1]
   w_top_obj_room[temp1] = temp2
   w_bot_obj_room[temp1] = temp2

   temp2 = init_x[temp1]
   top_obj_x[temp1] = temp2
   bot_obj_x[temp1] = temp2

   temp2 = init_y[temp1]
   top_obj_y[temp1] = temp2
   bot_obj_y[temp1] = temp2
 next
 return otherbank

 ; =====================================================================
 ; MODULAR DRAGON AI & SWORD COMBAT (With Cross-Room Pursuit & 0.75s Roar)
 ; =====================================================================
 ; drag_dead bit layout:
 ;   Bits 0, 1, 2 = Top Dragons 0, 1, 2 Slain
 ;   Bits 3, 4, 5 = Bottom Dragons 0, 1, 2 Slain
 ;
 ; top_drag_state / bot_drag_state bit layout:
 ;   Bits 0-1 = Active Roaring/Eating Dragon ID (0, 1, 2, or 3 = None)
 ;   Bits 2-6 = 5-Bit Roar Escape Timer (0..22 ticks at 30Hz = ~0.75 sec)
 ;   Bit 7    = Player Swallowed Flag (1 = Trapped in Dragon's belly)
 ; =====================================================================
update_top_dragons
 if top_drag_state{7} then gosub top_drag_eaten : return otherbank
 temp1 = top_drag_state & 3
 if temp1 < 3 then gosub top_drag_roaring : return otherbank

 temp1 = 0 : gosub top_one_dragon
 temp1 = 1 : gosub top_one_dragon
 temp1 = 2 : gosub top_one_dragon
 return otherbank

top_drag_eaten
 if joy0fire then top_drag_state = 3 : top_room = ENTRY_YELLOW : ballx = 92 : bally = 38 : room_flags{0} = 1 : return
 temp1 = top_drag_state & 3
 if temp1 < 3 then ballx = top_obj_x[temp1] + 2 : bally = top_obj_y[temp1] - 13
 return

top_drag_roaring
 ; Stage 2: Dragon freezes with mouth open for ~0.75s so player can escape!
 if r_top_obj_room[temp1] <> top_room then top_drag_state = 3 : return
 temp5 = top_obj_x[temp1] : temp6 = top_obj_y[temp1]
 gosub check_top_sword_hit
 if temp4 = 1 then drag_dead = drag_dead | bit_mask[temp1] : top_drag_state = 3 : return

 ; Advance 5-bit Roar Timer (+4 per Even frame; 22 ticks = 88)
 temp2 = top_drag_state + 4
 if temp2 < 88 then top_drag_state = temp2 : return

 ; Stage 3: Jaws snap shut! Check if Top Ball is still inside bite zone
 gosub check_top_ball_hit
 if temp4 = 0 then top_drag_state = 3 : return

 ; Bite succeeded! Check DEBUG_NO_SWALLOW
 if DEBUG_NO_SWALLOW = 1 then top_drag_state = 3 : return
 top_drag_state = temp1 | 128
 top_carried_item = 255
 ballx = temp5 + 2 : bally = temp6 - 13
 return

top_one_dragon
 temp4 = drag_dead & bit_mask[temp1]
 if temp4 <> 0 then return
 if r_top_obj_room[temp1] <> top_room then goto top_dragon_offscreen

 temp5 = top_obj_x[temp1] : temp6 = top_obj_y[temp1]
 gosub check_top_sword_hit
 if temp4 = 1 then drag_dead = drag_dead | bit_mask[temp1] : return

 ; Yellow Dragon (ID 1) flees Yellow Key (ID 7) if in same room
 if temp1 = 1 && r_top_obj_room[7] = top_room then goto _top_flee_key

 ; Stage 1: Chase Mouth Target (3px Right of ball, 12px Down so ball is at head)
 temp2 = ballx + 3
 temp3 = bally + 12
 if temp5 < temp2 then temp5 = temp5 + 1
 if temp5 > temp2 then temp5 = temp5 - 1
 if temp6 < temp3 then temp6 = temp6 + 1
 if temp6 > temp3 then temp6 = temp6 - 1
 top_obj_x[temp1] = temp5 : top_obj_y[temp1] = temp6

 gosub check_top_ball_hit
 if temp4 = 1 then top_drag_state = temp1
 return

_top_flee_key
 if temp5 < top_obj_x[7] && temp5 > 20 then temp5 = temp5 - 1
 if temp5 >= top_obj_x[7] && temp5 < 130 then temp5 = temp5 + 1
 if temp6 < top_obj_y[7] && temp6 > 18 then temp6 = temp6 - 1
 if temp6 >= top_obj_y[7] && temp6 < 42 then temp6 = temp6 + 1
 top_obj_x[1] = temp5 : top_obj_y[1] = temp6
 return

 ; --- Cross-Room Pursuit (Dragon follows player into adjacent room) ---
top_dragon_offscreen
 temp4 = r_top_obj_room[temp1]
 temp5 = top_obj_x[temp1] : temp6 = top_obj_y[temp1]
 if move_north_b2[temp4] = top_room then goto _top_pursue_n
 if move_south_b2[temp4] = top_room then goto _top_pursue_s
 if move_east_b2[temp4] = top_room then goto _top_pursue_e
 if move_west_b2[temp4] = top_room then goto _top_pursue_w
 return

_top_pursue_n
 if temp6 > 3 then top_obj_y[temp1] = temp6 - 1 : return
 w_top_obj_room[temp1] = top_room : top_obj_y[temp1] = 28 : return

_top_pursue_s
 if temp6 < 38 then top_obj_y[temp1] = temp6 + 1 : return
 w_top_obj_room[temp1] = top_room : top_obj_y[temp1] = 4 : return

_top_pursue_e
 if temp5 < 134 then top_obj_x[temp1] = temp5 + 1 : return
 w_top_obj_room[temp1] = top_room : top_obj_x[temp1] = 18 : return

_top_pursue_w
 if temp5 > 18 then top_obj_x[temp1] = temp5 - 1 : return
 w_top_obj_room[temp1] = top_room : top_obj_x[temp1] = 132 : return

check_top_sword_hit
 temp4 = 0
 if r_top_obj_room[4] <> top_room then return
 temp2 = temp5 + 8 : temp3 = top_obj_x[4] + 8
 if temp2 < top_obj_x[4] || temp5 > temp3 then return
 temp2 = temp6 + 20 : temp3 = top_obj_y[4] + 6
 if temp2 < top_obj_y[4] || temp6 > temp3 then return
 temp4 = 1
 return

check_top_ball_hit
 temp4 = 0
 ; Only roar/bite when ball is centered in the mouth (X: +1..+6, Y: +9..+15)
 temp2 = ballx + 1 : temp3 = ballx + 6
 if temp5 < temp2 || temp5 > temp3 then return
 temp2 = bally + 9 : temp3 = bally + 15
 if temp6 < temp2 || temp6 > temp3 then return
 temp4 = 1
 return

 ; =====================================================================
 ; BOTTOM SCREEN DRAGON AI & SWORD COMBAT (Runs on Odd Frames - 30 Hz)
 ; =====================================================================
update_bot_dragons
 if bot_drag_state{7} then gosub bot_drag_eaten : return otherbank
 temp1 = bot_drag_state & 3
 if temp1 < 3 then gosub bot_drag_roaring : return otherbank

 temp1 = 0 : gosub bot_one_dragon
 temp1 = 1 : gosub bot_one_dragon
 temp1 = 2 : gosub bot_one_dragon
 return otherbank

bot_drag_eaten
 if joy1fire then bot_drag_state = 3 : bottom_room = ENTRY_YELLOW : p2_ballx = 92 : p2_bally = 38 : room_flags{1} = 1 : return
 temp1 = bot_drag_state & 3
 if temp1 < 3 then p2_ballx = bot_obj_x[temp1] + 2 : p2_bally = bot_obj_y[temp1] - 13
 return

bot_drag_roaring
 ; Stage 2: Dragon freezes with mouth open for ~0.75s so player can escape!
 if r_bot_obj_room[temp1] <> bottom_room then bot_drag_state = 3 : return
 temp5 = bot_obj_x[temp1] : temp6 = bot_obj_y[temp1]
 gosub check_bot_sword_hit
 if temp4 = 1 then drag_dead = drag_dead | bot_bit_mask[temp1] : bot_drag_state = 3 : return

 ; Advance 5-bit Roar Timer (+4 per Odd frame; 22 ticks = 88)
 temp2 = bot_drag_state + 4
 if temp2 < 88 then bot_drag_state = temp2 : return

 ; Stage 3: Jaws snap shut! Check if Bottom Ball is still inside bite zone
 gosub check_bot_ball_hit
 if temp4 = 0 then bot_drag_state = 3 : return

 ; Bite succeeded! Check DEBUG_NO_SWALLOW
 if DEBUG_NO_SWALLOW = 1 then bot_drag_state = 3 : return
 bot_drag_state = temp1 | 128
 bot_carried_item = 255
 p2_ballx = temp5 + 2 : p2_bally = temp6 - 13
 return

bot_one_dragon
 temp4 = drag_dead & bot_bit_mask[temp1]
 if temp4 <> 0 then return
 if r_bot_obj_room[temp1] <> bottom_room then goto bot_dragon_offscreen

 temp5 = bot_obj_x[temp1] : temp6 = bot_obj_y[temp1]
 gosub check_bot_sword_hit
 if temp4 = 1 then drag_dead = drag_dead | bot_bit_mask[temp1] : return

 ; Yellow Dragon (ID 1) flees Yellow Key (ID 7) if in same room
 if temp1 = 1 && r_bot_obj_room[7] = bottom_room then goto _bot_flee_key

 ; Stage 1: Chase Mouth Target (3px Right of ball, 12px Down so ball is at head)
 temp2 = p2_ballx + 3
 temp3 = p2_bally + 12
 if temp5 < temp2 then temp5 = temp5 + 1
 if temp5 > temp2 then temp5 = temp5 - 1
 if temp6 < temp3 then temp6 = temp6 + 1
 if temp6 > temp3 then temp6 = temp6 - 1
 bot_obj_x[temp1] = temp5 : bot_obj_y[temp1] = temp6

 gosub check_bot_ball_hit
 if temp4 = 1 then bot_drag_state = temp1
 return

_bot_flee_key
 if temp5 < bot_obj_x[7] && temp5 > 20 then temp5 = temp5 - 1
 if temp5 >= bot_obj_x[7] && temp5 < 130 then temp5 = temp5 + 1
 if temp6 < bot_obj_y[7] && temp6 > 18 then temp6 = temp6 - 1
 if temp6 >= bot_obj_y[7] && temp6 < 42 then temp6 = temp6 + 1
 bot_obj_x[1] = temp5 : bot_obj_y[1] = temp6
 return

 ; --- Cross-Room Pursuit (Bottom Dragon follows player into adjacent room) ---
bot_dragon_offscreen
 temp4 = r_bot_obj_room[temp1]
 temp5 = bot_obj_x[temp1] : temp6 = bot_obj_y[temp1]
 if move_north_b2[temp4] = bottom_room then goto _bot_pursue_n
 if move_south_b2[temp4] = bottom_room then goto _bot_pursue_s
 if move_east_b2[temp4] = bottom_room then goto _bot_pursue_e
 if move_west_b2[temp4] = bottom_room then goto _bot_pursue_w
 return

_bot_pursue_n
 if temp6 > 3 then bot_obj_y[temp1] = temp6 - 1 : return
 w_bot_obj_room[temp1] = bottom_room : bot_obj_y[temp1] = 28 : return

_bot_pursue_s
 if temp6 < 38 then bot_obj_y[temp1] = temp6 + 1 : return
 w_bot_obj_room[temp1] = bottom_room : bot_obj_y[temp1] = 4 : return

_bot_pursue_e
 if temp5 < 134 then bot_obj_x[temp1] = temp5 + 1 : return
 w_bot_obj_room[temp1] = bottom_room : bot_obj_x[temp1] = 18 : return

_bot_pursue_w
 if temp5 > 18 then bot_obj_x[temp1] = temp5 - 1 : return
 w_bot_obj_room[temp1] = bottom_room : bot_obj_x[temp1] = 132 : return

check_bot_sword_hit
 temp4 = 0
 if r_bot_obj_room[4] <> bottom_room then return
 temp2 = temp5 + 8 : temp3 = bot_obj_x[4] + 8
 if temp2 < bot_obj_x[4] || temp5 > temp3 then return
 temp2 = temp6 + 20 : temp3 = bot_obj_y[4] + 6
 if temp2 < bot_obj_y[4] || temp6 > temp3 then return
 temp4 = 1
 return

 ;Tip: If you want to nudge the mouth alignment by a pixel or two after seeing it on screen, 
 ;just adjust the + 3 in temp2 = ballx + 3 / temp3 = bally + 3 and shift the + 1 / + 6 hitbox range by the same amount

check_bot_ball_hit
 temp4 = 0
 ; Only roar/bite when ball is centered in the mouth (X: +1..+6, Y: +9..+15)
 temp2 = p2_ballx + 1 : temp3 = p2_ballx + 6
 if temp5 < temp2 || temp5 > temp3 then return
 temp2 = p2_bally + 9 : temp3 = p2_bally + 15
 if temp6 < temp2 || temp6 > temp3 then return
 temp4 = 1
 return

 data bit_mask
 1, 2, 4
end

 data bot_bit_mask
 8, 16, 32
end

 ; Inline Assembly Flicker Engine (Reads Separate Top & Bottom Arrays)
run_flicker_logic
 asm
   lda #255
   sta w_top_obj_hit
   sta top_player1y
   sta w_bot_obj_hit
   sta bottom_player1y

   ; --- 1. Top Screen Round-Robin Search ---
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
   ; --- 2. Bottom Screen Round-Robin Search ---
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
end
 return otherbank

 ; Object Colors: Red Drag, Yel Drag, Grn Drag, Magnet, Sword, Chalice, Bridge, Yel Key, Wht Key, Blk Key, Bat
 data obj_colors
 $44, $1E, $C4, $00, $1E, $1E, $44, $1E, $0E, $00, $00
end

 bank 3

apply_graphics
  ; DO BOTTOM SCREEN FIRST to preserve top screen pointers
  temp3 = r_bot_obj_hit : temp4 = bot_drag_state : temp2 = drag_dead / 8 : gosub set_sprite_pointers
  bottom_p1_ptr_lo = top_p1_ptr_lo
  bottom_p1_ptr_hi = top_p1_ptr_hi

  ; DO TOP SCREEN SECOND so it stays in the hardware registers
  temp3 = r_top_obj_hit : temp4 = top_drag_state : temp2 = drag_dead & 7 : gosub set_sprite_pointers

  ; --- 1. Top Player Inventory Action (Dragons 0..2 cannot be picked up!) ---
  if joy0fire then top_carried_item = 255 : goto _check_bot_pickup
  temp1 = r_top_obj_hit
  if temp1 < 3 || temp1 = 255 then goto _check_bot_pickup
  if temp1 = top_carried_item then goto _check_bot_pickup
  
  temp5 = ballx + 4
  temp6 = top_player1x + 8
  if temp5 < top_player1x || ballx > temp6 then goto _check_bot_pickup
  
  temp5 = bally + 4
  temp6 = top_player1y + 8
  if temp5 < top_player1y || bally > temp6 then goto _check_bot_pickup
  
  ; Top Ball touched the top object!
  top_carried_item = temp1
  w_top_carry_off_x = top_obj_x[temp1] - ballx 
  w_top_carry_off_y = top_obj_y[temp1] - bally

_check_bot_pickup
  ; --- 2. Bottom Player Inventory Action (Dragons 0..2 cannot be picked up!) ---
  if joy1fire then bot_carried_item = 255 : return otherbank
  temp1 = r_bot_obj_hit
  if temp1 < 3 || temp1 = 255 then return otherbank
  if temp1 = bot_carried_item then return otherbank
  
  temp5 = p2_ballx + 4
  temp6 = bottom_player1x + 8
  if temp5 < bottom_player1x || p2_ballx > temp6 then return otherbank
  
  temp5 = p2_bally + 4
  temp6 = bottom_player1y + 8
  if temp5 < bottom_player1y || p2_bally > temp6 then return otherbank
  
  ; Bottom Ball touched the bottom object!
  bot_carried_item = temp1
  w_bot_carry_off_x = bot_obj_x[temp1] - p2_ballx
  w_bot_carry_off_y = bot_obj_y[temp1] - p2_bally
  return otherbank

set_sprite_pointers
  if temp3 < 3 then goto _select_dragon_pose
  if temp3 = 3 then goto _gfx_magnet
  if temp3 = 4 then goto _gfx_sword
  if temp3 = 5 then goto _gfx_chalice
  if temp3 = 6 then goto _gfx_bridge
  if temp3 = 7 || temp3 = 8 then goto _gfx_key
  if temp3 = 9 then goto _gfx_key
  if temp3 = 10 then goto _gfx_bat
  return

_select_dragon_pose
  ; 1. Check if this Dragon (temp3 = 0, 1, or 2) is Slain
  temp2 = temp2 & bit_mask_b3[temp3]
  if temp2 <> 0 then goto _gfx_dragon_dead
  ; 2. If Player is already Eaten (Bit 7 set), close mouth so ball sits in belly
  if temp4{7} then goto _gfx_dragon
  ; 3. Check if this Dragon is currently Roaring (Mouth Open Stage 2)
  temp2 = temp4 & 3
  if temp2 = temp3 then goto _gfx_dragon_roar
  goto _gfx_dragon

 data bit_mask_b3
 1, 2, 4
end

_gfx_dragon
  player1:
  %00111111
  %11100001
  %10001111
  %00001000
  %00111100
  %11111111
  %11000111
  %11000011
  %11000011
  %11100011
  %01111111
  %00111111
  %00011110
  %00000100
  %00000100
  %00001110
  %11111110
  %11110011
  %00001111
  %00000110
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return

_gfx_dragon_roar
  player1:
  %00011100
  %00001000
  %00111100
  %11111110
  %11000011
  %00000111
  %00011111
  %00111110
  %01111000
  %01110000
  %01110000
  %01111001
  %00111111
  %00011111
  %11001110
  %11100100
  %00001100
  %00111110
  %11101111
  %11000111
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return

_gfx_dragon_dead
  player1:
  %00000000
  %00000000
  %00000000
  %00000110
  %00100011
  %10010001
  %01111110
  %01001000
  %00011100
  %00111110
  %01111011
  %11111001
  %10111111
  %11011111
  %01001110
  %00100100
  %00011100
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return
  
_gfx_magnet
  player1:
  %11000011
  %11000011
  %11000011
  %11000011
  %11000011
  %11100111
  %01111110
  %00111100
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return

_gfx_sword
  player1:
  %00100000
  %01000000
  %11111111
  %01000000
  %00100000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return

_gfx_chalice
  player1:
  %01111110
  %00011000
  %00011000
  %00111100
  %01111110
  %01111110
  %11000011
  %10000001
  %10000001
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return

_gfx_bridge
  player1:
  %11000011
  %11000011
  %11000011
  %11000011
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %01000010
  %11000011
  %11000011
  %11000011
  %00000000
end
  return

_gfx_key
  player1:
  %10100111
  %11111101
  %00000111
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return

_gfx_bat
  player1:
  %01100110
  %01011010
  %11111111
  %11000011
  %11000011
  %10000001
  %10000001
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
  %00000000
end
  return

check_gates
  top_player0y = 255
  bottom_player0y = 255

  ; --- Top Screen Gates (Bits 0, 1, 2 of gate_state) ---
  if top_room = ENTRY_YELLOW && !gate_state{0} then top_player0y = 31
  if top_room = ENTRY_WHITE && !gate_state{1} then top_player0y = 31
  if top_room = ENTRY_BLACK && !gate_state{2} then top_player0y = 31

  ; --- Bottom Screen Gates (Bits 3, 4, 5 of gate_state) ---
  if bottom_room = ENTRY_YELLOW && !gate_state{3} then bottom_player0y = 30
  if bottom_room = ENTRY_WHITE && !gate_state{4} then bottom_player0y = 30
  if bottom_room = ENTRY_BLACK && !gate_state{5} then bottom_player0y = 30
  return otherbank

gate_collide_top
  temp1 = top_carried_item
  if top_room = ENTRY_YELLOW && temp1 = 7 then gate_state{0} = 1 : top_player0y = 255 : return otherbank
  if top_room = ENTRY_WHITE && temp1 = 8 then gate_state{1} = 1 : top_player0y = 255 : return otherbank
  if top_room = ENTRY_BLACK && temp1 = 9 then gate_state{2} = 1 : top_player0y = 255 : return otherbank
  ballx = r_top_oldx : bally = r_top_oldy 
  return otherbank

gate_collide_bot
  temp1 = bot_carried_item
  if bottom_room = ENTRY_YELLOW && temp1 = 7 then gate_state{3} = 1 : bottom_player0y = 255 : return otherbank
  if bottom_room = ENTRY_WHITE && temp1 = 8 then gate_state{4} = 1 : bottom_player0y = 255 : return otherbank
  if bottom_room = ENTRY_BLACK && temp1 = 9 then gate_state{5} = 1 : bottom_player0y = 255 : return otherbank
  p2_ballx = r_bottom_oldx : p2_bally = r_bottom_oldy 
  return otherbank

 ; Lowered Y threshold (< 32 Top / < 31 Bottom) + Center X-Axis Gate Restriction
castle_transitions_top
 if bally > 44 then goto _top_castle_exit_check
 if ballx < 71 || ballx > 85 then return otherbank
 if bally < 32 && top_room = ENTRY_YELLOW then top_room = CASTLE_YELLOW : bally = 42 : w_top_oldy = 42 : room_flags{0} = 1 : return otherbank
 if bally < 32 && top_room = ENTRY_WHITE then top_room = CASTLE_WHITE : bally = 42 : w_top_oldy = 42 : room_flags{0} = 1 : return otherbank
 if bally < 32 && top_room = ENTRY_BLACK then top_room = CASTLE_BLACK : bally = 42 : w_top_oldy = 42 : room_flags{0} = 1 : return otherbank
 return otherbank

_top_castle_exit_check
 if top_room = CASTLE_YELLOW then top_room = ENTRY_YELLOW : bally = 34 : w_top_oldy = 34 : room_flags{0} = 1 : return otherbank
 if top_room = CASTLE_WHITE then top_room = ENTRY_WHITE : bally = 34 : w_top_oldy = 34 : room_flags{0} = 1 : return otherbank
 if top_room = CASTLE_BLACK then top_room = ENTRY_BLACK : bally = 34 : w_top_oldy = 34 : room_flags{0} = 1 : return otherbank
 return otherbank

castle_transitions_bot
 if p2_bally > 45 then goto _bot_castle_exit_check
 if p2_ballx < 76 || p2_ballx > 90 then return otherbank
 if p2_bally < 31 && bottom_room = ENTRY_YELLOW then bottom_room = CASTLE_YELLOW : p2_bally = 42 : w_bottom_oldy = 42 : room_flags{1} = 1 : return otherbank
 if p2_bally < 31 && bottom_room = ENTRY_WHITE then bottom_room = CASTLE_WHITE : p2_bally = 42 : w_bottom_oldy = 42 : room_flags{1} = 1 : return otherbank
 if p2_bally < 31 && bottom_room = ENTRY_BLACK then bottom_room = CASTLE_BLACK : p2_bally = 42 : w_bottom_oldy = 42 : room_flags{1} = 1 : return otherbank
 return otherbank

_bot_castle_exit_check
 if bottom_room = CASTLE_YELLOW then bottom_room = ENTRY_YELLOW : p2_bally = 33 : w_bottom_oldy = 33 : room_flags{1} = 1 : return otherbank
 if bottom_room = CASTLE_WHITE then bottom_room = ENTRY_WHITE : p2_bally = 33 : w_bottom_oldy = 33 : room_flags{1} = 1 : return otherbank
 if bottom_room = CASTLE_BLACK then bottom_room = ENTRY_BLACK : p2_bally = 33 : w_bottom_oldy = 33 : room_flags{1} = 1 : return otherbank
 return otherbank

 bank 4

 ; =========================================================
 ; VBLANK ROUTINE (Uses idle VBlank cycles for Room Loads & Pointers)
 ; =========================================================
 vblank
 if !room_flags{0} then goto _skip_vblank_top
 room_flags{0} = 0
 gosub load_top_room bank1
 gosub check_gates bank3

_skip_vblank_top
 if !room_flags{1} then goto _skip_vblank_bot
 room_flags{1} = 0
 gosub load_bottom_room bank1
 gosub check_gates bank3

_skip_vblank_bot
 gosub apply_graphics bank3
 return