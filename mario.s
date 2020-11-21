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
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r1, #16
	mov	ip, #1280
	mov	r0, #14272
	ldr	r3, .L4+16
	pop	{r4, lr}
	stm	r3, {r0, ip}
	str	r1, [r3, #32]
	str	r1, [r3, #28]
	str	r2, [r3, #48]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	bx	lr
.L5:
	.align	2
.L4:
	.word	mariospritesheetPal
	.word	copyToSpritePaletteMem
	.word	mariospritesheetTiles
	.word	copyToCharBlock
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
	ldr	lr, .L78
	ldm	lr, {r2, r3}
	sub	sp, sp, #20
	ldr	r4, [lr, #12]
	str	r2, [sp, #12]
	asr	r1, r2, #6
	ldr	r2, [lr, #32]
	cmp	r4, #0
	str	r2, [sp, #4]
	asr	ip, r3, #6
	ble	.L25
	add	r2, r4, r3
	cmp	ip, r2, asr #6
	bge	.L71
	ldr	r5, [lr, #28]
	ldr	r6, [sp, #4]
	add	r9, r1, r1, lsl #2
	sub	r5, r5, #-2147483647
	add	r9, r1, r9, lsl #1
	sub	r7, r6, #1
	add	r5, r5, ip
	add	r5, r5, r9, lsl #8
	add	r7, r7, r1
	ldr	fp, .L78+4
	lsl	r5, r5, #1
	add	r6, r7, r7, lsl #2
	sub	r5, r5, #2
	lsl	r9, r9, #9
	add	r7, r7, r6, lsl #1
	mov	r0, ip
	mov	r10, #0
	str	fp, [sp, #8]
	ldr	r8, .L78+8
	rsb	r9, r9, #0
	add	r5, fp, r5
	lsl	r7, r7, #9
	b	.L29
.L27:
	lsl	r3, r0, #6
	mov	r2, r3
	add	r0, r0, #1
	cmp	r0, r2, asr #6
	mov	r4, #0
	mov	r10, #1
	bge	.L74
.L29:
	ldrh	r6, [r5, #2]!
	cmp	r6, r8
	bne	.L27
	add	r6, r5, r9
	ldrh	r6, [r6, r7]
	cmp	r6, r8
	bne	.L27
	add	r0, r0, #1
	cmp	r0, r2, asr #6
	blt	.L29
.L74:
	cmp	r10, #0
	strne	r3, [lr, #4]
	strne	r4, [lr, #12]
	asrne	ip, r3, #6
.L26:
	ldr	r8, [lr, #8]
	cmp	r8, #0
	ble	.L33
	ldr	r2, [sp, #12]
	add	r3, r8, r2
	cmp	r1, r3, asr #6
	bge	.L33
	ldr	r3, [sp, #4]
	ldr	r7, [lr, #28]
	add	r3, r3, r1
	add	r5, r3, r3, lsl #2
	add	r3, r3, r5, lsl #1
	add	r7, ip, r7
	add	r3, r7, r3, lsl #8
	ldr	r6, [sp, #8]
	sub	r3, r3, #2816
	sub	r3, r3, #-2147483646
	rsb	r7, r7, r7, lsl #31
	lsl	r9, ip, #1
	mov	r4, r8
	mov	r0, r1
	mov	fp, #0
	ldrsh	r5, [lr, #64]
	ldr	r10, .L78+8
	add	r3, r6, r3, lsl #1
	lsl	r7, r7, #1
	add	r9, r9, #4
	b	.L36
.L34:
	mov	r5, #1
	mov	r4, #0
	mov	fp, r5
	lsl	r2, r0, #6
	sub	r2, r2, #64
.L35:
	add	r0, r0, #1
	add	r6, r4, r2
	cmp	r0, r6, asr #6
	add	r3, r3, #5632
	bge	.L75
.L36:
	add	r6, r7, r3
	ldrh	r6, [r6, r9]
	cmp	r6, r10
	bne	.L34
	ldrh	r6, [r3]
	cmp	r6, r10
	bne	.L34
	b	.L35
.L75:
	cmp	fp, #0
	beq	.L33
	mov	r8, r4
	str	r2, [sp, #12]
	str	r4, [lr, #8]
	str	r2, [lr]
	strh	r5, [lr, #64]	@ movhi
	asr	r1, r2, #6
.L33:
	ldr	r3, [sp, #4]
	add	r3, r1, r3
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r0, [sp, #8]
	add	r2, ip, r3, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	ldr	r0, .L78+8
	cmp	r2, r0
	lsl	r3, r3, #8
	bne	.L37
	ldr	r0, [lr, #28]
	add	r3, r3, r0
	ldr	r0, [sp, #8]
	add	r3, r3, ip
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, r2
	moveq	r3, #0
	strheq	r3, [lr, #64]	@ movhi
.L37:
	cmp	r8, #0
	blt	.L76
.L24:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	bge	.L71
	add	r2, r4, r3
	asr	r0, r2, #6
	bic	r0, r0, r0, asr #31
	cmp	r0, ip
	bge	.L71
	ldr	r5, [sp, #4]
	add	fp, r1, r1, lsl #2
	sub	r8, r5, #1
	add	fp, r1, fp, lsl #1
	add	r8, r8, r1
	ldr	r7, .L78+4
	add	r5, ip, fp, lsl #8
	add	r6, r8, r8, lsl #2
	add	r5, r5, #1
	lsl	fp, fp, #9
	add	r8, r8, r6, lsl #1
	mov	r0, ip
	mov	r10, #0
	str	r7, [sp, #8]
	ldr	r9, .L78+8
	rsb	fp, fp, #0
	add	r5, r7, r5, lsl #1
	lsl	r8, r8, #9
	b	.L32
.L30:
	add	r3, r7, #64
	mov	r2, r3
	asr	r6, r2, #6
	bic	r6, r6, r6, asr #31
	cmp	r6, r0
	mov	r4, #0
	mov	r10, #1
	bge	.L77
.L32:
	ldrh	r6, [r5, #-2]!
	cmp	r6, r9
	lsl	r7, r0, #6
	sub	r0, r0, #1
	bne	.L30
	add	r6, r8, r5
	ldrh	r6, [r6, fp]
	cmp	r6, r9
	bne	.L30
	asr	r6, r2, #6
	bic	r6, r6, r6, asr #31
	cmp	r6, r0
	blt	.L32
.L77:
	cmp	r10, #0
	strne	r3, [lr, #4]
	strne	r4, [lr, #12]
	asrne	ip, r3, #6
	b	.L26
.L76:
	ldr	r10, [sp, #12]
	add	r4, r10, r8
	cmp	r1, r4, asr #6
	ble	.L24
	ldr	r5, .L78+8
	mov	r6, #0
	mov	r7, r5
	ldr	r9, [lr, #28]
	add	r3, r1, r1, lsl #2
	add	r9, ip, r9
	ldr	r0, [sp, #8]
	add	r3, r1, r3, lsl #1
	add	r3, r9, r3, lsl #8
	rsb	r9, r9, r9, lsl #31
	lsl	ip, ip, #1
	add	r3, r0, r3, lsl #1
	lsl	r9, r9, #1
	rsb	r2, r10, r1, lsl #6
.L41:
	add	r0, r3, r9
	ldrh	r0, [r0, ip]
	cmp	r0, #992
	cmpne	r0, r5
	sub	r1, r1, #1
	ldrh	r0, [r3, #-4]
	bne	.L39
	cmp	r0, r7
	beq	.L40
.L39:
	cmp	r0, #992
	movne	r8, r2
	movne	r6, #1
	addne	r4, r2, r10
.L40:
	cmp	r1, r4, asr #6
	sub	r3, r3, #5632
	sub	r2, r2, #64
	bgt	.L41
	cmp	r6, #0
	strne	r8, [lr, #8]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L71:
	ldr	r3, .L78+4
	str	r3, [sp, #8]
	b	.L26
.L79:
	.align	2
.L78:
	.word	player
	.word	Level1CollisionMapBitmap
	.word	32767
	.size	checkCollisionWithMap, .-checkCollisionWithMap
	.global	__aeabi_idivmod
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
	ldr	r3, .L159
	ldrh	r3, [r3, #48]
	tst	r3, #2
	moveq	r3, #1
	push	{r4, lr}
	ldreq	r4, .L159+4
	strheq	r3, [r4, #66]	@ movhi
	ldr	r3, .L159+8
	ldrh	r0, [r3]
	ldr	r3, .L159+12
	ldrne	r4, .L159+4
	ands	r1, r0, #2
	ldrh	r3, [r3]
	bne	.L85
	tst	r3, #2
	beq	.L85
	strh	r1, [r4, #66]	@ movhi
	ldr	ip, .L159
	ldrh	r2, [ip, #48]
	ldr	lr, [r4, #40]
	ands	r2, r2, #32
	str	lr, [r4, #44]
	beq	.L127
	ldrh	r2, [ip, #48]
	tst	r2, #16
	beq	.L87
	ldr	r2, [r4, #12]
.L92:
	cmp	r2, #192
	ble	.L94
	mov	r2, #192
	str	r2, [r4, #12]
.L95:
	cmp	r1, #0
	bne	.L120
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	ldr	r2, [r4, #12]
	strne	r1, [r4, #40]
	strne	r1, [r4, #52]
	cmp	r2, #0
	ble	.L98
	subs	r2, r2, #32
	bmi	.L100
.L155:
	tst	r0, #1
	str	r2, [r4, #12]
	and	r3, r3, #1
	bne	.L156
.L101:
	cmp	r3, #0
	beq	.L102
	ldrsh	r3, [r4, #64]
	cmp	r3, #0
	beq	.L157
.L102:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L104
	mov	r3, #0
	ldr	r2, [r4, #12]
	cmp	r2, r3
	str	r3, [r4, #4]
	strne	r3, [r4, #12]
.L104:
	bl	checkCollisionWithMap
	ldrsh	r1, [r4, #64]
	cmp	r1, #0
	beq	.L106
	mov	r2, #0
	ldr	r3, [r4, #40]
	cmp	r3, #2
	str	r2, [r4, #8]
	beq	.L158
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	cmp	r3, #0
	add	r2, r2, r1
	str	r2, [r4, #4]
	ldr	r0, [r4, #36]
	bne	.L109
.L108:
	mov	r3, #0
	str	r3, [r4, #48]
	str	r3, [r4, #44]
.L110:
	ldrsh	r3, [r4, #66]
	cmp	r3, #0
	movne	r1, #5
	moveq	r1, #7
	ldr	r3, .L159+16
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L113
	ldr	r3, [r4, #48]
	ldr	r2, [r4, #52]
	add	r3, r3, #1
	cmp	r3, r2
	movlt	r1, r3
	str	r1, [r4, #48]
.L113:
	pop	{r4, lr}
	b	adjustScreenOffset
.L85:
	ldr	r2, .L159
	ldrh	r1, [r2, #48]
	ldr	r2, [r4, #40]
	tst	r1, #32
	str	r2, [r4, #44]
	movne	r1, #0
	ldrsh	r2, [r4, #66]
	bne	.L84
	cmp	r2, #0
	mvneq	r1, #63
	mvnne	r1, #127
.L86:
	ldrsh	ip, [r4, #64]
	cmp	ip, #0
	movne	ip, #1
	str	r1, [r4, #12]
	movne	r1, #3
	strne	ip, [r4, #40]
	mov	ip, #0
	strne	r1, [r4, #52]
	mov	r1, #1
	str	ip, [r4, #60]
.L84:
	ldr	ip, .L159
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L90
	cmp	r2, #0
	beq	.L87
	mov	r2, #128
	ldrsh	r1, [r4, #64]
	cmp	r1, #0
	str	r2, [r4, #12]
	bne	.L125
.L153:
	mov	r2, #1
	str	r2, [r4, #60]
.L120:
	tst	r0, #1
	and	r3, r3, #1
	beq	.L101
.L156:
	cmp	r3, #0
	bne	.L102
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	beq	.L102
	mov	r1, #2
	ldr	r2, [r4, #8]
	sub	r2, r2, #416
	strh	r3, [r4, #64]	@ movhi
	str	r3, [r4, #52]
	str	r2, [r4, #8]
	str	r1, [r4, #40]
	b	.L102
.L90:
	cmp	r2, #0
	ldr	r2, [r4, #12]
	beq	.L92
	cmp	r2, #384
	movgt	r2, #384
	strgt	r2, [r4, #12]
	bgt	.L95
	cmn	r2, #384
	ldrlt	r2, .L159+20
	strlt	r2, [r4, #12]
	b	.L95
.L87:
	mov	r2, #64
	ldrsh	r1, [r4, #64]
	cmp	r1, #0
	str	r2, [r4, #12]
	beq	.L153
.L125:
	mov	r2, #1
	mov	r1, #3
	str	r2, [r4, #40]
	str	r2, [r4, #60]
	str	r1, [r4, #52]
	b	.L120
.L106:
	mov	r3, #2
	ldr	r2, [r4, #8]
	ldr	ip, [r4]
	ldr	r0, [r4, #4]
	ldr	lr, [r4, #12]
	add	r2, r2, #14
	add	r0, r0, lr
	add	ip, ip, r2
	str	r0, [r4, #4]
	str	r1, [r4, #52]
	str	r2, [r4, #8]
	str	ip, [r4]
	str	r3, [r4, #40]
	ldr	r0, [r4, #36]
.L109:
	ldr	r2, [r4, #44]
	cmp	r2, r3
	movne	r3, #0
	add	r0, r0, #1
	str	r0, [r4, #36]
	strne	r3, [r4, #48]
	b	.L110
.L98:
	beq	.L120
	add	r2, r2, #32
	cmp	r2, #0
	ble	.L155
.L100:
	mov	r2, #0
	str	r2, [r4, #12]
	str	r2, [r4, #40]
	str	r2, [r4, #52]
	b	.L120
.L157:
	ldr	r3, [r4, #8]
	cmn	r3, #256
	mvnlt	r3, #255
	strlt	r3, [r4, #8]
	b	.L102
.L127:
	mvn	r1, #63
	b	.L86
.L158:
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r3, r1
	str	r2, [r4, #40]
	str	r2, [r4, #52]
	str	r3, [r4, #4]
	ldr	r0, [r4, #36]
	b	.L108
.L94:
	cmn	r2, #192
	mvnlt	r2, #191
	strlt	r2, [r4, #12]
	b	.L95
.L160:
	.align	2
.L159:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	__aeabi_idivmod
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
	ldr	r2, .L167
	ldr	r3, .L167+4
	ldr	r1, [r2, #4]
	ldr	r3, [r3]
	rsb	r3, r3, r1, asr #6
	rsbs	r1, r3, #0
	ldr	r0, .L167+8
	and	r1, r1, #255
	and	r3, r3, #255
	rsbpl	r3, r1, #0
	str	lr, [sp, #-4]!
	ldr	r1, [r0]
	ldr	lr, [r2]
	ldr	ip, [r2, #60]
	lsl	r3, r3, #23
	ldr	r0, .L167+12
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
	lsl	r3, r3, #1
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L168:
	.align	2
.L167:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawSonic, .-drawSonic
	.comm	player,76,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
