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
	mov	r2, #2048
	mov	r3, #67108864
	push	{r4, lr}
	mov	r1, #256
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L16
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	mov	r2, #832
	mov	r1, #0
	ldr	r0, .L16+8
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #8
	ldr	r0, .L16+16
	ldr	r3, .L16+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	testmapPal
	.word	copyToBGPaletteMem
	.word	testmapTiles
	.word	copyToCharBlock
	.word	testmapMap
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
	push	{r4, lr}
	bl	initializeBackground
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	initializeSonic
	.size	initializeGame, .-initializeGame
	.ident	"GCC: (devkitARM release 53) 9.1.0"
