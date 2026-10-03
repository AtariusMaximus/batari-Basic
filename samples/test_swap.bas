 rem --- Swap & Debounce Demo ---
 
 rem Set initial starting positions

  a=40:b=50:c=100:d=50
  
main
 
 player0x = a
 player0y = b
 player1x = c
 player1y = d
 
 COLUP0 = $1C
 COLUP1 = $84
 
 player0:
 %11111111
 %11111111
 %11111111
 %11111111
end
 
 player1:
 %10000001
 %11000011
 %11100111
 %11111111
end
  
 rem Tap the fire button to instantly exchange sprite coordinates!
 if joy0fire pressed then swap a,c:swap b,d
 
 drawscreen
 
 goto main
