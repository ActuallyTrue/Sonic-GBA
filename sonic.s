	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"sonic.c"
	.text
	.align	2
	.global	initializeSonic
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeSonic, %function
initializeSonic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #256
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	r2, #16384
	mov	r1, #4
	ldr	r3, .L4+8
	ldr	r0, .L4+12
	mov	lr, pc
	bx	r3
	mov	r1, #4096
	mov	r2, #2048
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r1, [r3, #32]
	str	r2, [r3, #28]
	bx	lr
.L5:
	.align	2
.L4:
	.word	sonicSpritePal
	.word	copyToSpritePaletteMem
	.word	copyToCharBlock
	.word	sonicSpriteTiles
	.word	player
	.size	initializeSonic, .-initializeSonic
	.align	2
	.global	updateSonic
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSonic, %function
updateSonic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldrh	r2, [r3, #48]
	ldr	r3, .L40+4
	tst	r2, #32
	movne	r0, #0
	ldr	r2, [r3, #12]
	bne	.L7
	ldrsh	r1, [r3, #64]
	cmp	r1, #0
	subeq	r2, r2, #6
	streq	r2, [r3, #12]
	bne	.L38
.L10:
	mov	r1, #0
	mov	r0, #1
	str	r1, [r3, #60]
.L7:
	ldr	r1, .L40
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L11
	ldrsh	r1, [r3, #64]
	cmp	r1, #0
	bne	.L39
	add	r2, r2, #6
	str	r2, [r3, #12]
.L15:
	mov	r1, #1
	cmp	r2, #384
	str	r1, [r3, #60]
	ble	.L14
	mov	r2, #384
	str	r2, [r3, #12]
.L32:
	ldr	r1, .L40+8
	ldr	r2, .L40+12
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	tst	r1, #1
	and	r2, r2, #1
	beq	.L23
	cmp	r2, #0
	ldreq	r1, [r3, #8]
	subeq	r1, r1, #416
	ldrshne	r2, [r3, #64]
	strheq	r2, [r3, #64]	@ movhi
	streq	r1, [r3, #8]
.L25:
	ldr	r1, [r3, #4]
	cmp	r1, #0
	movlt	r0, #0
	movlt	r1, r0
	strlt	r0, [r3, #4]
	ldr	r0, [r3, #28]
	add	r1, r0, r1
	cmp	r1, #15360
	rsbgt	r0, r0, #15360
	strgt	r0, [r3, #4]
	ldr	r1, [r3]
	ldr	r0, [r3, #32]
	add	ip, r1, r0
	cmp	ip, #10240
	ble	.L28
	cmp	r2, #0
	moveq	r2, #1
	strheq	r2, [r3, #64]	@ movhi
	rsbeq	r1, r0, #10240
.L29:
	mov	r2, #0
	str	r2, [r3, #8]
.L30:
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #12]
	add	r2, r2, r0
	stm	r3, {r1, r2}
	bx	lr
.L39:
	cmp	r2, #0
	addge	r2, r2, #3
	strge	r2, [r3, #12]
	bge	.L15
	mov	r1, #1
	add	r2, r2, #32
	str	r2, [r3, #12]
	str	r1, [r3, #60]
.L14:
	cmn	r2, #384
	ldrlt	r2, .L40+16
	strlt	r2, [r3, #12]
	b	.L32
.L38:
	cmp	r2, #0
	subgt	r2, r2, #32
	suble	r2, r2, #3
	str	r2, [r3, #12]
	b	.L10
.L11:
	cmp	r2, #384
	ble	.L17
	mov	r2, #384
	cmp	r0, #0
	str	r2, [r3, #12]
	bne	.L32
.L33:
	subs	r2, r2, #3
	movmi	r2, #0
	strmi	r2, [r3, #12]
	strpl	r2, [r3, #12]
	b	.L32
.L28:
	ldr	r0, [r3, #8]
	cmp	r2, #0
	add	r2, r0, #14
	str	r2, [r3, #8]
	bne	.L29
	add	r1, r1, r2
	b	.L30
.L23:
	cmp	r2, #0
	ldrsh	r2, [r3, #64]
	beq	.L25
	ldr	r1, [r3, #8]
	cmn	r1, #256
	mvnlt	r1, #255
	strlt	r1, [r3, #8]
	b	.L25
.L17:
	cmn	r2, #384
	bge	.L19
	ldr	r2, .L40+16
	cmp	r0, #0
	str	r2, [r3, #12]
	bne	.L32
.L20:
	sub	r2, r2, #3
	str	r2, [r3, #12]
	b	.L32
.L19:
	cmp	r0, #0
	bne	.L32
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bgt	.L33
	beq	.L32
	b	.L20
.L41:
	.align	2
.L40:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	-384
	.size	updateSonic, .-updateSonic
	.align	2
	.global	drawSonic
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSonic, %function
drawSonic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L48
	ldr	r3, [r1]
	add	r2, r3, #63
	cmp	r3, #0
	movlt	r3, r2
	asr	r3, r3, #6
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	ldr	r2, [r1, #4]
	cmp	r2, #0
	add	r0, r2, #63
	movge	r0, r2
	mvn	r3, r3, lsr #17
	ldr	r2, .L48+4
	str	lr, [sp, #-4]!
	ldr	lr, [r1, #60]
	ldr	ip, .L48+8
	and	r2, r2, r0, asr #6
	orr	r2, r2, #49152
	cmp	lr, #0
	strh	r2, [ip, #2]	@ movhi
	orrne	r2, r2, #4096
	strh	r3, [ip]	@ movhi
	strhne	r2, [ip, #2]	@ movhi
	ldr	r3, [r1, #40]
	ldr	r2, [r1, #48]
	add	r3, r3, r2, lsl #5
	lsl	r3, r3, #2
	strh	r3, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	player
	.word	511
	.word	shadowOAM
	.size	drawSonic, .-drawSonic
	.comm	player,68,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
