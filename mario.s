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
	.file	"mario.c"
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
	mov	r1, #16
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r1, [r3, #32]
	str	r1, [r3, #28]
	str	r2, [r3, #4]
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	mariospritesheetPal
	.word	copyToSpritePaletteMem
	.word	copyToCharBlock
	.word	mariospritesheetTiles
	.word	player
	.size	initializeSonic, .-initializeSonic
	.align	2
	.global	adjustScreenOffset
	.syntax unified
	.arm
	.fpu softvfp
	.type	adjustScreenOffset, %function
adjustScreenOffset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r2, [r3, #8]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L19
	beq	.L9
	ldr	lr, .L22+4
	ldr	r0, [lr]
	cmp	r0, #95
	ble	.L20
.L9:
	ldr	r0, [r3, #12]
	cmp	r0, #0
	blt	.L21
.L14:
	beq	.L6
	ldr	r2, [r3, #28]
	ldr	r4, .L22+8
	rsbs	ip, r2, #0
	ldr	r1, [r3, #4]
	ldr	lr, [r4]
	and	ip, ip, #255
	and	r3, r2, #255
	rsbpl	r3, ip, #0
	rsb	r2, lr, r1, asr #6
	add	r3, r2, r3
	cmp	r3, #119
	ble	.L6
	asrs	r0, r0, #6
	addeq	lr, lr, #1
	addne	r0, lr, r0
	streq	lr, [r4]
	strne	r0, [r4]
.L6:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r1, [r3, #32]
	ldr	ip, [r3]
	rsbs	r4, r1, #0
	and	r4, r4, #255
	and	r1, r1, #255
	rsb	ip, r0, ip, asr #6
	rsbpl	r1, r4, #0
	add	r1, ip, r1
	cmp	r1, #79
	ble	.L9
	cmp	r2, #6144
	addlt	r0, r0, #1
	cmp	r0, #0
	streq	r0, [lr]
	asr	r2, r2, #6
	beq	.L9
	add	r2, r2, r0
	cmp	r2, #96
	movgt	r2, #96
.L18:
	ldr	r0, [r3, #12]
	cmp	r0, #0
	str	r2, [lr]
	bge	.L14
.L21:
	ldr	ip, .L22+8
	ldr	r3, [r3, #4]
	ldr	r1, [ip]
	rsb	r3, r1, r3, asr #6
	rsbs	r2, r3, #0
	and	r2, r2, #255
	and	r3, r3, #255
	rsbpl	r3, r2, #0
	cmp	r3, #120
	addle	r0, r1, r0, asr #6
	strle	r0, [ip]
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	lr, .L22+4
	ldr	r0, [lr]
	cmp	r0, #0
	ble	.L9
	ldr	r1, [r3]
	rsb	r1, r0, r1, asr #6
	rsbs	ip, r1, #0
	and	ip, ip, #255
	and	r1, r1, #255
	rsbpl	r1, ip, #0
	cmp	r1, #80
	bgt	.L9
	adds	r2, r0, r2, asr #6
	movmi	r2, #0
	strmi	r2, [lr]
	bpl	.L18
	b	.L9
.L23:
	.align	2
.L22:
	.word	player
	.word	vOff
	.word	hOff
	.size	adjustScreenOffset, .-adjustScreenOffset
	.align	2
	.global	checkCollisionWithMap
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithMap, %function
checkCollisionWithMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	lr, .L73
	ldr	r5, [lr, #12]
	ldr	r3, [lr, #4]
	ldr	fp, [lr]
	ldr	r2, [lr, #32]
	sub	sp, sp, #20
	cmp	r5, #0
	str	r2, [sp, #8]
	asr	ip, r3, #6
	asr	r1, fp, #6
	ble	.L25
	add	r4, r5, r3
	cmp	ip, r4, asr #6
	bge	.L65
	ldr	r6, [sp, #8]
	ldr	r0, [lr, #28]
	sub	r7, r6, #1
	add	r9, r1, r1, lsl #2
	ldr	r6, .L73+4
	sub	r0, r0, #-2147483647
	add	r9, r1, r9, lsl #1
	add	r7, r7, r1
	add	r0, r0, ip
	str	r6, [sp, #4]
	add	r0, r0, r9, lsl #8
	add	r6, r7, r7, lsl #2
	add	r7, r7, r6, lsl #1
	lsl	r0, r0, #1
	ldr	r6, [sp, #4]
	sub	r0, r0, #2
	lsl	r9, r9, #9
	mov	r2, ip
	mov	r10, #0
	ldr	r8, .L73+8
	rsb	r9, r9, #0
	add	r0, r6, r0
	lsl	r7, r7, #9
	b	.L29
.L27:
	lsl	r3, r2, #6
	mov	r4, r3
	add	r2, r2, #1
	cmp	r2, r4, asr #6
	mov	r5, #0
	mov	r10, #1
	bge	.L68
.L29:
	ldrh	r6, [r0, #2]!
	cmp	r6, r8
	bne	.L27
	add	r6, r9, r0
	ldrh	r6, [r6, r7]
	cmp	r6, r8
	bne	.L27
	add	r2, r2, #1
	cmp	r2, r4, asr #6
	blt	.L29
.L68:
	cmp	r10, #0
	strne	r3, [lr, #4]
	strne	r5, [lr, #12]
	asrne	ip, r3, #6
.L26:
	ldr	r8, [lr, #8]
	cmp	r8, #0
	ble	.L33
	add	r3, r8, fp
	cmp	r1, r3, asr #6
	bge	.L33
	ldr	r3, [sp, #8]
	ldr	r7, [lr, #28]
	add	r3, r3, r1
	add	r5, r3, r3, lsl #2
	add	r3, r3, r5, lsl #1
	add	r7, ip, r7
	add	r3, r7, r3, lsl #8
	ldr	r0, [sp, #4]
	sub	r3, r3, #2816
	sub	r3, r3, #-2147483646
	rsb	r7, r7, r7, lsl #31
	lsl	r9, ip, #1
	add	r3, r0, r3, lsl #1
	mov	r4, r8
	mov	r2, fp
	mov	r6, #0
	mov	r0, r1
	ldrsh	r5, [lr, #64]
	ldr	r10, .L73+8
	str	r1, [sp, #12]
	lsl	r7, r7, #1
	add	r9, r9, #4
	b	.L36
.L34:
	mov	r5, #1
	mov	r4, #0
	mov	r6, r5
	lsl	r2, r0, #6
	sub	r2, r2, #64
.L35:
	add	r0, r0, #1
	add	r1, r4, r2
	cmp	r0, r1, asr #6
	add	r3, r3, #5632
	bge	.L69
.L36:
	add	r1, r7, r3
	ldrh	r1, [r1, r9]
	cmp	r1, r10
	bne	.L34
	ldrh	r1, [r3]
	cmp	r1, r10
	bne	.L34
	b	.L35
.L69:
	cmp	r6, #0
	ldr	r1, [sp, #12]
	beq	.L33
	mov	r8, r4
	mov	fp, r2
	str	r4, [lr, #8]
	str	r2, [lr]
	strh	r5, [lr, #64]	@ movhi
	asr	r1, r2, #6
.L33:
	ldr	r3, [sp, #8]
	add	r3, r1, r3
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r0, [sp, #4]
	add	r2, ip, r3, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	ldr	r0, .L73+8
	cmp	r2, r0
	lsl	r3, r3, #8
	bne	.L37
	ldr	r0, [lr, #28]
	add	r3, r3, r0
	ldr	r0, [sp, #4]
	add	r3, r3, ip
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, r2
	moveq	r3, #0
	strheq	r3, [lr, #64]	@ movhi
.L37:
	cmp	r8, #0
	blt	.L70
.L24:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	bge	.L65
	add	r4, r5, r3
	asr	r2, r4, #6
	bic	r2, r2, r2, asr #31
	cmp	r2, ip
	bge	.L65
	ldr	r0, [sp, #8]
	sub	r7, r0, #1
	ldr	r0, .L73+4
	add	r7, r7, r1
	add	r9, r1, r1, lsl #2
	str	r0, [sp, #4]
	add	r9, r1, r9, lsl #1
	add	r0, r7, r7, lsl #2
	add	r6, ip, r9, lsl #8
	add	r7, r7, r0, lsl #1
	ldr	r0, [sp, #4]
	add	r6, r6, #1
	lsl	r9, r9, #9
	mov	r2, ip
	mov	r10, #0
	ldr	r8, .L73+8
	rsb	r9, r9, #0
	add	r6, r0, r6, lsl #1
	lsl	r7, r7, #9
	b	.L32
.L30:
	lsl	r3, r2, #6
	mov	r4, r3
	mov	r5, #0
	mov	r10, #1
.L31:
	asr	r0, r4, #6
	sub	r2, r2, #1
	bic	r0, r0, r0, asr #31
	cmp	r0, r2
	bge	.L71
.L32:
	ldrh	r0, [r6, #-2]!
	cmp	r0, r8
	bne	.L30
	add	r0, r7, r6
	ldrh	r0, [r0, r9]
	cmp	r0, r8
	bne	.L30
	b	.L31
.L70:
	add	r0, fp, r8
	cmp	r1, r0, asr #6
	ble	.L24
	ldr	r5, [lr, #28]
	add	r3, r1, r1, lsl #2
	add	r5, ip, r5
	ldr	r2, [sp, #4]
	add	r3, r1, r3, lsl #1
	add	r3, r5, r3, lsl #8
	rsb	r5, r5, r5, lsl #31
	add	r3, r2, r3, lsl #1
	mov	r6, #0
	ldr	r7, .L73+8
	lsl	ip, ip, #1
	lsl	r5, r5, #1
	rsb	r2, fp, r1, lsl #6
	b	.L41
.L39:
	add	r0, r2, fp
	cmp	r1, r0, asr #6
	mov	r8, r2
	mov	r6, #1
	sub	r2, r2, #64
	sub	r3, r3, #5632
	ble	.L72
.L41:
	add	r4, r5, r3
	ldrh	r4, [r4, ip]
	cmp	r4, r7
	sub	r1, r1, #1
	bne	.L39
	ldrh	r4, [r3, #-4]
	cmp	r4, r7
	bne	.L39
	cmp	r1, r0, asr #6
	sub	r2, r2, #64
	sub	r3, r3, #5632
	bgt	.L41
.L72:
	cmp	r6, #0
	strne	r8, [lr, #8]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L71:
	cmp	r10, #0
	strne	r3, [lr, #4]
	strne	r5, [lr, #12]
	asrne	ip, r3, #6
	b	.L26
.L65:
	ldr	r3, .L73+4
	str	r3, [sp, #4]
	b	.L26
.L74:
	.align	2
.L73:
	.word	player
	.word	Level1CollisionMapBitmap
	.word	32767
	.size	checkCollisionWithMap, .-checkCollisionWithMap
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
	ldr	r3, .L144
	ldrh	r3, [r3, #48]
	tst	r3, #2
	moveq	r3, #1
	push	{r4, lr}
	ldr	r2, .L144+4
	ldreq	r4, .L144+8
	strheq	r3, [r4, #66]	@ movhi
	ldrh	r3, [r2]
	ldrne	r4, .L144+8
	ands	r3, r3, #2
	ldr	r0, .L144+12
	bne	.L79
	ldrh	r1, [r0]
	tst	r1, #2
	bne	.L139
.L79:
	ldrsh	ip, [r4, #66]
.L78:
	ldr	r3, .L144
	ldrh	r3, [r3, #48]
	tst	r3, #32
	movne	r1, #0
	ldr	r3, [r4, #12]
	bne	.L80
	ldrsh	r1, [r4, #64]
	cmp	r1, #0
	subeq	r3, r3, #6
	streq	r3, [r4, #12]
	bne	.L140
.L83:
	mov	r1, #0
	str	r1, [r4, #60]
	mov	r1, #1
.L80:
	ldr	lr, .L144
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L85
	ldrsh	r1, [r4, #64]
	cmp	r1, #0
	addeq	r3, r3, #6
	streq	r3, [r4, #12]
	bne	.L141
.L88:
	mov	lr, #1
	mov	r1, lr
	str	lr, [r4, #60]
.L85:
	cmp	ip, #0
	bne	.L90
	cmp	r3, #192
	movgt	r3, #192
	strgt	r3, [r4, #12]
	bgt	.L92
	cmn	r3, #192
	mvnlt	r3, #191
	strlt	r3, [r4, #12]
	blt	.L93
.L109:
	cmp	r1, #0
	bne	.L113
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bgt	.L114
	blt	.L116
.L113:
	ldrh	r2, [r2]
	ldrh	r3, [r0]
	tst	r2, #1
	and	r3, r3, #1
	beq	.L98
	cmp	r3, #0
	beq	.L142
.L99:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L101
	mov	r3, #0
	ldr	r2, [r4, #12]
	cmp	r2, r3
	str	r3, [r4, #4]
	strne	r3, [r4, #12]
.L101:
	ldr	r3, [r4]
	cmp	r3, #0
	bge	.L104
	mov	r3, #0
	ldr	r2, [r4, #8]
	cmp	r2, r3
	str	r3, [r4]
	strne	r3, [r4, #8]
.L104:
	bl	checkCollisionWithMap
	ldrsh	r3, [r4, #64]
	cmp	r3, #0
	movne	r1, #0
	ldreq	r1, [r4, #8]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	r0, [r4, #12]
	addeq	r1, r1, #14
	add	r2, r2, r0
	add	r3, r3, r1
	str	r1, [r4, #8]
	str	r2, [r4, #4]
	str	r3, [r4]
	pop	{r4, lr}
	b	adjustScreenOffset
.L90:
	cmp	r3, #384
	ble	.L143
	mov	r3, #384
	str	r3, [r4, #12]
.L92:
	cmp	r1, #0
	bne	.L113
	ldr	r3, [r4, #12]
.L114:
	subs	r3, r3, #32
	bmi	.L97
.L138:
	str	r3, [r4, #12]
	b	.L113
.L98:
	cmp	r3, #0
	beq	.L99
	ldrsh	r3, [r4, #64]
	cmp	r3, #0
	bne	.L99
	ldr	r3, [r4, #8]
	cmn	r3, #256
	mvnlt	r3, #255
	strlt	r3, [r4, #8]
	b	.L99
.L142:
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	ldrne	r2, [r4, #8]
	subne	r2, r2, #416
	strhne	r3, [r4, #64]	@ movhi
	strne	r2, [r4, #8]
	b	.L99
.L143:
	cmn	r3, #384
	ldrlt	r3, .L144+16
	strlt	r3, [r4, #12]
	bge	.L109
.L93:
	cmp	r1, #0
	bne	.L113
	ldr	r3, [r4, #12]
.L116:
	add	r3, r3, #32
	cmp	r3, #0
	ble	.L138
.L97:
	mov	r3, #0
	str	r3, [r4, #12]
	b	.L113
.L141:
	cmp	r3, #0
	addlt	r3, r3, #32
	strlt	r3, [r4, #12]
	blt	.L88
	cmp	ip, #0
	moveq	r1, #3
	movne	r1, #6
	add	r3, r3, r1
	str	r3, [r4, #12]
	b	.L88
.L140:
	cmp	r3, #0
	subgt	r3, r3, #32
	strgt	r3, [r4, #12]
	bgt	.L83
	cmp	ip, #0
	moveq	r1, #3
	movne	r1, #6
	sub	r3, r3, r1
	str	r3, [r4, #12]
	b	.L83
.L139:
	mov	ip, r3
	strh	r3, [r4, #66]	@ movhi
	b	.L78
.L145:
	.align	2
.L144:
	.word	67109120
	.word	oldButtons
	.word	player
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
	ldr	r2, .L152
	ldr	r3, .L152+4
	ldr	r1, [r2, #4]
	ldr	r3, [r3]
	rsb	r3, r3, r1, asr #6
	rsbs	r1, r3, #0
	ldr	r0, .L152+8
	and	r1, r1, #255
	and	r3, r3, #255
	rsbpl	r3, r1, #0
	str	lr, [sp, #-4]!
	ldr	r1, [r0]
	ldr	lr, [r2]
	ldr	ip, [r2, #60]
	lsl	r3, r3, #23
	ldr	r0, .L152+12
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	rsb	r1, r1, lr, asr #6
	cmp	ip, #0
	strh	r3, [r0, #2]	@ movhi
	and	r1, r1, #255
	orrne	r3, r3, #4096
	strh	r1, [r0]	@ movhi
	strhne	r3, [r0, #2]	@ movhi
	ldr	r1, [r2, #48]
	ldr	r3, [r2, #40]
	add	r3, r3, r1, lsl #5
	lsl	r3, r3, #2
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L153:
	.align	2
.L152:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawSonic, .-drawSonic
	.comm	player,76,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
