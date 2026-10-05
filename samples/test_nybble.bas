 rem Nybble Test Program

 dim shared_byte = a

 def p1 = shared_byte{lo}
 def p2 = shared_byte{hi}

 p1 = 3
 p2 = 9

 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 X..............................X
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

main_loop
 
 if joy0up pressed then p1 = p1 + 1
 if joy0down pressed then p1 = p1 - 1
 
 if joy0fire pressed then p2 = p2 + 1
 if switchreset pressed then p2 = p2 - 1
 
 COLUBK = p1 * 4
 COLUPF = p2 * 8
 drawscreen
 goto main_loop
