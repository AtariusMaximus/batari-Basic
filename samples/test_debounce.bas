  rem --- Debounce Demo ---
  
  score = 0
  player0x = 75
  player0y = 45
  COLUP0 = $1C
  COLUBK = $00
  
  player0:
  %00111100
  %01111110
  %11011011
  %11111111
  %11111111
  %01111110
  %00111100
  %00011000
end
  
main
  
  rem Tap fire to increment score by exactly 1 (no machine-gunning)
  if joy0fire pressed then score = score + 1
  
  rem Release fire to flash the background red
  if joy0fire released then COLUBK = $44
  
  rem Background decays back to black normally every frame
  if COLUBK > 0 then COLUBK = COLUBK - 2
  
  rem Tap right to warp 8 pixels (won't slide continuously if held)
  if joy0right pressed then player0x = player0x + 8
  
  rem Standard movement on the left D-pad (slides continuously while held)
  if joy0left then player0x = player0x - 1
  
  drawscreen
  goto main
