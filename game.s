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
	.file	"game.c"
	.text
	.align	2
	.global	updateGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	updateSonic
	.size	updateGame, .-updateGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	updateSonic
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	drawSonic
	.size	drawGame, .-drawGame
	.align	2
	.global	initializeBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBackground, %function
initializeBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #18944
	mov	r4, #10
	mov	r5, #0
	mov	r3, #67108864
	ldr	r0, .L16
	ldr	r1, .L16+4
	str	r4, [r0]
	str	r5, [r1]
	ldr	r0, .L16+8
	strh	r2, [r3, #8]	@ movhi
	mov	r1, #256
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	mov	r1, r5
	ldr	r2, .L16+16
	ldr	r0, .L16+20
	ldr	r3, .L16+24
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r2, #11264
	ldr	r0, .L16+28
	ldr	r3, .L16+32
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	Level1Pal
	.word	copyToBGPaletteMem
	.word	8560
	.word	Level1Tiles
	.word	copyToCharBlock
	.word	Level1Map
	.word	copyToScreenBlock
	.size	initializeBackground, .-initializeBackground
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	ldr	r1, .L20
	ldr	r2, .L20+4
	str	r3, [r1]
	str	r3, [r2]
	bl	initializeBackground
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	hOff
	.word	vOff
	.word	initializeSonic
	.size	initializeGame, .-initializeGame
	.align	2
	.global	restoreBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	restoreBackground, %function
restoreBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L24
	ldr	r3, [r3]
	lsl	r3, r3, #24
	push	{r4, lr}
	orr	r3, r3, #1073741824
	lsr	r3, r3, #16
	strh	r3, [r2, #8]	@ movhi
	mov	r1, #256
	ldr	r0, .L24+4
	ldr	r3, .L24+8
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r2, .L24+12
	ldr	r0, .L24+16
	ldr	r3, .L24+20
	mov	lr, pc
	bx	r3
	mov	r2, #11264
	mov	r1, #10
	ldr	r0, .L24+24
	ldr	r3, .L24+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	Level1Pal
	.word	copyToBGPaletteMem
	.word	8560
	.word	Level1Tiles
	.word	copyToCharBlock
	.word	Level1Map
	.word	copyToScreenBlock
	.size	restoreBackground, .-restoreBackground
	.comm	shouldLose,2,2
	.comm	shouldWin,2,2
	.global	currentTileMapDivision
	.global	currentScreenBlock
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	currentScreenBlock, %object
	.size	currentScreenBlock, 4
currentScreenBlock:
	.word	10
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	currentTileMapDivision, %object
	.size	currentTileMapDivision, 4
currentTileMapDivision:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
