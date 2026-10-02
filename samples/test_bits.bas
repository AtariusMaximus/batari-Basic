  rem --- Bitwise Macro Test ---
  dim playerflags = a
  dim debouncestate = b

  dim scoreHI = score
  dim scoreMED = score+1
  dim scoreLO = score+2

  score = 0
  playerflags = 0
  debouncestate = 0

main
  COLUBK = $00
  COLUP0 = $18
  COLUP1 = $18
  COLUPF = $88
  scorecolor = $0E

  rem Put playerflags into the bottom byte of the score
  scoreLO = playerflags

  rem Push UP to turn bit 0 ON (+1)
  if joy0up then setbit playerflags 0

  rem Push DOWN to turn bit 0 OFF (-1)
  if joy0down then clearbit playerflags 0

  rem Push LEFT to turn bit 4 ON (+16 in hex = $10)
  if joy0left then setbit playerflags 4

  rem Push RIGHT to turn bit 4 OFF
  if joy0right then clearbit playerflags 4

  rem Tap FIRE to toggle bit 1 (+2 / -2) with simple button debounce
  if joy0fire && debouncestate = 0 then togglebit playerflags 1 : debouncestate = 1
  if !joy0fire then debouncestate = 0

  drawscreen
  goto main
