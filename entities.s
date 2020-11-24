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
	.file	"entities.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGoomba.part.0, %function
drawGoomba.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L10
	add	r2, r3, #52
	ldm	r2, {r2, ip}
	push	{r4, lr}
	ldr	lr, [r0, #4]
	ldr	r3, [r0]
	rsb	r2, r2, lr, asr #6
	rsb	ip, ip, r3, asr #6
	lsl	lr, r2, #23
	lsr	lr, lr, #23
	lsl	r3, ip, #16
	cmp	r2, #239
	add	r1, r1, #14
	orr	lr, lr, #16384
	lsr	r3, r3, #16
	bgt	.L2
	ldr	r4, [r0, #16]
	add	r2, r2, r4
	cmp	r2, #0
	ble	.L2
	sub	ip, ip, #1
	cmp	ip, #158
	bls	.L9
.L2:
	ldr	r2, .L10+4
	and	r3, r3, #255
	lsl	r0, r1, #3
	orr	r3, r3, #512
	add	r1, r2, r1, lsl #3
	strh	r3, [r2, r0]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L9:
	mov	ip, #4160
	ldr	r0, [r0, #48]
	ldr	r2, .L10+4
	cmp	r0, #0
	and	r3, r3, #255
	lsl	r0, r1, #3
	add	r1, r2, r1, lsl #3
	strh	r3, [r2, r0]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	orrne	lr, lr, #4096
	strhne	lr, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	shadowOAM
	.size	drawGoomba.part.0, .-drawGoomba.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChomper.part.0, %function
drawChomper.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L17
	add	r2, r3, #52
	ldm	r2, {r2, ip}
	push	{r4, lr}
	ldr	lr, [r0, #4]
	ldr	r3, [r0]
	rsb	r2, r2, lr, asr #6
	rsb	ip, ip, r3, asr #6
	lsl	lr, r2, #23
	lsr	lr, lr, #23
	lsl	r3, ip, #16
	cmp	r2, #239
	add	r1, r1, #14
	orr	lr, lr, #16384
	lsr	r3, r3, #16
	bgt	.L13
	ldr	r4, [r0, #16]
	add	r2, r2, r4
	cmp	r2, #0
	ble	.L13
	sub	ip, ip, #1
	cmp	ip, #158
	bls	.L16
.L13:
	ldr	r2, .L17+4
	and	r3, r3, #255
	lsl	r0, r1, #3
	orr	r3, r3, #512
	add	r1, r2, r1, lsl #3
	strh	r3, [r2, r0]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r2, [r0, #36]
	ldr	r0, .L17+4
	add	r2, r2, #2
	lsl	ip, r1, #3
	lsl	r2, r2, #6
	add	r1, r0, r1, lsl #3
	and	r3, r3, #255
	strh	r3, [r0, ip]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	shadowOAM
	.size	drawChomper.part.0, .-drawChomper.part.0
	.align	2
	.global	initializeItemBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeItemBlocks, %function
initializeItemBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #26
	mov	lr, #9920
	mov	ip, #0
	ldr	r2, .L63
	ldr	r0, .L63+4
	str	lr, [r2]
	stmib	r2, {r0, r1}
	str	r1, [r2, #12]
	mov	r4, ip
	mov	r2, ip
	mov	lr, #16
	ldr	r3, .L63+8
	add	r1, r3, #140
	ldm	r1, {r1, r5}
	sub	sp, sp, #44
	str	r1, [sp, #20]
	ldr	r1, [r3, #116]
	str	r1, [sp, #12]
	ldr	r1, [r3, #112]
	str	r1, [sp, #16]
	ldr	r1, [r3, #60]
	str	r1, [sp, #8]
	ldr	r1, [r3, #32]
	str	r1, [sp, #4]
	ldr	r1, [r3, #4]
	str	r1, [sp, #24]
	ldr	r1, [r3]
	str	r1, [sp, #28]
	ldr	r1, [r3, #24]
	ldr	r7, [r3, #164]
	str	r1, [sp, #32]
	ldr	r9, [r3, #88]
	ldr	r10, [r3, #84]
	ldr	r8, [r3, #56]
	ldr	fp, [r3, #28]
	ldr	r1, .L63+12
	str	r5, [sp, #36]
.L28:
	rsb	r0, r2, r2, lsl #3
	add	r0, r3, r0, lsl #2
	str	lr, [r0, #12]
	str	lr, [r0, #8]
	str	r4, [r0, #16]
	str	r4, [r0, #20]
	mov	r0, #30	@ movhi
	add	r5, r2, #1
	add	r6, r1, r5, lsl #3
	sub	r2, r2, #1
	strh	r0, [r6, #4]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L20
.L22:
	.word	.L27
	.word	.L37
	.word	.L25
	.word	.L38
	.word	.L39
	.word	.L40
.L27:
	mov	r2, #0
	mov	r0, #16
	str	r2, [r3, #72]
	str	r2, [r3, #76]
	mov	lr, #30
	mov	r2, #12160
	str	r0, [r3, #68]
	str	r0, [r3, #64]
	mov	fp, #11264
	mov	r0, #1
	strh	lr, [r1, #28]	@ movhi
	str	r2, [sp, #4]
.L26:
	mov	r4, #16
	mov	lr, #0
	mov	r8, #8192
	mov	r2, #1
	str	r4, [r3, #96]
	str	r4, [r3, #92]
	str	r4, [r3, #124]
	str	r4, [r3, #120]
	mov	r5, #30
	mov	r4, #14208
	str	lr, [r3, #100]
	str	lr, [r3, #104]
	str	lr, [r3, #128]
	str	lr, [r3, #132]
	mov	r10, r8
	mov	lr, r2
	mov	r9, #15232
	strh	r5, [r1, #36]	@ movhi
	strh	r5, [r1, #44]	@ movhi
	str	r4, [sp, #8]
.L24:
	mov	r4, #0
	mov	r5, #16
	str	r4, [r3, #156]
	str	r4, [r3, #160]
	mov	r6, #30
	mov	r4, #9216
	str	r5, [r3, #152]
	str	r5, [r3, #148]
	strh	r6, [r1, #52]	@ movhi
	str	r4, [sp, #16]
	mov	r4, #1
	ldr	r5, .L63+16
	str	r5, [sp, #12]
.L23:
	mov	r5, #0
	mov	r6, #16
	mov	r7, #30
	str	r5, [r3, #184]
	str	r5, [r3, #188]
	str	r6, [r3, #180]
	str	r6, [r3, #176]
	strh	r7, [r1, #60]	@ movhi
	mov	r1, #11264
	mov	r7, #2
	str	r1, [sp, #20]
	mov	r1, #1
	ldr	r5, .L63+20
.L21:
	cmp	ip, #0
	beq	.L30
	ldr	ip, [sp, #24]
	str	ip, [r3, #4]
	ldr	ip, [sp, #28]
	str	ip, [r3]
	ldr	ip, [sp, #32]
	str	ip, [r3, #24]
.L30:
	cmp	r0, #0
	ldrne	r0, [sp, #4]
	strne	fp, [r3, #28]
	strne	r0, [r3, #32]
	cmp	r2, #0
	ldrne	r2, [sp, #8]
	strne	r8, [r3, #56]
	strne	r2, [r3, #60]
	cmp	lr, #0
	strne	r9, [r3, #88]
	strne	r10, [r3, #84]
	cmp	r4, #0
	ldrne	r2, [sp, #12]
	strne	r2, [r3, #116]
	ldrne	r2, [sp, #16]
	strne	r2, [r3, #112]
	cmp	r1, #0
	mov	r1, #12288
	ldrne	r2, [sp, #20]
	strne	r2, [r3, #140]
	ldr	r2, .L63+24
	strne	r5, [r3, #144]
	strne	r7, [r3, #164]
	str	r1, [r3, #168]
	str	r2, [r3, #172]
.L19:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	mov	r0, #0
	mov	lr, #16
	mov	r4, #30
	str	lr, [r3, #124]
	str	lr, [r3, #120]
	str	r0, [r3, #128]
	str	r0, [r3, #132]
	mov	r2, r0
	mov	r10, #8192
	mov	lr, #1
	mov	r9, #15232
	strh	r4, [r1, #44]	@ movhi
	b	.L24
.L40:
	mov	r2, #0
	ldr	r5, [sp, #36]
	mov	r0, r2
	mov	r1, r2
	mov	r4, r2
	mov	lr, r2
	b	.L21
.L37:
	mov	r0, #0
	b	.L26
.L39:
	mov	r2, #0
	mov	r0, r2
	mov	r4, r2
	mov	lr, r2
	b	.L23
.L38:
	mov	r2, #0
	mov	r0, r2
	mov	lr, r2
	b	.L24
.L20:
	mov	r2, #11136
	mov	ip, #1
	str	r2, [sp, #24]
	mov	r2, #11264
	cmp	r5, #7
	str	ip, [sp, #32]
	str	r2, [sp, #28]
	bne	.L62
	mov	r2, #11136
	mov	r1, #11264
	stm	r3, {r1, r2}
	mov	r2, #1
	str	r2, [r3, #24]
	b	.L19
.L62:
	mov	r2, r5
	b	.L28
.L64:
	.align	2
.L63:
	.word	goal
	.word	171584
	.word	itemBlocks
	.word	shadowOAM
	.word	26496
	.word	44928
	.word	94080
	.size	initializeItemBlocks, .-initializeItemBlocks
	.align	2
	.global	initializeEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeEnemies, %function
initializeEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #16
	mov	r1, #1
	mov	r0, #3
	push	{r4, r5, r6, lr}
	mov	ip, #0
	mov	r4, #14336
	mov	lr, #64
	mov	r5, #13312
	mov	r6, #12800
	ldr	r3, .L67
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #80]
	str	r2, [r3, #76]
	str	r2, [r3, #140]
	str	r2, [r3, #136]
	str	r2, [r3, #200]
	str	r2, [r3, #196]
	str	r2, [r3, #260]
	str	r2, [r3, #256]
	str	r2, [r3, #320]
	str	r2, [r3, #316]
	str	r2, [r3, #380]
	str	r2, [r3, #376]
	str	r2, [r3, #440]
	str	r2, [r3, #436]
	str	r0, [r3, #40]
	str	r0, [r3, #100]
	str	r0, [r3, #160]
	str	r0, [r3, #220]
	str	r0, [r3, #280]
	str	r0, [r3, #340]
	str	r0, [r3, #400]
	str	r1, [r3, #56]
	str	r1, [r3, #116]
	str	r1, [r3, #176]
	str	r1, [r3, #236]
	str	r1, [r3, #296]
	str	r1, [r3, #356]
	str	r1, [r3, #416]
	str	r1, [r3, #476]
	str	r0, [r3, #460]
	str	r2, [r3, #500]
	str	r2, [r3, #496]
	str	r2, [r3, #560]
	str	r2, [r3, #556]
	ldr	r2, .L67+4
	str	r2, [r3, #64]
	add	r2, r2, #15168
	str	r2, [r3, #124]
	ldr	r2, .L67+8
	str	r2, [r3, #184]
	add	r2, r2, #2816
	str	r2, [r3, #244]
	add	r2, r2, #3584
	str	r2, [r3, #304]
	add	r2, r2, #7232
	str	r2, [r3, #364]
	add	r2, r2, #4608
	str	r0, [r3, #520]
	str	r0, [r3, #580]
	str	r6, [r3, #4]
	str	r4, [r3]
	str	r4, [r3, #60]
	str	r4, [r3, #360]
	str	lr, [r3, #12]
	str	lr, [r3, #72]
	str	lr, [r3, #192]
	str	lr, [r3, #252]
	str	r5, [r3, #120]
	str	r5, [r3, #180]
	str	r5, [r3, #240]
	str	r1, [r3, #536]
	str	r1, [r3, #596]
	str	r1, [r3, #172]
	str	r1, [r3, #352]
	str	r1, [r3, #412]
	ldr	r0, .L67+12
	str	ip, [r3, #52]
	str	ip, [r3, #112]
	str	ip, [r3, #232]
	str	ip, [r3, #292]
	str	r5, [r3, #300]
	str	r2, [r3, #424]
	ldr	r2, .L67+16
	str	r4, [r3, #420]
	str	lr, [r3, #432]
	str	r4, [r3, #480]
	str	r4, [r3, #540]
	str	lr, [r3, #552]
	str	ip, [r3, #472]
	str	r1, [r3, #532]
	str	ip, [r3, #592]
	str	r0, [r3, #484]
	str	r2, [r3, #544]
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	enemies
	.word	24640
	.word	62016
	.word	95040
	.word	120768
	.size	initializeEnemies, .-initializeEnemies
	.align	2
	.global	initializeFireBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeFireBalls, %function
initializeFireBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #192
	mov	r2, #0
	mov	r1, #8
	ldr	r3, .L73
	add	r0, r3, #108
.L70:
	str	ip, [r3, #20]
	str	r2, [r3, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3], #36
	cmp	r3, r0
	bne	.L70
	bx	lr
.L74:
	.align	2
.L73:
	.word	fireBalls
	.size	initializeFireBalls, .-initializeFireBalls
	.align	2
	.global	FIREBALLCheckCollisionWithEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	FIREBALLCheckCollisionWithEnemies, %function
FIREBALLCheckCollisionWithEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #0
	mov	r5, r0
	ldr	r4, .L84
	ldr	r8, .L84+4
	sub	sp, sp, #16
	add	r7, r4, #600
.L78:
	ldm	r4, {r2, r3}
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	asr	r0, r0, #6
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L76
	ldr	r3, [r4, #52]
	cmp	r3, #0
	streq	r3, [r4, #56]
	streq	r3, [r4, #4]
	streq	r3, [r4]
	str	r6, [r5, #28]
	str	r6, [r5, #4]
	str	r6, [r5]
.L76:
	add	r4, r4, #60
	cmp	r4, r7
	bne	.L78
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	enemies
	.word	collision
	.size	FIREBALLCheckCollisionWithEnemies, .-FIREBALLCheckCollisionWithEnemies
	.align	2
	.global	FIREBALLCheckCollisionWithCollisionMap
	.syntax unified
	.arm
	.fpu softvfp
	.type	FIREBALLCheckCollisionWithCollisionMap, %function
FIREBALLCheckCollisionWithCollisionMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	lr, [r0, #16]
	ldr	r5, [r0, #4]
	cmp	lr, #0
	asr	ip, r5, #6
	ble	.L87
	ldr	r1, [r0]
	add	r4, lr, r1
	asr	r4, r4, #6
	cmp	r4, r1, asr #6
	asr	r1, r1, #6
	ble	.L87
	ldr	r3, [r0, #12]
	add	r3, r1, r3
	sub	r3, r3, #1
	ldr	r6, .L129
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	ldr	r7, .L129+4
	lsl	r3, r3, #8
	add	r8, r6, ip, lsl #1
.L89:
	lsl	r2, r3, #1
	ldrh	r2, [r8, r2]
	cmp	r2, r7
	bne	.L88
	ldr	r2, [r0, #8]
	add	r2, r3, r2
	add	r2, r2, ip
	add	r2, r6, r2, lsl #1
	ldrh	r2, [r2, #-4]
	cmp	r2, r7
	beq	.L126
.L88:
	mvn	r3, #207
	str	r3, [r0, #16]
.L86:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L126:
	add	r1, r1, #1
	cmp	r1, r4
	add	r3, r3, #2816
	bne	.L89
.L87:
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ble	.L91
	add	r5, r3, r5
	cmp	ip, r5, asr #6
	asr	r5, r5, #6
	bge	.L92
	ldr	r4, [r0]
	ldr	r3, [r0, #8]
	asr	r4, r4, #6
	sub	r2, r3, #-2147483647
	add	r1, r4, r4, lsl #2
	add	r1, r4, r1, lsl #1
	ldr	r6, .L129
	add	r2, r2, ip
	add	r2, r2, r1, lsl #8
	ldr	r8, .L129+4
	add	r1, r3, ip
	sub	r3, r3, #1
	add	r2, r6, r2, lsl #1
	sub	r1, r1, #1
	add	r5, r3, r5
.L94:
	ldrh	r3, [r2], #2
	cmp	r3, #992
	cmpne	r3, r8
	bne	.L93
	ldr	r7, [r0, #12]
	add	r3, r4, r7
	sub	r3, r3, #1
	add	r9, r3, r3, lsl #2
	add	r3, r3, r9, lsl #1
	add	r3, r1, r3, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #992
	cmpne	r3, r8
	add	r1, r1, #1
	bne	.L93
	cmp	r5, r1
	bne	.L94
.L95:
	cmp	ip, #0
	movle	r3, #0
	movle	r2, r3
	movle	r5, r2
	ldrgt	r5, [r0]
	strle	r3, [r0, #28]
	strle	r3, [r0, #4]
	strle	r3, [r0]
	asrgt	r2, r5, #6
.L98:
	cmp	lr, #0
	blt	.L127
.L100:
	add	r7, r7, r2
	cmp	r7, #255
	ble	.L86
.L93:
	mov	r3, #0
	pop	{r4, r5, r6, r7, r8, r9, lr}
	str	r3, [r0, #28]
	str	r3, [r0, #4]
	str	r3, [r0]
	bx	lr
.L91:
	bne	.L96
.L92:
	ldr	r7, [r0, #12]
	b	.L95
.L96:
	add	r3, r3, r5
	asr	r3, r3, #6
	bic	r3, r3, r3, asr #31
	cmp	r3, ip
	bge	.L92
	ldr	r5, [r0]
	asr	r2, r5, #6
	add	r4, r2, r2, lsl #2
	add	r4, r2, r4, lsl #1
	ldr	r6, .L129
	add	r4, ip, r4, lsl #8
	add	r4, r4, #1
	ldr	r8, .L129+4
	add	r4, r6, r4, lsl #1
.L97:
	ldrh	r1, [r4, #-2]!
	cmp	r1, #992
	cmpne	r1, r8
	bne	.L93
	ldr	r7, [r0, #12]
	add	r1, r7, r2
	sub	r1, r1, #1
	add	r9, r1, r1, lsl #2
	add	r1, r1, r9, lsl #1
	add	r1, ip, r1, lsl #8
	lsl	r1, r1, #1
	ldrh	r1, [r6, r1]
	cmp	r1, #992
	cmpne	r1, r8
	sub	ip, ip, #1
	bne	.L93
	cmp	r3, ip
	bne	.L97
	b	.L98
.L127:
	add	r5, lr, r5
	cmp	r2, r5, asr #6
	ble	.L100
	ldr	r4, .L129+4
	add	r1, r2, r2, lsl #2
	add	r1, r2, r1, lsl #1
	mov	ip, #0
	mov	r8, r4
	ldr	r5, [r0, #8]
	ldr	r6, .L129
	lsl	r1, r1, #8
	b	.L104
.L103:
	mov	r3, lr
	mov	r9, #0
	str	ip, [r0, #28]
	str	ip, [r0, #4]
	str	ip, [r0]
.L102:
	sub	r2, r2, #1
	cmp	r2, r3, asr #6
	sub	r1, r1, #2816
	ble	.L128
.L104:
	ldr	r3, [r0, #4]
	add	r3, r1, r3, asr #6
	lsl	r9, r3, #1
	ldrh	r9, [r6, r9]
	cmp	r9, #992
	cmpne	r9, r4
	add	r3, r3, r5
	add	r3, r6, r3, lsl #1
	ldrh	r3, [r3, #-4]
	bne	.L101
	cmp	r3, r8
	beq	.L125
.L101:
	cmp	r3, #992
	bne	.L103
.L125:
	ldr	r9, [r0]
	add	r3, lr, r9
	b	.L102
.L128:
	asr	r2, r9, #6
	b	.L100
.L130:
	.align	2
.L129:
	.word	Level1CollisionMapBitmap
	.word	32767
	.size	FIREBALLCheckCollisionWithCollisionMap, .-FIREBALLCheckCollisionWithCollisionMap
	.align	2
	.global	FIREBALLCheckCollisionWithItemBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	FIREBALLCheckCollisionWithItemBlocks, %function
FIREBALLCheckCollisionWithItemBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	ldr	r4, .L162
	ldr	r6, .L162+4
	ldr	r7, .L162+8
	sub	sp, sp, #20
	add	r8, r4, #196
.L133:
	ldr	r2, [r4, #4]
	ldr	r3, [r6, #52]
	rsb	r3, r3, r2, asr #6
	cmp	r3, #239
	asr	r2, r2, #6
	bgt	.L135
	ldr	ip, [r4, #8]
	add	r3, r3, ip
	cmp	r3, #0
	ble	.L135
	ldr	r1, [r4]
	ldr	r3, [r6, #56]
	rsb	r3, r3, r1, asr #6
	sub	r3, r3, #1
	cmp	r3, #158
	asr	r1, r1, #6
	bhi	.L135
	ldr	r0, [r5, #16]
	cmp	r0, #0
	bgt	.L157
.L136:
	ldr	r2, [r5, #20]
	cmp	r2, #0
	bgt	.L158
.L139:
	cmp	r2, #0
	blt	.L154
.L156:
	ldr	r0, [r5, #16]
.L143:
	cmp	r0, #0
	blt	.L159
.L135:
	add	r4, r4, #28
	cmp	r4, r8
	bne	.L133
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L157:
	ldr	r9, [r5]
	add	r3, r0, r9
	asr	r3, r3, #6
	cmp	r3, r9, asr #6
	asr	r9, r9, #6
	bgt	.L138
	b	.L136
.L137:
	ldr	r3, [r5]
	ldr	r0, [r5, #16]
	add	r3, r3, r0
	cmp	r9, r3, asr #6
	bge	.L136
	ldm	r4, {r1, r2}
	ldr	ip, [r4, #8]
	asr	r2, r2, #6
	asr	r1, r1, #6
.L138:
	ldr	r3, [r4, #12]
	ldr	r0, [r5, #4]
	stmib	sp, {r1, ip}
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r5, #8
	mov	r1, r9
	ldm	r2, {r2, r3}
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	add	r9, r9, #1
	beq	.L137
	mvn	r3, #207
	str	r3, [r5, #16]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L158:
	ldr	r9, [r5, #4]
	add	r2, r2, r9
	asr	r2, r2, #6
	cmp	r2, r9, asr #6
	asr	r9, r9, #6
	bgt	.L140
	b	.L143
.L142:
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #4]
	add	r3, r2, r3
	cmp	r9, r3, asr #6
	bge	.L139
.L140:
	ldm	r4, {r2, r3}
	add	r0, r4, #8
	ldm	r0, {r0, ip}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r1, [r5]
	str	r2, [sp, #4]
	str	r0, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r5, #8
	mov	r0, r9
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	add	r9, r9, #1
	beq	.L142
.L144:
	mov	r3, #0
	str	r3, [r5, #28]
	str	r3, [r5, #4]
	str	r3, [r5]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L159:
	ldr	r9, [r5]
	add	r0, r0, r9
	asr	r0, r0, #6
	cmp	r0, r9, asr #6
	asr	r9, r9, #6
	blt	.L146
	b	.L135
.L160:
	ldr	r3, [r5]
	ldr	r2, [r5, #16]
	add	r3, r3, r2
	cmp	r9, r3, asr #6
	ble	.L135
.L146:
	ldm	r4, {r2, r3}
	add	r1, r4, #8
	ldm	r1, {r1, ip}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r0, [r5, #4]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r5, #8
	mov	r1, r9
	ldm	r2, {r2, r3}
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	sub	r9, r9, #1
	beq	.L160
	b	.L144
.L154:
	ldr	r9, [r5, #4]
	add	r2, r9, r2
	asr	r2, r2, #6
	bic	r2, r2, r2, asr #31
	cmp	r2, r9, asr #6
	asr	r9, r9, #6
	blt	.L145
	b	.L156
.L161:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #20]
	add	r3, r3, r2
	asr	r3, r3, #6
	bic	r3, r3, r3, asr #31
	cmp	r3, r9
	bge	.L156
.L145:
	ldm	r4, {r2, r3}
	add	r0, r4, #8
	ldm	r0, {r0, ip}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r1, [r5]
	str	r2, [sp, #4]
	str	r0, [sp, #8]
	str	r3, [sp]
	str	ip, [sp, #12]
	add	r2, r5, #8
	mov	r0, r9
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	sub	r9, r9, #1
	beq	.L161
	b	.L144
.L163:
	.align	2
.L162:
	.word	itemBlocks
	.word	player
	.word	collision
	.size	FIREBALLCheckCollisionWithItemBlocks, .-FIREBALLCheckCollisionWithItemBlocks
	.align	2
	.global	updateFireBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFireBalls, %function
updateFireBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L173
	add	r5, r4, #108
.L166:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L172
.L165:
	add	r4, r4, #36
	cmp	r4, r5
	bne	.L166
	pop	{r4, r5, r6, lr}
	bx	lr
.L172:
	mov	r0, r4
	bl	FIREBALLCheckCollisionWithItemBlocks
	mov	r0, r4
	bl	FIREBALLCheckCollisionWithEnemies
	mov	r0, r4
	bl	FIREBALLCheckCollisionWithCollisionMap
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r2, [r4]
	ldr	r0, [r4, #20]
	add	r2, r2, r3
	add	r1, r1, r0
	add	r3, r3, #14
	str	r1, [r4, #4]
	str	r2, [r4]
	str	r3, [r4, #16]
	b	.L165
.L174:
	.align	2
.L173:
	.word	fireBalls
	.size	updateFireBalls, .-updateFireBalls
	.align	2
	.global	GOOMBACheckCollisionWithEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	GOOMBACheckCollisionWithEnemies, %function
GOOMBACheckCollisionWithEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r4, .L185
	ldr	r7, .L185+4
	sub	sp, sp, #20
	add	r6, r4, #600
.L179:
	cmp	r5, r4
	beq	.L177
	ldm	r4, {r2, r3}
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	asr	r2, r2, #6
	asr	r3, r3, #6
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	asr	r1, r1, #6
	asr	r0, r0, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r5, #12]
	rsbne	r3, r3, #0
	strne	r3, [r5, #12]
.L177:
	add	r4, r4, #60
	cmp	r4, r6
	bne	.L179
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L186:
	.align	2
.L185:
	.word	enemies
	.word	collision
	.size	GOOMBACheckCollisionWithEnemies, .-GOOMBACheckCollisionWithEnemies
	.align	2
	.global	GOOMBACheckCollisionWithCollisionMap
	.syntax unified
	.arm
	.fpu softvfp
	.type	GOOMBACheckCollisionWithCollisionMap, %function
GOOMBACheckCollisionWithCollisionMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #12]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, [r0, #4]
	cmp	r1, #0
	asr	r4, lr, #6
	ble	.L188
	add	lr, r1, lr
	cmp	r4, lr, asr #6
	asr	lr, lr, #6
	bge	.L189
	ldr	r5, [r0]
	ldr	r3, [r0, #16]
	asr	r5, r5, #6
	sub	r2, r3, #-2147483647
	add	ip, r5, r5, lsl #2
	add	ip, r5, ip, lsl #1
	ldr	r6, .L213
	add	r2, r2, r4
	add	r2, r2, ip, lsl #8
	ldr	r7, .L213+4
	add	ip, r3, r4
	sub	r3, r3, #1
	add	r2, r6, r2, lsl #1
	sub	ip, ip, #1
	add	lr, r3, lr
.L191:
	ldrh	r3, [r2], #2
	cmp	r3, #992
	cmpne	r3, r7
	bne	.L210
	ldr	r3, [r0, #20]
	add	r3, r5, r3
	sub	r3, r3, #1
	add	r8, r3, r3, lsl #2
	add	r3, r3, r8, lsl #1
	add	r3, ip, r3, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #992
	cmpne	r3, r7
	add	ip, ip, #1
	beq	.L212
.L210:
	rsb	r1, r1, #0
	str	r1, [r0, #12]
.L187:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L212:
	cmp	lr, ip
	bne	.L191
.L189:
	cmp	r4, #0
	ble	.L210
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L188:
	beq	.L189
	add	lr, r1, lr
	asr	lr, lr, #6
	bic	lr, lr, lr, asr #31
	cmp	lr, r4
	bge	.L189
	ldr	ip, [r0]
	asr	ip, ip, #6
	add	r2, ip, ip, lsl #2
	add	r2, ip, r2, lsl #1
	ldr	r6, .L213
	add	r2, r4, r2, lsl #8
	add	r2, r2, #1
	ldr	r5, .L213+4
	add	r2, r6, r2, lsl #1
.L194:
	ldrh	r3, [r2, #-2]!
	cmp	r3, #992
	cmpne	r3, r5
	bne	.L210
	ldr	r3, [r0, #20]
	add	r3, ip, r3
	sub	r3, r3, #1
	add	r7, r3, r3, lsl #2
	add	r3, r3, r7, lsl #1
	add	r3, r4, r3, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #992
	cmpne	r3, r5
	sub	r4, r4, #1
	bne	.L210
	cmp	lr, r4
	bne	.L194
	b	.L187
.L214:
	.align	2
.L213:
	.word	Level1CollisionMapBitmap
	.word	32767
	.size	GOOMBACheckCollisionWithCollisionMap, .-GOOMBACheckCollisionWithCollisionMap
	.align	2
	.global	updateGoomba
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGoomba, %function
updateGoomba:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	GOOMBACheckCollisionWithEnemies
	mov	r0, r4
	bl	GOOMBACheckCollisionWithCollisionMap
	ldr	r2, [r4, #24]
	add	r3, r2, r2, lsl #4
	ldr	r1, .L218
	add	r3, r3, r3, lsl #8
	ldr	r0, .L218+4
	add	r3, r3, r3, lsl #16
	sub	r1, r1, r3
	cmp	r1, r0
	bcs	.L216
	ldr	r3, [r4, #48]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r4, #48]
.L216:
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	add	r2, r2, #1
	add	r3, r3, r1
	str	r2, [r4, #24]
	str	r3, [r4, #4]
	pop	{r4, lr}
	bx	lr
.L219:
	.align	2
.L218:
	.word	143165576
	.word	286331153
	.size	updateGoomba, .-updateGoomba
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L235
	mov	r7, #0
	ldr	r6, .L235+4
	ldr	r5, .L235+8
	add	r8, r4, #600
	b	.L227
.L234:
	cmp	r3, #1
	bne	.L221
	ldr	r2, [r4]
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r6, r3
	cmp	r3, r5
	bcs	.L225
	ldr	r3, [r4, #12]
	ldr	r1, [r4, #16]
	add	r3, r3, #1
	cmp	r3, r1
	movlt	r1, r3
	movge	r1, r7
	str	r1, [r4, #12]
.L225:
	add	r2, r2, #1
	str	r2, [r4]
.L221:
	add	r4, r4, #60
	cmp	r4, r8
	beq	.L233
.L227:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L221
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L234
	sub	r0, r4, #24
	add	r4, r4, #60
	bl	updateGoomba
	cmp	r4, r8
	bne	.L227
.L233:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L236:
	.align	2
.L235:
	.word	enemies+24
	.word	143165576
	.word	286331153
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	killEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	killEnemy, %function
killEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r3, [r0, #56]
	str	r3, [r0, #4]
	str	r3, [r0]
	bx	lr
	.size	killEnemy, .-killEnemy
	.align	2
	.global	updateChomper
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateChomper, %function
updateChomper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #24]
	add	r3, r2, r2, lsl #4
	ldr	r1, .L242
	add	r3, r3, r3, lsl #8
	ldr	ip, .L242+4
	add	r3, r3, r3, lsl #16
	sub	r1, r1, r3
	cmp	r1, ip
	bcs	.L240
	ldr	r3, [r0, #36]
	ldr	r1, [r0, #40]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r0, #36]
	movge	r3, #0
	strge	r3, [r0, #36]
.L240:
	add	r2, r2, #1
	str	r2, [r0, #24]
	bx	lr
.L243:
	.align	2
.L242:
	.word	143165576
	.word	286331153
	.size	updateChomper, .-updateChomper
	.align	2
	.global	initializeItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeItems, %function
initializeItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	r2, #16
	ldr	r3, .L248
	add	r1, r3, #216
.L245:
	str	r0, [r3, #28]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L245
	bx	lr
.L249:
	.align	2
.L248:
	.word	items
	.size	initializeItems, .-initializeItems
	.align	2
	.global	spawnItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnItem, %function
spawnItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L259
	mov	r3, #0
	mov	ip, r4
.L255:
	ldr	lr, [ip, #28]
	cmp	lr, #0
	beq	.L258
	add	r3, r3, #1
	cmp	r3, #6
	add	ip, ip, #36
	bne	.L255
.L250:
	pop	{r4, lr}
	bx	lr
.L258:
	mov	ip, #1
	add	r3, r3, r3, lsl #3
	str	r1, [r4, r3, lsl #2]
	cmp	r2, ip
	add	r3, r4, r3, lsl #2
	str	r0, [r3, #4]
	str	r2, [r3, #24]
	str	ip, [r3, #28]
	str	ip, [r3, #32]
	beq	.L252
	cmp	r2, #2
	streq	lr, [r3, #20]
	beq	.L250
	cmp	r2, #0
	bne	.L250
.L252:
	mov	r2, #64
	pop	{r4, lr}
	str	r2, [r3, #20]
	bx	lr
.L260:
	.align	2
.L259:
	.word	items
	.size	spawnItem, .-spawnItem
	.align	2
	.global	updateItemBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateItemBlocks, %function
updateItemBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L270
	mov	r6, #1
	add	r5, r4, #196
	b	.L263
.L262:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L269
.L263:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L262
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L262
	ldr	r1, [r4]
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #4]
	str	r6, [r4, #20]
	sub	r1, r1, #1024
	add	r4, r4, #28
	bl	spawnItem
	cmp	r4, r5
	bne	.L263
.L269:
	pop	{r4, r5, r6, lr}
	bx	lr
.L271:
	.align	2
.L270:
	.word	itemBlocks
	.size	updateItemBlocks, .-updateItemBlocks
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	mov	r7, #512
	ldr	r4, .L284
	ldr	r6, .L284+4
	b	.L278
.L283:
	cmp	r3, #1
	bne	.L275
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L277
	mov	r1, r5
	mov	r0, r4
	bl	drawChomper.part.0
.L275:
	add	r5, r5, #1
	cmp	r5, #10
	add	r4, r4, #60
	beq	.L282
.L278:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L283
	ldr	r3, [r4, #56]
	cmp	r3, #0
	lsl	r3, r5, #3
	beq	.L281
	mov	r1, r5
	mov	r0, r4
	add	r5, r5, #1
	bl	drawGoomba.part.0
	cmp	r5, #10
	add	r4, r4, #60
	bne	.L278
.L282:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L277:
	lsl	r3, r5, #3
.L281:
	strh	r7, [r3, r6]	@ movhi
	b	.L275
.L285:
	.align	2
.L284:
	.word	enemies
	.word	shadowOAM+112
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItems, %function
drawItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #222
	ldr	r3, .L298
	add	r7, r3, #52
	ldm	r7, {r7, r10}
	ldr	r2, .L298+4
	lsl	r4, r10, #16
	lsl	r6, r7, #16
	ldr	r0, .L298+8
	ldr	r8, .L298+12
	lsr	r4, r4, #16
	lsr	r6, r6, #16
	add	r5, r2, #216
.L293:
	ldr	r1, [r2]
	ldr	ip, [r2, #28]
	rsb	r3, r4, r1, asr #6
	lsl	r3, r3, #16
	cmp	ip, #0
	lsr	r3, r3, #16
	asr	r1, r1, #6
	beq	.L287
	ldr	ip, [r2, #4]
	rsb	lr, r6, ip, asr #6
	rsb	ip, r7, ip, asr #6
	and	lr, lr, r8
	cmp	ip, #239
	orr	lr, lr, #16384
	bgt	.L288
	ldr	r9, [r2, #8]
	add	ip, ip, r9
	cmp	ip, #0
	ble	.L288
	sub	r1, r1, r10
	sub	r1, r1, #1
	cmp	r1, #158
	bls	.L296
.L288:
	and	r3, r3, #255
	orr	r3, r3, #512
	strh	r3, [r0, #64]	@ movhi
	strh	lr, [r0, #66]	@ movhi
.L289:
	ldr	r3, [r2, #24]
	cmp	r3, #1
	beq	.L290
.L297:
	cmp	r3, #2
	strheq	fp, [r0, #68]	@ movhi
	beq	.L292
	cmp	r3, #0
	moveq	r3, #158	@ movhi
	strheq	r3, [r0, #68]	@ movhi
.L292:
	add	r2, r2, #36
	cmp	r5, r2
	add	r0, r0, #8
	bne	.L293
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L287:
	and	r3, r3, #255
	orr	r3, r3, #512
	strh	r3, [r0, #64]	@ movhi
	ldr	r3, [r2, #24]
	cmp	r3, #1
	bne	.L297
.L290:
	ldr	r3, .L298+16
	strh	r3, [r0, #68]	@ movhi
	b	.L292
.L296:
	and	r3, r3, #255
	strh	r3, [r0, #64]	@ movhi
	strh	lr, [r0, #66]	@ movhi
	b	.L289
.L299:
	.align	2
.L298:
	.word	player
	.word	items
	.word	shadowOAM
	.word	511
	.word	286
	.size	drawItems, .-drawItems
	.align	2
	.global	drawItemBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawItemBlocks, %function
drawItemBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #94
	ldr	r3, .L310
	add	r5, r3, #52
	ldm	r5, {r5, r8}
	ldr	r2, .L310+4
	lsl	r4, r8, #16
	lsl	lr, r5, #16
	ldr	ip, .L310+8
	ldr	r7, .L310+12
	lsr	r4, r4, #16
	lsr	lr, lr, #16
	add	r6, r2, #196
.L304:
	ldr	r1, [r2, #4]
	ldr	r10, [r2]
	rsb	r0, lr, r1, asr #6
	rsb	r3, r4, r10, asr #6
	rsb	r1, r5, r1, asr #6
	and	r0, r0, r7
	lsl	r3, r3, #16
	cmp	r1, #239
	orr	r0, r0, #16384
	lsr	r3, r3, #16
	asr	r10, r10, #6
	bgt	.L301
	ldr	fp, [r2, #8]
	add	r1, r1, fp
	sub	r10, r10, r8
	cmp	r1, #0
	sub	r10, r10, #1
	ble	.L301
	cmp	r10, #158
	and	r1, r3, #255
	strhls	r1, [ip, #8]	@ movhi
	strhls	r0, [ip, #10]	@ movhi
	bls	.L302
.L301:
	and	r3, r3, #255
	orr	r3, r3, #512
	strh	r3, [ip, #8]	@ movhi
	strh	r0, [ip, #10]	@ movhi
.L302:
	ldr	r3, [r2, #16]
	add	r2, r2, #28
	cmp	r3, #0
	strhne	r9, [ip, #12]	@ movhi
	cmp	r6, r2
	add	ip, ip, #8
	bne	.L304
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L311:
	.align	2
.L310:
	.word	player
	.word	itemBlocks
	.word	shadowOAM
	.word	511
	.size	drawItemBlocks, .-drawItemBlocks
	.align	2
	.global	drawGoomba
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGoomba, %function
drawGoomba:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #56]
	cmp	r3, #0
	mov	r3, r1
	bne	drawGoomba.part.0
.L313:
	mov	r2, #512
	ldr	r1, .L314
	add	r1, r1, r3, lsl #3
	strh	r2, [r1, #112]	@ movhi
	bx	lr
.L315:
	.align	2
.L314:
	.word	shadowOAM
	.size	drawGoomba, .-drawGoomba
	.align	2
	.global	drawChomper
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChomper, %function
drawChomper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #56]
	cmp	r3, #0
	mov	r3, r1
	bne	drawChomper.part.0
.L317:
	mov	r2, #512
	ldr	r1, .L318
	add	r1, r1, r3, lsl #3
	strh	r2, [r1, #112]	@ movhi
	bx	lr
.L319:
	.align	2
.L318:
	.word	shadowOAM
	.size	drawChomper, .-drawChomper
	.align	2
	.global	drawGoal
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGoal, %function
drawGoal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L324
	ldr	ip, .L324+4
	ldr	r2, [r3, #52]
	ldr	r1, [ip, #4]
	ldr	r0, [r3, #56]
	ldr	r3, [ip]
	rsb	r2, r2, r1, asr #6
	rsb	r0, r0, r3, asr #6
	lsl	r1, r2, #23
	lsr	r1, r1, #23
	lsl	r3, r0, #16
	cmp	r2, #239
	orr	r1, r1, #32768
	lsr	r3, r3, #16
	bgt	.L321
	ldr	ip, [ip, #8]
	add	r2, r2, ip
	cmp	r2, #0
	ble	.L321
	sub	r0, r0, #1
	cmp	r0, #158
	bls	.L323
.L321:
	ldr	r2, .L324+8
	and	r3, r3, #255
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
.L322:
	mov	r2, #348
	ldr	r3, .L324+12
	strh	r2, [r3]	@ movhi
	bx	lr
.L323:
	ldr	r2, .L324+8
	and	r3, r3, #255
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	b	.L322
.L325:
	.align	2
.L324:
	.word	player
	.word	goal
	.word	shadowOAM+784
	.word	shadowOAM+788
	.size	drawGoal, .-drawGoal
	.align	2
	.global	drawFireBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFireBalls, %function
drawFireBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #512
	ldr	r3, .L333
	add	r8, r3, #52
	ldm	r8, {r8, r9}
	ldr	r3, .L333+4
	lsl	r6, r9, #16
	lsl	r5, r8, #16
	ldr	r2, .L333+8
	ldr	r10, .L333+12
	sub	sp, sp, #12
	lsr	r6, r6, #16
	lsr	r5, r5, #16
	add	r7, r3, #108
.L330:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	strheq	fp, [r2, #192]	@ movhi
	beq	.L329
	ldr	ip, [r3]
	ldr	r1, [r3, #4]
	rsb	r0, r6, ip, asr #6
	lsl	r0, r0, #16
	rsb	r4, r8, r1, asr #6
	lsr	r0, r0, #16
	rsb	r1, r5, r1, asr #6
	and	lr, r0, #255
	cmp	r4, #239
	orr	lr, lr, #512
	asr	ip, ip, #6
	and	r1, r1, r10
	bgt	.L328
	sub	ip, ip, r9
	str	ip, [sp, #4]
	ldr	ip, [r3, #8]
	add	r4, r4, ip
	ldr	ip, [sp, #4]
	cmp	r4, #0
	sub	ip, ip, #1
	ble	.L328
	cmp	ip, #158
	and	r0, r0, #255
	bhi	.L328
	strh	r1, [r2, #194]	@ movhi
	mov	r1, #29	@ movhi
	add	r3, r3, #36
	cmp	r3, r7
	strh	r0, [r2, #192]	@ movhi
	strh	r1, [r2, #196]	@ movhi
	add	r2, r2, #8
	bne	.L330
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L328:
	strh	lr, [r2, #192]	@ movhi
	strh	r1, [r2, #194]	@ movhi
.L329:
	add	r3, r3, #36
	cmp	r3, r7
	add	r2, r2, #8
	bne	.L330
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L334:
	.align	2
.L333:
	.word	player
	.word	fireBalls
	.word	shadowOAM
	.word	511
	.size	drawFireBalls, .-drawFireBalls
	.align	2
	.global	drawCoinCount
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoinCount, %function
drawCoinCount:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r5, #208
	mov	r4, #216
	mov	lr, #224
	mov	ip, #232
	ldr	r2, .L337
	ldr	r3, .L337+4
	ldr	r2, [r2, #68]
	smull	r6, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, lsl #2
	sub	r1, r2, r1, lsl #1
	lsl	r1, r1, #5
	lsl	r2, r3, #5
	ldr	r3, .L337+8
	add	r1, r1, #21
	add	r6, r3, #1020
	orr	r1, r1, #4096
	add	r2, r2, #21
	strh	r1, [r6]	@ movhi
	orr	r2, r2, #4096
	add	r1, r3, #1012
	strh	r2, [r1]	@ movhi
	add	r2, r3, #992
	ldr	r1, .L337+12
	strh	r0, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	add	r2, r3, #996
	strh	r1, [r2]	@ movhi
	add	r2, r3, #1000
	strh	r0, [r2]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	add	r1, r1, #32
	add	r2, r3, #1004
	strh	r1, [r2]	@ movhi
	add	r2, r3, #1008
	add	r3, r3, #1016
	strh	r0, [r2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L338:
	.align	2
.L337:
	.word	player
	.word	1717986919
	.word	shadowOAM
	.word	4118
	.size	drawCoinCount, .-drawCoinCount
	.comm	goal,36,4
	.comm	fireBalls,108,4
	.comm	items,216,4
	.comm	enemies,600,4
	.comm	itemBlocks,196,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
