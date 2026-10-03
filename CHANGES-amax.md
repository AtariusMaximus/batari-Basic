# Batari Basic - Atarius Maximus (amax) Branch Changes

This fork is intended to introduce some enhancements. Currently there is only one.  
Note that this build is purely experimental and may break something, I'm just testing changes at this point.

## amax.1. Multi-line Block `if...then...endif` Support

The compiler now natively supports multi-line conditional blocks with if/then/endif.

I updated "zombie_chase.bas" in the samples subdirectory with an if/then/else/endif block as a usage example.

### Syntax Example:
```basic
 if powerup=1 then
    extralives=extralives+1
    score=score+100
 endif
```

## amax.2. `if...then...endif` with else support

### Syntax Example:
```basic
 if powerup=1 then
    extralives=extralives+1
    score=score+100
 else
    goto no_powerup
 endif
```

## amax.3. Native Bitwise Macros (`setbit`, `clearbit`, `togglebit`)

The compiler now includes native commands to manipulate individual bits within a variable directly. This eliminates the need to use raw binary math (like `var = var | %00000100`or the `{}` syntax)

See "test_bits.bas" in the samples subdirectory for a usage example.

### Syntax Example:
```basic
 rem Turn ON bit 0
 setbit playerflags 0

 rem Turn OFF bit 4
 clearbit playerflags 4

 rem Flip bit 1 to the opposite state
 togglebit playerflags 1
```

## amax.4. Native `switch...case` Block Support

The compiler now supports structural state machine blocks using `switch`, `case`, and `default`. 

The `case` evaluation natively supports standard decimal integers, hex (`$0A`), binary (`%00001010`), or even comparisons against other variables. The block should be closed with `endswitch`.

See "test_switch.bas" in the samples subdirectory for a usage example.

### Syntax Example:
```basic
 switch gamestate
    case 0
      gosub TitleRoutine
    case 1
      gosub GameLoop
    case %10000000
      gosub SpecialEvent
    case my_other_var
      gosub DynamicEvent
    default
      rem Executes if no matching cases are found above
      gosub ErrorState
 endswitch
```

## amax.5. Native Joystick Debouncing (Edge Detection)

The compiler now natively supports edge detection for all joystick and console switches using the `pressed` and `released` modifiers. This eliminates the need to write manual debounce logic or waste RAM on state-tracking variables. 

### Syntax Example:
```basic
 rem Fires exactly once per button press, preventing "machine-gun" firing
 if joy0fire pressed then score = score + 1
 
 rem Triggers exactly once when the player lets go of the button
 if joy0fire released then COLUBK = $00

 rem Standard continuous evaluation still works normally
 if joy0right then player0x = player0x + 1
```

