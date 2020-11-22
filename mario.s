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
	mov	lr, #1280
	mov	r1, #16
	mov	ip, #14272
	ldr	r3, .L4+16
	ldr	r0, .L4+20
	ldr	r4, [r3]
	ldr	r0, [r0]
	ldr	r3, .L4+24
	stm	r3, {ip, lr}
	str	r4, [r3, #56]
	str	r0, [r3, #60]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #36]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
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
	ldrsh	r2, [r3, #54]
	cmp	r2, #0
	ldr	r2, [r3, #56]
	addne	ip, ip, #2
	addne	r2, r2, #2
	addeq	ip, ip, #1
	addeq	r2, r2, #1
	str	ip, [lr]
	str	r2, [r3, #56]
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
	ldr	r1, [r3, #60]
	add	r0, r0, r2, asr #6
	cmp	r0, #96
	add	r2, r1, r2, asr #6
	str	r2, [r3, #60]
	movgt	r2, #96
	str	r0, [lr]
	strgt	r2, [r3, #60]
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
	ldrsh	r2, [r3, #54]
	cmp	r2, #0
	ldr	r2, [r3, #56]
	subne	r0, r0, #2
	subne	r2, r2, #2
	subeq	r0, r0, #1
	subeq	r2, r2, #1
	str	r0, [ip]
	str	r2, [r3, #56]
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
	ldr	r1, [r3, #60]
	add	r0, r0, r2, asr #6
	cmp	r0, #0
	add	r2, r1, r2, asr #6
	str	r0, [ip]
	str	r2, [r3, #60]
	movlt	r2, #0
	strlt	r2, [ip]
	strlt	r2, [r3, #60]
	b	.L9
.L20:
	.align	2
.L19:
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
	ldr	ip, .L83
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
	ble	.L22
	add	lr, r5, r0
	cmp	r2, lr, asr #6
	bge	.L79
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
	ldr	r9, .L83+4
	add	r2, r2, r6, lsl #8
	add	r7, r7, r3
	lsl	r2, r2, #1
	add	r4, r7, r7, lsl #2
	sub	r2, r2, #2
	lsl	r6, r6, #9
	add	r7, r7, r4, lsl #1
	str	r9, [sp, #8]
	ldr	r8, .L83+8
	rsb	r6, r6, #0
	add	r2, r9, r2
	lsl	r7, r7, #9
.L26:
	ldrh	r4, [r2, #2]!
	cmp	r4, #992
	cmpne	r4, r8
	add	r9, r6, r2
	bne	.L24
	ldrh	r4, [r9, r7]
	cmp	r4, #992
	cmpne	r4, r8
	beq	.L25
.L24:
	lsl	r0, r1, #6
	mov	lr, r0
	mov	r5, #0
	mov	r10, #1
.L25:
	add	r1, r1, #1
	cmp	r1, lr, asr #6
	blt	.L26
	cmp	r10, #0
	asrne	r2, r0, #6
	strne	r0, [ip, #4]
	strne	r2, [sp]
	strne	r5, [ip, #12]
.L23:
	ldr	r7, [ip, #8]
	cmp	r7, #0
	ble	.L80
	add	r2, r7, fp
	cmp	r3, r2, asr #6
	bge	.L80
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
	ldrsh	r4, [ip, #52]
	ldr	r9, .L83+8
	add	r2, r5, r2, lsl #1
	lsl	r6, r6, #1
	add	r8, r8, #4
	b	.L33
.L31:
	mov	r4, #1
	mov	lr, #0
	mov	r10, r4
	lsl	r0, r1, #6
	sub	r0, r0, #64
.L32:
	add	r1, r1, #1
	add	r5, lr, r0
	cmp	r1, r5, asr #6
	add	r2, r2, #5632
	bge	.L81
.L33:
	add	r5, r6, r2
	ldrh	r5, [r5, r8]
	cmp	r5, r9
	bne	.L31
	ldrh	r5, [r2]
	cmp	r5, r9
	bne	.L31
	b	.L32
.L81:
	cmp	r10, #0
	beq	.L30
	mov	r7, lr
	mov	fp, r0
	ldr	r2, [sp, #4]
	add	r2, r2, r0, asr #6
	str	lr, [ip, #8]
	str	r0, [ip]
	strh	r4, [ip, #52]	@ movhi
	str	r2, [sp, #12]
	asr	r3, r0, #6
.L30:
	ldr	r2, [sp, #4]
	add	r2, r3, r2
	add	r1, r2, r2, lsl #2
	add	r2, r2, r1, lsl #1
	ldr	r1, [sp]
	ldr	r0, [sp, #8]
	add	r1, r1, r2, lsl #8
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	ldr	r0, .L83+8
	cmp	r1, r0
	lsl	r2, r2, #8
	bne	.L34
	ldr	r0, [ip, #16]
	add	r2, r2, r0
	ldr	r0, [sp]
	add	r2, r2, r0
	ldr	r0, [sp, #8]
	add	r2, r0, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, r1
	moveq	r2, #0
	strheq	r2, [ip, #52]	@ movhi
.L34:
	cmp	r7, #0
	blt	.L82
.L35:
	ldr	r3, [sp, #12]
	cmp	r3, #255
	movgt	r2, #1
	ldrgt	r3, .L83+12
	strhgt	r2, [r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L80:
	ldr	r2, [sp, #4]
	add	r2, r2, r3
	str	r2, [sp, #12]
	b	.L30
.L22:
	bge	.L79
	add	lr, r5, r0
	ldr	r1, [sp]
	asr	r2, lr, #6
	bic	r2, r2, r2, asr #31
	cmp	r2, r1
	bge	.L79
	mov	r9, #0
	ldr	r4, [sp, #4]
	ldr	r1, [sp]
	sub	r6, r4, #1
	add	r10, r3, r3, lsl #2
	ldr	r8, .L83+4
	add	r10, r3, r10, lsl #1
	add	r6, r6, r3
	mov	r2, r1
	add	r4, r6, r6, lsl #2
	add	r1, r1, r10, lsl #8
	add	r1, r1, #1
	lsl	r10, r10, #9
	add	r6, r6, r4, lsl #1
	str	r8, [sp, #8]
	ldr	r7, .L83+8
	rsb	r10, r10, #0
	add	r1, r8, r1, lsl #1
	lsl	r6, r6, #9
.L29:
	ldrh	r4, [r1, #-2]!
	cmp	r4, #992
	cmpne	r4, r7
	add	r8, r6, r1
	lsl	r4, r2, #6
	sub	r2, r2, #1
	bne	.L27
	ldrh	r8, [r8, r10]
	cmp	r8, #992
	cmpne	r8, r7
	beq	.L28
.L27:
	add	r0, r4, #64
	mov	lr, r0
	mov	r5, #0
	mov	r9, #1
.L28:
	asr	r4, lr, #6
	bic	r4, r4, r4, asr #31
	cmp	r4, r2
	blt	.L29
	cmp	r9, #0
	asrne	r2, r0, #6
	strne	r0, [ip, #4]
	strne	r5, [ip, #12]
	strne	r2, [sp]
	b	.L23
.L82:
	add	lr, fp, r7
	cmp	r3, lr, asr #6
	ble	.L35
	ldr	r4, .L83+8
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
.L38:
	add	r9, r2, r0
	ldrh	r9, [r9, r8]
	cmp	r9, #992
	cmpne	r9, r4
	sub	r1, r1, #1
	ldrh	r9, [r2, #-4]
	bne	.L36
	cmp	r9, r6
	beq	.L37
.L36:
	cmp	r9, #992
	movne	r7, r3
	movne	r5, #1
	addne	lr, r3, fp
.L37:
	cmp	r1, lr, asr #6
	sub	r2, r2, #5632
	sub	r3, r3, #64
	bgt	.L38
	cmp	r5, #0
	strne	r7, [ip, #8]
	b	.L35
.L79:
	ldr	r2, .L83+4
	str	r2, [sp, #8]
	b	.L23
.L84:
	.align	2
.L83:
	.word	player
	.word	Level1CollisionMapBitmap
	.word	32767
	.word	shouldLose
	.size	checkCollisionWithMap, .-checkCollisionWithMap
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
	ldr	r3, .L164
	ldrh	r3, [r3, #48]
	tst	r3, #2
	moveq	r3, #1
	push	{r4, lr}
	ldreq	r4, .L164+4
	strheq	r3, [r4, #54]	@ movhi
	ldr	r3, .L164+8
	ldrh	r0, [r3]
	ldr	r3, .L164+12
	ldrne	r4, .L164+4
	ands	r1, r0, #2
	ldrh	r3, [r3]
	bne	.L90
	tst	r3, #2
	beq	.L90
	strh	r1, [r4, #54]	@ movhi
	ldr	ip, .L164
	ldrh	r2, [ip, #48]
	ldr	lr, [r4, #28]
	ands	r2, r2, #32
	str	lr, [r4, #32]
	beq	.L132
	ldrh	r2, [ip, #48]
	tst	r2, #16
	beq	.L92
	ldr	r2, [r4, #12]
.L97:
	cmp	r2, #192
	ble	.L99
	mov	r2, #192
	str	r2, [r4, #12]
.L100:
	cmp	r1, #0
	bne	.L125
	ldrsh	r2, [r4, #52]
	cmp	r2, #0
	ldr	r2, [r4, #12]
	strne	r1, [r4, #28]
	strne	r1, [r4, #40]
	cmp	r2, #0
	ble	.L103
	subs	r2, r2, #32
	bmi	.L105
.L160:
	tst	r0, #1
	str	r2, [r4, #12]
	and	r3, r3, #1
	bne	.L161
.L106:
	cmp	r3, #0
	beq	.L107
	ldrsh	r3, [r4, #52]
	cmp	r3, #0
	beq	.L162
.L107:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bge	.L109
	mov	r3, #0
	ldr	r2, [r4, #12]
	cmp	r2, r3
	str	r3, [r4, #4]
	strne	r3, [r4, #12]
.L109:
	bl	checkCollisionWithMap
	ldrsh	r1, [r4, #52]
	cmp	r1, #0
	beq	.L111
	mov	r2, #0
	ldr	r3, [r4, #28]
	cmp	r3, #2
	str	r2, [r4, #8]
	beq	.L163
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	cmp	r3, #0
	add	r2, r2, r1
	str	r2, [r4, #4]
	ldr	r0, [r4, #24]
	bne	.L114
.L113:
	mov	r3, #0
	str	r3, [r4, #36]
	str	r3, [r4, #32]
.L115:
	ldrsh	r3, [r4, #54]
	cmp	r3, #0
	movne	r1, #5
	moveq	r1, #7
	ldr	r3, .L164+16
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L118
	ldr	r3, [r4, #36]
	ldr	r2, [r4, #40]
	add	r3, r3, #1
	cmp	r3, r2
	movlt	r1, r3
	str	r1, [r4, #36]
.L118:
	pop	{r4, lr}
	b	adjustScreenOffset
.L90:
	ldr	r2, .L164
	ldrh	r1, [r2, #48]
	ldr	r2, [r4, #28]
	tst	r1, #32
	str	r2, [r4, #32]
	movne	r1, #0
	ldrsh	r2, [r4, #54]
	bne	.L89
	cmp	r2, #0
	mvneq	r1, #63
	mvnne	r1, #127
.L91:
	ldrsh	ip, [r4, #52]
	cmp	ip, #0
	movne	ip, #1
	str	r1, [r4, #12]
	movne	r1, #3
	strne	ip, [r4, #28]
	mov	ip, #0
	strne	r1, [r4, #40]
	mov	r1, #1
	str	ip, [r4, #48]
.L89:
	ldr	ip, .L164
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L95
	cmp	r2, #0
	beq	.L92
	mov	r2, #128
	ldrsh	r1, [r4, #52]
	cmp	r1, #0
	str	r2, [r4, #12]
	bne	.L130
.L158:
	mov	r2, #1
	str	r2, [r4, #48]
.L125:
	tst	r0, #1
	and	r3, r3, #1
	beq	.L106
.L161:
	cmp	r3, #0
	bne	.L107
	ldrsh	r2, [r4, #52]
	cmp	r2, #0
	beq	.L107
	mov	r1, #2
	ldr	r2, [r4, #8]
	sub	r2, r2, #416
	strh	r3, [r4, #52]	@ movhi
	str	r3, [r4, #40]
	str	r2, [r4, #8]
	str	r1, [r4, #28]
	b	.L107
.L95:
	cmp	r2, #0
	ldr	r2, [r4, #12]
	beq	.L97
	cmp	r2, #384
	movgt	r2, #384
	strgt	r2, [r4, #12]
	bgt	.L100
	cmn	r2, #384
	ldrlt	r2, .L164+20
	strlt	r2, [r4, #12]
	b	.L100
.L92:
	mov	r2, #64
	ldrsh	r1, [r4, #52]
	cmp	r1, #0
	str	r2, [r4, #12]
	beq	.L158
.L130:
	mov	r2, #1
	mov	r1, #3
	str	r2, [r4, #28]
	str	r2, [r4, #48]
	str	r1, [r4, #40]
	b	.L125
.L111:
	mov	r3, #2
	ldr	r2, [r4, #8]
	ldr	ip, [r4]
	ldr	r0, [r4, #4]
	ldr	lr, [r4, #12]
	add	r2, r2, #14
	add	r0, r0, lr
	add	ip, ip, r2
	str	r0, [r4, #4]
	str	r1, [r4, #40]
	str	r2, [r4, #8]
	str	ip, [r4]
	str	r3, [r4, #28]
	ldr	r0, [r4, #24]
.L114:
	ldr	r2, [r4, #32]
	cmp	r2, r3
	movne	r3, #0
	add	r0, r0, #1
	str	r0, [r4, #24]
	strne	r3, [r4, #36]
	b	.L115
.L103:
	beq	.L125
	add	r2, r2, #32
	cmp	r2, #0
	ble	.L160
.L105:
	mov	r2, #0
	str	r2, [r4, #12]
	str	r2, [r4, #28]
	str	r2, [r4, #40]
	b	.L125
.L162:
	ldr	r3, [r4, #8]
	cmn	r3, #256
	mvnlt	r3, #255
	strlt	r3, [r4, #8]
	b	.L107
.L132:
	mvn	r1, #63
	b	.L91
.L163:
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r3, r1
	str	r2, [r4, #28]
	str	r2, [r4, #40]
	str	r3, [r4, #4]
	ldr	r0, [r4, #24]
	b	.L113
.L99:
	cmn	r2, #192
	mvnlt	r2, #191
	strlt	r2, [r4, #12]
	b	.L100
.L165:
	.align	2
.L164:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	__aeabi_idivmod
	.word	-384
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
	ldr	r2, .L172
	ldr	r3, .L172+4
	ldr	r1, [r2, #4]
	ldr	r3, [r3]
	rsb	r3, r3, r1, asr #6
	rsbs	r1, r3, #0
	ldr	r0, .L172+8
	and	r1, r1, #255
	and	r3, r3, #255
	rsbpl	r3, r1, #0
	str	lr, [sp, #-4]!
	ldr	r1, [r0]
	ldr	lr, [r2]
	ldr	ip, [r2, #48]
	lsl	r3, r3, #23
	ldr	r0, .L172+12
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	rsb	r1, r1, lr, asr #6
	cmp	ip, #0
	strh	r3, [r0, #2]	@ movhi
	and	r1, r1, #255
	orrne	r3, r3, #4096
	strh	r1, [r0]	@ movhi
	strhne	r3, [r0, #2]	@ movhi
	ldr	r1, [r2, #36]
	ldr	r3, [r2, #28]
	add	r3, r3, r1, lsl #5
	lsl	r3, r3, #1
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L173:
	.align	2
.L172:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawMario, .-drawMario
	.comm	player,64,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
