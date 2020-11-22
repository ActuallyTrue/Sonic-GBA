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
	.global	initializeItemBlocks
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeItemBlocks, %function
initializeItemBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #0
	mov	r4, #16
	mov	r2, lr
	ldr	r3, .L46
	ldr	r1, [r3, #84]
	sub	sp, sp, #28
	str	r1, [sp, #4]
	ldr	r1, [r3, #80]
	str	r1, [sp, #8]
	ldr	r1, [r3, #44]
	str	r1, [sp]
	ldr	r1, [r3, #4]
	add	r5, r3, #100
	ldm	r5, {r5, r6}
	str	r1, [sp, #12]
	ldr	r1, [r3]
	add	r8, r3, #20
	str	r1, [sp, #16]
	ldr	r10, [r3, #64]
	ldr	fp, [r3, #60]
	ldr	ip, [r3, #40]
	ldm	r8, {r8, r9}
	ldr	r1, .L46+4
	str	r6, [sp, #20]
.L10:
	add	r0, r2, r2, lsl #2
	add	r0, r3, r0, lsl #2
	str	r4, [r0, #12]
	str	r4, [r0, #8]
	mov	r0, #30	@ movhi
	add	r6, r2, #1
	add	r7, r1, r6, lsl #3
	sub	r2, r2, #1
	strh	r0, [r7, #4]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L2
.L4:
	.word	.L9
	.word	.L19
	.word	.L7
	.word	.L20
	.word	.L21
	.word	.L22
.L9:
	mov	r2, #16
	mov	r0, #30
	str	r2, [r3, #52]
	str	r2, [r3, #48]
	mov	r8, #11264
	strh	r0, [r1, #28]	@ movhi
	mov	r9, #12160
	mov	r0, #1
.L8:
	mov	r4, #16
	mov	r5, #30
	mov	ip, #8192
	mov	r2, #1
	str	r4, [r3, #72]
	str	r4, [r3, #68]
	str	r4, [r3, #92]
	str	r4, [r3, #88]
	strh	r5, [r1, #36]	@ movhi
	strh	r5, [r1, #44]	@ movhi
	mov	r5, #14208
	mov	fp, ip
	mov	r4, r2
	mov	r10, #15232
	str	r5, [sp]
.L6:
	mov	r5, #16
	mov	r6, #30
	str	r5, [r3, #112]
	str	r5, [r3, #108]
	mov	r5, #9216
	mov	r7, #1
	strh	r6, [r1, #52]	@ movhi
	str	r5, [sp, #8]
	ldr	r5, .L46+8
	str	r5, [sp, #4]
.L5:
	mov	r5, #16
	mov	r6, #30
	str	r5, [r3, #132]
	str	r5, [r3, #128]
	strh	r6, [r1, #60]	@ movhi
	mov	r5, #11264
	mov	r1, #1
	ldr	r6, .L46+12
.L3:
	cmp	lr, #0
	ldrne	lr, [sp, #12]
	strne	lr, [r3, #4]
	ldrne	lr, [sp, #16]
	strne	lr, [r3]
	cmp	r0, #0
	strne	r9, [r3, #24]
	strne	r8, [r3, #20]
	cmp	r2, #0
	ldrne	r2, [sp]
	strne	ip, [r3, #40]
	strne	r2, [r3, #44]
	cmp	r4, #0
	strne	r10, [r3, #64]
	strne	fp, [r3, #60]
	cmp	r7, #0
	ldrne	r2, [sp, #4]
	strne	r2, [r3, #84]
	ldrne	r2, [sp, #8]
	strne	r2, [r3, #80]
	cmp	r1, #0
	mov	r1, #12288
	ldr	r2, .L46+16
	strne	r6, [r3, #104]
	strne	r5, [r3, #100]
	str	r1, [r3, #120]
	str	r2, [r3, #124]
.L1:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	mov	r0, #16
	mov	r4, #30
	mov	r2, #0
	str	r0, [r3, #92]
	str	r0, [r3, #88]
	mov	fp, #8192
	strh	r4, [r1, #44]	@ movhi
	mov	r0, r2
	mov	r4, #1
	mov	r10, #15232
	b	.L6
.L19:
	mov	r0, #0
	b	.L8
.L21:
	mov	r2, #0
	mov	r0, r2
	mov	r7, r2
	mov	r4, r2
	b	.L5
.L22:
	mov	r2, #0
	ldr	r6, [sp, #20]
	mov	r0, r2
	mov	r1, r2
	mov	r7, r2
	mov	r4, r2
	b	.L3
.L20:
	mov	r2, #0
	mov	r0, r2
	mov	r4, r2
	b	.L6
.L2:
	mov	r2, #11136
	str	r2, [sp, #12]
	mov	r2, #11264
	cmp	r6, #7
	mov	lr, #1
	str	r2, [sp, #16]
	moveq	r1, #11264
	moveq	r2, #11136
	stmeq	r3, {r1, r2}
	beq	.L1
.L45:
	mov	r2, r6
	b	.L10
.L47:
	.align	2
.L46:
	.word	itemBlocks
	.word	shadowOAM
	.word	26496
	.word	44928
	.word	94080
	.size	initializeItemBlocks, .-initializeItemBlocks
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
	ldr	r3, .L58
	add	r5, r3, #56
	ldm	r5, {r5, r8}
	ldr	r2, .L58+4
	lsl	r4, r8, #16
	lsl	lr, r5, #16
	ldr	ip, .L58+8
	ldr	r7, .L58+12
	lsr	r4, r4, #16
	lsr	lr, lr, #16
	add	r6, r2, #140
.L52:
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
	bgt	.L49
	ldr	fp, [r2, #8]
	add	r1, r1, fp
	sub	r10, r10, r8
	cmp	r1, #0
	sub	r10, r10, #1
	ble	.L49
	cmp	r10, #158
	and	r1, r3, #255
	strhls	r1, [ip, #8]	@ movhi
	strhls	r0, [ip, #10]	@ movhi
	bls	.L50
.L49:
	and	r3, r3, #255
	orr	r3, r3, #512
	strh	r3, [ip, #8]	@ movhi
	strh	r0, [ip, #10]	@ movhi
.L50:
	ldr	r3, [r2, #16]
	add	r2, r2, #20
	cmp	r3, #0
	strhne	r9, [ip, #12]	@ movhi
	cmp	r6, r2
	add	ip, ip, #8
	bne	.L52
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	player
	.word	itemBlocks
	.word	shadowOAM
	.word	511
	.size	drawItemBlocks, .-drawItemBlocks
	.comm	enemies,312,4
	.comm	itemBlocks,140,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
