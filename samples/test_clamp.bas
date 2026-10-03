 rem --- Clamp Demo ---
 
 player0x = 80
 player0y = 50
 
main
 
 COLUP0 = $1C
 
 player0:
 %11111111
 %11111111
 %11111111
 %11111111
end
 
 rem Joystick movement
 if joy0left then player0x = player0x - 2
 if joy0right then player0x = player0x + 2
 
 rem Clamp the X coordinate so the player cannot leave the screen
 player0x = clamp(player0x, 16, 140)
 
 drawscreen
 
 goto main
