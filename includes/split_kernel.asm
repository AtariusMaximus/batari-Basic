; Provided under the CC0 license. See the included LICENSE.txt for details.
; Split Screen Kernel (Modified from original std_kernel.asm in bB 1.9)
; Steve Engelhardt
; 10/8/2026

top_player0y     = player0y
top_player1y     = player1y
top_p0_ptr_lo    = player0pointerlo
top_p0_ptr_hi    = player0pointerhi
top_p1_ptr_lo    = player1pointerlo
top_p1_ptr_hi    = player1pointerhi
top_colup0       = COLUP0
top_colup1       = COLUP1
top_colupf       = COLUPF
top_colubk       = COLUBK
top_nusiz1       = NUSIZ1

     ifnconst vertical_reflect
kernel
; --- DUAL SCREEN AUTO-CONFIGURATION ---
 ifconst pfres
     if pfres == 32
split_ram_offset = 64
split_pos_auto   = 64
     endif
     if pfres == 24
split_ram_offset = 48
split_pos_auto   = 80
     endif
     if pfres == 12
split_ram_offset = 24
split_pos_auto   = 104
     endif
 else
     ; Default to 12 lines TOTAL (6 per half) if pfres is omitted
split_ram_offset = 24
split_pos_auto   = 104
 endif
 ; --------------------------------------
     endif
     sta WSYNC
     lda #255
     sta TIM64T

     lda #1
     sta VDELBL
     sta VDELP0
     ldx ballheight
     inx
     inx
     stx temp4
     lda player1y
     sta temp3

     ifconst shakescreen
         jsr doshakescreen
     else
         ldx missile0height
         inx
     endif

     inx
     stx stack1

     lda bally
     sta stack2

     lda player0y
     ldx #0
     sta WSYNC
     stx GRP0
     stx GRP1
     stx PF1L
     stx PF2
     stx CXCLR
     ifconst readpaddle
         stx paddle
     else
         sleep 3
     endif

     sta temp2,x

     ifnconst pfres
         ldx #128-48+(4-pfwidth)*12
     else
         ldx #128-pfres*pfwidth
     endif

     dec player0y

     lda missile0y
     sta temp5
     lda missile1y
     sta temp6

     lda playfieldpos
     sta temp1
     
     ifconst pfrowheight
         lda #pfrowheight+2
     else
         ifnconst pfres
             lda #10
         else
             lda #(96/pfres)+2 
         endif
     endif
     clc
     sbc playfieldpos
     sta playfieldpos
     jmp .startkernel

.skipDrawP0
     lda #0
     tay
     jmp .continueP0

.skipDrawP1
     lda #0
     tay
     jmp .continueP1

.kerloop

continuekernel
     sleep 2
continuekernel2
     lda ballheight
     
     ifconst pfres
         ldy playfield+pfres*pfwidth-128,x
         sty PF1L ;3
         ldy playfield+pfres*pfwidth-127-pfadjust,x
         sty PF2L ;3
         ;sleep 14 
         ldy playfield+pfres*pfwidth-126,x
         sty PF1 
         ldy playfield+pfres*pfwidth-125-pfadjust,x
         sty PF2
     else
             ldy playfield-48+pfwidth*12+48-128,x
             sty PF1L ;3
             ldy playfield-48+pfwidth*12+49-128-pfadjust,x ;4
             sty PF2L ;3
             
             ldy playfield-48+pfwidth*12+50-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+51-128-pfadjust,x
             sty PF2
         endif

     dcp bally
     rol
     rol
goback
     sta ENABL 
.startkernel
     lda player1height ;3
     dcp player1y ;5
     bcc .skipDrawP1 ;2
     ldy player1y ;3
     lda (player1pointer),y 

.continueP1
     sta GRP1 ;3

     ifnconst player1colors
         lda missile1height ;3
         dcp missile1y ;5
         rol;2
         rol;2
         sta ENAM1 ;3
     else
         lda (player1color),y
         sta COLUP1
         ifnconst playercolors
             sleep 7
         else
             lda.w player0colorstore
             sta COLUP0
         endif
     endif

     ifconst pfres
         lda playfield+pfres*pfwidth-128,x 
         sta PF1L ;3
         lda playfield+pfres*pfwidth-127-pfadjust,x 
         sta PF2L ;3
         ;sleep 14 
         ldy playfield+pfres*pfwidth-126,x
         sty PF1 
         ldy playfield+pfres*pfwidth-125-pfadjust,x
         sty PF2
     else
             lda playfield-48+pfwidth*12+48-128,x ;4
             sta PF1L ;3
             lda playfield-48+pfwidth*12+49-128-pfadjust,x ;4
             sta PF2L ;3
             
             ldy playfield-48+pfwidth*12+50-128,x
             sty PF1 
             ldy playfield-48+pfwidth*12+51-128-pfadjust,x
             sty PF2
         endif

     lda player0height
     dcp player0y
     bcc .skipDrawP0
     ldy player0y
     lda (player0pointer),y
.continueP0
     sta GRP0

     ifnconst no_blank_lines
         ifnconst playercolors
             lda missile0height ;3
             dcp missile0y ;5
             sbc stack1
             sta ENAM0 ;3
         else
             lda (player0color),y
             sta player0colorstore
             sleep 6
         endif
         dec temp1
         bne continuekernel
     else
         dec temp1
         beq altkernel2
         ifconst readpaddle
             ldy currentpaddle
             lda INPT0,y
             bpl noreadpaddle
             inc paddle
             jmp continuekernel2
noreadpaddle
             sleep 2
             jmp continuekernel
         else
             ifnconst playercolors 
                 ifconst PFcolors
                     txa
                     tay
                     lda (pfcolortable),y
                     ifnconst backgroundchange
                         sta COLUPF
                     else
                         sta COLUBK
                     endif
                     jmp continuekernel
                 else
                     ifconst kernelmacrodef
                         kernelmacro
                     else
                         sleep 12
                     endif
                 endif
             else
                 lda (player0color),y
                 sta player0colorstore
                 sleep 4
             endif
             jmp continuekernel
         endif

altkernel2
         txa
         ifnconst vertical_reflect
             sbx #256-pfwidth
         else
             sbx #256-pfwidth/2
         endif
         bmi lastkernelline
         ifconst pfrowheight
             lda #pfrowheight
         else
             ifnconst pfres
                 lda #8
             else
                 lda #(96/pfres)
             endif
         endif
         sta temp1
         jmp continuekernel
     endif

altkernel
     ifconst PFmaskvalue
         lda #PFmaskvalue
     else
         lda #0
     endif
     sta PF1L
     sta PF2

     txa
     ifnconst vertical_reflect
         sbx #256-pfwidth
     else
         sbx #256-pfwidth/2
     endif

     bmi lastkernelline

     ifconst PFcolorandheight
         ifconst pfres
             ldy playfieldcolorandheight-131+pfres*pfwidth,x
         else
             ldy playfieldcolorandheight-87,x
         endif
         ifnconst backgroundchange
             sty COLUPF
         else
             sty COLUBK
         endif
         ifconst pfres
             lda playfieldcolorandheight-132+pfres*pfwidth,x
         else
             lda playfieldcolorandheight-88,x
         endif
         sta.w temp1
     endif
     ifconst PFheights
         lsr
         lsr
         tay
         lda (pfheighttable),y
         sta.w temp1
     endif
     ifconst PFcolors
         tay
         lda (pfcolortable),y
         ifnconst backgroundchange
             sta COLUPF
         else
             sta COLUBK
         endif
         ifconst pfrowheight
             lda #pfrowheight
         else
             ifnconst pfres
                 lda #8
             else
                 lda #(96/pfres)
             endif
         endif
         sta temp1
     endif
     ifnconst PFcolorandheight
         ifnconst PFcolors
             ifnconst PFheights
                 ifnconst no_blank_lines
                     ; --- DUAL SCREEN INJECTION POINT ---
                     cpx #split_pos_auto   ; Uses the auto-calculated split line
                     bne SplitNoDivider    ; 3 cycles if branch taken 
                     jmp SplitDoDivider    ; 3 cycles
SplitNoDivider
                     sleep 5               ; 5 cycles (Total: 2+3+5 = 10 cycles for non-split rows)
SplitReturnFromDivider
                     ; --- END INJECTION POINT ---
                     ifconst pfrowheight
                         lda #pfrowheight
                     else
                         ifnconst pfres
                             lda #8
                         else
                             lda #(96/pfres)
                         endif
                     endif
                     sta temp1
                 endif
             endif
         endif
     endif
     
     lda ballheight
     dcp bally
     sbc temp4

     jmp goback

     ifnconst no_blank_lines
lastkernelline
         ifnconst PFcolors
             sleep 10
         else
             ldy #124
             lda (pfcolortable),y
             sta COLUPF
         endif

         ifconst PFheights
             ldx #1
             sleep 3 
         else
             ldx playfieldpos
             sleep 2 
         endif

         jmp enterlastkernel

     else
lastkernelline
         ifconst PFheights
             ldx #1
             sleep 4 
         else
             ldx playfieldpos
             sleep 3 
         endif

         cpx #0
         bne .enterfromNBL
         jmp no_blank_lines_bailout
     endif

     if ((<*)>$d5)
         align 256
     endif

.skipDrawlastP1
     lda #0
     tay 
     jmp .continuelastP1

.endkerloop     
     nop

.enterfromNBL
     ifconst pfres
         ldy.w playfield-128+pfres*pfwidth-4      ; Fixed A7 memory addressing
         sty PF1L ;3
         ldy.w playfield-128+pfres*pfwidth-3-pfadjust
         sty PF2L ;3

         ;sleep 14 
         ldy.w playfield-128+pfres*pfwidth-2      ; Fixed A7 memory addressing
         sty PF1 
         ldy.w playfield-128+pfres*pfwidth-1-pfadjust
         sty PF2
     else
             ldy.w playfield-48+pfwidth*12+44
             sty PF1L ;3
             ldy.w playfield-48+pfwidth*12+45-pfadjust
             sty PF2L ;3
             
             ldy.w playfield-48+pfwidth*12+46         ; Fixed
             sty PF1 
             ldy.w playfield-48+pfwidth*12+47-pfadjust; Fixed
             sty PF2
         endif

enterlastkernel
     lda ballheight

     dcp bally
     rol
     rol
     sta ENABL 

     lda player1height ;3
     dcp player1y ;5
     bcc .skipDrawlastP1
     ldy player1y ;3
     lda (player1pointer),y 

.continuelastP1
     sta GRP1 ;3

     ifnconst player1colors
         lda missile1height ;3
         dcp missile1y ;5
     else
         lda (player1color),y
         sta COLUP1
     endif

     dex
             beq endkernel

             ifconst pfres
            ldy.w playfield-128+pfres*pfwidth-4      ; Fixed A7 memory addressing
            sty PF1L ;3
            ldy.w playfield-128+pfres*pfwidth-3-pfadjust
            sty PF2L ;3

            ;sleep 14 
            ldy.w playfield-128+pfres*pfwidth-2      ; Fixed A7 memory addressing
            sty PF1 
            ldy.w playfield-128+pfres*pfwidth-1-pfadjust
            sty PF2

             else
                     ldy.w playfield-48+pfwidth*12+44
                     sty PF1L ;3
                     ldy.w playfield-48+pfwidth*12+45-pfadjust
                     sty PF2L ;3
                     
                     ldy.w playfield-48+pfwidth*12+46         ; Fixed
                     sty PF1 
                     ldy.w playfield-48+pfwidth*12+47-pfadjust; Fixed
                     sty PF2
                 endif

     ifnconst player1colors
         rol;2
         rol;2
         sta ENAM1 ;3
     else
         ifnconst playercolors
             sleep 7
         else
             lda.w player0colorstore
             sta COLUP0
         endif
     endif
     
     lda.w player0height
     dcp player0y
     bcc .skipDrawlastP0
     ldy player0y
     lda (player0pointer),y
.continuelastP0
     sta GRP0

     ifnconst no_blank_lines
         lda missile0height ;3
         dcp missile0y ;5
         sbc stack1
         sta ENAM0 ;3
         jmp .endkerloop
     else
         ifconst readpaddle
             ldy currentpaddle
             lda INPT0,y
             bpl noreadpaddle2
             inc paddle
             jmp .endkerloop
noreadpaddle2
             sleep 4
             jmp .endkerloop
         else 
             pla
             pha 
             pla
             pha
             jmp .endkerloop
         endif
     endif

.skipDrawlastP0
     lda #0
     tay
     jmp .continuelastP0

     ifconst no_blank_lines
no_blank_lines_bailout
         ldx #0
     endif

endkernel
     ; 6 digit score routine
     stx PF1
     stx PF2
     clc

     ifconst pfrowheight
         lda #pfrowheight+2
     else
         ifnconst pfres
             lda #10
         else
             lda #(96/pfres)+2 
         endif
     endif

     sbc playfieldpos
     sta playfieldpos
     txa

     ifconst shakescreen
         bit shakescreen
         bmi noshakescreen2
         ldx #$3D
noshakescreen2
     endif

     sta WSYNC,x

     sta REFP0
     sta REFP1
     STA GRP0
     STA GRP1
     sta HMCLR
     sta ENAM0
     sta ENAM1
     sta ENABL

     lda temp2 
     sta player0y
     lda temp3
     sta player1y
     ifnconst player1colors
         lda temp6
         sta missile1y
     endif
     ifnconst playercolors
         ifnconst readpaddle
             lda temp5
             sta missile0y
         endif
     endif
     lda stack2
     sta bally

     lda INTIM
     clc
     ifnconst vblank_time
         adc #43+12+87
     else
         adc #vblank_time+12+87

     endif
     sta TIM64T

     ifconst minikernel
         jsr minikernel
     endif

     ifnconst noscore
         lda scorepointers+1
         sta temp1
         lda scorepointers+3
         sta temp3

         sta HMCLR
         tsx
         stx stack1 
         ldx #$E0
         stx HMP0

         LDA scorecolor 
         STA COLUP0
         STA COLUP1
         ifconst scorefade
             STA stack2
         endif
         ifconst pfscore
             lda pfscorecolor
             sta COLUPF
         endif
         sta WSYNC
         ldx #0
         STx GRP0
         STx GRP1 

         lda scorepointers+5
         sta temp5,x
         lda #>scoretable
         sta scorepointers+1
         sta scorepointers+3
         sta scorepointers+5
         sta temp2
         sta temp4
         sta temp6
         LDY #7
         STY VDELP0
         STA RESP0
         STA RESP1

         LDA #$03
         STA NUSIZ0
         STA NUSIZ1
         STA VDELP1
         LDA #$F0
         STA HMP1
         lda (scorepointers),y
         sta GRP0
         STA HMOVE 
         jmp beginscore

         if ((<*)>$d4)
             align 256 
         endif

loop2
         lda (scorepointers),y 
         sta GRP0 
         ifconst pfscore
             lda.w pfscore1
             sta PF1
         else
             ifconst scorefade
                 sleep 2
                 dec stack2 
             else
                 sleep 7
             endif
         endif
beginscore
         lda (scorepointers+$8),y 
         sta GRP1 
         lda (scorepointers+$6),y 
         sta GRP0 
         lax (scorepointers+$2),y 
         txs
         lax (scorepointers+$4),y 
         ifconst scorefade
             lda stack2
         else
             sleep 3
         endif

         ifconst pfscore
             lda pfscore2
             sta PF1
         else
             ifconst scorefade
                 sta COLUP0
                 sta COLUP1
             else
                 sleep 6
             endif
         endif

         lda (scorepointers+$A),y 
         stx GRP1 
         tsx
         stx GRP0 
         sta GRP1 
         sty GRP0 
         dey
         bpl loop2 

         ldx stack1 
         txs
         ldy temp1
         sty scorepointers+1

         LDA #0 
         sta PF1
         STA GRP0
         STA GRP1
         STA VDELP0
         STA VDELP1
         STA NUSIZ0
         STA NUSIZ1

         ldy temp3
         sty scorepointers+3

         ldy temp5
         sty scorepointers+5
     endif 
    ifconst readpaddle
        lda #%11000010
    else
        ifconst qtcontroller
            lda qtcontroller
            lsr    
            lda #4
            ror    
        else
            lda #2
        endif 
    endif 
 sta WSYNC
 sta VBLANK
 jmp SplitReturnSafely
 
; =========================================================
; THE DIVIDER & SWAP ROUTINE 
; =========================================================
     if (<*) > $90
         align 256
     endif
SplitDoDivider
     txa                ; Push playfield offset X to stack (Cycle 37)
     pha                ; (Cycle 40)
     
     ; --- CACHE TOP SCREEN COLLISIONS ---
     ; (Removed unused CXP1FB read & duplicate CXCLR to save 9 cycles -> Ends at Cycle 63!)
     lda CXBLPF         ; (Cycle 43)
     sta top_cxblpf     ; (Cycle 46)
     lda CXP0FB         ; (Cycle 49)
     sta top_cxp0fb     ; (Cycle 52)
     
     ; Clear leftover top-screen sprites & ball before divider scanlines
     ; (GRP1 MUST be written last to latch GRP0 and ENABL via VDELP0/VDELBL)
     lda #0             ; (Cycle 54)
     sta GRP0           ; (Cycle 57)
     sta ENABL          ; (Cycle 60)
     sta GRP1           ; (Cycle 63 - 13 cycles of safe margin before Cycle 76!)
     
     ; Scanline 1: The 1-Pixel Colored Line + Pointer Swaps
     sta WSYNC
     ifconst split_color
        ;lda #split_color  ; Use the # if you want to define this as a constant
         lda split_color   ; Do not use the # if you want to dim this as a variable in bB
         sta COLUBK    
     endif
     
     lda bottom_player0y
     sta top_player0y
     lda bottom_player1y         
     sta top_player1y
     lda bottom_p0_ptr_lo
     sta top_p0_ptr_lo
     lda bottom_p0_ptr_hi
     sta top_p0_ptr_hi
     lda bottom_p1_ptr_lo
     sta top_p1_ptr_lo
     lda bottom_p1_ptr_hi
     sta top_p1_ptr_hi

     ; Fast Clamp Bottom Player 1 X 
     lda bottom_player1x
     clc               
     adc #13           ; CHANGED: Add 13 to align perfectly with bottom ball and top screen
     cmp #160          
     bcc .d_safe
     lda #159          
.d_safe  
     tax               
         
     ; Fast Clamp Bottom Player 0 X 
     lda bottom_player0x
     clc               
     adc #13           ; CHANGED: Add 13 to align perfectly with bottom ball and top screen          
     cmp #160
     bcc .c_safe
     lda #159
.c_safe  
     tay               
         
     ; Scanline 2: Position Bottom P0 (Starts loop at exact Cycle 14)
     sta WSYNC
     lda #bottom_colubk_val ; 2 cycles (constant; frees w030 for CTRLPF)
     sta COLUBK          ; 3 cycles
     sleep 5             ; 5 cycles (Total = 10)
     tya                 ; 2 cycles (12)
     sec                 ; 2 cycles (14)
SplitPosP0
     sbc #15
     bcs SplitPosP0
     sta RESP0         
     tay             
     
     ; Scanline 3: Position Bottom P1 (Starts loop at exact Cycle 14)
     sta WSYNC
     sleep 10            ; 10 cycles
     txa                 ; 2 cycles (12)
     sec                 ; 2 cycles (14)
SplitPosP1
     sbc #15
     bcs SplitPosP1
     sta RESP1         
     tax               

     ; Scanline 4: Position Bottom Ball (Starts loop at exact Cycle 14!)
     sta WSYNC
     sleep 5             ; 5 cycles
     lda p2_ballx        ; 3 cycles (8)
     clc                 ; 2 cycles (10)
     adc #13             ; 2 cycles (12) -> Matches old sleep 10 + sbc #2 visual offset
     sec                 ; 2 cycles (14)
SplitPosBall
     sbc #15
     bcs SplitPosBall
     sta RESBL
     
     ; NO pha here! The Accumulator holds the Ball remainder safely!
     
     ; Scanline 5: Fine Positioning Math + Color Swaps + Early HMOVE
     sta WSYNC         ; Halts CPU until end of Scanline 4
     sta HMCLR         ; 3 cycles
     
     ; 1. Process Bottom Ball remainder first (already in A)
     eor #7
     asl
     asl
     asl
     asl
     sta HMBL          ; Total: 16 cycles
     
     ; 2. Process Bottom P0 remainder (in Y)
     tya               
     eor #7
     asl
     asl
     asl
     asl
     sta HMP0          ; Total: 31 cycles

     ; 3. Process Bottom P1 remainder (in X)
     txa               
     eor #7
     asl
     asl
     asl
     asl
     sta HMP1          ; Total: 46 cycles
     
     ; Offload standard color swaps 
     lda bottom_colupf 
     sta top_colupf        
     lda bottom_colup0
     sta top_colup0        
     lda bottom_colup1
     sta top_colup1    ; Total: 64 cycles
     
     ; Pad exactly 7 cycles to hit Early HMOVE perfectly on cycle 73
     lda r_bottom_ctrlpf ; 4 cycles  - bottom CTRLPF (priority bit for torch)
     sta CTRLPF        ; 3 cycles (Total: 71 cycles)  [was: sta CXCLR / nop / nop]
     
     ; Early HMOVE Strobe
     sta HMOVE

     ; --- SCANLINE 6 (Seamlessly crossed into from the HMOVE above) ---
     lda p2_bally
     sta bally
     
     lda r_bottom_nusiz1
     sta top_nusiz1

     pla                 ; Pull Playfield offset X from the stack
     tax                 ; Restore it to X
         
     ; Proven playfield phase sync: 11 cycles (was sleep 11).  Now does useful work:
     lda bot_nusiz0      ; 3 cycles - bottom P0 size (gate = 5, torch = 7)
     sta NUSIZ0          ; 3 cycles
     sta CXCLR           ; 3 cycles (moved here from the end of scanline 5)
     sleep 9             ; steve - commented out nop below and added sleep 9 to fix playfield render issue on room 16 in bottom half
     ;nop                 ; 2 cycles (Total: 11)
         
     jmp SplitReturnFromDivider
SplitReturnSafely
 RETURN
     ifconst shakescreen
doshakescreen
         bit shakescreen
         bmi noshakescreen
         sta WSYNC
noshakescreen
         ldx missile0height
         inx
         rts
     endif