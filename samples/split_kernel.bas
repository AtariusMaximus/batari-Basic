 
 set kernel split 
 set romsize 16kSC

 dim p2_player0y = a
 dim p2_player1y = b
 dim p2_player0x = c
 dim p2_player1x = d
 dim p2_player0pointerlo = e
 dim p2_player0pointerhi = f
 dim p2_player1pointerlo = g
 dim p2_player1pointerhi = h
 dim p2_colupf = i
 const pfres=32
 
 player0:
 %11110000
 %11110000
 %11110000
 %11110000
end

 player1:
 %11111111
 %11111111
 %11111111
 %11111111
end
 
 ; Starting Coordinates 
 ; (Y coordinates act exactly like standard bB, but relative to their half)
 player0x = 40
 player0y = 40

 p2_player0x = 40
 p2_player0y = 58

 ; --- 32-Row Room Layout ---
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X........................XXXX..X
 X........................X..X..X
 X........................X..X..X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..X..X........................X
 X..X..X........................X
 X..XXXX........................X
 X..............................X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X..XX...XXXXXXXXXXXXXXXXXXXXX..X
 X..X........................X..X
 X..X..XXXX..................X..X
 X..X..X..X..................X..X
 X..X..X.....................X..X
 X..X..X.....................X..X
 X..X..X.....................X..X
 X..X..X..X..................X..X
 X..X..XXXX..................X..X
 X..X........................X..X
 X..XXXXXXXXXXXXXXX......XXXXX..X
 X..............................X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
end
 
main

 ballx=30:bally=30
 scorecolor=$08
 score=999999
 CTRLPF = $21    
 COLUPF = $84    ; Top room walls are Blue
 p2_colupf = rand ; Bottom room walls 

 ; Setup Colors
 COLUBK = $00    
 COLUP0 = $1E    
 COLUP1 = $2F
 
 ; Standard movement for Player 1 (Top Screen)
 if joy0up then player0y = player0y - 1
 if joy0down then player0y = player0y + 1
 if joy0left then player0x = player0x - 1
 if joy0right then player0x = player0x + 1
 
 ; Prevent P1 from dropping into the divider
 if player0y > 42 then player0y = 42
 if player0y < 8 then player0y = 8
 
 ; Prevent P2 from dropping out of the bottom screen
 if p2_player0y > 42 then p2_player0y = 42
 if p2_player0y < 8 then p2_player0y = 8

 ; Auto-move Player 2's X coordinate based on Y axis 
 if joy0left then p2_player0x = p2_player0x - 1
 if joy0right then p2_player0x = p2_player0x + 1
 if joy0up then p2_player0y = p2_player0y - 1
 if joy0down then p2_player0y = p2_player0y + 1
 
 drawscreen
 goto main
