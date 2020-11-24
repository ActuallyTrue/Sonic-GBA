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
	.global	initializeMario
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeMario, %function
initializeMario:
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
	mov	lr, #1280
	mov	r1, #16
	mov	ip, #14272
	ldr	r3, .L4+16
	ldr	r0, .L4+20
	ldr	r4, [r3]
	ldr	r0, [r0]
	ldr	r3, .L4+24
	stm	r3, {ip, lr}
	str	r4, [r3, #52]
	str	r0, [r3, #56]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #36]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	strh	r2, [r3, #44]	@ movhi
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mariospritesheetPal
	.word	copyToSpritePaletteMem
	.word	mariospritesheetTiles
	.word	copyToCharBlock
	.word	hOff
	.word	vOff
	.word	player
	.size	initializeMario, .-initializeMario
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
	ldr	r3, .L19
	ldr	r2, [r3, #8]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L16
	beq	.L9
	ldr	lr, .L19+4
	ldr	r0, [lr]
	cmp	r0, #95
	ble	.L17
.L9:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	blt	.L18
.L11:
	beq	.L6
	ldr	r2, [r3, #16]
	ldr	lr, .L19+8
	rsbs	r0, r2, #0
	ldr	ip, [lr]
	ldr	r1, [r3, #4]
	and	r0, r0, #255
	and	r2, r2, #255
	rsb	r1, ip, r1, asr #6
	rsbpl	r2, r0, #0
	add	r2, r1, r2
	cmp	r2, #119
	ble	.L6
	ldrsh	r2, [r3, #50]
	cmp	r2, #0
	ldr	r2, [r3, #52]
	addne	ip, ip, #2
	addne	r2, r2, #2
	addeq	ip, ip, #1
	addeq	r2, r2, #1
	str	ip, [lr]
	str	r2, [r3, #52]
.L6:
	pop	{r4, lr}
	bx	lr
.L17:
	ldr	r1, [r3, #20]
	ldr	ip, [r3]
	rsbs	r4, r1, #0
	and	r4, r4, #255
	and	r1, r1, #255
	rsb	ip, r0, ip, asr #6
	rsbpl	r1, r4, #0
	add	r1, ip, r1
	cmp	r1, #79
	ble	.L9
	ldr	r1, [r3, #56]
	add	r0, r0, r2, asr #6
	cmp	r0, #96
	add	r2, r1, r2, asr #6
	str	r2, [r3, #56]
	movgt	r2, #96
	str	r0, [lr]
	strgt	r2, [r3, #56]
	strgt	r2, [lr]
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bge	.L11
.L18:
	ldr	ip, .L19+8
	ldr	r2, [r3, #4]
	ldr	r0, [ip]
	rsb	r2, r0, r2, asr #6
	rsbs	r1, r2, #0
	and	r1, r1, #255
	and	r2, r2, #255
	rsbpl	r2, r1, #0
	cmp	r2, #120
	bgt	.L6
	ldrsh	r2, [r3, #50]
	cmp	r2, #0
	ldr	r2, [r3, #52]
	subne	r0, r0, #2
	subne	r2, r2, #2
	subeq	r0, r0, #1
	subeq	r2, r2, #1
	str	r0, [ip]
	str	r2, [r3, #52]
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	ip, .L19+4
	ldr	r0, [ip]
	cmp	r0, #0
	ble	.L9
	ldr	r1, [r3]
	rsb	r1, r0, r1, asr #6
	rsbs	lr, r1, #0
	and	lr, lr, #255
	and	r1, r1, #255
	rsbpl	r1, lr, #0
	cmp	r1, #40
	bgt	.L9
	ldr	r1, [r3, #56]
	add	r0, r0, r2, asr #6
	cmp	r0, #0
	add	r2, r1, r2, asr #6
	str	r0, [ip]
	str	r2, [r3, #56]
	movlt	r2, #0
	strlt	r2, [ip]
	strlt	r2, [r3, #56]
	b	.L9
.L20:
	.align	2
.L19:
	.word	player
	.word	vOff
	.word	hOff
	.size	adjustScreenOffset, .-adjustScreenOffset
	.align	2
	.global	downToNormal
	.syntax unified
	.arm
	.fpu softvfp
	.type	downToNormal, %function
downToNormal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #16
	mov	r1, #0
	ldr	r3, .L22
	strh	r1, [r3, #60]	@ movhi
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.size	downToNormal, .-downToNormal
	.align	2
	.global	advanceToMushroom
	.syntax unified
	.arm
	.fpu softvfp
	.type	advanceToMushroom, %function
advanceToMushroom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #16
	mov	r0, #1
	mov	r1, #27
	ldr	r3, .L29
	ldrsh	ip, [r3, #48]
	cmp	ip, #0
	str	r2, [r3, #16]
	strh	r0, [r3, #60]	@ movhi
	ldr	r2, [r3, #20]
	str	r1, [r3, #20]
	bxeq	lr
	lsl	r2, r2, #16
	ldr	r1, [r3]
	asr	r2, r2, #16
	rsb	r2, r2, #27
	sub	r2, r1, r2, lsl #6
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.size	advanceToMushroom, .-advanceToMushroom
	.align	2
	.global	advanceToFireFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	advanceToFireFlower, %function
advanceToFireFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #2
	mov	r1, #16
	mov	r2, #27
	ldr	r3, .L32
	strh	r0, [r3, #60]	@ movhi
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L33:
	.align	2
.L32:
	.word	player
	.size	advanceToFireFlower, .-advanceToFireFlower
	.align	2
	.global	checkCollisionWithItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithItems, %function
checkCollisionWithItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L50
	ldr	r5, .L50+4
	ldr	r7, .L50+8
	ldr	r10, .L50+12
	ldr	r9, .L50+16
	ldr	r8, .L50+20
	ldr	fp, .L50+24
	sub	sp, sp, #28
	add	r6, r4, #216
	b	.L40
.L36:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L49
.L40:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L36
	ldm	r4, {r2, r3}
	asr	r2, r2, #6
	str	r2, [sp, #4]
	ldr	ip, [r4, #12]
	ldr	r2, [r4, #8]
	asr	r3, r3, #6
	str	r2, [sp, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L36
	mov	r2, #0
	ldr	r3, [r4, #24]
	cmp	r3, #1
	str	r2, [r4, #28]
	str	r2, [r4, #4]
	str	r2, [r4]
	beq	.L38
	cmp	r3, #2
	beq	.L39
	cmp	r3, r2
	bne	.L36
	mov	r2, r3
	ldr	r1, [fp]
	ldr	r0, .L50+28
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #68]
	add	r4, r4, #36
	add	r3, r3, #1
	cmp	r4, r6
	str	r3, [r5, #68]
	bne	.L40
.L49:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	ldr	r1, [r10]
	mov	r0, r9
	str	r3, [sp, #20]
	mov	lr, pc
	bx	r8
	mov	r1, #16
	mov	r2, #27
	ldr	r3, [sp, #20]
	str	r1, [r5, #16]
	strh	r3, [r5, #60]	@ movhi
	str	r2, [r5, #20]
	b	.L36
.L38:
	mov	r0, r9
	ldr	r1, [r10]
	str	r3, [sp, #20]
	mov	lr, pc
	bx	r8
	mov	r1, #16
	mov	r2, #27
	ldr	r3, [sp, #20]
	strh	r3, [r5, #60]	@ movhi
	ldr	r3, [r5, #20]
	ldrsh	r0, [r5, #48]
	lsl	r3, r3, r1
	asr	r3, r3, r1
	cmp	r0, #0
	str	r1, [r5, #16]
	str	r2, [r5, #20]
	sub	r3, r2, r3
	ldrne	r2, [r5]
	subne	r3, r2, r3, lsl #6
	strne	r3, [r5]
	b	.L36
.L51:
	.align	2
.L50:
	.word	items
	.word	player
	.word	collision
	.word	powerUpSound_length
	.word	powerUpSound_data
	.word	playSoundB
	.word	coinSound_length
	.word	coinSound_data
	.size	checkCollisionWithItems, .-checkCollisionWithItems
	.align	2
	.global	checkCollisionWithItemBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithItemBlocks, %function
checkCollisionWithItemBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L93
	mov	r6, #0
	mov	r4, r8
	ldr	r5, .L93+4
	ldr	r7, .L93+8
	sub	sp, sp, #16
.L70:
	ldr	r2, [r4, #4]
	ldr	r3, [r5, #52]
	rsb	r3, r3, r2, asr #6
	cmp	r3, #239
	asr	r2, r2, #6
	bgt	.L53
	ldr	r0, [r4, #8]
	add	r3, r3, r0
	cmp	r3, #0
	ble	.L53
	ldr	r3, [r4]
	ldr	r1, [r5, #56]
	asr	r3, r3, #6
	sub	r1, r3, r1
	sub	r1, r1, #1
	cmp	r1, #158
	mov	ip, r3
	bhi	.L53
	ldr	r1, [r5, #12]
	cmp	r1, #0
	bgt	.L86
	cmp	r1, #0
	blt	.L87
.L55:
	ldr	r2, [r5, #8]
	ldr	r1, [r5]
	cmp	r2, #0
	asr	r9, r1, #6
	blt	.L88
.L62:
	cmp	r2, #0
	bgt	.L89
.L63:
	cmp	r9, ip
	blt	.L90
.L53:
	add	r6, r6, #1
	cmp	r6, #7
	add	r4, r4, #28
	bne	.L70
.L52:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L86:
	ldr	r9, [r5, #4]
	add	r1, r1, r9
	asr	r1, r1, #6
	cmp	r1, r9, asr #6
	asr	r9, r9, #6
	bgt	.L59
	b	.L55
.L56:
	ldr	r1, [r5, #12]
	ldr	r3, [r5, #4]
	add	r9, r9, #1
	add	r3, r1, r3
	cmp	r9, r3, asr #6
	ldr	r3, [r4]
	bge	.L91
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #8]
	asr	r3, r3, #6
	asr	r2, r2, #6
.L59:
	ldr	ip, [r4, #12]
	stm	sp, {r2, r3}
	str	r0, [sp, #8]
	ldr	r1, [r5]
	str	ip, [sp, #12]
	add	r2, r5, #16
	mov	r0, r9
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L56
	mov	r3, #0
	sub	r9, r9, #1
	lsl	r9, r9, #6
	str	r9, [r5, #4]
	str	r3, [r5, #12]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L90:
	ldr	r3, [r4, #4]
	ldr	lr, [r4, #12]
	str	ip, [sp, #4]
	ldr	r2, [r4, #8]
	asr	r3, r3, #6
	str	r2, [sp, #8]
	ldr	r0, [r5, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	add	r1, r9, #1
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L53
	mov	r3, #1
	strh	r3, [r5, #48]	@ movhi
	b	.L52
.L87:
	ldr	r9, [r5, #4]
	add	r1, r9, r1
	asr	r1, r1, #6
	bic	r1, r1, r1, asr #31
	cmp	r1, r9, asr #6
	asr	r9, r9, #6
	bge	.L55
.L61:
	ldr	r2, [r4, #4]
	add	r0, r4, #8
	ldm	r0, {r0, ip}
	asr	r2, r2, #6
	stm	sp, {r2, r3}
	str	r0, [sp, #8]
	ldr	r1, [r5]
	str	ip, [sp, #12]
	add	r2, r5, #16
	mov	r0, r9
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L92
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	add	r3, r3, r2
	asr	r3, r3, #6
	bic	r3, r3, r3, asr #31
	sub	r9, r9, #1
	cmp	r3, r9
	ldr	r3, [r4]
	asr	r3, r3, #6
	blt	.L61
	mov	ip, r3
	b	.L55
.L88:
	add	r2, r2, r1
	cmp	r9, r2, asr #6
	bgt	.L67
	b	.L63
.L64:
	ldr	r1, [r5]
	ldr	r2, [r5, #8]
	sub	r9, r9, #1
	add	r3, r1, r2
	cmp	r9, r3, asr #6
	ldr	r3, [r4]
	asr	r3, r3, #6
	ble	.L83
.L67:
	ldr	r2, [r4, #4]
	add	r1, r4, #8
	ldm	r1, {r1, ip}
	asr	r2, r2, #6
	stm	sp, {r2, r3}
	str	r1, [sp, #8]
	ldr	r0, [r5, #4]
	str	ip, [sp, #12]
	add	r2, r5, #16
	mov	r1, r9
	ldm	r2, {r2, r3}
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L64
	rsb	r4, r6, r6, lsl #3
	lsl	r10, r4, #2
	ldr	r2, [r8, r10]
	add	r4, r8, r4, lsl #2
	asr	r2, r2, #6
	add	r1, r4, #8
	ldm	r1, {r1, ip}
	ldr	r3, [r4, #4]
	str	r2, [sp, #4]
	ldr	r2, [r5]
	ldr	r0, [r5, #4]
	add	r9, r9, #1
	str	ip, [sp, #12]
	asr	r3, r3, #6
	lsl	ip, r9, #6
	rsb	r2, r2, r9, lsl #6
	str	r3, [sp]
	str	r1, [sp, #8]
	ldr	r3, [r5, #20]
	str	r2, [r5, #8]
	asr	r1, ip, #6
	ldr	r2, [r5, #16]
	asr	r0, r0, #6
	str	ip, [r5]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	lsl	r3, r6, #3
	beq	.L65
	ldr	r1, [r8, r10]
	ldr	r2, [r4, #12]
	add	r2, r2, r1, asr #6
	add	r2, r2, #1
	lsl	r2, r2, #6
	str	r2, [r5]
.L65:
	mov	r1, #64
	sub	r6, r3, r6
	add	r8, r8, r6, lsl #2
	ldr	r2, [r8, #16]
	cmp	r2, #0
	str	r1, [r5, #8]
	bne	.L52
	ldr	r3, .L93+12
	ldr	r0, .L93+16
	ldr	r1, [r3]
	ldr	r3, .L93+20
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r8, #16]
	b	.L52
.L89:
	add	r2, r2, r1
	cmp	r9, r2, asr #6
	blt	.L69
	b	.L63
.L68:
	ldr	r2, [r5]
	ldr	r3, [r5, #8]
	add	r9, r9, #1
	add	r3, r2, r3
	cmp	r9, r3, asr #6
	ldr	r3, [r4]
	bge	.L84
	asr	r3, r3, #6
.L69:
	ldr	r2, [r4, #4]
	add	r1, r4, #8
	ldm	r1, {r1, ip}
	asr	r2, r2, #6
	stm	sp, {r2, r3}
	str	r1, [sp, #8]
	ldr	r0, [r5, #4]
	str	ip, [sp, #12]
	add	r2, r5, #16
	mov	r1, r9
	ldm	r2, {r2, r3}
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L68
	mov	r1, #0
	mov	r2, #1
	sub	r3, r9, #1
	lsl	r3, r3, #6
	str	r3, [r5]
	str	r1, [r5, #8]
	strh	r2, [r5, #48]	@ movhi
	b	.L52
.L91:
	asr	r3, r3, #6
	cmp	r1, #0
	mov	ip, r3
	bge	.L55
	b	.L87
.L84:
	asr	ip, r3, #6
	asr	r9, r2, #6
	b	.L63
.L83:
	mov	ip, r3
	asr	r9, r1, #6
	b	.L62
.L92:
	mov	r2, #0
	add	r3, r9, #1
	lsl	r3, r3, #6
	str	r3, [r5, #4]
	str	r2, [r5, #12]
	b	.L52
.L94:
	.align	2
.L93:
	.word	itemBlocks
	.word	player
	.word	collision
	.word	itemSpawnSound_length
	.word	itemSpawnSound_data
	.word	playSoundB
	.size	checkCollisionWithItemBlocks, .-checkCollisionWithItemBlocks
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
	ldr	ip, .L157
	ldr	r5, [ip, #12]
	ldr	r0, [ip, #4]
	ldr	fp, [ip]
	ldr	r1, [ip, #20]
	sub	sp, sp, #20
	asr	r2, r0, #6
	cmp	r5, #0
	str	r2, [sp]
	str	r1, [sp, #4]
	asr	r3, fp, #6
	ble	.L96
	add	lr, r5, r0
	cmp	r2, lr, asr #6
	bge	.L153
	mov	r10, #0
	ldr	r2, [ip, #16]
	ldr	r4, [sp]
	sub	r2, r2, #-2147483647
	add	r2, r2, r4
	mov	r1, r4
	ldr	r4, [sp, #4]
	add	r6, r3, r3, lsl #2
	add	r6, r3, r6, lsl #1
	sub	r7, r4, #1
	ldr	r9, .L157+4
	add	r2, r2, r6, lsl #8
	add	r7, r7, r3
	lsl	r2, r2, #1
	add	r4, r7, r7, lsl #2
	sub	r2, r2, #2
	lsl	r6, r6, #9
	add	r7, r7, r4, lsl #1
	str	r9, [sp, #8]
	ldr	r8, .L157+8
	rsb	r6, r6, #0
	add	r2, r9, r2
	lsl	r7, r7, #9
.L100:
	ldrh	r4, [r2, #2]!
	cmp	r4, #992
	cmpne	r4, r8
	add	r9, r6, r2
	bne	.L98
	ldrh	r4, [r9, r7]
	cmp	r4, #992
	cmpne	r4, r8
	beq	.L99
.L98:
	lsl	r0, r1, #6
	mov	lr, r0
	mov	r5, #0
	mov	r10, #1
.L99:
	add	r1, r1, #1
	cmp	r1, lr, asr #6
	blt	.L100
	cmp	r10, #0
	asrne	r2, r0, #6
	strne	r0, [ip, #4]
	strne	r2, [sp]
	strne	r5, [ip, #12]
.L97:
	ldr	r7, [ip, #8]
	cmp	r7, #0
	ble	.L154
	add	r2, r7, fp
	cmp	r3, r2, asr #6
	bge	.L154
	ldr	r2, [sp, #4]
	add	r4, r2, r3
	add	r2, r4, r4, lsl #2
	add	r2, r4, r2, lsl #1
	str	r4, [sp, #12]
	ldr	r6, [ip, #16]
	ldr	r4, [sp]
	add	r6, r4, r6
	add	r2, r6, r2, lsl #8
	ldr	r5, [sp, #8]
	sub	r2, r2, #2816
	lsl	r8, r4, #1
	sub	r2, r2, #-2147483646
	rsb	r6, r6, r6, lsl #31
	mov	lr, r7
	mov	r1, r3
	mov	r0, fp
	mov	r10, #0
	ldrsh	r4, [ip, #48]
	ldr	r9, .L157+8
	add	r2, r5, r2, lsl #1
	lsl	r6, r6, #1
	add	r8, r8, #4
	b	.L107
.L105:
	mov	r4, #1
	mov	lr, #0
	mov	r10, r4
	lsl	r0, r1, #6
	sub	r0, r0, #64
.L106:
	add	r1, r1, #1
	add	r5, lr, r0
	cmp	r1, r5, asr #6
	add	r2, r2, #5632
	bge	.L155
.L107:
	add	r5, r6, r2
	ldrh	r5, [r5, r8]
	cmp	r5, r9
	bne	.L105
	ldrh	r5, [r2]
	cmp	r5, r9
	bne	.L105
	b	.L106
.L155:
	cmp	r10, #0
	beq	.L104
	mov	r7, lr
	mov	fp, r0
	ldr	r2, [sp, #4]
	add	r2, r2, r0, asr #6
	str	lr, [ip, #8]
	str	r0, [ip]
	strh	r4, [ip, #48]	@ movhi
	str	r2, [sp, #12]
	asr	r3, r0, #6
.L104:
	ldr	r2, [sp, #4]
	add	r2, r3, r2
	add	r1, r2, r2, lsl #2
	add	r2, r2, r1, lsl #1
	ldr	r1, [sp]
	ldr	r0, [sp, #8]
	add	r1, r1, r2, lsl #8
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	ldr	r0, .L157+8
	cmp	r1, r0
	lsl	r2, r2, #8
	bne	.L108
	ldr	r0, [ip, #16]
	add	r2, r2, r0
	ldr	r0, [sp]
	add	r2, r2, r0
	ldr	r0, [sp, #8]
	add	r2, r0, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, r1
	moveq	r2, #0
	strheq	r2, [ip, #48]	@ movhi
.L108:
	cmp	r7, #0
	blt	.L156
.L109:
	ldr	r3, [sp, #12]
	cmp	r3, #255
	movgt	r2, #1
	ldrgt	r3, .L157+12
	strhgt	r2, [r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L154:
	ldr	r2, [sp, #4]
	add	r2, r2, r3
	str	r2, [sp, #12]
	b	.L104
.L96:
	bge	.L153
	add	lr, r5, r0
	ldr	r1, [sp]
	asr	r2, lr, #6
	bic	r2, r2, r2, asr #31
	cmp	r2, r1
	bge	.L153
	mov	r9, #0
	ldr	r4, [sp, #4]
	ldr	r1, [sp]
	sub	r6, r4, #1
	add	r10, r3, r3, lsl #2
	ldr	r8, .L157+4
	add	r10, r3, r10, lsl #1
	add	r6, r6, r3
	mov	r2, r1
	add	r4, r6, r6, lsl #2
	add	r1, r1, r10, lsl #8
	add	r1, r1, #1
	lsl	r10, r10, #9
	add	r6, r6, r4, lsl #1
	str	r8, [sp, #8]
	ldr	r7, .L157+8
	rsb	r10, r10, #0
	add	r1, r8, r1, lsl #1
	lsl	r6, r6, #9
.L103:
	ldrh	r4, [r1, #-2]!
	cmp	r4, #992
	cmpne	r4, r7
	add	r8, r6, r1
	lsl	r4, r2, #6
	sub	r2, r2, #1
	bne	.L101
	ldrh	r8, [r8, r10]
	cmp	r8, #992
	cmpne	r8, r7
	beq	.L102
.L101:
	add	r0, r4, #64
	mov	lr, r0
	mov	r5, #0
	mov	r9, #1
.L102:
	asr	r4, lr, #6
	bic	r4, r4, r4, asr #31
	cmp	r4, r2
	blt	.L103
	cmp	r9, #0
	asrne	r2, r0, #6
	strne	r0, [ip, #4]
	strne	r5, [ip, #12]
	strne	r2, [sp]
	b	.L97
.L156:
	add	lr, fp, r7
	cmp	r3, lr, asr #6
	ble	.L109
	ldr	r4, .L157+8
	mov	r5, #0
	mov	r6, r4
	ldr	r8, [sp]
	ldr	r0, [ip, #16]
	add	r2, r3, r3, lsl #2
	add	r0, r8, r0
	add	r2, r3, r2, lsl #1
	ldr	r9, [sp, #8]
	add	r2, r0, r2, lsl #8
	rsb	r0, r0, r0, lsl #31
	mov	r1, r3
	lsl	r8, r8, #1
	add	r2, r9, r2, lsl #1
	lsl	r0, r0, #1
	rsb	r3, fp, r3, lsl #6
.L112:
	add	r9, r2, r0
	ldrh	r9, [r9, r8]
	cmp	r9, #992
	cmpne	r9, r4
	sub	r1, r1, #1
	ldrh	r9, [r2, #-4]
	bne	.L110
	cmp	r9, r6
	beq	.L111
.L110:
	cmp	r9, #992
	movne	r7, r3
	movne	r5, #1
	addne	lr, r3, fp
.L111:
	cmp	r1, lr, asr #6
	sub	r2, r2, #5632
	sub	r3, r3, #64
	bgt	.L112
	cmp	r5, #0
	strne	r7, [ip, #8]
	b	.L109
.L153:
	ldr	r2, .L157+4
	str	r2, [sp, #8]
	b	.L97
.L158:
	.align	2
.L157:
	.word	player
	.word	Level1CollisionMapBitmap
	.word	32767
	.word	shouldLose
	.size	checkCollisionWithMap, .-checkCollisionWithMap
	.align	2
	.global	checkCollisionWithGoal
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithGoal, %function
checkCollisionWithGoal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L165
	ldr	ip, [r3]
	ldr	r2, .L165+4
	sub	sp, sp, #16
	ldr	r0, [r3, #4]
	asr	ip, ip, #6
	ldr	r1, [r2]
	ldr	r4, [r3, #12]
	ldr	lr, [r3, #8]
	str	ip, [sp, #4]
	asr	r3, r0, #6
	ldr	r0, [r2, #4]
	str	r4, [sp, #12]
	str	r3, [sp]
	str	lr, [sp, #8]
	add	r2, r2, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L165+8
	asr	r1, r1, #6
	asr	r0, r0, #6
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L165+12
	strhne	r2, [r3]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L166:
	.align	2
.L165:
	.word	goal
	.word	player
	.word	collision
	.word	shouldWin
	.size	checkCollisionWithGoal, .-checkCollisionWithGoal
	.align	2
	.global	takeDamage
	.syntax unified
	.arm
	.fpu softvfp
	.type	takeDamage, %function
takeDamage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	r4, .L176
	ldrsh	r3, [r4, #60]
	cmp	r3, r5
	strh	r5, [r4, #62]	@ movhi
	beq	.L168
	cmp	r3, #2
	beq	.L169
	cmp	r3, #0
	beq	.L175
.L167:
	pop	{r4, r5, r6, lr}
	bx	lr
.L168:
	ldr	r3, .L176+4
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L176+8
	ldr	r3, .L176+12
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r2, #0
	str	r3, [r4, #16]
	strh	r2, [r4, #60]	@ movhi
	str	r3, [r4, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L175:
	ldr	r3, .L176+16
	strh	r5, [r3]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L169:
	ldr	r3, .L176+4
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L176+8
	ldr	r3, .L176+12
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r2, #27
	ldrsh	r1, [r4, #48]
	cmp	r1, #0
	str	r3, [r4, #16]
	strh	r5, [r4, #60]	@ movhi
	ldr	r3, [r4, #20]
	str	r2, [r4, #20]
	beq	.L167
	lsl	r3, r3, #16
	ldr	r2, [r4]
	asr	r3, r3, #16
	rsb	r3, r3, #27
	sub	r3, r2, r3, lsl #6
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	player
	.word	powerDownSound_length
	.word	powerDownSound_data
	.word	playSoundB
	.word	shouldLose
	.size	takeDamage, .-takeDamage
	.align	2
	.global	checkCollisionWithGoombas
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithGoombas, %function
checkCollisionWithGoombas:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L220
	ldr	r2, [r0, #4]
	ldr	r3, [r4, #52]
	rsb	r3, r3, r2, asr #6
	cmp	r3, #239
	sub	sp, sp, #16
	bgt	.L178
	ldr	r1, [r0, #16]
	add	r3, r3, r1
	cmp	r3, #0
	mov	r5, r0
	ble	.L178
	ldr	r3, [r0]
	ldr	r0, [r4, #56]
	asr	r3, r3, #6
	sub	r0, r3, r0
	sub	r0, r0, #1
	cmp	r0, #158
	mov	ip, r3
	bhi	.L178
	ldr	r0, [r4, #8]
	ldr	lr, [r4]
	cmp	r0, #0
	asr	r6, lr, #6
	ble	.L182
	add	r0, r0, lr
	cmp	r6, r0, asr #6
	bge	.L183
	ldr	r7, .L220+4
	asr	r2, r2, #6
	b	.L188
.L184:
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	add	r3, r2, r3
	cmp	r6, r3, asr #6
	ldr	r3, [r5]
	bge	.L216
	ldr	r2, [r5, #4]
	ldr	r1, [r5, #16]
	asr	r3, r3, #6
	asr	r2, r2, #6
.L188:
	ldr	ip, [r5, #20]
	ldr	r0, [r4, #4]
	stm	sp, {r2, r3}
	str	r1, [sp, #8]
	str	ip, [sp, #12]
	add	r2, r4, #16
	mov	r1, r6
	ldm	r2, {r2, r3}
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	add	r6, r6, #1
	beq	.L184
	ldr	r3, .L220+8
	ldrh	r2, [r3, #48]
	ldr	r3, .L220+12
	ands	r2, r2, #1
	ldr	r1, [r3]
	bne	.L185
	mov	r0, #2
	ldr	r3, .L220+16
	str	r0, [r4, #28]
	str	r3, [r4, #8]
	ldr	r0, .L220+20
	ldr	r3, .L220+24
	strh	r2, [r4, #48]	@ movhi
	str	r2, [r4, #40]
	mov	lr, pc
	bx	r3
.L186:
	mov	r0, r5
	ldr	r3, .L220+28
	mov	lr, pc
	bx	r3
.L178:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L216:
	asr	ip, r3, #6
	asr	r6, r2, #6
.L182:
	cmp	r6, ip
	bge	.L189
.L204:
	ldrsh	r8, [r4, #48]
	cmp	r8, #0
	beq	.L217
.L189:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	blt	.L218
.L192:
	ldr	r2, [r4, #12]
	cmp	r2, #0
	ble	.L196
	ldr	r6, [r4, #4]
	add	r2, r2, r6
	asr	r2, r2, #6
	cmp	r2, r6, asr #6
	asr	r6, r6, #6
	ble	.L198
	ldr	r7, .L220+4
	b	.L197
.L199:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #4]
	add	r3, r2, r3
	cmp	r6, r3, asr #6
	bge	.L196
.L197:
	ldm	r5, {r2, r3}
	add	r0, r5, #16
	ldm	r0, {r0, ip}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r1, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r4, #16
	mov	r0, r6
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	add	r6, r6, #1
	beq	.L199
.L203:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	takeDamage
.L219:
	bl	takeDamage
.L198:
	ldrsh	r3, [r4, #48]
	cmp	r3, #0
	beq	.L178
	ldm	r5, {r2, r3}
	asr	r2, r2, #6
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	r2, [sp, #4]
	add	r2, r5, #16
	ldm	r2, {r2, ip}
	asr	r3, r3, #6
	str	r2, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r4, .L220+4
	asr	r1, r1, #6
	asr	r0, r0, #6
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L178
	b	.L203
.L196:
	cmp	r2, #0
	bge	.L198
	ldr	r6, [r4, #4]
	add	r2, r6, r2
	asr	r2, r2, #6
	bic	r2, r2, r2, asr #31
	cmp	r2, r6, asr #6
	asr	r6, r6, #6
	bge	.L198
	ldr	r7, .L220+4
.L202:
	ldm	r5, {r2, r3}
	add	r0, r5, #16
	ldm	r0, {r0, ip}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r1, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r4, #16
	mov	r0, r6
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	sub	r6, r6, #1
	bne	.L219
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	asr	r3, r3, #6
	bic	r3, r3, r3, asr #31
	cmp	r6, r3
	bgt	.L202
	b	.L198
.L217:
	ldr	r3, [r5, #4]
	add	r2, r5, #16
	ldm	r2, {r2, lr}
	asr	r3, r3, #6
	ldr	r0, [r4, #4]
	str	r2, [sp, #8]
	str	ip, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r7, .L220+4
	add	r1, r6, #1
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L189
	ldr	r3, .L220+8
	ldrh	r3, [r3, #48]
	ands	r3, r3, #1
	bne	.L190
	mov	r1, #2
	ldr	r2, .L220+16
	strh	r3, [r4, #48]	@ movhi
	str	r3, [r4, #40]
	str	r1, [r4, #28]
	str	r2, [r4, #8]
	b	.L186
.L218:
	ldr	r6, [r4]
	add	r3, r3, r6
	asr	r3, r3, #6
	cmp	r3, r6, asr #6
	asr	r6, r6, #6
	bge	.L192
	ldr	r7, .L220+4
	b	.L195
.L194:
	ldr	r3, [r4]
	ldr	r2, [r4, #8]
	add	r3, r3, r2
	cmp	r6, r3, asr #6
	ble	.L192
.L195:
	ldm	r5, {r2, r3}
	add	r1, r5, #16
	ldm	r1, {r1, ip}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r0, [r4, #4]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r4, #16
	mov	r1, r6
	ldm	r2, {r2, r3}
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	sub	r6, r6, #1
	beq	.L194
	bl	takeDamage
	b	.L192
.L185:
	mvn	r0, #207
	mov	r3, #2
	mov	r2, #0
	str	r0, [r4, #8]
	str	r3, [r4, #28]
	ldr	r0, .L220+20
	ldr	r3, .L220+24
	strh	r2, [r4, #48]	@ movhi
	str	r2, [r4, #40]
	mov	lr, pc
	bx	r3
	b	.L186
.L183:
	cmp	r3, r6
	ble	.L192
	b	.L204
.L190:
	mvn	r2, #207
	mov	r3, #2
	strh	r8, [r4, #48]	@ movhi
	str	r8, [r4, #40]
	str	r2, [r4, #8]
	str	r3, [r4, #28]
	b	.L186
.L221:
	.align	2
.L220:
	.word	player
	.word	collision
	.word	67109120
	.word	jumpSound_length
	.word	-462
	.word	jumpSound_data
	.word	playSoundB
	.word	killEnemy
	.size	checkCollisionWithGoombas, .-checkCollisionWithGoombas
	.align	2
	.global	checkCollisionWithEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithEnemies, %function
checkCollisionWithEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L235
	ldr	r5, .L235+4
	ldr	r7, .L235+8
	sub	sp, sp, #20
	add	r6, r4, #600
	b	.L226
.L234:
	cmp	r3, #1
	bne	.L225
	ldm	r4, {r2, r3}
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	ldr	r1, [r5]
	asr	r2, r2, #6
	asr	r3, r3, #6
	str	r2, [sp, #4]
	ldr	r0, [r5, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	asr	r1, r1, #6
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	add	r1, r1, #1
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L232
.L225:
	add	r4, r4, #60
	cmp	r4, r6
	beq	.L233
.L226:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L234
	mov	r0, r4
	add	r4, r4, #60
	bl	checkCollisionWithGoombas
	cmp	r4, r6
	bne	.L226
.L233:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L232:
	bl	takeDamage
	b	.L225
.L236:
	.align	2
.L235:
	.word	enemies
	.word	player
	.word	collision
	.size	checkCollisionWithEnemies, .-checkCollisionWithEnemies
	.global	__aeabi_idivmod
	.align	2
	.global	updateMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMario, %function
updateMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L329
	bl	checkCollisionWithGoal
	ldrh	r3, [r5]
	ands	r3, r3, #2
	beq	.L238
	ldr	r6, .L329+4
	ldrh	r2, [r6]
	tst	r2, #2
	ldr	r4, .L329+8
	beq	.L322
.L239:
	ldr	r2, .L329+12
	ldrh	r2, [r2, #48]
	tst	r2, #2
	bne	.L245
.L283:
	mov	r2, #1
	strh	r2, [r4, #50]	@ movhi
.L243:
	cmp	r3, #0
	bne	.L245
	b	.L244
.L238:
	ldr	r3, .L329+12
	ldrh	r3, [r3, #48]
	tst	r3, #2
	moveq	r3, #1
	ldreq	r4, .L329+8
	ldrne	r6, .L329+4
	ldrne	r4, .L329+8
	ldreq	r6, .L329+4
	strheq	r3, [r4, #50]	@ movhi
.L244:
	ldrh	r3, [r6]
	tst	r3, #2
	movne	r3, #0
	strhne	r3, [r4, #50]	@ movhi
.L245:
	ldr	r3, .L329+12
	ldrh	r1, [r3, #48]
	ldr	r2, [r4, #28]
	tst	r1, #32
	str	r2, [r4, #32]
	ldrsh	r2, [r4, #48]
	beq	.L247
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L248
	ldrsh	r3, [r4, #50]
.L249:
	cmp	r3, #0
	movne	r3, #128
	moveq	r3, #64
	cmp	r2, #0
	str	r3, [r4, #12]
	movne	r3, #3
	movne	r2, #1
	strne	r3, [r4, #40]
	mov	r3, #1
	strne	r2, [r4, #28]
	strh	r3, [r4, #46]	@ movhi
.L255:
	bl	checkCollisionWithMap
	bl	checkCollisionWithItemBlocks
	ldrsh	r3, [r4, #62]
	cmp	r3, #0
	beq	.L326
	ldr	r3, [r4, #64]
	tst	r3, #1
	beq	.L327
.L262:
	cmp	r3, #90
	movgt	r3, #0
	addle	r3, r3, #1
	strhgt	r3, [r4, #62]	@ movhi
	strhgt	r3, [r4, #44]	@ movhi
	str	r3, [r4, #64]
.L261:
	ldr	r3, .L329+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #256
	bne	.L264
	mov	r1, #2
	ldr	r2, .L329+16
	strh	r3, [r4, #48]	@ movhi
	str	r3, [r4, #40]
	str	r1, [r4, #28]
	str	r2, [r4, #8]
.L265:
	bl	checkCollisionWithMap
	bl	checkCollisionWithItemBlocks
	ldr	r2, [r4, #4]
	cmp	r2, #0
	blt	.L274
	ldr	r3, [r4, #12]
	add	r2, r2, r3
.L275:
	ldr	r1, [r4, #8]
	ldr	r3, [r4]
	adds	r3, r1, r3
	bpl	.L276
	cmp	r1, #0
	movne	r3, #0
	moveq	r3, r1
	strne	r3, [r4, #8]
.L276:
	ldr	r1, [r4, #28]
	cmp	r1, #0
	str	r2, [r4, #4]
	str	r3, [r4]
	ldr	r0, [r4, #24]
	streq	r1, [r4, #36]
	streq	r1, [r4, #32]
	beq	.L278
	ldr	r3, [r4, #32]
	cmp	r1, r3
	movne	r3, #0
	add	r0, r0, #1
	str	r0, [r4, #24]
	strne	r3, [r4, #36]
.L278:
	ldrsh	r3, [r4, #50]
	cmp	r3, #0
	movne	r1, #5
	moveq	r1, #7
	ldr	r3, .L329+20
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L281
	ldr	r3, [r4, #36]
	ldr	r2, [r4, #40]
	add	r3, r3, #1
	cmp	r3, r2
	movlt	r1, r3
	str	r1, [r4, #36]
.L281:
	bl	adjustScreenOffset
	pop	{r4, r5, r6, r7, r8, lr}
	b	checkCollisionWithItems
.L247:
	ldrsh	r3, [r4, #50]
	cmp	r3, #0
	mvnne	r1, #127
	mvneq	r1, #63
	cmp	r2, #0
	str	r1, [r4, #12]
	movne	r1, #3
	strne	r1, [r4, #40]
	mov	r1, #0
	movne	r0, #1
	strh	r1, [r4, #46]	@ movhi
	ldr	r1, .L329+12
	ldrh	r1, [r1, #48]
	strne	r0, [r4, #28]
	tst	r1, #16
	bne	.L255
	b	.L249
.L264:
	ldrh	r3, [r5]
	ldrh	r7, [r6]
	tst	r3, #1
	and	r7, r7, #1
	ldrsh	r3, [r4, #48]
	beq	.L266
	cmp	r7, #0
	bne	.L267
	cmp	r3, #0
	bne	.L328
.L268:
	ldr	r3, [r4, #8]
	add	r3, r3, #14
.L269:
	mov	r1, #2
	mov	r2, #0
	str	r3, [r4, #8]
	str	r1, [r4, #28]
	str	r2, [r4, #40]
	b	.L265
.L327:
	ldrsh	r2, [r4, #44]
	rsbs	r2, r2, #1
	movcc	r2, #0
	strh	r2, [r4, #44]	@ movhi
	b	.L262
.L322:
	ldrsh	r2, [r4, #60]
	cmp	r2, #2
	bne	.L239
	ldr	r7, .L329+24
	ldr	r8, [r7, #28]
	cmp	r8, #0
	beq	.L240
	ldr	r1, [r7, #64]
	cmp	r1, #0
	beq	.L284
	ldr	r1, [r7, #100]
	cmp	r1, #0
	moveq	r8, r2
	bne	.L239
.L240:
	ldr	r3, .L329+28
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L329+32
	ldr	r3, .L329+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldrsh	r1, [r4, #46]
	add	r3, r8, r8, lsl #3
	add	r3, r7, r3, lsl #2
	cmp	r1, #0
	str	r2, [r3, #28]
	lsl	r2, r8, #3
	beq	.L241
	mov	r0, #192
	ldr	ip, [r4, #4]
	ldr	r1, [r4, #16]
	add	r1, r1, ip, asr #6
	lsl	r1, r1, #6
	str	r1, [r3, #4]
	str	r0, [r3, #20]
.L242:
	mov	r1, #64
	add	r8, r2, r8
	ldr	r2, .L329+12
	ldr	r3, [r4]
	ldrh	r2, [r2, #48]
	lsl	r8, r8, #2
	str	r3, [r7, r8]!
	ldrh	r3, [r5]
	tst	r2, #2
	str	r1, [r7, #16]
	and	r3, r3, #2
	beq	.L283
	b	.L243
.L248:
	cmp	r2, #0
	movne	r3, #0
	strne	r3, [r4, #28]
	strne	r3, [r4, #40]
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ble	.L257
	subs	r3, r3, #32
	bmi	.L259
.L325:
	str	r3, [r4, #12]
	b	.L255
.L266:
	cmp	r7, #0
	beq	.L267
	cmp	r3, #0
	bne	.L271
	ldr	r3, [r4, #8]
	cmn	r3, #256
	addge	r3, r3, #14
	bge	.L269
.L270:
	mvn	r3, #241
	b	.L269
.L267:
	cmp	r3, #0
	beq	.L268
.L271:
	mov	r3, #0
	ldr	r2, [r4, #28]
	cmp	r2, #2
	str	r3, [r4, #8]
	streq	r3, [r4, #28]
	streq	r3, [r4, #40]
	b	.L265
.L274:
	mov	r3, #0
	ldr	r2, [r4, #12]
	cmp	r2, r3
	movne	r2, r3
	str	r3, [r4, #4]
	strne	r3, [r4, #12]
	b	.L275
.L326:
	bl	checkCollisionWithEnemies
	b	.L261
.L257:
	beq	.L255
	add	r3, r3, #32
	cmp	r3, #0
	ble	.L325
.L259:
	mov	r3, #0
	str	r3, [r4, #12]
	str	r3, [r4, #28]
	str	r3, [r4, #40]
	b	.L255
.L328:
	ldr	r3, .L329+40
	mov	r2, r7
	ldr	r1, [r3]
	ldr	r0, .L329+44
	ldr	r3, .L329+36
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldrh	r1, [r5]
	ldr	r3, .L329+16
	tst	r1, #1
	str	r3, [r4, #8]
	strh	r7, [r4, #48]	@ movhi
	str	r7, [r4, #40]
	str	r2, [r4, #28]
	ldrne	r3, .L329+48
	bne	.L269
	ldrh	r3, [r6]
	tst	r3, #1
	bne	.L270
	b	.L268
.L241:
	mvn	r0, #191
	ldr	r1, [r4, #4]
	str	r0, [r3, #20]
	str	r1, [r3, #4]
	b	.L242
.L284:
	mov	r8, #1
	b	.L240
.L330:
	.align	2
.L329:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	67109120
	.word	-416
	.word	__aeabi_idivmod
	.word	fireBalls
	.word	fireBallSound_length
	.word	fireBallSound_data
	.word	playSoundB
	.word	jumpSound_length
	.word	jumpSound_data
	.word	-402
	.size	updateMario, .-updateMario
	.align	2
	.global	drawMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMario, %function
drawMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L343
	ldrsh	r3, [r1, #60]
	cmp	r3, #1
	push	{r4, lr}
	beq	.L332
	cmp	r3, #2
	beq	.L333
	cmp	r3, #0
	beq	.L334
	ldr	r0, .L343+4
	ldrh	r3, [r0, #2]
.L335:
	ldrsh	r2, [r1, #46]
	cmp	r2, #0
	orrne	r3, r3, #4096
	biceq	r3, r3, #4096
	strh	r3, [r0, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L332:
	ldr	r3, .L343+8
	ldr	r2, [r3]
	ldrsh	r3, [r1, #44]
	ldr	r0, [r1]
	cmp	r3, #0
	ldr	r3, .L343+12
	rsb	r2, r2, r0, asr #6
	ldr	r3, [r3]
	ldr	r0, [r1, #4]
	and	r2, r2, #255
	rsb	r3, r3, r0, asr #6
	ldr	ip, [r1, #28]
	orrne	r2, r2, #33280
	orreq	r2, r2, #32768
	rsbs	r0, r3, #0
	ldr	lr, [r1, #36]
	and	r0, r0, #255
	and	r3, r3, #255
	add	ip, ip, #4
	rsbpl	r3, r0, #0
	lsl	r3, r3, #23
	ldr	r0, .L343+4
	add	ip, ip, lr, lsl #6
	lsr	r3, r3, #23
	lsl	ip, ip, #1
	strh	ip, [r0, #4]	@ movhi
	strh	r2, [r0]	@ movhi
	orr	r3, r3, #32768
	b	.L335
.L334:
	ldr	r3, .L343+8
	ldr	r2, [r1]
	ldr	r3, [r3]
	rsb	r3, r3, r2, asr #6
	ldrsh	r0, [r1, #44]
	rsbs	r2, r3, #0
	and	r2, r2, #255
	and	r3, r3, #255
	rsbpl	r3, r2, #0
	cmp	r0, #0
	andne	r3, r3, #255
	orrne	r2, r3, #512
	andeq	r2, r3, #255
	ldr	r3, .L343+12
	ldr	r0, [r1, #4]
	ldr	r3, [r3]
	rsb	r3, r3, r0, asr #6
	rsbs	r0, r3, #0
	ldr	lr, [r1, #36]
	ldr	ip, [r1, #28]
	and	r0, r0, #255
	and	r3, r3, #255
	rsbpl	r3, r0, #0
	lsl	r3, r3, #23
	ldr	r0, .L343+4
	add	ip, ip, lr, lsl #5
	lsr	r3, r3, #23
	lsl	ip, ip, #1
	strh	ip, [r0, #4]	@ movhi
	strh	r2, [r0]	@ movhi
	orr	r3, r3, #16384
	b	.L335
.L333:
	ldr	r3, .L343+12
	ldr	ip, [r1, #4]
	ldr	r3, [r3]
	ldr	r2, .L343+8
	rsb	r3, r3, ip, asr #6
	ldr	r4, [r2]
	ldr	ip, [r1]
	ldr	lr, [r1, #28]
	rsbs	r0, r3, #0
	rsb	r4, r4, ip, asr #6
	ldr	ip, [r1, #36]
	and	r0, r0, #255
	add	lr, lr, #4
	and	r3, r3, #255
	ldr	r2, .L343+16
	rsbpl	r3, r0, #0
	add	lr, lr, ip, lsl #6
	ldr	r0, .L343+4
	lsl	ip, r3, #23
	and	r4, r4, #255
	lsl	lr, lr, #1
	orr	r4, r4, r2
	orr	lr, lr, #4096
	lsr	ip, ip, #23
	and	r3, r2, #32768
	strh	r4, [r0]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	orr	r3, r3, ip
	b	.L335
.L344:
	.align	2
.L343:
	.word	player
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.word	-32768
	.size	drawMario, .-drawMario
	.comm	player,72,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
