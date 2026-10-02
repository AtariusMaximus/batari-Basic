  rem --- Switch/Case Statement Demo ---
  
  dim player_state = a
  
  player0x = 75
  player0y = 45
  score = 0
  
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
  COLUP0 = $1C
  scorecolor = $0E
  
  rem Define state based on joystick input
  player_state = 0
  if joy0up then player_state = 1
  if joy0down then player_state = 2
  if joy0left then player_state = 3
  if joy0right then player_state = 4
  if joy0fire then player_state = 5
  
  rem Route the logic using the new switch block
  switch player_state
    case 1
      player0y = player0y - 1
      score = score + 1
    case 2
      player0y = player0y + 1
      score = score + 2
    case 3
      player0x = player0x - 1
      score = score + 3
    case 4
      player0x = player0x + 1
      score = score + 4
    case 5
      COLUBK = $44
      score = score + 10
    default
      rem Idle state fallback
      COLUBK = $00
  endswitch
  
  drawscreen
  goto main
