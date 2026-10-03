game
.L00 ;;line 1;;  include fixed_point_math.asm

.L01 ;;line 2;;  rem Zombie Chase

.L02 ;;line 3;;  rem A fun game that may help you learn batari Basic!

.L03 ;;line 4;;  rem

.
 ;;line 5;; 

.L04 ;;line 6;;  rem timed game, 16 levels

.L05 ;;line 7;;  rem Each level lasts about one minute

.L06 ;;line 8;;  rem you must score 1000 points to move on

.L07 ;;line 9;;  rem COLOR/BW switch selects joystick or DC

.L08 ;;line 10;;  rem left difficulty A=stop on collision; B=slow down on collision

.L09 ;;line 11;;  rem right difficulty A=L/R border; B=no border

.
 ;;line 12;; 

.L010 ;;line 13;;  set kernel_options no_blank_lines player1colors

.L011 ;;line 14;;  playfieldpos=4

