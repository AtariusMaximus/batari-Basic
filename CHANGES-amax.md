# Batari Basic - Atarius Maximus (amax) Branch Changes

This fork is intended to introduce some enhancements. Currently there is only one.

## 1. Multi-line Block `if...then...endif` Support

The compiler now natively supports multi-line conditional blocks with if/then/endif.

### Syntax Example:
```basic
 if powerup=1 then
    extralives=extralives+1
    score=score+100
 endif

