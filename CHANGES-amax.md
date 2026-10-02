# Batari Basic - Atarius Maximus (amax) Branch Changes

This fork is intended to introduce some enhancements. Currently there is only one.  
Note that this build is purely experimental and may break something, I'm just testing changes at this point.

## amax.1. Multi-line Block `if...then...endif` Support

The compiler now natively supports multi-line conditional blocks with if/then/endif.

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

### Syntax Example:
```basic
 rem Turn ON bit 0
 setbit playerflags 0

 rem Turn OFF bit 4
 clearbit playerflags 4

 rem Flip bit 1 to the opposite state
 togglebit playerflags 1
```

# amax.4. Native `switch...case` Block Support

The compiler now supports structural state machine blocks using `switch`, `case`, and `default`. Unlike `on...goto` jump tables, this generates optimized local branch sequences (`CMP` and `BNE`). This allows your cases to jump to routines in other banks.

The `case` evaluation natively supports standard decimal integers, hex (`$0A`), binary (`%00001010`), or even comparisons against other variables. The block should be closed with `endswitch`.

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
