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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	ldr	ip, .L9
	add	r3, r0, r1, lsl #4
	ldr	ip, [ip]
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldrh	r1, [ip, r3]
	sub	sp, sp, #8
	strh	r1, [sp, #6]	@ movhi
	ldrh	r1, [sp, #6]
	tst	r0, #1
	andne	r1, r1, #255
	andeq	r1, r1, #65280
	strhne	r1, [sp, #6]	@ movhi
	strheq	r1, [sp, #6]	@ movhi
	ldrhne	r1, [sp, #6]
	ldrheq	r1, [sp, #6]
	orrne	r2, r1, r2, lsl #8
	orreq	r2, r1, r2
	strh	r2, [sp, #6]	@ movhi
	ldrh	r2, [sp, #6]
	strh	r2, [ip, r3]	@ movhi
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #0
	ldr	ip, .L21
	sub	sp, sp, #8
	ldr	lr, [ip]
	add	r4, r1, r3
	rsb	r5, r1, r1, lsl #4
	ldr	r6, [ip, #4]
	rsb	r4, r4, r4, lsl #4
	ldrh	ip, [sp, #40]
	add	r1, r0, r5, lsl #4
	add	r1, lr, r1, lsl #1
	add	r10, sp, #6
	add	r7, r0, r4, lsl #4
	orr	r8, r2, #-2130706432
	cmp	r3, r9
	strh	ip, [sp, #6]	@ movhi
	add	r7, lr, r7, lsl #1
	str	r9, [r6, #44]
	str	r10, [r6, #36]
	str	r1, [r6, #40]
	str	r8, [r6, #44]
	ble	.L12
	lsl	r3, r5, #4
	mov	r5, r7
	lsl	r4, r4, #4
.L13:
	strh	ip, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L13
	mov	r1, #0
	add	r0, r0, r2
	add	r3, r3, r0
	add	r0, r0, r4
	add	r4, sp, #4
	strh	ip, [sp, #4]	@ movhi
	str	r1, [r6, #44]
	str	r4, [r6, #36]
	str	r7, [r6, #40]
	str	r8, [r6, #44]
	add	r3, lr, r3, lsl #1
	add	r2, lr, r0, lsl #1
.L15:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L15
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L12:
	add	r3, sp, #4
	strh	ip, [sp, #4]	@ movhi
	str	r9, [r6, #44]
	str	r3, [r6, #36]
	str	r7, [r6, #40]
	str	r8, [r6, #44]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r2, #1
	mov	r7, r0
	mov	r4, r1
	mov	r5, r3
	sub	sp, sp, #12
	beq	.L49
	cmp	r2, #2
	beq	.L50
	ldrb	r1, [sp, #48]	@ zero_extendqisi2
	ldrb	r3, [sp, #48]	@ zero_extendqisi2
	ands	r10, r0, #1
	orr	r3, r3, r1, lsl #8
	strh	r3, [sp, #6]	@ movhi
	bne	.L29
	ands	lr, r2, #1
	bne	.L30
	cmp	r5, #0
	ble	.L23
	ldr	r3, .L52
	add	r5, r4, r5
	rsb	r5, r5, r5, lsl #4
	asr	r2, r2, #1
	rsb	r4, r4, r4, lsl #4
	ldm	r3, {r0, r3}
	add	ip, r7, r5, lsl #4
	orr	r2, r2, #-2130706432
	add	r7, r7, r4, lsl #4
	add	r9, sp, #6
.L37:
	bic	r1, r7, #1
	add	r7, r7, #240
	add	r1, r0, r1
	cmp	ip, r7
	str	lr, [r3, #44]
	str	r9, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bne	.L37
.L23:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	cmp	r0, #0
	rsblt	r10, r10, #0
	cmp	r10, #1
	beq	.L51
.L33:
	cmp	r5, #0
	ble	.L23
	sub	r10, r2, #2
	rsb	r1, r4, r4, lsl #4
	add	r8, r7, #1
	asr	r10, r10, #1
	sub	r2, r2, #1
	ldr	fp, .L52
	add	r5, r5, r4
	add	r8, r8, r1, lsl #4
	orr	r10, r10, #-2130706432
	add	r6, r2, r7
	add	r9, sp, #6
.L40:
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	bl	setPixel4
	mov	r3, #0
	ldm	fp, {r1, r2}
	bic	r0, r8, #1
	add	r1, r1, r0
	str	r3, [r2, #44]
	str	r9, [r2, #36]
	str	r1, [r2, #40]
	str	r10, [r2, #44]
	mov	r1, r4
	mov	r0, r6
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r5, r4
	add	r8, r8, #240
	bne	.L40
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L30:
	cmp	r2, #0
	rsblt	lr, lr, #0
	cmp	lr, #1
	bne	.L33
	cmp	r5, #0
	ble	.L23
	mov	r8, r4
	sub	r0, r2, #1
	asr	r6, r0, #1
	rsb	r4, r4, r4, lsl #4
	ldr	fp, .L52
	add	r0, r0, r7
	orr	r6, r6, #-2130706432
	add	r5, r5, r8
	add	r7, r7, r4, lsl #4
	add	r9, sp, #6
.L38:
	ldm	fp, {r1, r2}
	bic	ip, r7, #1
	add	r1, r1, ip
	str	r10, [r2, #44]
	str	r9, [r2, #36]
	str	r1, [r2, #40]
	str	r6, [r2, #44]
	mov	r1, r8
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	add	r8, r8, #1
	bl	setPixel4
	cmp	r5, r8
	add	r7, r7, #240
	bne	.L38
	b	.L23
.L49:
	cmp	r3, #0
	ble	.L23
	add	r5, r3, r1
.L26:
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r4, r5
	bne	.L26
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L51:
	cmp	r2, #0
	and	r3, r2, #1
	rsblt	r3, r3, #0
	cmp	r3, #1
	bne	.L33
	cmp	r5, #0
	ble	.L23
	mov	r6, #0
	sub	r8, r2, #1
	asr	r8, r8, #1
	rsb	r2, r4, r4, lsl #4
	add	r10, r0, #1
	ldr	fp, .L52
	orr	r8, r8, #-2130706432
	add	r5, r5, r4
	add	r10, r10, r2, lsl #4
	add	r9, sp, #6
.L39:
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	bl	setPixel4
	ldr	r1, [fp]
	ldr	r2, [fp, #4]
	bic	r0, r10, #1
	add	r4, r4, #1
	add	r1, r1, r0
	cmp	r4, r5
	str	r6, [r2, #44]
	add	r10, r10, #240
	str	r9, [r2, #36]
	str	r1, [r2, #40]
	str	r8, [r2, #44]
	bne	.L39
	b	.L23
.L50:
	cmp	r3, #0
	ble	.L23
	add	r6, r0, #1
	add	r5, r3, r1
.L28:
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	bl	setPixel4
	mov	r1, r4
	mov	r0, r6
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r5, r4
	bne	.L28
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	drawFromPointToPoint3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFromPointToPoint3, %function
drawFromPointToPoint3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, r2
	cmpeq	r2, r1
	push	{r4, r5, lr}
	sub	sp, sp, #12
	moveq	lr, #1
	movne	lr, #0
	ldrh	ip, [sp, #24]
	bne	.L55
	ldr	r3, .L86
	rsb	r2, r2, r2, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r2, lsl #4
	lsl	r0, r0, #1
	strh	ip, [r3, r0]	@ movhi
.L54:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L55:
	cmp	r0, r2
	beq	.L82
	cmp	r1, r3
	beq	.L83
	movlt	lr, #1
	movge	lr, #0
	cmp	r0, r2
	movge	r4, #0
	andlt	r4, lr, #1
	cmp	r4, #0
	bne	.L84
	cmp	r0, r2
	movle	r4, #0
	movgt	r4, #1
	cmp	r1, r3
	cmpgt	r0, r2
	bgt	.L85
	tst	lr, r4
	bne	.L68
	cmp	r0, r2
	movgt	lr, #0
	movle	lr, #1
	cmp	r1, r3
	movlt	lr, #0
	cmp	lr, #0
	beq	.L54
	mov	r5, r1
	ldr	r4, .L86
	rsb	lr, r1, r1, lsl #4
	ldr	r4, [r4]
	add	lr, r0, lr, lsl #4
	add	r4, r4, lr, lsl #1
.L71:
	sub	r5, r5, #1
	sub	lr, r1, r5
	add	lr, lr, r0
	cmp	r2, lr
	movlt	lr, #0
	movge	lr, #1
	cmp	r3, r5
	movgt	lr, #0
	strh	ip, [r4]	@ movhi
	cmp	lr, #0
	sub	r4, r4, #476
	sub	r4, r4, #2
	bne	.L71
	b	.L54
.L85:
	mov	r5, r1
	ldr	lr, .L86
	rsb	r4, r1, r1, lsl #4
	ldr	lr, [lr]
	add	r4, r0, r4, lsl #4
	add	r4, lr, r4, lsl #1
.L67:
	sub	r5, r5, #1
	sub	lr, r5, r1
	add	lr, lr, r0
	cmp	lr, r2
	movlt	lr, #0
	movge	lr, #1
	cmp	r3, r5
	movgt	lr, #0
	strh	ip, [r4]	@ movhi
	cmp	lr, #0
	sub	r4, r4, #480
	sub	r4, r4, #2
	bne	.L67
	b	.L54
.L84:
	mov	r4, r1
	ldr	lr, .L86
	rsb	r5, r1, r1, lsl #4
	ldr	lr, [lr]
	add	r5, r0, r5, lsl #4
	add	lr, lr, r5, lsl #1
.L65:
	add	r4, r4, #1
	sub	r5, r4, r1
	add	r5, r5, r0
	cmp	r2, r5
	cmpge	r3, r4
	strh	ip, [lr]	@ movhi
	add	lr, lr, #480
	add	lr, lr, #2
	bge	.L65
	b	.L54
.L82:
	cmp	r1, r3
	bge	.L58
	ldr	r2, .L86
	rsb	r1, r1, r1, lsl #4
	ldr	lr, [r2]
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, r1, lsl #4
	add	r0, r0, r3, lsl #4
	add	r2, lr, r2, lsl #1
	add	r0, lr, r0, lsl #1
.L59:
	strh	ip, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L59
	b	.L54
.L83:
	ldr	r4, .L86
	rsb	r1, r1, r1, lsl #4
	cmp	r0, r2
	ldr	r3, [r4, #4]
	lsl	r1, r1, #4
	ldr	r4, [r4]
	bge	.L63
	add	r1, r0, r1
	sub	r2, r2, r0
	add	r1, r4, r1, lsl #1
	orr	r2, r2, #-2130706432
	add	r0, sp, #4
	strh	ip, [sp, #4]	@ movhi
	str	lr, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L54
.L68:
	mov	r5, r1
	ldr	lr, .L86
	rsb	r4, r1, r1, lsl #4
	ldr	lr, [lr]
	add	r4, r0, r4, lsl #4
	add	r4, lr, r4, lsl #1
.L70:
	add	r5, r5, #1
	sub	lr, r1, r5
	add	lr, lr, r0
	cmp	r2, lr
	movgt	lr, #0
	movle	lr, #1
	cmp	r3, r5
	movlt	lr, #0
	strh	ip, [r4]	@ movhi
	cmp	lr, #0
	add	r4, r4, #476
	add	r4, r4, #2
	bne	.L70
	b	.L54
.L58:
	subs	r1, r1, r3
	beq	.L54
	ldr	r2, .L86
	add	r1, r3, r1
	ldr	r2, [r2]
	rsb	r1, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	add	r1, r0, r1, lsl #4
	add	r0, r0, r3, lsl #4
	add	r1, r2, r1, lsl #1
	add	r0, r2, r0, lsl #1
.L61:
	strh	ip, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r1, r0
	bne	.L61
	b	.L54
.L63:
	add	r1, r2, r1
	sub	r2, r0, r2
	add	r1, r4, r1, lsl #1
	orr	r2, r2, #-2130706432
	add	r0, sp, #6
	strh	ip, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L54
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	.size	drawFromPointToPoint3, .-drawFromPointToPoint3
	.align	2
	.global	drawHorizontalLine3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine3, %function
drawHorizontalLine3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L90
	rsb	r1, r1, r1, lsl #4
	ldr	lr, [ip]
	sub	sp, sp, #8
	ldr	ip, [ip, #4]
	add	r1, r0, r1, lsl #4
	add	lr, lr, r1, lsl #1
	orr	r2, r2, #-2130706432
	add	r1, sp, #6
	strh	r3, [sp, #6]	@ movhi
	str	r4, [ip, #44]
	str	r1, [ip, #36]
	str	lr, [ip, #40]
	str	r2, [ip, #44]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	.LANCHOR0
	.size	drawHorizontalLine3, .-drawHorizontalLine3
	.align	2
	.global	drawVerticalLine3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine3, %function
drawVerticalLine3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r2, #0
	bxle	lr
	ldr	r2, .L100
	add	ip, r1, ip
	ldr	r2, [r2]
	str	lr, [sp, #-4]!
	rsb	ip, ip, ip, lsl #4
	rsb	lr, r1, r1, lsl #4
	add	r1, r0, ip, lsl #4
	add	r0, r0, lr, lsl #4
	add	r1, r2, r1, lsl #1
	add	r2, r2, r0, lsl #1
.L94:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L94
	ldr	lr, [sp], #4
	bx	lr
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.size	drawVerticalLine3, .-drawVerticalLine3
	.align	2
	.global	drawFilledRectHori3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFilledRectHori3, %function
drawFilledRectHori3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #12
	ldrh	lr, [sp, #24]
	ldr	r4, .L108
	subs	ip, r3, #0
	strh	lr, [sp, #6]	@ movhi
	ldr	r3, [r4]
	ble	.L102
	mov	lr, #0
	add	ip, r1, ip
	rsb	ip, ip, ip, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	r5, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r4, #4]
	add	r0, r3, ip, lsl #1
	orr	r2, r2, #-2130706432
	add	r3, r3, r5, lsl #1
	add	ip, sp, #6
.L104:
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	r2, [r1, #44]
	bne	.L104
.L102:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	.LANCHOR0
	.size	drawFilledRectHori3, .-drawFilledRectHori3
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L112
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L112+4
	orr	r0, r0, r0, lsl #16
	add	ip, sp, #4
	str	r0, [sp, #4]
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L113:
	.align	2
.L112:
	.word	.LANCHOR0
	.word	-2063578368
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r1, .L116
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, r0, lsl #24
	orr	r3, r3, r2
	ldm	r1, {r0, r2}
	ldr	r1, .L116+4
	orr	r3, r3, ip, lsl #8
	add	ip, sp, #12
	str	r3, [sp, #12]
	str	lr, [r2, #44]
	str	ip, [r2, #36]
	str	r0, [r2, #40]
	str	r1, [r2, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L117:
	.align	2
.L116:
	.word	.LANCHOR0
	.word	-2063587968
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L118
	mov	r4, #0
	ldr	r6, .L124
	add	lr, r1, lr
	ldr	r3, [r6]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L120:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L120
.L118:
	pop	{r4, r5, r6, lr}
	bx	lr
.L125:
	.align	2
.L124:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ands	r4, r2, #3
	bne	.L126
	cmp	r3, #0
	ble	.L126
	ldr	r7, .L131
	add	r3, r1, r3
	rsb	lr, r3, r3, lsl #4
	rsb	r5, r1, r1, lsl #4
	asr	r2, r2, #1
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r3, [r7, #4]
	add	r1, r0, lr, lsl #4
	add	r0, r0, r5, lsl #4
	lsl	lr, r2, #1
	orr	r5, r2, #-2147483648
.L128:
	bic	r2, r0, #1
	add	r0, r0, #240
	add	r2, r6, r2
	cmp	r0, r1
	str	r4, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	add	ip, ip, lr
	str	r5, [r3, #44]
	bne	.L128
.L126:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L134
	ldr	r1, .L134+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L135:
	.align	2
.L134:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L137
	ldr	r1, .L137+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L138:
	.align	2
.L137:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L140:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L140
	mov	r2, #67108864
.L141:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L141
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L148
	moveq	r2, #100663296
	ldr	r1, .L148+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L149:
	.align	2
.L148:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L152
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L153:
	.align	2
.L152:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	copyToBGPaletteMem
	.syntax unified
	.arm
	.fpu softvfp
	.type	copyToBGPaletteMem, %function
copyToBGPaletteMem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	mov	r2, #83886080
	ldr	r3, .L155
	ldr	r3, [r3, #4]
	orr	r1, r1, #-2147483648
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L156:
	.align	2
.L155:
	.word	.LANCHOR0
	.size	copyToBGPaletteMem, .-copyToBGPaletteMem
	.align	2
	.global	copyToSpritePaletteMem
	.syntax unified
	.arm
	.fpu softvfp
	.type	copyToSpritePaletteMem, %function
copyToSpritePaletteMem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L158
	ldr	r2, .L158+4
	ldr	r3, [r3, #4]
	orr	r1, r1, #-2147483648
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L159:
	.align	2
.L158:
	.word	.LANCHOR0
	.word	83886592
	.size	copyToSpritePaletteMem, .-copyToSpritePaletteMem
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L164
	add	r2, r3, #1024
.L161:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L161
	bx	lr
.L165:
	.align	2
.L164:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	copyShadowOAM
	.syntax unified
	.arm
	.fpu softvfp
	.type	copyShadowOAM, %function
copyShadowOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	mov	r1, #117440512
	ldr	r3, .L167
	ldr	r0, .L167+4
	ldr	r3, [r3, #4]
	ldr	r2, .L167+8
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L168:
	.align	2
.L167:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-2147483136
	.size	copyShadowOAM, .-copyShadowOAM
	.align	2
	.global	copyToCharBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	copyToCharBlock, %function
copyToCharBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L170
	lsl	r1, r1, #14
	ldr	r3, [r3, #4]
	add	r1, r1, #100663296
	orr	r2, r2, #-2147483648
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L171:
	.align	2
.L170:
	.word	.LANCHOR0
	.size	copyToCharBlock, .-copyToCharBlock
	.align	2
	.global	copyToScreenBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	copyToScreenBlock, %function
copyToScreenBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L173
	lsl	r1, r1, #11
	ldr	r3, [r3, #4]
	add	r1, r1, #100663296
	orr	r2, r2, #-2147483648
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L174:
	.align	2
.L173:
	.word	.LANCHOR0
	.size	copyToScreenBlock, .-copyToScreenBlock
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	cmp	r3, ip
	blt	.L179
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	blt	.L179
	ldr	r3, [sp]
	add	r2, r0, r2
	cmp	r2, r3
	blt	.L179
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
	bx	lr
.L179:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	dma
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
