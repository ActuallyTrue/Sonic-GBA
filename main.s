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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #0
	mov	r2, #6272
	strh	r4, [r3, #16]	@ movhi
	mov	r1, #256
	strh	r4, [r3, #18]	@ movhi
	ldr	r0, .L4
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r2, #14272
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #24
	ldr	r0, .L4+16
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	titleScreenPal
	.word	copyToBGPaletteMem
	.word	titleScreenTiles
	.word	copyToCharBlock
	.word	titleScreenMap
	.word	copyToScreenBlock
	.word	hideSprites
	.word	copyShadowOAM
	.word	state
	.size	goToStart, .-goToStart
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
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r3, .L8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+8
	ldr	r1, .L8+12
	ldrh	r0, [r3, #48]
	ldr	r3, .L8+16
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	copyShadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #0
	mov	r2, #6272
	strh	r4, [r3, #16]	@ movhi
	mov	r1, #256
	strh	r4, [r3, #18]	@ movhi
	ldr	r0, .L16
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	mov	r1, r4
	ldr	r2, .L16+8
	ldr	r0, .L16+12
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	ldr	r3, .L16+20
	mov	r1, #24
	ldr	r0, .L16+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	instructionScreenPal
	.word	copyToBGPaletteMem
	.word	12320
	.word	instructionScreenTiles
	.word	copyToCharBlock
	.word	copyToScreenBlock
	.word	instructionScreenMap
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L34+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.word	initializeBackground
	.word	restoreBackground
	.word	state
	.size	instructions, .-instructions
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
	push	{r4, lr}
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L38+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	restoreBackground
	.word	state
	.size	goToGame, .-goToGame
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
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #0
	mov	r2, #6272
	strh	r4, [r3, #16]	@ movhi
	mov	r1, #256
	strh	r4, [r3, #18]	@ movhi
	ldr	r0, .L42
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r2, #6464
	ldr	r0, .L42+8
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #24
	ldr	r0, .L42+16
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L42+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	pauseScreenPal
	.word	copyToBGPaletteMem
	.word	pauseScreenTiles
	.word	copyToCharBlock
	.word	pauseScreenMap
	.word	copyToScreenBlock
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
	ldr	r3, .L58
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L58+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L57
.L45:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L58+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L57:
	push	{r4, lr}
	ldr	r3, .L58+8
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L58+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	oldButtons
	.word	buttons
	.word	restoreBackground
	.word	state
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
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #0
	mov	r2, #6272
	strh	r4, [r3, #16]	@ movhi
	mov	r1, #256
	strh	r4, [r3, #18]	@ movhi
	ldr	r0, .L62
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	mov	r1, r4
	ldr	r2, .L62+8
	ldr	r0, .L62+12
	ldr	r3, .L62+16
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #24
	ldr	r0, .L62+20
	ldr	r3, .L62+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+32
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L62+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L63:
	.align	2
.L62:
	.word	winScreenPal
	.word	copyToBGPaletteMem
	.word	14624
	.word	winScreenTiles
	.word	copyToCharBlock
	.word	winScreenMap
	.word	copyToScreenBlock
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
	@ link register save eliminated.
	ldr	r3, .L66
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L67:
	.align	2
.L66:
	.word	oldButtons
	.size	win, .-win
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
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #0
	mov	r2, #6272
	strh	r4, [r3, #16]	@ movhi
	mov	r1, #256
	strh	r4, [r3, #18]	@ movhi
	ldr	r0, .L70
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	mov	r1, r4
	ldr	r2, .L70+8
	ldr	r0, .L70+12
	ldr	r3, .L70+16
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #24
	ldr	r0, .L70+20
	ldr	r3, .L70+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+32
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L70+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L71:
	.align	2
.L70:
	.word	loseScreenPal
	.word	copyToBGPaletteMem
	.word	5216
	.word	loseScreenTiles
	.word	copyToCharBlock
	.word	loseScreenMap
	.word	copyToScreenBlock
	.word	hideSprites
	.word	copyShadowOAM
	.word	state
	.size	goToLose, .-goToLose
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
	ldr	r3, .L106
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L106+16
	ldr	r2, [r0]
	cmp	r2, #10
	ldr	r1, .L106+20
	beq	.L99
	cmp	r2, #19
	ldr	r3, [r1]
	bne	.L76
	cmp	r3, #251
	movgt	r3, #252
	strgt	r3, [r1]
	ble	.L100
.L78:
	mov	r2, #67108864
	ldr	r1, .L106+24
	ldrh	r1, [r1]
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L106+28
	strh	r1, [r2, #18]	@ movhi
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
	ldr	r2, .L106+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L101
.L82:
	tst	r3, #256
	beq	.L84
	ldr	r2, .L106+32
	ldrh	r2, [r2]
	tst	r2, #256
	beq	.L102
.L84:
	tst	r3, #512
	beq	.L83
	ldr	r3, .L106+32
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L103
.L83:
	ldr	r3, .L106+36
	ldrsh	r3, [r3]
	cmp	r3, #0
	bne	.L104
	ldr	r3, .L106+40
	ldrsh	r3, [r3]
	cmp	r3, #0
	bne	.L105
	pop	{r4, lr}
	bx	lr
.L76:
	cmp	r2, #18
	movle	ip, #1
	movgt	ip, #0
	cmp	r3, #255
	movle	ip, #0
	cmp	ip, #0
	bne	.L87
	cmp	r3, #0
	bge	.L98
	cmp	r2, #10
	bgt	.L81
.L98:
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	b	.L78
.L99:
	ldr	r3, [r1]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r1]
	blt	.L98
	cmp	r3, #255
	ble	.L98
.L87:
	mov	r4, #67108864
	add	r2, r2, #1
	lsl	ip, r2, #24
	sub	lr, r3, #256
	orr	ip, ip, #1073741824
	lsr	ip, ip, #16
	lsl	r3, lr, #16
	str	r2, [r0]
	str	lr, [r1]
	lsr	r3, r3, #16
	strh	ip, [r4, #8]	@ movhi
	b	.L78
.L104:
	pop	{r4, lr}
	b	goToWin
.L105:
	pop	{r4, lr}
	b	goToLose
.L100:
	cmp	r3, #0
	bge	.L98
.L81:
	mov	lr, #67108864
	sub	r2, r2, #1
	lsl	ip, r2, #24
	add	r3, r3, #256
	orr	ip, ip, #1073741824
	str	r3, [r1]
	lsr	ip, ip, #16
	lsl	r3, r3, #16
	str	r2, [r0]
	lsr	r3, r3, #16
	strh	ip, [lr, #8]	@ movhi
	b	.L78
.L101:
	bl	goToPause
	b	.L83
.L102:
	bl	goToWin
	b	.L83
.L103:
	bl	goToLose
	b	.L83
.L107:
	.align	2
.L106:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	copyShadowOAM
	.word	currentScreenBlock
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	shouldWin
	.word	shouldLose
	.size	game, .-game
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
	ldr	r6, .L126
	ldr	r10, .L126+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L126+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L126+16
	ldr	r8, .L126+20
	ldr	r7, .L126+24
	ldr	fp, .L126+28
	ldr	r4, .L126+32
.L110:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L119
.L112:
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L111
.L111:
	tst	r0, #8
	beq	.L119
	ldr	r3, .L126+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L110
.L113:
	tst	r0, #8
	beq	.L119
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L110
.L114:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L110
.L115:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L110
.L116:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L110
.L117:
	tst	r0, #8
	beq	.L119
	tst	r3, #8
	beq	.L125
.L119:
	mov	r0, r3
	b	.L110
.L125:
	ldr	r3, .L126+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L110
.L127:
	.align	2
.L126:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	instructions
	.word	game
	.word	pause
	.word	win.part.0
	.word	67109120
	.word	lose.part.0
	.word	goToInstructions
	.size	main, .-main
	.text
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
