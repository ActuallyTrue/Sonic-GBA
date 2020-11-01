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
	.file	"main.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	start.part.0, %function
start.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L8+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	buttons
	.word	initializeGame
	.word	state
	.size	start.part.0, .-start.part.0
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #4352
	mov	r7, #67108864
	ldr	r6, .L12
	strh	r3, [r7]	@ movhi
	ldr	r5, .L12+4
	mov	lr, pc
	bx	r6
	mov	r4, #0
	mov	lr, pc
	bx	r5
	mov	r3, #6144
	ldr	r1, .L12+8
	ldr	r2, .L12+12
	ldrh	r1, [r1, #48]
	strh	r1, [r2]	@ movhi
	ldr	r2, .L12+16
	strh	r4, [r2]	@ movhi
	strh	r3, [r7, #8]	@ movhi
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	ldr	r3, .L12+20
	str	r4, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	hideSprites
	.word	copyShadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #6144
	push	{r4, lr}
	ldr	r3, .L16
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L16+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	hideSprites
	.word	copyShadowOAM
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	start.part.0
.L21:
	.align	2
.L20:
	.word	oldButtons
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L23
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	copyShadowOAM
	.size	game, .-game
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #6144
	push	{r4, lr}
	ldr	r3, .L31
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L31+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L32:
	.align	2
.L31:
	.word	hideSprites
	.word	copyShadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L34
	ldr	r2, .L47+4
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L34
	mov	r2, #1
	ldr	r3, .L47+8
	str	r2, [r3]
	bx	lr
.L34:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L47+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #4
	beq	.L46
	pop	{r4, lr}
	bx	lr
.L46:
	mov	r2, #67108864
	mov	r1, #6144
	ldr	r3, .L47+12
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+8
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	hideSprites
	.word	copyShadowOAM
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #6144
	push	{r4, lr}
	ldr	r3, .L51
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L51+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	hideSprites
	.word	copyShadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L63+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L62
	pop	{r4, lr}
	bx	lr
.L62:
	mov	r2, #67108864
	mov	r1, #6144
	ldr	r3, .L63+8
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	copyShadowOAM
	.word	state
	.size	win, .-win
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L77
	ldr	fp, .L77+4
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L77+12
	ldr	r2, [r6]
	ldrh	r1, [fp]
	ldr	r10, .L77+16
	ldr	r9, .L77+20
	ldr	r8, .L77+24
	ldr	r7, .L77+28
	ldr	r4, .L77+32
.L67:
	strh	r1, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L74
.L69:
	.word	.L72
	.word	.L71
	.word	.L70
	.word	.L68
	.word	.L68
.L68:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L67
.L70:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L67
.L71:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L67
.L72:
	tst	r1, #8
	beq	.L74
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L67
.L74:
	mov	r1, r3
	b	.L67
.L78:
	.align	2
.L77:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start.part.0
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #6144
	push	{r4, lr}
	ldr	r3, .L81
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+4
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L81+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L82:
	.align	2
.L81:
	.word	hideSprites
	.word	copyShadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
