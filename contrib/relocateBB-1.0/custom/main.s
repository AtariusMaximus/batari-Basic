	.arch armv6-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "main.c"
	.section	.text.my_memcpy,"ax",%progbits
	.align	1
	.global	my_memcpy
	.syntax unified
	.code	16
	.thumb_func
	.type	my_memcpy, %function
my_memcpy:
.LFB0:
	.loc 1 177 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	.loc 1 178 9
	.loc 1 179 9
	.loc 1 177 1 is_stmt 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 0, -32
	.cfi_offset 1, -28
	.cfi_offset 2, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 177 1
	str	r3, [sp, #4]
	.loc 1 179 14
	movs	r3, #0
.LVL1:
	.loc 1 180 56
	ldr	r7, .L4
.LVL2:
.L2:
	.loc 1 179 18 is_stmt 1 discriminator 1
	ldr	r4, [sp, #4]
	cmp	r3, r4
	blt	.L3
	.loc 1 181 1 is_stmt 0
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
.L3:
	.loc 1 180 17 is_stmt 1 discriminator 3
	.loc 1 180 28 is_stmt 0 discriminator 3
	movs	r5, #255
	adds	r4, r2, r3
	.loc 1 180 56 discriminator 3
	ldrb	r6, [r1, r3]
	.loc 1 180 28 discriminator 3
	ands	r4, r5
	.loc 1 180 56 discriminator 3
	ldr	r5, [r7]
	.loc 1 179 26 discriminator 3
	adds	r3, r3, #1
.LVL3:
	.loc 1 180 56 discriminator 3
	ands	r5, r6
	.loc 1 180 45 discriminator 3
	strb	r5, [r0, r4]
	.loc 1 179 26 is_stmt 1 discriminator 3
.LVL4:
	b	.L2
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.cfi_endproc
.LFE0:
	.size	my_memcpy, .-my_memcpy
	.section	.text.my_memset,"ax",%progbits
	.align	1
	.global	my_memset
	.syntax unified
	.code	16
	.thumb_func
	.type	my_memset, %function
my_memset:
.LFB1:
	.loc 1 184 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 185 9
	.loc 1 186 9
	.loc 1 186 15 is_stmt 0
	movs	r3, #0
.LVL6:
.L7:
	.loc 1 186 19 is_stmt 1 discriminator 1
	cmp	r3, r2
	blt	.L8
	.loc 1 188 1 is_stmt 0
	@ sp needed
	bx	lr
.L8:
	.loc 1 187 17 is_stmt 1 discriminator 3
	.loc 1 187 31 is_stmt 0 discriminator 3
	strb	r1, [r0, r3]
	.loc 1 186 27 is_stmt 1 discriminator 3
	adds	r3, r3, #1
.LVL7:
	b	.L7
	.cfi_endproc
.LFE1:
	.size	my_memset, .-my_memset
	.section	.text.reverse,"ax",%progbits
	.align	1
	.global	reverse
	.syntax unified
	.code	16
	.thumb_func
	.type	reverse, %function
reverse:
.LFB2:
	.loc 1 191 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 192 9
	.loc 1 193 9
.L10:
	.loc 1 193 18
	cmp	r0, r1
	blt	.L11
	.loc 1 199 1 is_stmt 0
	@ sp needed
	pop	{r4, pc}
.L11:
	.loc 1 195 15 is_stmt 1
	.loc 1 195 20 is_stmt 0
	ldrb	r3, [r2, r0]
.LVL9:
	.loc 1 195 25 is_stmt 1
	.loc 1 195 33 is_stmt 0
	ldrb	r4, [r2, r1]
	.loc 1 195 30
	strb	r4, [r2, r0]
	.loc 1 195 38 is_stmt 1
	.loc 1 195 43 is_stmt 0
	strb	r3, [r2, r1]
	.loc 1 196 15 is_stmt 1
	.loc 1 196 16 is_stmt 0
	adds	r0, r0, #1
.LVL10:
	.loc 1 197 15 is_stmt 1
	.loc 1 197 16 is_stmt 0
	subs	r1, r1, #1
.LVL11:
	b	.L10
	.cfi_endproc
.LFE2:
	.size	reverse, .-reverse
	.section	.text.memscroll,"ax",%progbits
	.align	1
	.global	memscroll
	.syntax unified
	.code	16
	.thumb_func
	.type	memscroll, %function
memscroll:
.LFB3:
	.loc 1 202 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL12:
	.loc 1 204 9
	.loc 1 202 1 is_stmt 0
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 202 1
	movs	r4, r0
	.loc 1 207 1
	@ sp needed
	.loc 1 202 1
	movs	r5, r1
	.loc 1 204 9
	movs	r2, r0
	subs	r1, r1, #1
.LVL13:
	movs	r0, #0
.LVL14:
	bl	reverse
.LVL15:
	.loc 1 205 9 is_stmt 1
	movs	r0, r5
	movs	r2, r4
	movs	r1, #255
	bl	reverse
.LVL16:
	.loc 1 206 9
	movs	r2, r4
	movs	r1, #255
	movs	r0, #0
	bl	reverse
.LVL17:
.LVL18:
	.loc 1 207 1 is_stmt 0
	pop	{r4, r5, r6, pc}
	.cfi_endproc
.LFE3:
	.size	memscroll, .-memscroll
	.section	.text.get32bitdff,"ax",%progbits
	.align	1
	.global	get32bitdff
	.syntax unified
	.code	16
	.thumb_func
	.type	get32bitdff, %function
get32bitdff:
.LFB4:
	.loc 1 210 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL19:
	.loc 1 211 3
	.loc 1 211 22 is_stmt 0
	ldr	r3, .L14
	.loc 1 212 1
	@ sp needed
	.loc 1 211 22
	ldr	r3, [r3, #4]
	adds	r3, r3, r0
	movs	r2, r3
	adds	r2, r2, #46
	ldrb	r0, [r2]
.LVL20:
	.loc 1 211 51
	adds	r3, r3, #7
	ldrb	r3, [r3, #31]
	.loc 1 211 35
	lsls	r0, r0, #8
	.loc 1 211 39
	adds	r0, r0, r3
	.loc 1 212 1
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.cfi_endproc
.LFE4:
	.size	get32bitdff, .-get32bitdff
	.section	.text.get32bitdf,"ax",%progbits
	.align	1
	.global	get32bitdf
	.syntax unified
	.code	16
	.thumb_func
	.type	get32bitdf, %function
get32bitdf:
.LFB5:
	.loc 1 215 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL21:
	.loc 1 216 3
	.loc 1 216 22 is_stmt 0
	ldr	r3, .L17
	.loc 1 217 1
	@ sp needed
	.loc 1 216 22
	ldr	r3, [r3, #4]
	adds	r3, r3, r0
	ldrb	r0, [r3, #30]
.LVL22:
	.loc 1 216 51
	ldrb	r3, [r3, #22]
	.loc 1 216 35
	lsls	r0, r0, #8
	.loc 1 216 39
	adds	r0, r0, r3
	.loc 1 217 1
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.cfi_endproc
.LFE5:
	.size	get32bitdf, .-get32bitdf
	.section	.text.checkwrap,"ax",%progbits
	.align	1
	.global	checkwrap
	.syntax unified
	.code	16
	.thumb_func
	.type	checkwrap, %function
checkwrap:
.LFB6:
	.loc 1 229 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL23:
	.loc 1 230 3
	.loc 1 230 13 is_stmt 0
	adds	r3, r0, r1
	.loc 1 230 6
	uxtb	r3, r3
	cmp	r3, r1
	bcs	.L20
	.loc 1 230 29
	movs	r0, #0
.LVL24:
.L20:
	.loc 1 232 1
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE6:
	.size	checkwrap, .-checkwrap
	.section	.text.checkswap,"ax",%progbits
	.align	1
	.global	checkswap
	.syntax unified
	.code	16
	.thumb_func
	.type	checkswap, %function
checkswap:
.LFB7:
	.loc 1 235 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL25:
	.loc 1 236 3
	.loc 1 237 3
	.loc 1 239 3
	.loc 1 235 1 is_stmt 0
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 239 20
	ldr	r3, .L29
	ldr	r2, [r3]
	.loc 1 239 6
	adds	r0, r2, r0
.LVL26:
	ldrb	r3, [r0, #21]
	adds	r0, r0, #2
	ldrb	r4, [r0, #31]
.LVL27:
.LBB6:
.LBB7:
	.loc 1 230 3 is_stmt 1
	.loc 1 230 13 is_stmt 0
	adds	r0, r3, r4
	.loc 1 230 6
	uxtb	r0, r0
	cmp	r4, r0
	bls	.L23
	.loc 1 230 29
	movs	r3, #0
.LVL28:
.L23:
.LBE7:
.LBE6:
	.loc 1 240 3 is_stmt 1
	.loc 1 240 6 is_stmt 0
	adds	r2, r2, r1
	ldrb	r1, [r2, #21]
.LVL29:
	adds	r2, r2, #2
	ldrb	r2, [r2, #31]
.LVL30:
.LBB8:
.LBB9:
	.loc 1 230 3 is_stmt 1
	.loc 1 230 13 is_stmt 0
	adds	r0, r1, r2
	.loc 1 230 6
	uxtb	r0, r0
	cmp	r2, r0
	bls	.L24
	.loc 1 230 29
	movs	r1, #0
.LVL31:
.L24:
.LBE9:
.LBE8:
	.loc 1 242 3 is_stmt 1
	.loc 1 249 19 is_stmt 0
	movs	r0, #1
	.loc 1 242 8
	subs	r3, r3, r1
.LVL32:
	.loc 1 243 3 is_stmt 1
	.loc 1 243 6 is_stmt 0
	cmp	r3, #0
	ble	.L22
	.loc 1 245 5 is_stmt 1
	.loc 1 245 15 is_stmt 0
	subs	r3, r3, #5
.LVL33:
	.loc 1 245 8
	cmp	r3, #0
	ble	.L22
	.loc 1 247 7 is_stmt 1
	.loc 1 247 10 is_stmt 0
	asrs	r0, r2, #31
	lsrs	r1, r3, #31
.LVL34:
	cmp	r2, r3
	adcs	r0, r0, r1
.L22:
	.loc 1 265 1
	@ sp needed
	pop	{r4, pc}
.L30:
	.align	2
.L29:
	.word	.LANCHOR1
	.cfi_endproc
.LFE7:
	.size	checkswap, .-checkswap
	.section	.text.copynybble,"ax",%progbits
	.align	1
	.global	copynybble
	.syntax unified
	.code	16
	.thumb_func
	.type	copynybble, %function
copynybble:
.LFB8:
	.loc 1 268 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL35:
	.loc 1 269 5
	.loc 1 270 5
	.loc 1 271 5
	.loc 1 272 5
	.loc 1 268 1 is_stmt 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 32
	.cfi_offset 0, -32
	.cfi_offset 1, -28
	.cfi_offset 2, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 272 35
	ldr	r2, .L34
	.loc 1 272 67
	ldr	r7, .L34+4
	.loc 1 272 35
	ldr	r1, [r2, #4]
	.loc 1 268 1
	str	r0, [sp, #4]
	.loc 1 272 35
	movs	r3, r1
	adds	r3, r3, #57
	.loc 1 272 43
	ldrb	r5, [r3]
	.loc 1 272 59
	subs	r3, r3, #1
	ldrb	r6, [r3]
	.loc 1 272 75
	ldr	r3, [r2, #8]
	.loc 1 272 67
	ldr	r4, [r7, #4]
	.loc 1 272 75
	adds	r0, r3, #1
.LVL36:
	str	r0, [r2, #8]
	.loc 1 273 66
	ldr	r2, [r7, #8]
	.loc 1 273 78
	movs	r7, #120
	ldr	r0, [sp, #4]
	.loc 1 272 78
	lsls	r3, r3, #3
	.loc 1 273 78
	lsls	r0, r0, #3
	ands	r0, r7
	.loc 1 273 46
	movs	r7, r1
	adds	r1, r1, #55
	ldrb	r1, [r1]
	adds	r7, r7, #54
	ldrb	r7, [r7]
	lsls	r1, r1, #8
	orrs	r1, r7
	.loc 1 273 66
	adds	r0, r0, r1
	.loc 1 272 43
	lsls	r5, r5, #8
	.loc 1 273 5 is_stmt 1
.LVL37:
	.loc 1 274 5
	.loc 1 274 14
	.loc 1 272 67 is_stmt 0
	adds	r3, r3, r6
	adds	r1, r2, r0
.LVL38:
	adds	r3, r3, r5
	subs	r2, r2, #8
	adds	r4, r4, r3
	adds	r2, r2, r0
.LVL39:
.L32:
	.loc 1 275 7 is_stmt 1 discriminator 3
	.loc 1 275 30 is_stmt 0 discriminator 3
	ldrb	r3, [r1, #7]
	.loc 1 274 14 discriminator 3
	subs	r1, r1, #1
	.loc 1 275 22 discriminator 3
	strb	r3, [r4]
	.loc 1 274 18 is_stmt 1 discriminator 3
	.loc 1 274 14 discriminator 3
	adds	r4, r4, #1
	cmp	r1, r2
	bne	.L32
	.loc 1 276 1 is_stmt 0
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.cfi_endproc
.LFE8:
	.size	copynybble, .-copynybble
	.section	.text.on_off_flip,"ax",%progbits
	.align	1
	.global	on_off_flip
	.syntax unified
	.code	16
	.thumb_func
	.type	on_off_flip, %function
on_off_flip:
.LFB9:
	.loc 1 279 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL40:
	.loc 1 280 3
	movs	r2, #3
	.loc 1 280 20 is_stmt 0
	ldr	r3, .L41
	ldr	r3, [r3, #12]
	ldrb	r3, [r3]
	ands	r3, r2
	.loc 1 280 3
	cmp	r3, #1
	beq	.L37
	cmp	r3, #2
	beq	.L38
	cmp	r3, #0
	bne	.L36
	.loc 1 283 7 is_stmt 1
	.loc 1 283 14 is_stmt 0
	ldr	r3, .L41+4
	ldr	r2, [r3, #12]
	.loc 1 283 19
	ldrb	r3, [r2, r0]
	orrs	r3, r1
.L40:
	.loc 1 289 19
	strb	r3, [r2, r0]
	.loc 1 290 7 is_stmt 1
.L36:
	.loc 1 294 1 is_stmt 0
	@ sp needed
	bx	lr
.L37:
	.loc 1 286 7 is_stmt 1
	.loc 1 286 14 is_stmt 0
	ldr	r3, .L41+4
	ldr	r2, [r3, #12]
	.loc 1 286 19
	ldrb	r3, [r2, r0]
	bics	r3, r1
	b	.L40
.L38:
	.loc 1 289 7 is_stmt 1
	.loc 1 289 14 is_stmt 0
	ldr	r3, .L41+4
	ldr	r2, [r3, #12]
	.loc 1 289 19
	ldrb	r3, [r2, r0]
	eors	r3, r1
	b	.L40
.L42:
	.align	2
.L41:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.cfi_endproc
.LFE9:
	.size	on_off_flip, .-on_off_flip
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC11:
	.ascii	"\200@ \020\010\004\002\001\001\002\004\010\020 @\200"
	.ascii	"\200@ \020\010\004\002\001\001\002\004\010\020 @\200"
	.ascii	"\000"
	.section	.text.startup.main,"ax",%progbits
	.align	1
	.global	main
	.syntax unified
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB10:
	.loc 1 298 1 is_stmt 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 300 3
	.loc 1 303 3
	.loc 1 304 3
	.loc 1 305 3
	.loc 1 306 3
.LVL41:
	.loc 1 307 3
	.loc 1 298 1 is_stmt 0
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #68
	.cfi_def_cfa_offset 88
	.loc 1 307 23
	movs	r2, #32
	ldr	r1, .L104
	add	r0, sp, #32
	bl	memcpy
.LVL42:
	.loc 1 313 3 is_stmt 1
	.loc 1 313 24 is_stmt 0
	ldr	r4, .L104+4
	.loc 1 313 14
	ldr	r6, .L104+8
	.loc 1 313 46
	ldr	r3, [r4, #16]
	ldrh	r2, [r3]
	.loc 1 313 24
	ldr	r3, [r4, #8]
	adds	r3, r3, r2
	movs	r2, #3
	.loc 1 313 14
	str	r3, [r6, #4]
	.loc 1 316 3 is_stmt 1
	.loc 1 316 17 is_stmt 0
	ldr	r3, [r4, #12]
	str	r3, [sp, #8]
	ldrb	r3, [r3, #1]
	str	r3, [sp, #4]
.LVL43:
	.loc 1 317 3 is_stmt 1
	.loc 1 317 17 is_stmt 0
	ldr	r3, [sp, #8]
	ldrb	r5, [r3, #2]
.LVL44:
	.loc 1 318 3 is_stmt 1
	.loc 1 318 17 is_stmt 0
	ldrb	r7, [r3, #3]
.LVL45:
	.loc 1 320 3 is_stmt 1
	ldrb	r3, [r3]
	bics	r3, r2
	cmp	r3, #20
	bne	.LCB587
	b	.L44	@long jump
.LCB587:
	bls	.LCB589
	b	.L45	@long jump
.LCB589:
	cmp	r3, #12
	bne	.LCB591
	b	.L46	@long jump
.LCB591:
	bls	.LCB593
	b	.L47	@long jump
.LCB593:
	cmp	r3, #4
	bne	.LCB595
	b	.L48	@long jump
.LCB595:
	cmp	r3, #8
	bne	.LCB597
	b	.L58	@long jump
.LCB597:
.L50:
	.loc 1 397 4
	.loc 1 401 3
	.loc 1 405 18 is_stmt 0
	movs	r0, r4
	.loc 1 401 13
	ldr	r3, [sp, #4]
	.loc 1 405 18
	adds	r4, r4, #30
	movs	r2, r3
	movs	r1, r4
	adds	r0, r0, #20
	.loc 1 401 13
	strb	r3, [r6, #16]
	.loc 1 403 3 is_stmt 1
.LVL46:
	.loc 1 405 18 is_stmt 0
	bl	memcpy
.LVL47:
	.loc 1 408 3 is_stmt 1
	.loc 1 408 8 is_stmt 0
	ldr	r3, [sp, #4]
	subs	r7, r3, #1
.LVL48:
	.loc 1 409 3 is_stmt 1
	.loc 1 410 2
	subs	r5, r3, #2
.LVL49:
	adds	r6, r4, r5
	.loc 1 408 8 is_stmt 0
	str	r7, [sp, #8]
.LVL50:
.L66:
	.loc 1 410 14 is_stmt 1
	cmp	r5, #0
	blt	.LCB634
	b	.L70	@long jump
.LCB634:
	.loc 1 437 9 is_stmt 0
	movs	r3, #0
	.loc 1 438 9
	ldr	r4, .L104+4
	.loc 1 437 13
	ldr	r5, .L104+8
.LVL51:
	.loc 1 438 38
	ldr	r0, .L104+12
.L74:
.LVL52:
	.loc 1 437 13 is_stmt 1 discriminator 1
	ldrb	r1, [r5, #16]
	.loc 1 438 9 is_stmt 0 discriminator 1
	ldr	r2, [r4]
	.loc 1 437 13 discriminator 1
	cmp	r1, r3
	ble	.LCB647
	b	.L75	@long jump
.LCB647:
	.loc 1 439 3 is_stmt 1
	.loc 1 439 22 is_stmt 0
	ldr	r3, [sp, #8]
.LVL53:
	.loc 1 442 19
	movs	r0, #3
	.loc 1 439 22
	strb	r3, [r2, #9]
	.loc 1 442 3 is_stmt 1
	.loc 1 442 19 is_stmt 0
	bl	get32bitdf
.LVL54:
	.loc 1 442 3
	ldr	r6, [r4, #4]
	movs	r2, #192
	movs	r1, #0
	.loc 1 442 18
	adds	r0, r6, r0
	.loc 1 442 3
	bl	my_memset
.LVL55:
	.loc 1 445 3 is_stmt 1
	.loc 1 445 19 is_stmt 0
	movs	r0, #1
	bl	get32bitdf
.LVL56:
	.loc 1 445 37
	ldr	r3, [r4]
	.loc 1 445 3
	ldr	r6, [r4, #4]
	.loc 1 445 37
	adds	r3, r3, #55
	.loc 1 445 3
	ldrb	r1, [r3]
	movs	r2, #192
	.loc 1 445 18
	adds	r0, r6, r0
	.loc 1 445 3
	bl	my_memset
.LVL57:
	.loc 1 447 3 is_stmt 1
	.loc 1 447 19 is_stmt 0
	movs	r0, #0
	bl	get32bitdf
.LVL58:
	.loc 1 447 39
	ldr	r3, [r4]
	.loc 1 447 3
	ldr	r6, [r4, #4]
	.loc 1 447 39
	adds	r3, r3, #54
	.loc 1 447 32
	subs	r0, r0, #1
	.loc 1 447 3
	ldrb	r1, [r3]
	movs	r2, #193
	.loc 1 447 32
	adds	r0, r6, r0
	.loc 1 447 3
	bl	my_memset
.LVL59:
	.loc 1 451 3 is_stmt 1
	.loc 1 451 19 is_stmt 0
	movs	r0, #0
	bl	get32bitdf
.LVL60:
	.loc 1 452 28
	ldr	r1, [r4]
	.loc 1 451 3
	ldr	r6, [r4, #4]
	ldrb	r2, [r1, #20]
	.loc 1 452 48
	ldrb	r7, [r1, #30]
	.loc 1 453 17
	adds	r3, r1, #1
	.loc 1 452 48
	ldrb	r1, [r1, #31]
	.loc 1 451 3
	ldrb	r3, [r3, #31]
	.loc 1 452 48
	lsls	r1, r1, #8
	orrs	r1, r7
	ldr	r7, [r4, #8]
	.loc 1 451 18
	adds	r0, r6, r0
	.loc 1 452 48
	adds	r1, r7, r1
	.loc 1 451 3
	bl	my_memcpy
.LVL61:
	.loc 1 456 3 is_stmt 1
	.loc 1 456 19 is_stmt 0
	movs	r0, #2
	bl	get32bitdf
.LVL62:
	.loc 1 457 28
	ldr	r2, [r4]
	.loc 1 456 3
	ldr	r6, [r4, #4]
	.loc 1 457 50
	movs	r1, r2
	.loc 1 458 17
	adds	r3, r2, #1
	.loc 1 457 50
	adds	r2, r2, #57
	ldrb	r2, [r2]
	adds	r1, r1, #56
	ldrb	r1, [r1]
	lsls	r2, r2, #8
	orrs	r2, r1
	ldr	r1, [r4, #8]
	.loc 1 456 3
	ldrb	r3, [r3, #31]
	.loc 1 457 50
	adds	r1, r1, r2
	.loc 1 456 18
	adds	r0, r6, r0
	.loc 1 456 3
	movs	r2, #0
	bl	my_memcpy
.LVL63:
	.loc 1 460 3 is_stmt 1
	.loc 1 460 8 is_stmt 0
	movs	r3, #0
	str	r3, [r5, #24]
	.loc 1 461 3 is_stmt 1
	.loc 1 461 8 is_stmt 0
	str	r3, [r5, #20]
	.loc 1 462 3 is_stmt 1
.LVL64:
.L76:
	.loc 1 462 16
	ldr	r1, .L104+8
	.loc 1 472 15 is_stmt 0
	ldr	r5, .L104+4
	.loc 1 462 16
	ldr	r3, [r1, #20]
	ldr	r2, .L104+16
	.loc 1 472 15
	ldr	r4, [r5]
	.loc 1 462 16
	cmp	r3, r2
	beq	.LCB741
	b	.L82	@long jump
.LCB741:
	.loc 1 516 3 is_stmt 1
	.loc 1 516 8 is_stmt 0
	movs	r3, #1
	.loc 1 518 10
	movs	r4, #51
	.loc 1 516 8
	str	r3, [r1, #8]
	.loc 1 518 3 is_stmt 1
.LVL65:
	.loc 1 518 21
.L83:
	.loc 1 519 5 discriminator 3
	ldr	r3, [r5]
	ldrb	r0, [r3, r4]
	bl	copynybble
.LVL66:
	.loc 1 520 5 discriminator 3
	.loc 1 520 20 is_stmt 0 discriminator 3
	ldr	r3, [r5]
	.loc 1 520 5 discriminator 3
	ldrb	r0, [r3, r4]
	.loc 1 518 33 discriminator 3
	adds	r4, r4, #1
.LVL67:
	.loc 1 520 5 discriminator 3
	lsrs	r0, r0, #4
	bl	copynybble
.LVL68:
	.loc 1 518 33 is_stmt 1 discriminator 3
	.loc 1 518 21 discriminator 3
	cmp	r4, #54
	bne	.L83
	.loc 1 523 3
	.loc 1 524 1 is_stmt 0
	movs	r0, #0
	b	.L43
.LVL69:
.L47:
	.loc 1 320 3
	cmp	r3, #16
	bne	.L50
	.loc 1 348 7 is_stmt 1
	movs	r1, #0
	ldr	r0, [r4]
	ldr	r2, .L104+20
	adds	r0, r0, #58
.L103:
	.loc 1 386 7 is_stmt 0
	bl	my_memset
.LVL70:
	.loc 1 387 7 is_stmt 1
	b	.L43
.L45:
	.loc 1 320 3 is_stmt 0
	cmp	r3, #28
	bne	.LCB798
	b	.L52	@long jump
.LCB798:
	.loc 1 391 16
	str	r5, [sp, #12]
	.loc 1 320 3
	cmp	r3, #32
	bne	.LCB801
	b	.L64	@long jump
.LCB801:
	cmp	r3, #24
	beq	.LCB804
	b	.L50	@long jump
.LCB804:
	.loc 1 380 7 is_stmt 1
	.loc 1 380 21 is_stmt 0
	ldr	r3, [sp, #4]
	.loc 1 380 20
	ldr	r4, [r4, #4]
	.loc 1 380 21
	lsrs	r0, r3, #3
	bl	get32bitdff
.LVL71:
	.loc 1 381 22
	ldr	r1, [sp, #4]
	.loc 1 380 20
	adds	r4, r4, r0
	.loc 1 380 14
	str	r4, [r6, #12]
	.loc 1 381 7 is_stmt 1
	.loc 1 381 22 is_stmt 0
	add	r3, sp, #32
	ldrb	r2, [r4, r5]
	ldrb	r3, [r3, r1]
	ands	r3, r2
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	ldr	r2, [sp, #8]
	strb	r3, [r2, #3]
	.loc 1 382 7 is_stmt 1
	b	.L43
.L48:
	.loc 1 324 7
	.loc 1 324 21 is_stmt 0
	lsrs	r0, r7, #3
	bl	get32bitdff
.LVL72:
	.loc 1 324 20
	ldr	r4, [r4, #4]
	adds	r4, r4, r0
	.loc 1 324 14
	str	r4, [r6, #12]
	.loc 1 325 7 is_stmt 1
.LVL73:
.L55:
	.loc 1 325 27 discriminator 1
	ldr	r3, [sp, #4]
	cmp	r3, r5
	bge	.L56
.LVL74:
.L43:
	.loc 1 524 1 is_stmt 0
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LVL75:
.L56:
	.loc 1 327 9 is_stmt 1 discriminator 3
	add	r3, sp, #32
	movs	r0, r5
	ldrb	r1, [r3, r7]
	bl	on_off_flip
.LVL76:
	.loc 1 325 41 discriminator 3
	adds	r5, r5, #1
.LVL77:
	b	.L55
.LVL78:
.L59:
	.loc 1 335 9 discriminator 3
	.loc 1 335 22 is_stmt 0 discriminator 3
	ldr	r3, [r4, #4]
	.loc 1 335 23 discriminator 3
	asrs	r0, r7, #3
	.loc 1 335 22 discriminator 3
	str	r3, [sp, #8]
	.loc 1 335 23 discriminator 3
	bl	get32bitdff
.LVL79:
	.loc 1 335 22 discriminator 3
	ldr	r3, [sp, #8]
	adds	r0, r3, r0
	.loc 1 336 9 discriminator 3
	add	r3, sp, #32
	ldrb	r1, [r3, r7]
	.loc 1 335 16 discriminator 3
	str	r0, [r6, #12]
	.loc 1 336 9 is_stmt 1 discriminator 3
	movs	r0, r5
	bl	on_off_flip
.LVL80:
	.loc 1 333 41 discriminator 3
	adds	r7, r7, #1
.LVL81:
.L58:
	.loc 1 333 27 discriminator 1
	ldr	r3, [sp, #4]
	cmp	r3, r7
	bge	.L59
	b	.L43
.LVL82:
.L46:
	.loc 1 342 7
	.loc 1 342 21 is_stmt 0
	lsrs	r0, r7, #3
	bl	get32bitdff
.LVL83:
	.loc 1 342 20
	ldr	r4, [r4, #4]
	.loc 1 343 7
	add	r3, sp, #32
	.loc 1 342 20
	adds	r4, r4, r0
	.loc 1 343 7
	ldrb	r1, [r3, r7]
	movs	r0, r5
	.loc 1 342 14
	str	r4, [r6, #12]
	.loc 1 343 7 is_stmt 1
	bl	on_off_flip
.LVL84:
	.loc 1 344 7
	b	.L43
.L44:
	.loc 1 356 7
	.loc 1 356 20 is_stmt 0
	movs	r3, #0
	ldr	r2, [sp, #8]
	strb	r3, [r2, #3]
	.loc 1 357 7 is_stmt 1
.LVL85:
	.loc 1 358 7
	.loc 1 358 18 is_stmt 0
	ldr	r2, [r4]
	adds	r7, r2, r5
.LVL86:
	.loc 1 358 74
	adds	r3, r7, #1
	.loc 1 358 13
	ldrb	r6, [r7, #20]
.LVL87:
	.loc 1 358 74
	ldrb	r3, [r3, #31]
	.loc 1 366 65
	lsls	r5, r5, #1
.LVL88:
	.loc 1 358 69
	adds	r3, r3, r6
	str	r3, [sp, #24]
	.loc 1 366 30
	ldr	r3, [r4, #8]
	mov	ip, r3
	.loc 1 366 53
	movs	r3, r5
	adds	r3, r3, #57
	.loc 1 366 36
	adds	r3, r2, r3
	.loc 1 366 94
	adds	r5, r5, #56
	.loc 1 366 36
	str	r3, [sp, #8]
	.loc 1 366 77
	adds	r3, r2, r5
	str	r3, [sp, #12]
	.loc 1 367 65
	ldr	r3, [sp, #4]
	lsls	r3, r3, #1
	.loc 1 367 53
	movs	r1, r3
	adds	r1, r1, #57
	.loc 1 367 36
	adds	r1, r2, r1
	str	r1, [sp, #16]
	.loc 1 358 13
	movs	r1, r6
	.loc 1 367 94
	adds	r3, r3, #56
	.loc 1 367 77
	adds	r3, r2, r3
	str	r3, [sp, #20]
	.loc 1 360 21
	ldr	r3, [sp, #4]
	adds	r2, r2, r3
	.loc 1 360 82
	adds	r3, r2, #1
	str	r3, [sp, #28]
.LVL89:
.L61:
	.loc 1 358 42 is_stmt 1 discriminator 1
	ldr	r3, [sp, #24]
	cmp	r3, r1
	ble	.L43
	.loc 1 360 9
	.loc 1 360 21 is_stmt 0
	ldrb	r5, [r2, #20]
	.loc 1 360 12
	cmp	r5, r1
	bgt	.L62
	.loc 1 360 82 discriminator 1
	ldr	r3, [sp, #28]
	ldrb	r3, [r3, #31]
	.loc 1 360 77 discriminator 1
	adds	r3, r3, r5
	.loc 1 360 45 discriminator 1
	cmp	r3, r1
	ble	.L62
	.loc 1 363 11 is_stmt 1
	.loc 1 363 21 is_stmt 0
	ldrb	r0, [r7, #10]
	.loc 1 363 48
	ldrb	r3, [r2, #10]
	.loc 1 363 43
	subs	r0, r0, r3
	.loc 1 363 16
	adds	r0, r0, #7
.LVL90:
	.loc 1 364 11 is_stmt 1
	.loc 1 364 14 is_stmt 0
	cmp	r0, #14
	bgt	.L62
	.loc 1 366 13 is_stmt 1
	.loc 1 366 36 is_stmt 0
	ldr	r3, [sp, #8]
	.loc 1 366 77
	ldr	r4, [sp, #12]
	.loc 1 366 36
	ldrb	r3, [r3]
	.loc 1 366 77
	ldrb	r4, [r4]
	.loc 1 366 68
	lsls	r3, r3, #8
	.loc 1 366 72
	adds	r3, r3, r4
	.loc 1 366 109
	adds	r3, r3, r1
	.loc 1 366 111
	subs	r3, r3, r6
	.loc 1 366 30
	add	r3, r3, ip
	ldrb	r3, [r3]
	str	r3, [sp, #4]
	.loc 1 367 36
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]
	.loc 1 367 68
	lsls	r3, r3, #8
	movs	r4, r3
	.loc 1 367 77
	ldr	r3, [sp, #20]
	ldrb	r3, [r3]
	.loc 1 367 72
	adds	r3, r4, r3
	.loc 1 367 109
	adds	r3, r3, r1
	.loc 1 367 111
	subs	r3, r3, r5
	.loc 1 367 30
	add	r3, r3, ip
	ldrb	r3, [r3]
.LVL91:
	.loc 1 369 4 is_stmt 1
	.loc 1 366 140 is_stmt 0
	ldr	r4, [sp, #4]
	.loc 1 367 140
	lsls	r3, r3, r0
.LVL92:
	.loc 1 366 140
	lsls	r4, r4, #7
	.loc 1 369 7
	tst	r3, r4
	beq	.L62
	.loc 1 371 6 is_stmt 1
	.loc 1 371 19 is_stmt 0
	movs	r2, #255
	.loc 1 371 16
	ldr	r3, .L104+4
	ldr	r3, [r3, #12]
	.loc 1 371 19
	strb	r2, [r3, #3]
	.loc 1 372 6 is_stmt 1
	b	.L43
.LVL93:
.L62:
	.loc 1 358 102 discriminator 2
	adds	r1, r1, #1
.LVL94:
	b	.L61
.LVL95:
.L52:
	.loc 1 386 7
	.loc 1 386 23 is_stmt 0
	movs	r0, #0
	bl	get32bitdff
.LVL96:
	.loc 1 386 7
	movs	r2, #128
	ldr	r4, [r4, #4]
	ldr	r1, [sp, #4]
	.loc 1 386 22
	adds	r0, r4, r0
	.loc 1 386 7
	lsls	r2, r2, #3
	b	.L103
.LVL97:
.L65:
	.loc 1 392 9 is_stmt 1 discriminator 3
	.loc 1 392 25 is_stmt 0 discriminator 3
	ldr	r0, [sp, #12]
	bl	get32bitdff
.LVL98:
	.loc 1 392 9 discriminator 3
	ldr	r5, [r4, #4]
	ldr	r1, [sp, #4]
	.loc 1 392 24 discriminator 3
	adds	r0, r5, r0
	.loc 1 392 9 discriminator 3
	bl	memscroll
.LVL99:
	.loc 1 391 52 is_stmt 1 discriminator 3
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.LVL100:
.L64:
	.loc 1 391 34 discriminator 1
	ldr	r3, [sp, #12]
	cmp	r7, r3
	bgt	.L65
	b	.L43
.LVL101:
.L70:
	.loc 1 412 3
	.loc 1 412 30 is_stmt 0
	ldrb	r3, [r6, #1]
	str	r3, [sp, #12]
	.loc 1 412 50
	ldrb	r3, [r6]
	.loc 1 412 10
	ldr	r0, [sp, #12]
	movs	r1, r3
	.loc 1 412 50
	str	r3, [sp, #16]
	.loc 1 412 10
	bl	checkswap
.LVL102:
	.loc 1 412 3
	cmp	r0, #1
	beq	.L67
	cmp	r0, #2
	beq	.L68
	cmp	r0, #0
	bne	.L70
.L69:
	subs	r6, r6, #1
	subs	r5, r5, #1
	b	.L66
.L67:
	.loc 1 415 7 is_stmt 1
	.loc 1 418 10 is_stmt 0
	movs	r2, r5
	movs	r1, #0
	.loc 1 415 12
	ldr	r3, [sp, #8]
	subs	r3, r3, #1
	str	r3, [sp, #8]
.LVL103:
	.loc 1 417 4 is_stmt 1
	.loc 1 417 10 is_stmt 0
	ldr	r3, .L104+8
.LVL104:
	str	r5, [r3, #20]
	.loc 1 418 4 is_stmt 1
	ldr	r3, .L104+12
	adds	r3, r3, r5
.L71:
	.loc 1 418 16
	cmp	r7, r2
	bne	.L72
	cmp	r1, #0
	beq	.L68
	ldr	r2, [sp, #4]
	ldr	r3, .L104+8
	subs	r2, r2, #1
	str	r2, [r3, #20]
.LVL105:
.L68:
	.loc 1 432 3
	.loc 1 433 3
	.loc 1 433 22 is_stmt 0
	ldr	r2, [sp, #16]
	adds	r3, r4, r5
	strb	r2, [r3, #1]
	.loc 1 434 3 is_stmt 1
	.loc 1 434 20 is_stmt 0
	ldr	r3, [sp, #12]
	strb	r3, [r6]
	.loc 1 435 3 is_stmt 1
	b	.L69
.LVL106:
.L72:
	.loc 1 420 3
	.loc 1 420 20 is_stmt 0
	ldrb	r1, [r3, #1]
	adds	r2, r2, #1
	strb	r1, [r3]
	.loc 1 421 3 is_stmt 1
	.loc 1 420 20 is_stmt 0
	movs	r1, #1
	adds	r3, r3, #1
	b	.L71
.LVL107:
.L75:
	.loc 1 438 5 is_stmt 1 discriminator 3
	.loc 1 438 38 is_stmt 0 discriminator 3
	ldrb	r1, [r3, r0]
	.loc 1 438 27 discriminator 3
	strb	r1, [r2, r3]
	.loc 1 437 26 is_stmt 1 discriminator 3
	adds	r3, r3, #1
.LVL108:
	b	.L74
.L105:
	.align	2
.L104:
	.word	.LC11
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LANCHOR1+20
	.word	511
	.word	3614
.LVL109:
.L82:
	.loc 1 464 5
	.loc 1 464 24 is_stmt 0
	ldr	r3, [r1, #24]
	adds	r3, r5, r3
	.loc 1 464 13
	ldrb	r5, [r3, #20]
.LVL110:
	.loc 1 471 7 is_stmt 1
	.loc 1 471 12 is_stmt 0
	movs	r3, #255
	str	r3, [r1]
	.loc 1 472 7 is_stmt 1
	.loc 1 472 15 is_stmt 0
	adds	r3, r4, r5
	movs	r0, r3
	adds	r0, r0, #42
	ldrb	r2, [r0]
	.loc 1 472 10
	ldrb	r0, [r0]
	sxtb	r0, r0
	cmp	r0, #0
	bge	.L77
	.loc 1 474 9 is_stmt 1
	.loc 1 474 17 is_stmt 0
	ldrb	r6, [r3, #11]
	.loc 1 474 12
	cmp	r6, #152
	bls	.L77
	.loc 1 477 12 is_stmt 1
	.loc 1 477 54 is_stmt 0
	movs	r7, #8
	asrs	r3, r2, #3
	ands	r3, r7
	.loc 1 477 86
	lsls	r2, r2, #1
	adds	r7, r7, r7
	ands	r2, r7
	.loc 1 477 25
	ldr	r0, .L106
	.loc 1 477 58
	orrs	r3, r2
	.loc 1 477 115
	subs	r6, r6, #153
	.loc 1 477 90
	orrs	r3, r6
	.loc 1 477 25
	ldrb	r3, [r0, r3]
	str	r3, [r1]
.L77:
	.loc 1 481 7 is_stmt 1
	.loc 1 481 23 is_stmt 0
	movs	r0, #3
	bl	get32bitdf
.LVL111:
	.loc 1 482 56
	lsls	r3, r5, #1
	str	r3, [sp, #12]
	.loc 1 483 28
	movs	r3, r5
	adds	r3, r3, #21
	str	r3, [sp, #4]
	.loc 1 482 30
	ldr	r1, [sp, #12]
	.loc 1 481 7
	ldr	r2, [sp, #4]
	.loc 1 484 33
	adds	r5, r5, #33
.LVL112:
	.loc 1 481 7
	ldrb	r3, [r4, r5]
	ldrb	r2, [r4, r2]
	.loc 1 482 30
	adds	r4, r4, r1
	movs	r1, r4
	adds	r1, r1, #59
	.loc 1 482 59
	ldrb	r1, [r1]
	.loc 1 482 68
	adds	r4, r4, #58
	.loc 1 481 7
	ldr	r7, .L106+4
	.loc 1 482 68
	ldrb	r4, [r4]
	.loc 1 482 59
	lsls	r1, r1, #8
	.loc 1 481 7
	ldr	r6, [r7, #4]
	.loc 1 482 63
	adds	r1, r1, r4
	ldr	r4, [r7, #8]
	.loc 1 481 22
	adds	r0, r6, r0
	.loc 1 482 63
	adds	r1, r4, r1
	.loc 1 481 7
	bl	my_memcpy
.LVL113:
	.loc 1 485 7 is_stmt 1
	.loc 1 485 12 is_stmt 0
	movs	r3, #255
	ldr	r4, .L106+8
	.loc 1 487 23
	movs	r0, #1
	.loc 1 485 12
	str	r3, [r4]
	.loc 1 487 7 is_stmt 1
	ldr	r3, [r7, #4]
	str	r3, [sp, #16]
	.loc 1 487 23 is_stmt 0
	bl	get32bitdf
.LVL114:
	.loc 1 488 30
	ldr	r6, [r7]
	ldr	r1, [sp, #12]
	.loc 1 487 7
	ldr	r2, [sp, #4]
	ldrb	r3, [r6, r5]
	ldrb	r2, [r6, r2]
	.loc 1 488 30
	adds	r6, r6, r1
	movs	r1, r6
	adds	r1, r1, #77
	.loc 1 488 57
	ldrb	r1, [r1]
	.loc 1 488 66
	adds	r6, r6, #76
	ldrb	r6, [r6]
	.loc 1 488 57
	lsls	r1, r1, #8
	.loc 1 488 61
	adds	r6, r1, r6
	ldr	r1, [r7, #8]
	adds	r1, r1, r6
	.loc 1 487 22
	ldr	r6, [sp, #16]
	adds	r0, r6, r0
	.loc 1 487 7
	bl	my_memcpy
.LVL115:
	.loc 1 492 5 is_stmt 1
	.loc 1 492 10 is_stmt 0
	ldr	r3, [r4, #20]
	.loc 1 493 65
	ldr	r2, [sp, #4]
	.loc 1 492 10
	str	r3, [r4, #8]
	.loc 1 493 5 is_stmt 1
	.loc 1 493 16 is_stmt 0
	ldr	r3, [r7]
	.loc 1 493 65
	ldrb	r1, [r3, r5]
	ldrb	r2, [r3, r2]
	.loc 1 494 30
	ldr	r5, [r4, #24]
.LVL116:
	.loc 1 493 65
	adds	r2, r2, r1
	uxtb	r2, r2
	str	r2, [r4, #20]
	.loc 1 494 5 is_stmt 1
	.loc 1 494 24 is_stmt 0
	adds	r2, r7, r5
	.loc 1 494 13
	ldrb	r6, [r2, #21]
.LVL117:
	.loc 1 495 5 is_stmt 1
	.loc 1 495 8 is_stmt 0
	ldr	r2, [sp, #8]
	cmp	r2, r5
	beq	.L78
	.loc 1 495 34 discriminator 1
	adds	r3, r3, r6
	.loc 1 495 26 discriminator 1
	ldrb	r3, [r3, #21]
	cmp	r3, #175
	bls	.L79
.L78:
	.loc 1 497 7 is_stmt 1
	.loc 1 497 12 is_stmt 0
	ldr	r3, .L106+12
	str	r3, [r4, #20]
	.loc 1 498 7 is_stmt 1
	.loc 1 498 12 is_stmt 0
	movs	r3, #0
	str	r3, [r4, #8]
.L79:
	.loc 1 504 6 is_stmt 1
	.loc 1 504 11 is_stmt 0
	ldr	r3, [r7, #4]
	.loc 1 504 12
	movs	r0, #4
	.loc 1 504 11
	str	r3, [sp, #4]
	.loc 1 504 12
	bl	get32bitdf
.LVL118:
	.loc 1 504 11
	ldr	r3, [sp, #4]
	.loc 1 504 25
	adds	r0, r5, r0
	.loc 1 504 39
	ldr	r2, [r4, #8]
	.loc 1 504 11
	adds	r0, r3, r0
	.loc 1 504 39
	ldr	r3, [r4, #20]
	.loc 1 504 52
	asrs	r5, r5, #1
	.loc 1 504 39
	subs	r3, r3, r2
	.loc 1 504 45
	subs	r3, r3, r5
	.loc 1 504 57
	asrs	r3, r3, #1
	.loc 1 504 32
	uxtb	r3, r3
	strb	r3, [r0]
	.loc 1 506 5 is_stmt 1
	.loc 1 506 22 is_stmt 0
	movs	r3, r6
	adds	r3, r3, #11
	str	r3, [sp, #4]
	.loc 1 506 13
	ldr	r2, [sp, #4]
	ldr	r3, [r7]
	adds	r1, r3, r2
	ldrb	r3, [r3, r2]
	.loc 1 506 8
	cmp	r3, #159
	bls	.L80
	.loc 1 507 7 is_stmt 1
	.loc 1 507 30 is_stmt 0
	movs	r2, #96
	cmp	r3, #208
	bhi	.L81
	adds	r2, r2, #64
.L81:
	.loc 1 507 30 discriminator 4
	subs	r3, r3, r2
	strb	r3, [r1]
.L80:
	.loc 1 508 5 is_stmt 1
	.loc 1 508 37 is_stmt 0
	ldr	r3, [r7]
	.loc 1 508 11
	movs	r0, #5
	.loc 1 508 45
	adds	r6, r6, #42
.LVL119:
	.loc 1 508 37
	adds	r6, r3, r6
	.loc 1 508 11
	bl	get32bitdff
.LVL120:
	.loc 1 508 25
	ldr	r4, .L106+8
	.loc 1 508 10
	ldr	r5, [r7, #4]
	.loc 1 508 25
	ldr	r3, [r4, #24]
	.loc 1 509 50
	ldr	r2, [sp, #4]
	.loc 1 508 25
	adds	r0, r0, r3
	.loc 1 508 37
	ldrb	r3, [r6]
	.loc 1 508 10
	adds	r5, r5, r0
	.loc 1 508 32
	strb	r3, [r5]
	.loc 1 509 5 is_stmt 1
	.loc 1 509 50 is_stmt 0
	ldr	r3, [r7]
	.loc 1 509 44
	ldr	r6, [r4, #4]
	.loc 1 509 50
	ldrb	r3, [r3, r2]
	.loc 1 509 11
	movs	r0, #7
	.loc 1 509 44
	adds	r3, r3, #66
	adds	r6, r6, r3
	.loc 1 509 11
	bl	get32bitdff
.LVL121:
	.loc 1 509 25
	ldr	r3, [r4, #24]
	.loc 1 509 10
	ldr	r5, [r7, #4]
	.loc 1 509 25
	adds	r0, r0, r3
	.loc 1 509 44
	ldrb	r3, [r6]
	.loc 1 509 10
	adds	r5, r5, r0
	.loc 1 509 32
	strb	r3, [r5]
	.loc 1 511 5 is_stmt 1
	.loc 1 511 55 is_stmt 0
	ldr	r3, [r7]
	ldr	r2, [sp, #4]
	.loc 1 511 50
	ldr	r5, .L106+16
	.loc 1 511 55
	ldrb	r3, [r3, r2]
	.loc 1 511 43
	ldr	r2, [r4, #4]
	.loc 1 511 50
	ldrb	r3, [r3, r5]
	.loc 1 511 11
	movs	r0, #5
	.loc 1 511 43
	adds	r3, r2, r3
	str	r3, [sp, #12]
	.loc 1 511 11
	bl	get32bitdf
.LVL122:
	.loc 1 511 24
	ldr	r3, [r4, #24]
	.loc 1 511 10
	ldr	r6, [r7, #4]
	.loc 1 511 24
	adds	r0, r0, r3
	.loc 1 511 43
	ldr	r3, [sp, #12]
	.loc 1 511 10
	adds	r6, r6, r0
	.loc 1 511 43
	ldrb	r3, [r3]
	.loc 1 513 55
	ldr	r2, [sp, #4]
	.loc 1 511 31
	strb	r3, [r6]
	.loc 1 513 5 is_stmt 1
	.loc 1 513 55 is_stmt 0
	ldr	r3, [r7]
	.loc 1 513 11
	movs	r0, #6
	.loc 1 513 55
	ldrb	r3, [r3, r2]
	.loc 1 513 10
	ldr	r6, [r7, #4]
	.loc 1 513 50
	ldrb	r3, [r3, r5]
	.loc 1 513 43
	ldr	r5, [r4, #4]
	adds	r3, r3, #11
	adds	r5, r5, r3
	.loc 1 513 11
	bl	get32bitdf
.LVL123:
	.loc 1 513 24
	ldr	r3, [r4, #24]
	adds	r0, r0, r3
	.loc 1 513 43
	ldrb	r3, [r5]
	.loc 1 513 10
	adds	r6, r6, r0
	.loc 1 513 31
	strb	r3, [r6]
	.loc 1 514 5 is_stmt 1
	.loc 1 514 10 is_stmt 0
	ldr	r3, [r4, #24]
	adds	r3, r3, #1
	str	r3, [r4, #24]
	b	.L76
.L107:
	.align	2
.L106:
	.word	.LANCHOR2
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	511
	.word	536878080
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.global	maxsprites
	.global	myGfxIndex
	.global	spritesort
	.global	maskdata
	.global	mask
	.global	temp5
	.global	temp4
	.global	count
	.global	pfpixel
	.global	fetcheraddr
	.global	RIOT
	.global	fetcher_address_table
	.global	C_function
	.global	queue_int
	.global	flashdata
	.global	queue
	.section	.rodata
	.set	.LANCHOR2,. + 0
	.type	maskdata, %object
	.size	maskdata, 32
maskdata:
	.ascii	"\000\001\003\007\017\037?\177\376\374\370\360\340\300"
	.ascii	"\200\000\000\200\300\340\360\370\374\376\177?\037\017"
	.ascii	"\007\003\001\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	RIOT, %object
	.size	RIOT, 4
RIOT:
	.word	536939944
	.type	queue, %object
	.size	queue, 4
queue:
	.word	536939520
	.type	flashdata, %object
	.size	flashdata, 4
flashdata:
	.word	536873984
	.type	C_function, %object
	.size	C_function, 4
C_function:
	.word	536939940
	.type	fetcher_address_table, %object
	.size	fetcher_address_table, 4
fetcher_address_table:
	.word	536898976
	.type	myGfxIndex, %object
	.size	myGfxIndex, 10
myGfxIndex:
	.ascii	"\000\001\002\003\004\005\006\007\010\000"
	.type	spritesort, %object
	.size	spritesort, 10
spritesort:
	.ascii	"\000\001\002\003\004\005\006\007\010\000"
	.type	queue_int, %object
	.size	queue_int, 4
queue_int:
	.word	536939520
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mask, %object
	.size	mask, 4
mask:
	.space	4
	.type	fetcheraddr, %object
	.size	fetcheraddr, 4
fetcheraddr:
	.space	4
	.type	temp5, %object
	.size	temp5, 4
temp5:
	.space	4
	.type	pfpixel, %object
	.size	pfpixel, 4
pfpixel:
	.space	4
	.type	maxsprites, %object
	.size	maxsprites, 1
maxsprites:
	.space	1
	.space	3
	.type	temp4, %object
	.size	temp4, 4
temp4:
	.space	4
	.type	count, %object
	.size	count, 4
count:
	.space	4
	.text
.Letext0:
	.file 2 "src/custom.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7e3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF142
	.byte	0xc
	.4byte	.LASF143
	.4byte	.LASF144
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macinfo0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x20
	.4byte	0x35
	.uleb128 0x3
	.byte	0x4
	.4byte	0x42
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x5
	.4byte	0x3b
	.uleb128 0x6
	.4byte	0x3b
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2
	.byte	0x20
	.4byte	0x35
	.uleb128 0x7
	.4byte	0x29
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.uleb128 0x5
	.byte	0x3
	.4byte	queue
	.uleb128 0x7
	.4byte	0x4c
	.byte	0x1
	.byte	0x28
	.byte	0x19
	.uleb128 0x5
	.byte	0x3
	.4byte	flashdata
	.uleb128 0x8
	.4byte	.LASF2
	.byte	0x1
	.byte	0x29
	.byte	0xf
	.4byte	0x86
	.uleb128 0x5
	.byte	0x3
	.4byte	queue_int
	.uleb128 0x3
	.byte	0x4
	.4byte	0x93
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.4byte	0x8c
	.uleb128 0xa
	.byte	0x1
	.4byte	0x3b
	.byte	0x1
	.byte	0x2a
	.byte	0x6
	.4byte	0x2da
	.uleb128 0xb
	.4byte	.LASF4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF5
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF6
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF7
	.byte	0x3
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF11
	.byte	0x7
	.uleb128 0xb
	.4byte	.LASF12
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x9
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0xa
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0xb
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0xd
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0xe
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0xf
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x11
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x12
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x13
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x15
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x17
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x19
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x1a
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x1b
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x1d
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x1e
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x1f
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x21
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x22
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x23
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x25
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x26
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x27
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x29
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x2a
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x2b
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x2d
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x2e
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x2f
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF53
	.byte	0x31
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x32
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x33
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x35
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x36
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x37
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x38
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x39
	.uleb128 0xb
	.4byte	.LASF62
	.byte	0x3a
	.uleb128 0xb
	.4byte	.LASF63
	.byte	0x3b
	.uleb128 0xb
	.4byte	.LASF64
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF65
	.byte	0x3d
	.uleb128 0xb
	.4byte	.LASF66
	.byte	0x3e
	.uleb128 0xb
	.4byte	.LASF67
	.byte	0x3f
	.uleb128 0xb
	.4byte	.LASF68
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF69
	.byte	0x41
	.uleb128 0xb
	.4byte	.LASF70
	.byte	0x42
	.uleb128 0xb
	.4byte	.LASF71
	.byte	0x43
	.uleb128 0xb
	.4byte	.LASF72
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF73
	.byte	0x45
	.uleb128 0xb
	.4byte	.LASF74
	.byte	0x46
	.uleb128 0xb
	.4byte	.LASF75
	.byte	0x47
	.uleb128 0xb
	.4byte	.LASF76
	.byte	0x48
	.uleb128 0xb
	.4byte	.LASF77
	.byte	0x49
	.uleb128 0xb
	.4byte	.LASF78
	.byte	0x4a
	.uleb128 0xb
	.4byte	.LASF79
	.byte	0x4b
	.uleb128 0xb
	.4byte	.LASF80
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF81
	.byte	0x4d
	.uleb128 0xb
	.4byte	.LASF82
	.byte	0x4e
	.uleb128 0xb
	.4byte	.LASF83
	.byte	0x4f
	.uleb128 0xb
	.4byte	.LASF84
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF85
	.byte	0x51
	.uleb128 0xb
	.4byte	.LASF86
	.byte	0x52
	.uleb128 0xb
	.4byte	.LASF87
	.byte	0x53
	.uleb128 0xb
	.4byte	.LASF88
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF89
	.byte	0x55
	.uleb128 0xb
	.4byte	.LASF90
	.byte	0x56
	.uleb128 0xb
	.4byte	.LASF91
	.byte	0x57
	.uleb128 0xb
	.4byte	.LASF92
	.byte	0x58
	.uleb128 0xb
	.4byte	.LASF93
	.byte	0x59
	.uleb128 0xb
	.4byte	.LASF94
	.byte	0x5a
	.uleb128 0xb
	.4byte	.LASF95
	.byte	0x5b
	.uleb128 0xb
	.4byte	.LASF96
	.byte	0x5c
	.uleb128 0xb
	.4byte	.LASF97
	.byte	0x5d
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.4byte	0x3b
	.byte	0x1
	.byte	0x80
	.byte	0x7
	.4byte	0x2fa
	.uleb128 0xb
	.4byte	.LASF98
	.byte	0
	.uleb128 0xb
	.4byte	.LASF99
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF100
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.4byte	.LASF101
	.byte	0x1
	.byte	0x85
	.byte	0x10
	.4byte	0x30c
	.uleb128 0x5
	.byte	0x3
	.4byte	C_function
	.uleb128 0x3
	.byte	0x4
	.4byte	0x3b
	.uleb128 0x8
	.4byte	.LASF102
	.byte	0x1
	.byte	0x86
	.byte	0x11
	.4byte	0x324
	.uleb128 0x5
	.byte	0x3
	.4byte	fetcher_address_table
	.uleb128 0x3
	.byte	0x4
	.4byte	0x32a
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF103
	.uleb128 0x8
	.4byte	.LASF104
	.byte	0x1
	.byte	0x87
	.byte	0x10
	.4byte	0x30c
	.uleb128 0x5
	.byte	0x3
	.4byte	RIOT
	.uleb128 0x8
	.4byte	.LASF105
	.byte	0x1
	.byte	0x89
	.byte	0x10
	.4byte	0x30c
	.uleb128 0x5
	.byte	0x3
	.4byte	fetcheraddr
	.uleb128 0x8
	.4byte	.LASF106
	.byte	0x1
	.byte	0x8a
	.byte	0x10
	.4byte	0x30c
	.uleb128 0x5
	.byte	0x3
	.4byte	pfpixel
	.uleb128 0x8
	.4byte	.LASF107
	.byte	0x1
	.byte	0x8b
	.byte	0x5
	.4byte	0x8c
	.uleb128 0x5
	.byte	0x3
	.4byte	count
	.uleb128 0x8
	.4byte	.LASF108
	.byte	0x1
	.byte	0x90
	.byte	0x5
	.4byte	0x8c
	.uleb128 0x5
	.byte	0x3
	.4byte	temp4
	.uleb128 0x8
	.4byte	.LASF109
	.byte	0x1
	.byte	0x91
	.byte	0x5
	.4byte	0x8c
	.uleb128 0x5
	.byte	0x3
	.4byte	temp5
	.uleb128 0x8
	.4byte	.LASF110
	.byte	0x1
	.byte	0x92
	.byte	0xe
	.4byte	0x3af
	.uleb128 0x5
	.byte	0x3
	.4byte	mask
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF111
	.uleb128 0xc
	.4byte	0x47
	.4byte	0x3c6
	.uleb128 0xd
	.4byte	0x3af
	.byte	0x1f
	.byte	0
	.uleb128 0x6
	.4byte	0x3b6
	.uleb128 0x8
	.4byte	.LASF112
	.byte	0x1
	.byte	0x97
	.byte	0x15
	.4byte	0x3c6
	.uleb128 0x5
	.byte	0x3
	.4byte	maskdata
	.uleb128 0xc
	.4byte	0x3ed
	.4byte	0x3ed
	.uleb128 0xd
	.4byte	0x3af
	.byte	0x9
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF113
	.uleb128 0x8
	.4byte	.LASF114
	.byte	0x1
	.byte	0x9f
	.byte	0x6
	.4byte	0x3dd
	.uleb128 0x5
	.byte	0x3
	.4byte	spritesort
	.uleb128 0x8
	.4byte	.LASF115
	.byte	0x1
	.byte	0xa0
	.byte	0x6
	.4byte	0x3dd
	.uleb128 0x5
	.byte	0x3
	.4byte	myGfxIndex
	.uleb128 0x8
	.4byte	.LASF116
	.byte	0x1
	.byte	0xa3
	.byte	0x6
	.4byte	0x3ed
	.uleb128 0x5
	.byte	0x3
	.4byte	maxsprites
	.uleb128 0xe
	.4byte	.LASF125
	.byte	0x1
	.2byte	0x129
	.byte	0x5
	.4byte	0x8c
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4dc
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x12c
	.byte	0x7
	.4byte	0x8c
	.4byte	.LLST21
	.uleb128 0x10
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x12f
	.byte	0x7
	.4byte	0x8c
	.4byte	.LLST22
	.uleb128 0x10
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x130
	.byte	0x7
	.4byte	0x8c
	.4byte	.LLST23
	.uleb128 0x10
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x131
	.byte	0x7
	.4byte	0x8c
	.4byte	.LLST24
	.uleb128 0x11
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x132
	.byte	0x12
	.4byte	0x30c
	.4byte	0x20001c00
	.uleb128 0x12
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x133
	.byte	0x17
	.4byte	0x3b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x13c
	.byte	0x11
	.4byte	0x3b
	.4byte	.LLST25
	.uleb128 0x10
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x13d
	.byte	0x11
	.4byte	0x3b
	.4byte	.LLST26
	.uleb128 0x10
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x13e
	.byte	0x11
	.4byte	0x3b
	.4byte	.LLST27
	.byte	0
	.uleb128 0x13
	.4byte	.LASF126
	.byte	0x1
	.2byte	0x116
	.byte	0x6
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x512
	.uleb128 0x14
	.ascii	"loc\000"
	.byte	0x1
	.2byte	0x116
	.byte	0x1f
	.4byte	0x3af
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x116
	.byte	0x31
	.4byte	0x3af
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x13
	.4byte	.LASF128
	.byte	0x1
	.2byte	0x10b
	.byte	0x6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x568
	.uleb128 0x16
	.ascii	"num\000"
	.byte	0x1
	.2byte	0x10b
	.byte	0x1f
	.4byte	0x3b
	.4byte	.LLST18
	.uleb128 0xf
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x10d
	.byte	0x9
	.4byte	0x8c
	.4byte	.LLST19
	.uleb128 0x17
	.4byte	.LASF139
	.byte	0x1
	.2byte	0x10e
	.byte	0x14
	.4byte	0x30c
	.uleb128 0x10
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x10f
	.byte	0x14
	.4byte	0x30c
	.4byte	.LLST20
	.byte	0
	.uleb128 0x18
	.4byte	.LASF131
	.byte	0x1
	.byte	0xea
	.byte	0x5
	.4byte	0x8c
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x615
	.uleb128 0x19
	.ascii	"a\000"
	.byte	0x1
	.byte	0xea
	.byte	0x13
	.4byte	0x8c
	.4byte	.LLST10
	.uleb128 0x19
	.ascii	"b\000"
	.byte	0x1
	.byte	0xea
	.byte	0x1a
	.4byte	0x8c
	.4byte	.LLST11
	.uleb128 0x1a
	.4byte	.LASF130
	.byte	0x1
	.byte	0xec
	.byte	0xe
	.4byte	0x8c
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1b
	.ascii	"s1\000"
	.byte	0x1
	.byte	0xed
	.byte	0x8
	.4byte	0x3ed
	.4byte	.LLST12
	.uleb128 0x1b
	.ascii	"s2\000"
	.byte	0x1
	.byte	0xed
	.byte	0xb
	.4byte	0x3ed
	.4byte	.LLST13
	.uleb128 0x1c
	.4byte	0x615
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.byte	0xef
	.byte	0x6
	.4byte	0x5f1
	.uleb128 0x1d
	.4byte	0x630
	.4byte	.LLST14
	.uleb128 0x1d
	.4byte	0x626
	.4byte	.LLST15
	.byte	0
	.uleb128 0x1e
	.4byte	0x615
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.byte	0x1
	.byte	0xf0
	.byte	0x6
	.uleb128 0x1d
	.4byte	0x630
	.4byte	.LLST16
	.uleb128 0x1d
	.4byte	0x626
	.4byte	.LLST17
	.byte	0
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF145
	.byte	0x1
	.byte	0xe4
	.byte	0x6
	.4byte	0x3ed
	.byte	0x1
	.4byte	0x63b
	.uleb128 0x20
	.ascii	"a\000"
	.byte	0x1
	.byte	0xe4
	.byte	0x15
	.4byte	0x3ed
	.uleb128 0x20
	.ascii	"b\000"
	.byte	0x1
	.byte	0xe4
	.byte	0x1d
	.4byte	0x3ed
	.byte	0
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0x1
	.byte	0xd6
	.byte	0xe
	.4byte	0x3af
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x666
	.uleb128 0x21
	.4byte	.LASF133
	.byte	0x1
	.byte	0xd6
	.byte	0x1d
	.4byte	0x8c
	.4byte	.LLST8
	.byte	0
	.uleb128 0x18
	.4byte	.LASF134
	.byte	0x1
	.byte	0xd1
	.byte	0xe
	.4byte	0x3af
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x691
	.uleb128 0x21
	.4byte	.LASF133
	.byte	0x1
	.byte	0xd1
	.byte	0x1e
	.4byte	0x8c
	.4byte	.LLST7
	.byte	0
	.uleb128 0x22
	.4byte	.LASF135
	.byte	0x1
	.byte	0xc9
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c8
	.uleb128 0x21
	.4byte	.LASF136
	.byte	0x1
	.byte	0xc9
	.byte	0x1f
	.4byte	0x30c
	.4byte	.LLST5
	.uleb128 0x21
	.4byte	.LASF133
	.byte	0x1
	.byte	0xc9
	.byte	0x36
	.4byte	0x3b
	.4byte	.LLST6
	.byte	0
	.uleb128 0x22
	.4byte	.LASF137
	.byte	0x1
	.byte	0xbe
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x718
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.byte	0xbe
	.byte	0x12
	.4byte	0x8c
	.4byte	.LLST3
	.uleb128 0x19
	.ascii	"j\000"
	.byte	0x1
	.byte	0xbe
	.byte	0x19
	.4byte	0x8c
	.4byte	.LLST4
	.uleb128 0x23
	.ascii	"x\000"
	.byte	0x1
	.byte	0xbe
	.byte	0x2b
	.4byte	0x30c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x24
	.ascii	"t\000"
	.byte	0x1
	.byte	0xc0
	.byte	0xd
	.4byte	0x8c
	.uleb128 0x6
	.byte	0x73
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
	.uleb128 0x22
	.4byte	.LASF138
	.byte	0x1
	.byte	0xb7
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x767
	.uleb128 0x25
	.4byte	.LASF139
	.byte	0x1
	.byte	0xb7
	.byte	0x1f
	.4byte	0x30c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x25
	.4byte	.LASF140
	.byte	0x1
	.byte	0xb7
	.byte	0x30
	.4byte	0x8c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x25
	.4byte	.LASF107
	.byte	0x1
	.byte	0xb7
	.byte	0x40
	.4byte	0x8c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.byte	0xb9
	.byte	0xd
	.4byte	0x8c
	.4byte	.LLST2
	.byte	0
	.uleb128 0x22
	.4byte	.LASF141
	.byte	0x1
	.byte	0xb0
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7c6
	.uleb128 0x25
	.4byte	.LASF139
	.byte	0x1
	.byte	0xb0
	.byte	0x1f
	.4byte	0x30c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x25
	.4byte	.LASF129
	.byte	0x1
	.byte	0xb0
	.byte	0x3b
	.4byte	0x30c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x25
	.4byte	.LASF133
	.byte	0x1
	.byte	0xb0
	.byte	0x47
	.4byte	0x8c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x21
	.4byte	.LASF107
	.byte	0x1
	.byte	0xb0
	.byte	0x53
	.4byte	0x8c
	.4byte	.LLST0
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.byte	0xb2
	.byte	0xd
	.4byte	0x8c
	.4byte	.LLST1
	.byte	0
	.uleb128 0x26
	.4byte	0x615
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	0x626
	.4byte	.LLST9
	.uleb128 0x27
	.4byte	0x630
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x43
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST21:
	.4byte	.LVL46
	.4byte	.LVL47
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL65
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL67
	.4byte	.LVL68
	.2byte	0x3
	.byte	0x74
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL73
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL75
	.4byte	.LVL78
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL78
	.4byte	.LVL82
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL87
	.4byte	.LVL89
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL89
	.4byte	.LVL95
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL105
	.4byte	.LVL106
	.2byte	0x9
	.byte	0x91
	.sleb128 -76
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL107
	.4byte	.LVL109
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL48
	.4byte	.LVL49
	.2byte	0x3
	.byte	0x73
	.sleb128 -2
	.byte	0x9f
	.4byte	.LVL49
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL85
	.4byte	.LVL91
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL91
	.4byte	.LVL92
	.2byte	0xd
	.byte	0x91
	.sleb128 -84
	.byte	0x6
	.byte	0x37
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL93
	.4byte	.LVL95
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL48
	.4byte	.LVL50
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL50
	.4byte	.LVL69
	.2byte	0x3
	.byte	0x91
	.sleb128 -80
	.4byte	.LVL90
	.4byte	.LVL93
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL97
	.4byte	.LVL98-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL98-1
	.4byte	.LVL101
	.2byte	0x3
	.byte	0x91
	.sleb128 -76
	.4byte	.LVL103
	.4byte	.LVL104
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL104
	.4byte	.LFE10
	.2byte	0x3
	.byte	0x91
	.sleb128 -80
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL110
	.4byte	.LVL112
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL112
	.4byte	.LVL116
	.2byte	0x3
	.byte	0x75
	.sleb128 -33
	.byte	0x9f
	.4byte	.LVL116
	.4byte	.LVL117
	.2byte	0x7
	.byte	0x91
	.sleb128 -84
	.byte	0x6
	.byte	0x45
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL117
	.4byte	.LVL119
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL119
	.4byte	.LFE10
	.2byte	0x7
	.byte	0x91
	.sleb128 -84
	.byte	0x6
	.byte	0x3b
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL43
	.4byte	.LVL64
	.2byte	0x3
	.byte	0x91
	.sleb128 -84
	.4byte	.LVL69
	.4byte	.LVL74
	.2byte	0x3
	.byte	0x91
	.sleb128 -84
	.4byte	.LVL75
	.4byte	.LVL89
	.2byte	0x3
	.byte	0x91
	.sleb128 -84
	.4byte	.LVL95
	.4byte	.LVL109
	.2byte	0x3
	.byte	0x91
	.sleb128 -84
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL44
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL69
	.4byte	.LVL73
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL78
	.4byte	.LVL88
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL95
	.4byte	.LVL97
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL45
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL69
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL75
	.4byte	.LVL78
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL82
	.4byte	.LVL86
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL95
	.4byte	.LVL101
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL37
	.4byte	.LVL39
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL25
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL28
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL31
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL12
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL14
	.4byte	.LVL15-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL15-1
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10
	.4byte	.LFE2
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL8
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL11
	.4byte	.LFE2
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LFE1
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL1
	.4byte	.LFE0
	.2byte	0x2
	.byte	0x91
	.sleb128 -28
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x6c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	0
	.4byte	0
	.section	.debug_macinfo,"",%progbits
.Ldebug_macinfo0:
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x1
	.uleb128 0
	.ascii	"__STDC__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__STDC_VERSION__ 201710L\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__STDC_UTF_16__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__STDC_UTF_32__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__STDC_HOSTED__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GNUC__ 12\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GNUC_MINOR__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__VERSION__ \"12.2.1 20221205\"\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ATOMIC_RELAXED 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ATOMIC_SEQ_CST 5\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ATOMIC_ACQUIRE 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ATOMIC_RELEASE 3\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ATOMIC_ACQ_REL 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ATOMIC_CONSUME 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__OPTIMIZE_SIZE__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__OPTIMIZE__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_INT__ 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_LONG__ 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_SHORT__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_FLOAT__ 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__CHAR_BIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_POINTER__ 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\"\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\"\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZE_TYPE__ unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__PTRDIFF_TYPE__ int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WINT_TYPE__ unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INTMAX_TYPE__ long long int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT8_TYPE__ signed char\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT16_TYPE__ short int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT32_TYPE__ long int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT64_TYPE__ long long int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT8_TYPE__ unsigned char\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST8_TYPE__ int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST16_TYPE__ int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST32_TYPE__ int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INTPTR_TYPE__ int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GXX_ABI_VERSION 1017\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SCHAR_MAX__ 0x7f\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SHRT_MAX__ 0x7fff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_MAX__ 0x7fffffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WCHAR_MIN__ 0U\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WINT_MIN__ 0U\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SCHAR_WIDTH__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SHRT_WIDTH__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LONG_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WCHAR_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__WINT_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZE_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INTMAX_C(c) c ## LL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INTMAX_WIDTH__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT8_MAX__ 0x7f\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT16_MAX__ 0x7fff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT8_MAX__ 0xff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT16_MAX__ 0xffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT8_C(c) c\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT16_C(c) c\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT32_C(c) c ## L\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT64_C(c) c ## LL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT8_C(c) c\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT16_C(c) c\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT32_C(c) c ## UL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT64_C(c) c ## ULL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__INTPTR_WIDTH__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_IEC_559 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_RADIX__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_MANT_DIG__ 24\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_DIG__ 6\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_MAX_EXP__ 128\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_NORM_MAX__ 3.4028234663852886e+38F\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_HAS_DENORM__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT_IS_IEC_60559__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_MANT_DIG__ 53\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_DIG__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_MAX_EXP__ 1024\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_NORM_MAX__ ((double)1.7976931348623157e+308L)"
	.ascii	"\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_HAS_DENORM__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DBL_IS_IEC_60559__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_MANT_DIG__ 53\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_DIG__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DECIMAL_DIG__ 17\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_NORM_MAX__ 1.7976931348623157e+308L\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LDBL_IS_IEC_60559__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_MANT_DIG__ 24\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_DIG__ 6\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_MAX_EXP__ 128\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_MAX__ 3.4028234663852886e+38F32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_NORM_MAX__ 3.4028234663852886e+38F32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_MIN__ 1.1754943508222875e-38F32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_EPSILON__ 1.1920928955078125e-7F32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_DENORM_MIN__ 1.4012984643248171e-45F32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32_IS_IEC_60559__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_MANT_DIG__ 53\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_DIG__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_MAX__ 1.7976931348623157e+308F64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_NORM_MAX__ 1.7976931348623157e+308F64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_MIN__ 2.2250738585072014e-308F64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_EPSILON__ 2.2204460492503131e-16F64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_DENORM_MIN__ 4.9406564584124654e-324F64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT64_IS_IEC_60559__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_DIG__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_MAX__ 1.7976931348623157e+308F32x\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_NORM_MAX__ 1.7976931348623157e+308F32x\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_MIN__ 2.2250738585072014e-308F32x\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_EPSILON__ 2.2204460492503131e-16F32x\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FLT32X_IS_IEC_60559__ 2\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SFRACT_FBIT__ 7\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SFRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USFRACT_FBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USFRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FRACT_FBIT__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UFRACT_FBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UFRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LFRACT_FBIT__ 31\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LFRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULFRACT_FBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULFRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLFRACT_FBIT__ 63\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLFRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLFRACT_FBIT__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLFRACT_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SACCUM_FBIT__ 7\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SACCUM_IBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USACCUM_FBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USACCUM_IBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ACCUM_FBIT__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ACCUM_IBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UACCUM_FBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UACCUM_IBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LACCUM_FBIT__ 31\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LACCUM_IBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULACCUM_FBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULACCUM_IBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLACCUM_FBIT__ 31\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLACCUM_IBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLACCUM_FBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLACCUM_IBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__QQ_FBIT__ 7\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__QQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__HQ_FBIT__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__HQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SQ_FBIT__ 31\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DQ_FBIT__ 63\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__TQ_FBIT__ 127\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__TQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UQQ_FBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UQQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UHQ_FBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UHQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USQ_FBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UDQ_FBIT__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UDQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UTQ_FBIT__ 128\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UTQ_IBIT__ 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__HA_FBIT__ 7\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__HA_IBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SA_FBIT__ 15\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SA_IBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DA_FBIT__ 31\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__DA_IBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__TA_FBIT__ 63\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__TA_IBIT__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UHA_FBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UHA_IBIT__ 8\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USA_FBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USA_IBIT__ 16\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UDA_FBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UDA_IBIT__ 32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UTA_FBIT__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__UTA_IBIT__ 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__REGISTER_PREFIX__ \000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USER_LABEL_PREFIX__ \000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__CHAR_UNSIGNED__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_DESTRUCTIVE_SIZE 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_CONSTRUCTIVE_SIZE 64\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__HAVE_SPECULATION_SAFE_VALUE 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_WINT_T__ 4\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_DSP\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_QBIT\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_SAT\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_CRYPTO\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_UNALIGNED\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_QRDMX\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_CRC32\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_DOTPROD\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_COMPLEX\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_32BIT_STATE\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_MVE\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_CMSE\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_LDREX\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_CLZ\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_SIMD32\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_ARCH_PROFILE\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_ARCH_PROFILE 77\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__arm__ 1\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_ARCH\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_ARCH 6\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__APCS_32__ 1\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__GCC_ASM_FLAG_OUTPUTS__\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__thumb__ 1\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__thumb2__\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__THUMBEL__ 1\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_ARCH_ISA_THUMB\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_ARCH_ISA_THUMB 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARMEL__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__SOFTFP__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__VFP_FP__ 1\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FP\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FP16_ARGS\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_FP16_FML\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_FMA\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_NEON__\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_NEON\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_NEON_FP\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__THUMB_INTERWORK__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_ARCH_6M__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_PCS 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ARM_EABI__ 1\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__FDPIC__\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_ARCH_EXT_IDIV__\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_IDIV\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_COPROC\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_CDE\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_CDE_COPROC\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_MATMUL_INT8\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_BF16_SCALAR_ARITHMETIC\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_FEATURE_BF16_VECTOR_ARITHMETIC\000"
	.byte	0x2
	.uleb128 0
	.ascii	"__ARM_BF16_FORMAT_ALTERNATIVE\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__ELF__ 1\000"
	.byte	0x1
	.uleb128 0
	.ascii	"__USES_INITFINI__ 1\000"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x2
	.byte	0x4
	.byte	0x1
	.uleb128 0xa5
	.ascii	"kernello(a) fetcheraddr[(a)]\000"
	.byte	0x1
	.uleb128 0xa6
	.ascii	"kernelhi(a) fetcheraddr[(a)+11]\000"
	.byte	0x1
	.uleb128 0xa7
	.ascii	"dflow(a) fetcheraddr[(a)+22]\000"
	.byte	0x1
	.uleb128 0xa8
	.ascii	"dfhigh(a) fetcheraddr[(a)+30]\000"
	.byte	0x1
	.uleb128 0xa9
	.ascii	"dffraclo(a) fetcheraddr[(a)+38]\000"
	.byte	0x1
	.uleb128 0xaa
	.ascii	"dffrachi(a) fetcheraddr[(a)+46]\000"
	.byte	0x1
	.uleb128 0xab
	.ascii	"scoregraphics(a) fetcheraddr[(a)+54]\000"
	.byte	0x1
	.uleb128 0xac
	.ascii	"scorepointer(a) fetcheraddr[(a)+56]\000"
	.byte	0x1
	.uleb128 0xad
	.ascii	"Hmval(a) fetcheraddr[(a)+58]\000"
	.byte	0x1
	.uleb128 0xae
	.ascii	"Hmval74(a) fetcheraddr[(a)+66]\000"
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF144:
	.ascii	"/home/steve/relocateBB/custom\000"
.LASF89:
	.ascii	"junk10\000"
.LASF36:
	.ascii	"player0height\000"
.LASF82:
	.ascii	"player2color\000"
.LASF95:
	.ascii	"junk13\000"
.LASF68:
	.ascii	"player4pointerlo\000"
.LASF47:
	.ascii	"NUSIZ2\000"
.LASF126:
	.ascii	"on_off_flip\000"
.LASF48:
	.ascii	"NUSIZ3\000"
.LASF116:
	.ascii	"maxsprites\000"
.LASF114:
	.ascii	"spritesort\000"
.LASF113:
	.ascii	"char\000"
.LASF70:
	.ascii	"player5pointerlo\000"
.LASF12:
	.ascii	"junk8a\000"
.LASF128:
	.ascii	"copynybble\000"
.LASF54:
	.ascii	"NUSIZ9\000"
.LASF2:
	.ascii	"queue_int\000"
.LASF38:
	.ascii	"player2height\000"
.LASF17:
	.ascii	"player3x\000"
.LASF27:
	.ascii	"player3y\000"
.LASF125:
	.ascii	"main\000"
.LASF75:
	.ascii	"player7pointerhi\000"
.LASF93:
	.ascii	"junk12\000"
.LASF121:
	.ascii	"setbyte\000"
.LASF110:
	.ascii	"mask\000"
.LASF97:
	.ascii	"junk14\000"
.LASF21:
	.ascii	"player7x\000"
.LASF31:
	.ascii	"player7y\000"
.LASF40:
	.ascii	"player4height\000"
.LASF140:
	.ascii	"fill_value\000"
.LASF136:
	.ascii	"qmemory\000"
.LASF94:
	.ascii	"player8color\000"
.LASF15:
	.ascii	"player1x\000"
.LASF74:
	.ascii	"player7pointerlo\000"
.LASF63:
	.ascii	"player1pointerhi\000"
.LASF37:
	.ascii	"player1height\000"
.LASF73:
	.ascii	"player6pointerhi\000"
.LASF108:
	.ascii	"temp4\000"
.LASF42:
	.ascii	"player6height\000"
.LASF91:
	.ascii	"junk11\000"
.LASF9:
	.ascii	"junk5a\000"
.LASF34:
	.ascii	"player0color\000"
.LASF98:
	.ascii	"SKIP\000"
.LASF14:
	.ascii	"player0x\000"
.LASF24:
	.ascii	"player0y\000"
.LASF122:
	.ascii	"C_function1\000"
.LASF123:
	.ascii	"C_function2\000"
.LASF124:
	.ascii	"C_function3\000"
.LASF62:
	.ascii	"player1pointerlo\000"
.LASF71:
	.ascii	"player5pointerhi\000"
.LASF131:
	.ascii	"checkswap\000"
.LASF44:
	.ascii	"player8height\000"
.LASF18:
	.ascii	"player4x\000"
.LASF28:
	.ascii	"player4y\000"
.LASF49:
	.ascii	"NUSIZ4\000"
.LASF50:
	.ascii	"NUSIZ5\000"
.LASF51:
	.ascii	"NUSIZ6\000"
.LASF52:
	.ascii	"NUSIZ7\000"
.LASF53:
	.ascii	"NUSIZ8\000"
.LASF142:
	.ascii	"GNU C17 12.2.1 20221205 -mthumb -mfloat-abi=soft -m"
	.ascii	"arch=armv6-m -g3 -gdwarf-4 -gstrict-dwarf -Oz -ffun"
	.ascii	"ction-sections\000"
.LASF129:
	.ascii	"source\000"
.LASF35:
	.ascii	"junk5\000"
.LASF0:
	.ascii	"queue\000"
.LASF32:
	.ascii	"player8y\000"
.LASF120:
	.ascii	"HMdiv\000"
.LASF13:
	.ascii	"spritedisplay\000"
.LASF90:
	.ascii	"player6color\000"
.LASF105:
	.ascii	"fetcheraddr\000"
.LASF39:
	.ascii	"player3height\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF102:
	.ascii	"fetcher_address_table\000"
.LASF4:
	.ascii	"SpriteGfxIndex\000"
.LASF46:
	.ascii	"_NUSIZ1\000"
.LASF112:
	.ascii	"maskdata\000"
.LASF55:
	.ascii	"score\000"
.LASF101:
	.ascii	"C_function\000"
.LASF67:
	.ascii	"player3pointerhi\000"
.LASF145:
	.ascii	"checkwrap\000"
.LASF10:
	.ascii	"junk6a\000"
.LASF77:
	.ascii	"player8pointerhi\000"
.LASF78:
	.ascii	"player9pointerlo\000"
.LASF5:
	.ascii	"junk1\000"
.LASF6:
	.ascii	"junk2\000"
.LASF7:
	.ascii	"junk3\000"
.LASF8:
	.ascii	"junk4\000"
.LASF25:
	.ascii	"player1y\000"
.LASF81:
	.ascii	"junk6\000"
.LASF83:
	.ascii	"junk7\000"
.LASF85:
	.ascii	"junk8\000"
.LASF87:
	.ascii	"junk9\000"
.LASF103:
	.ascii	"short unsigned int\000"
.LASF99:
	.ascii	"OVERLAP\000"
.LASF66:
	.ascii	"player3pointerlo\000"
.LASF132:
	.ascii	"get32bitdf\000"
.LASF65:
	.ascii	"player2pointerhi\000"
.LASF19:
	.ascii	"player5x\000"
.LASF29:
	.ascii	"player5y\000"
.LASF11:
	.ascii	"junk78\000"
.LASF100:
	.ascii	"NOOVERLAP\000"
.LASF58:
	.ascii	"COLUM0\000"
.LASF59:
	.ascii	"COLUM1\000"
.LASF107:
	.ascii	"count\000"
.LASF23:
	.ascii	"player9x\000"
.LASF33:
	.ascii	"player9y\000"
.LASF138:
	.ascii	"my_memset\000"
.LASF96:
	.ascii	"player9color\000"
.LASF41:
	.ascii	"player5height\000"
.LASF76:
	.ascii	"player8pointerlo\000"
.LASF64:
	.ascii	"player2pointerlo\000"
.LASF92:
	.ascii	"player7color\000"
.LASF143:
	.ascii	"main.c\000"
.LASF127:
	.ascii	"fnmask\000"
.LASF1:
	.ascii	"flashdata\000"
.LASF86:
	.ascii	"player4color\000"
.LASF135:
	.ascii	"memscroll\000"
.LASF133:
	.ascii	"offset\000"
.LASF137:
	.ascii	"reverse\000"
.LASF80:
	.ascii	"player1color\000"
.LASF57:
	.ascii	"score3\000"
.LASF141:
	.ascii	"my_memcpy\000"
.LASF115:
	.ascii	"myGfxIndex\000"
.LASF43:
	.ascii	"player7height\000"
.LASF119:
	.ascii	"Gfxindex\000"
.LASF72:
	.ascii	"player6pointerlo\000"
.LASF16:
	.ascii	"player2x\000"
.LASF26:
	.ascii	"player2y\000"
.LASF134:
	.ascii	"get32bitdff\000"
.LASF84:
	.ascii	"player3color\000"
.LASF139:
	.ascii	"destination\000"
.LASF130:
	.ascii	"temp1\000"
.LASF117:
	.ascii	"temp2\000"
.LASF104:
	.ascii	"RIOT\000"
.LASF45:
	.ascii	"player9height\000"
.LASF109:
	.ascii	"temp5\000"
.LASF61:
	.ascii	"player0pointerhi\000"
.LASF20:
	.ascii	"player6x\000"
.LASF30:
	.ascii	"player6y\000"
.LASF88:
	.ascii	"player5color\000"
.LASF106:
	.ascii	"pfpixel\000"
.LASF60:
	.ascii	"player0pointerlo\000"
.LASF111:
	.ascii	"unsigned int\000"
.LASF69:
	.ascii	"player4pointerhi\000"
.LASF79:
	.ascii	"player9pointerhi\000"
.LASF118:
	.ascii	"temp3\000"
.LASF56:
	.ascii	"score2\000"
.LASF22:
	.ascii	"player8x\000"
	.ident	"GCC: (Arm GNU Toolchain 12.2.Rel1 (Build arm-12.24)) 12.2.1 20221205"
