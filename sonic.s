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
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #32
	mov	r0, #13312
	mov	r1, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3, #32]
	str	r2, [r3, #28]
	str	r0, [r3, #4]
	str	r1, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	sonicSpritePal
	.word	copyToSpritePaletteMem
	.word	sonicSpriteTiles
	.word	copyToCharBlock
	.word	player
	.size	initializeSonic, .-initializeSonic
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
	ldr	lr, .L55
	ldr	r5, [lr, #12]
	ldr	r3, [lr, #4]
	ldr	fp, [lr]
	ldr	r2, [lr, #32]
	sub	sp, sp, #20
	cmp	r5, #0
	str	r2, [sp, #4]
	asr	ip, r3, #6
	asr	r0, fp, #6
	ble	.L7
	add	r4, r5, r3
	cmp	ip, r4, asr #6
	bge	.L47
	ldr	r1, [lr, #28]
	ldr	r6, [sp, #4]
	sub	r1, r1, #-2147483647
	rsb	r10, r0, r0, lsl #4
	add	r1, r1, ip
	add	r1, r1, r10, lsl #4
	sub	r8, r6, #1
	lsl	r1, r1, #1
	ldr	r6, .L55+4
	add	r8, r8, r0
	sub	r1, r1, #2
	lsl	r10, r10, #5
	rsb	r8, r8, r8, lsl #4
	mov	r2, ip
	mov	r9, #0
	str	r6, [sp, #8]
	ldr	r7, .L55+8
	rsb	r10, r10, #0
	add	r1, r6, r1
	lsl	r8, r8, #5
	b	.L11
.L9:
	lsl	r3, r2, #6
	mov	r4, r3
	add	r2, r2, #1
	cmp	r2, r4, asr #6
	mov	r5, #0
	mov	r9, #1
	bge	.L50
.L11:
	ldrh	r6, [r1, #2]!
	cmp	r6, r7
	bne	.L9
	add	r6, r10, r1
	ldrh	r6, [r6, r8]
	cmp	r6, r7
	bne	.L9
	add	r2, r2, #1
	cmp	r2, r4, asr #6
	blt	.L11
.L50:
	cmp	r9, #0
	strne	r3, [lr, #4]
	strne	r5, [lr, #12]
	asrne	ip, r3, #6
.L8:
	ldr	r8, [lr, #8]
	cmp	r8, #0
	ble	.L15
	add	r3, r8, fp
	cmp	r0, r3, asr #6
	bge	.L15
	ldr	r3, [sp, #4]
	ldr	r7, [lr, #28]
	add	r3, r3, r0
	add	r7, ip, r7
	rsb	r3, r3, r3, lsl #4
	add	r3, r7, r3, lsl #4
	ldr	r1, [sp, #8]
	add	r3, r3, #-2147483648
	sub	r3, r3, #242
	rsb	r7, r7, r7, lsl #31
	lsl	r9, ip, #1
	add	r3, r1, r3, lsl #1
	mov	r4, r8
	mov	r2, fp
	mov	r6, #0
	mov	r1, r0
	ldrsh	r5, [lr, #64]
	ldr	r10, .L55+8
	str	r0, [sp, #12]
	lsl	r7, r7, #1
	add	r9, r9, #4
	b	.L18
.L16:
	mov	r5, #1
	mov	r4, #0
	mov	r6, r5
	lsl	r2, r1, #6
	sub	r2, r2, #64
.L17:
	add	r1, r1, #1
	add	r0, r4, r2
	cmp	r1, r0, asr #6
	add	r3, r3, #480
	bge	.L51
.L18:
	add	r0, r7, r3
	ldrh	r0, [r0, r9]
	cmp	r0, r10
	bne	.L16
	ldrh	r0, [r3]
	cmp	r0, r10
	bne	.L16
	b	.L17
.L51:
	cmp	r6, #0
	ldr	r0, [sp, #12]
	beq	.L15
	mov	r8, r4
	mov	fp, r2
	str	r4, [lr, #8]
	str	r2, [lr]
	strh	r5, [lr, #64]	@ movhi
	asr	r0, r2, #6
.L15:
	ldr	r3, [sp, #4]
	add	r3, r0, r3
	rsb	r3, r3, r3, lsl #4
	ldr	r1, [sp, #8]
	add	r2, ip, r3, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	ldr	r1, .L55+8
	cmp	r2, r1
	lsl	r3, r3, #4
	bne	.L19
	ldr	r1, [lr, #28]
	add	r3, r3, r1
	ldr	r1, [sp, #8]
	add	r3, r3, ip
	add	r3, r1, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, r2
	moveq	r3, #0
	strheq	r3, [lr, #64]	@ movhi
.L19:
	cmp	r8, #0
	blt	.L52
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	bge	.L47
	add	r4, r5, r3
	asr	r2, r4, #6
	bic	r2, r2, r2, asr #31
	cmp	r2, ip
	bge	.L47
	ldr	r1, [sp, #4]
	rsb	r9, r0, r0, lsl #4
	sub	r8, r1, #1
	add	r6, ip, r9, lsl #4
	ldr	r1, .L55+4
	add	r8, r8, r0
	add	r6, r6, #1
	lsl	r9, r9, #5
	rsb	r8, r8, r8, lsl #4
	mov	r2, ip
	mov	r10, #0
	str	r1, [sp, #8]
	ldr	r7, .L55+8
	rsb	r9, r9, #0
	add	r6, r1, r6, lsl #1
	lsl	r8, r8, #5
	b	.L14
.L12:
	lsl	r3, r2, #6
	mov	r4, r3
	mov	r5, #0
	mov	r10, #1
.L13:
	asr	r1, r4, #6
	sub	r2, r2, #1
	bic	r1, r1, r1, asr #31
	cmp	r1, r2
	bge	.L53
.L14:
	ldrh	r1, [r6, #-2]!
	cmp	r1, r7
	bne	.L12
	add	r1, r8, r6
	ldrh	r1, [r1, r9]
	cmp	r1, r7
	bne	.L12
	b	.L13
.L52:
	add	r1, fp, r8
	cmp	r0, r1, asr #6
	ble	.L6
	ldr	r5, [lr, #28]
	ldr	r2, [sp, #8]
	add	r5, ip, r5
	rsb	r3, r0, r0, lsl #4
	add	r3, r5, r3, lsl #4
	rsb	r5, r5, r5, lsl #31
	add	r3, r2, r3, lsl #1
	mov	r6, #0
	ldr	r7, .L55+8
	lsl	ip, ip, #1
	lsl	r5, r5, #1
	rsb	r2, fp, r0, lsl #6
	b	.L23
.L21:
	add	r1, r2, fp
	cmp	r0, r1, asr #6
	mov	r8, r2
	mov	r6, #1
	sub	r2, r2, #64
	sub	r3, r3, #480
	ble	.L54
.L23:
	add	r4, r5, r3
	ldrh	r4, [r4, ip]
	cmp	r4, r7
	sub	r0, r0, #1
	bne	.L21
	ldrh	r4, [r3, #-4]
	cmp	r4, r7
	bne	.L21
	cmp	r0, r1, asr #6
	sub	r2, r2, #64
	sub	r3, r3, #480
	bgt	.L23
.L54:
	cmp	r6, #0
	strne	r8, [lr, #8]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L53:
	cmp	r10, #0
	strne	r3, [lr, #4]
	strne	r5, [lr, #12]
	asrne	ip, r3, #6
	b	.L8
.L47:
	ldr	r3, .L55+4
	str	r3, [sp, #8]
	b	.L8
.L56:
	.align	2
.L55:
	.word	player
	.word	testcollisionmapBitmap
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
	ldr	r2, .L154
	ldrh	r3, [r2, #48]
	push	{r4, lr}
	ldr	r4, .L154+4
	tst	r3, #32
	ldrsh	r1, [r4, #66]
	ldr	r3, [r4, #12]
	bne	.L58
	cmp	r1, #0
	beq	.L148
	ldrh	r1, [r2, #48]
.L146:
	cmp	r3, #384
	ldrh	r0, [r2, #48]
	bgt	.L100
	cmn	r3, #384
	mvnlt	r3, #380
	bge	.L149
.L141:
	str	r3, [r4, #12]
.L99:
	ldr	r3, .L154+8
	ldr	r2, .L154+12
	ldrh	r3, [r3]
	ldrh	ip, [r2]
	tst	r3, #1
	and	r2, ip, #1
	beq	.L82
	cmp	r2, #0
	bne	.L83
	ldrsh	r1, [r4, #64]
	subs	r1, r1, #0
	movne	r1, #1
	ands	r0, r0, #128
	movne	lr, r1
	moveq	lr, #0
	cmp	lr, #0
	bne	.L150
	cmp	r0, #0
	movne	r1, #0
	cmp	r1, #0
	bne	.L151
.L83:
	ands	r3, r3, #128
	bne	.L85
	tst	ip, #128
	beq	.L85
	ldrsh	r2, [r4, #66]
	cmp	r2, #0
	bne	.L152
.L85:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L87
	mov	r2, #0
	ldr	r3, [r4, #12]
	cmp	r3, r2
	movne	r3, r2
	str	r2, [r4, #4]
	strne	r2, [r4, #12]
.L87:
	ldr	r2, [r4, #28]
	add	r3, r2, r3
	cmp	r3, #15360
	ble	.L89
	ldr	r3, [r4, #12]
	cmp	r3, #0
	movne	r3, #0
	rsb	r2, r2, #15360
	str	r2, [r4, #4]
	strne	r3, [r4, #12]
.L89:
	ldr	r3, [r4]
	cmp	r3, #0
	asrge	r3, r3, #6
	bge	.L92
	mov	r2, #0
	ldr	r3, [r4, #8]
	cmp	r3, r2
	movne	r3, r2
	str	r2, [r4]
	strne	r2, [r4, #8]
.L92:
	ldr	r2, [r4, #32]
	add	r3, r3, r2
	cmp	r3, #160
	ble	.L93
	ldrsh	r3, [r4, #64]
	cmp	r3, #0
	bne	.L93
	mov	r3, #1
	lsl	r2, r2, #6
	rsb	r2, r2, #10240
	str	r2, [r4]
	strh	r3, [r4, #64]	@ movhi
.L94:
	bl	checkCollisionWithMap
	ldrsh	r3, [r4, #64]
	cmp	r3, #0
	movne	r3, #0
	movne	r1, r3
	ldr	r2, [r4, #4]
	ldreq	r1, [r4, #8]
	strne	r3, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r3, [r4]
	add	r2, r2, r0
	add	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L148:
	ldrsh	r0, [r4, #64]
	cmp	r0, #0
	beq	.L60
	cmp	r3, #0
	ldrh	r0, [r2, #48]
	ble	.L61
	sub	r3, r3, #32
	tst	r0, #16
	str	r3, [r4, #12]
	str	r1, [r4, #60]
	bne	.L153
.L62:
	cmp	r3, #0
	addge	r3, r3, #3
	strge	r3, [r4, #12]
	bge	.L74
.L64:
	mov	r2, #1
	ldr	r1, .L154
	add	r3, r3, #32
	ldrh	r0, [r1, #48]
	str	r3, [r4, #12]
	str	r2, [r4, #60]
.L104:
	cmn	r3, #384
	ldrlt	r3, .L154+16
	strlt	r3, [r4, #12]
	b	.L99
.L93:
	ldr	r3, [r4, #8]
	add	r3, r3, #14
	str	r3, [r4, #8]
	b	.L94
.L58:
	ldrh	r0, [r2, #48]
	and	r0, r0, #16
	orrs	r1, r1, r0
	bne	.L146
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	bne	.L62
.L66:
	add	r3, r3, #6
	str	r3, [r4, #12]
.L74:
	mov	r2, #1
	ldr	r1, .L154
	cmp	r3, #384
	ldrh	r0, [r1, #48]
	str	r2, [r4, #60]
	ble	.L104
.L75:
	mov	r3, #384
	str	r3, [r4, #12]
	b	.L99
.L82:
	cmp	r2, #0
	beq	.L83
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	bne	.L83
	ldr	r2, [r4, #8]
	cmn	r2, #256
	mvnlt	r2, #255
	strlt	r2, [r4, #8]
	b	.L83
.L100:
	mov	r3, #384
	str	r3, [r4, #12]
	ldr	r3, [r4, #12]
.L102:
	subs	r3, r3, #3
	movmi	r3, #0
	b	.L141
.L152:
	ldr	r1, [r4, #60]
	cmp	r1, #0
	ldr	r2, .L154+16
	movne	r2, #384
	strh	r3, [r4, #66]	@ movhi
	str	r2, [r4, #12]
	b	.L85
.L60:
	ldrh	r1, [r2, #48]
	sub	r3, r3, #6
	tst	r1, #16
	str	r3, [r4, #12]
	str	r0, [r4, #60]
	beq	.L66
	cmp	r3, #384
	ldrh	r0, [r2, #48]
	ble	.L104
	b	.L75
.L150:
	ldr	r1, [r4, #8]
	sub	r1, r1, #416
	strh	r2, [r4, #64]	@ movhi
	str	r1, [r4, #8]
	b	.L83
.L151:
	mov	r2, #1
	strh	r2, [r4, #66]	@ movhi
	b	.L83
.L61:
	sub	r3, r3, #3
	tst	r0, #16
	str	r3, [r4, #12]
	str	r1, [r4, #60]
	beq	.L64
	ldrh	r0, [r2, #48]
	b	.L104
.L153:
	cmp	r3, #384
	ldrh	r0, [r2, #48]
	bgt	.L75
	b	.L99
.L149:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bgt	.L102
	beq	.L99
	add	r3, r3, #3
	cmp	r3, #0
	movgt	r3, #0
	b	.L141
.L155:
	.align	2
.L154:
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
	ldr	r2, .L162
	str	lr, [sp, #-4]!
	ldr	r3, .L162+4
	ldm	r2, {r1, lr}
	ldr	ip, [r2, #60]
	ldr	r0, .L162+8
	and	r3, r3, lr, asr #6
	orr	r3, r3, #32768
	cmp	ip, #0
	asr	r1, r1, #6
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
.L163:
	.align	2
.L162:
	.word	player
	.word	511
	.word	shadowOAM
	.size	drawSonic, .-drawSonic
	.comm	player,68,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
