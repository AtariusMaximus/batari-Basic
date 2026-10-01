# Batari Basic - Atarius Maximus (amax) Branch Changes

This fork is intended to introduce some enhancements. Currently there is only one.  
Note that this build is purely experimental and may break something, I'm just testing changes at this point.

## 1. Multi-line Block `if...then...endif` Support

The compiler now natively supports multi-line conditional blocks with if/then/endif.

### Syntax Example:
```basic
 if powerup=1 then
    extralives=extralives+1
    score=score+100
 endif
```

Compiler Modifications:

statements.c

State Management: Added if_stack array and if_stack_ptr global variables to track open branch labels, enabling support for nested if evaluations.  
Label Parsing: Updated the findlabel function to explicitly identify newline characters following then as block statements rather than unindented line labels.  
Execution Routing: Modified the seven condition execution paths inside the doif function. If the line ends after then, the compiler now pushes the auto-generated branch label to the stack instead of printing it immediately.  
Block Closure: Added the doendif function to pop the matched label from the stack and emit the branch closure to the assembly output.  

keywords.c

Registered extern void doendif();.  
Added the endif keyword routing to the main keywords lookup sequence to trigger the block closure.  
