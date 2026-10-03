 rem --- Zero/Clear Demo ---
 
 score = 999999
 a = 55
 b = 60
 
main

 player0x = a
 player0y = b
 
 scorecolor=$08
 
 COLUP0 = $1C
 
 player0:
 %11111111
 %11111111
 %11111111
 %11111111
end
 
 rem Press FIRE to batch zero all the variables!
 if joy0fire pressed then zero a, b, score
 
 drawscreen
 
 goto main
