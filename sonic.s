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
	ldr	r3, .L4+8
	mov	r1, #4
	ldr	r0, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #2048
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3, #32]
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
	.global	checkCollisionWithMap
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithMap, %function
checkCollisionWithMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	lr, .L38
	ldr	r4, [lr]
	cmp	r4, #0
	add	r3, r4, #63
	movge	r3, r4
	ldr	r5, [lr, #12]
	cmp	r5, #0
	asr	r3, r3, #6
	ble	.L7
	ldr	r6, [lr, #4]
	add	r1, r5, r6
	cmp	r1, #0
	add	r0, r1, #63
	movge	r0, r1
	cmp	r6, #0
	add	r2, r6, #63
	movge	r2, r6
	asr	r0, r0, #6
	cmp	r0, r2, asr #6
	asr	r2, r2, #6
	ble	.L9
	add	r0, lr, #28
	ldm	r0, {r0, ip}
	add	r8, r0, #63
	cmp	r0, #0
	movlt	r0, r8
	cmp	ip, #0
	add	r7, ip, #63
	movge	r7, ip
	add	r0, r2, r0, asr #6
	add	r7, r3, r7, asr #6
	rsb	r9, r3, r3, lsl #4
	ldr	ip, .L38+4
	sub	r0, r0, #-2147483647
	sub	r7, r7, #1
	add	r0, r0, r9, lsl #4
	rsb	r7, r7, r7, lsl #4
	lsl	r9, r9, #5
	mov	r10, #0
	ldr	r8, .L38+8
	rsb	r9, r9, #0
	add	ip, ip, r0, lsl #1
	lsl	r7, r7, #5
	b	.L12
.L10:
	lsl	r6, r2, #6
	mov	r1, r6
	mov	r5, #0
	mov	r10, #1
.L11:
	cmp	r1, #0
	add	r0, r1, #63
	movge	r0, r1
	add	r2, r2, #1
	cmp	r2, r0, asr #6
	bge	.L35
.L12:
	ldrh	r0, [ip, #2]!
	cmp	r0, r8
	bne	.L10
	add	r0, r9, ip
	ldrh	r0, [r0, r7]
	cmp	r0, r8
	bne	.L10
	b	.L11
.L37:
	cmp	fp, #0
	strne	r5, [lr, #12]
.L9:
	ldr	r8, [lr, #8]
	cmp	r8, #0
	ble	.L17
	add	r2, r8, r4
	cmp	r2, #0
	add	r1, r2, #63
	movge	r1, r2
	cmp	r3, r1, asr #6
	bge	.L6
	ldr	r5, [lr, #28]
	ldr	r6, [lr, #4]
	ldr	r1, [lr, #32]
	add	r0, r5, #63
	cmp	r5, #0
	movlt	r5, r0
	add	r0, r6, #63
	cmp	r6, #0
	movlt	r6, r0
	add	r0, r1, #63
	cmp	r1, #0
	movlt	r1, r0
	asr	r5, r5, #6
	add	r5, r5, r6, asr #6
	add	r0, r5, #-2147483648
	add	r1, r3, r1, asr #6
	sub	r0, r0, #241
	ldr	ip, .L38+12
	asr	r6, r6, #6
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	add	r6, r6, #1
	rsb	r5, r5, r5, lsl #31
	mov	r10, #0
	ldrsh	r7, [lr, #64]
	ldr	r9, .L38+8
	lsl	r6, r6, #1
	lsl	r5, r5, #1
	add	ip, ip, r1, lsl #1
	rsb	r0, r4, r3, lsl #6
	b	.L21
.L19:
	mov	r7, #1
	mov	r8, r0
	mov	r10, r7
	add	r2, r0, r4
.L20:
	cmp	r2, #0
	add	r1, r2, #63
	movge	r1, r2
	cmp	r3, r1, asr #6
	add	r0, r0, #64
	add	ip, ip, #480
	bge	.L36
.L21:
	add	r1, r5, ip
	ldrh	r1, [r1, r6]
	cmp	r1, r9
	add	r3, r3, #1
	bne	.L19
	ldrh	r1, [ip]
	cmp	r1, r9
	bne	.L19
	b	.L20
.L17:
	ldr	r1, [lr, #32]
	ldr	r2, [lr, #4]
	add	r0, r1, #63
	cmp	r1, #0
	movlt	r1, r0
	add	r0, r2, #63
	cmp	r2, #0
	movlt	r2, r0
	add	r3, r3, r1, asr #6
	asr	r2, r2, #6
	rsb	r3, r3, r3, lsl #4
	add	r3, r2, r3, lsl #4
	ldr	r2, .L38+12
	lsl	r1, r3, #1
	ldrh	r1, [r2, r1]
	ldr	r0, .L38+8
	cmp	r1, r0
	beq	.L6
	ldr	r1, [lr, #28]
	cmp	r1, #0
	add	ip, r1, #63
	movlt	r1, ip
	add	r3, r3, r1, asr #6
	add	r3, r2, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, r0
	movne	r3, #0
	strhne	r3, [lr, #64]	@ movhi
.L6:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L35:
	cmp	r10, #0
	strne	r6, [lr, #4]
	strne	r5, [lr, #12]
	b	.L9
.L36:
	cmp	r10, #0
	beq	.L6
	str	r8, [lr, #8]
	strh	r7, [lr, #64]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	bge	.L9
	ldr	r8, [lr, #4]
	add	r2, r5, r8
	cmp	r2, #0
	add	r1, r2, #63
	movge	r1, r2
	cmp	r8, #0
	add	ip, r8, #63
	movge	ip, r8
	asr	r1, r1, #6
	cmp	r1, ip, asr #6
	asr	ip, ip, #6
	bge	.L9
	ldr	r1, [lr, #32]
	cmp	r1, #0
	add	r7, r1, #63
	movge	r7, r1
	rsb	r10, r3, r3, lsl #4
	add	r7, r3, r7, asr #6
	add	r1, ip, r10, lsl #4
	ldr	r6, .L38+12
	sub	r7, r7, #1
	rsb	r7, r7, r7, lsl #4
	add	r1, r1, #1
	lsl	r10, r10, #5
	mov	fp, #0
	ldr	r9, .L38+8
	lsl	r7, r7, #5
	rsb	r10, r10, #0
	add	r6, r6, r1, lsl #1
	rsb	r0, r8, ip, lsl #6
	b	.L16
.L14:
	mov	r5, r0
	mov	fp, #1
	add	r2, r0, r8
.L15:
	cmp	r2, #0
	add	r1, r2, #63
	movge	r1, r2
	cmp	ip, r1, asr #6
	sub	r0, r0, #64
	ble	.L37
.L16:
	ldrh	r1, [r6, #-2]!
	cmp	r1, r9
	sub	ip, ip, #1
	bne	.L14
	add	r1, r7, r6
	ldrh	r1, [r1, r10]
	cmp	r1, r9
	bne	.L14
	b	.L15
.L39:
	.align	2
.L38:
	.word	player
	.word	testcollisionmapBitmap-2
	.word	32767
	.word	testcollisionmapBitmap
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
	ldr	r3, .L92
	ldrh	r3, [r3, #48]
	push	{r4, lr}
	ldr	r4, .L92+4
	tst	r3, #32
	movne	r1, #0
	ldr	r3, [r4, #12]
	bne	.L41
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	subeq	r3, r3, #6
	streq	r3, [r4, #12]
	bne	.L89
.L44:
	mov	r2, #0
	mov	r1, #1
	str	r2, [r4, #60]
.L41:
	ldr	r2, .L92
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L45
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	bne	.L90
	add	r3, r3, #6
	str	r3, [r4, #12]
.L49:
	mov	r2, #1
	cmp	r3, #384
	str	r2, [r4, #60]
	ble	.L48
	mov	r3, #384
	str	r3, [r4, #12]
.L70:
	ldr	r2, .L92+8
	ldr	r3, .L92+12
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	tst	r2, #1
	and	r3, r3, #1
	beq	.L58
	cmp	r3, #0
	bne	.L59
	ldrsh	r2, [r4, #64]
	cmp	r2, #0
	bne	.L91
.L59:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L60
	mov	r2, #0
	ldr	r3, [r4, #12]
	cmp	r3, r2
	movne	r3, r2
	str	r2, [r4, #4]
	strne	r2, [r4, #12]
.L60:
	ldr	r2, [r4, #28]
	add	r3, r2, r3
	cmp	r3, #15360
	ble	.L62
	ldr	r3, [r4, #12]
	cmp	r3, #0
	movne	r3, #0
	rsb	r2, r2, #15360
	str	r2, [r4, #4]
	strne	r3, [r4, #12]
.L62:
	ldr	r3, [r4]
	cmp	r3, #0
	bge	.L64
	mov	r2, #0
	ldr	r3, [r4, #8]
	cmp	r3, r2
	movne	r3, r2
	str	r2, [r4]
	strne	r2, [r4, #8]
.L64:
	ldr	r2, [r4, #32]
	add	r3, r2, r3
	cmp	r3, #10240
	ble	.L65
	ldrsh	r3, [r4, #64]
	cmp	r3, #0
	bne	.L65
	mov	r3, #1
	rsb	r2, r2, #10240
	str	r2, [r4]
	strh	r3, [r4, #64]	@ movhi
.L66:
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
.L90:
	cmp	r3, #0
	addge	r3, r3, #3
	strge	r3, [r4, #12]
	bge	.L49
	mov	r2, #1
	add	r3, r3, #32
	str	r3, [r4, #12]
	str	r2, [r4, #60]
.L48:
	cmn	r3, #384
	ldrlt	r3, .L92+16
	strlt	r3, [r4, #12]
	b	.L70
.L89:
	cmp	r3, #0
	subgt	r3, r3, #32
	suble	r3, r3, #3
	str	r3, [r4, #12]
	b	.L44
.L65:
	ldr	r3, [r4, #8]
	add	r3, r3, #14
	str	r3, [r4, #8]
	b	.L66
.L45:
	cmp	r3, #384
	ble	.L51
	mov	r3, #384
	cmp	r1, #0
	str	r3, [r4, #12]
	bne	.L70
.L71:
	subs	r3, r3, #3
	movmi	r3, #0
.L88:
	str	r3, [r4, #12]
	b	.L70
.L58:
	cmp	r3, #0
	beq	.L59
	ldr	r3, [r4, #8]
	cmn	r3, #256
	mvnlt	r3, #255
	strlt	r3, [r4, #8]
	b	.L59
.L51:
	cmn	r3, #384
	bge	.L53
	ldr	r3, .L92+16
	cmp	r1, #0
	str	r3, [r4, #12]
	mvneq	r3, #380
	beq	.L88
	b	.L70
.L91:
	ldr	r2, [r4, #8]
	sub	r2, r2, #416
	strh	r3, [r4, #64]	@ movhi
	str	r2, [r4, #8]
	b	.L59
.L53:
	cmp	r1, #0
	bne	.L70
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bgt	.L71
	beq	.L70
	add	r3, r3, #3
	cmp	r3, #0
	strgt	r1, [r4, #12]
	bgt	.L70
	b	.L88
.L93:
	.align	2
.L92:
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
	ldr	r1, .L100
	ldr	r3, [r1]
	ldr	r2, [r1, #4]
	add	ip, r3, #63
	cmp	r3, #0
	movlt	r3, ip
	cmp	r2, #0
	add	r0, r2, #63
	movge	r0, r2
	ldr	r2, .L100+4
	str	lr, [sp, #-4]!
	ldr	lr, [r1, #60]
	ldr	ip, .L100+8
	and	r2, r2, r0, asr #6
	orr	r2, r2, #32768
	cmp	lr, #0
	asr	r3, r3, #6
	strh	r2, [ip, #2]	@ movhi
	and	r3, r3, #255
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
.L101:
	.align	2
.L100:
	.word	player
	.word	511
	.word	shadowOAM
	.size	drawSonic, .-drawSonic
	.comm	player,68,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
