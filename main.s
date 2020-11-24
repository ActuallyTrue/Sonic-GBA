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
	mov	r2, #32768
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
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+40
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+48
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
	.word	stopSound
	.word	titleSong_length
	.word	titleSong_data
	.word	playSoundA
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
	mov	r1, #0
	ldr	r3, .L8+8
	ldr	r0, .L8+12
	ldrh	ip, [r3, #48]
	ldr	r2, .L8+16
	ldr	r3, .L8+20
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	copyShadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupInterrupts
	.word	setupSounds
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
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	mov	r4, #0
	mov	r3, #67108864
	mov	r2, #6272
	strh	r4, [r3, #16]	@ movhi
	mov	r1, #256
	strh	r4, [r3, #18]	@ movhi
	ldr	r0, .L16+4
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r2, #32768
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
	.word	initializeGame
	.word	instructionScreenPal
	.word	copyToBGPaletteMem
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
	.global	updateInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L77
	ldr	r1, [r2, #148]
	sub	sp, sp, #44
	str	r1, [sp, #24]
	ldr	r1, [r2, #144]
	str	r1, [sp, #28]
	ldr	r1, [r2, #184]
	str	r1, [sp, #32]
	ldr	r1, [r2, #76]
	str	r1, [sp, #8]
	ldr	r1, [r2, #72]
	str	r1, [sp, #12]
	ldr	r1, [r2, #108]
	str	r1, [sp, #16]
	ldr	r1, [r2, #100]
	cmp	r3, #2
	str	r1, [sp, #20]
	mov	r10, r3
	mov	fp, r3
	str	r3, [sp, #4]
	str	r3, [sp, #36]
	ldr	r0, [r2, #168]
	ldr	r9, [r2, #172]
	ldr	r5, [r2, #180]
	ldr	r1, [r2, #24]
	ldm	r2, {r7, r8}
	ldr	r6, [r2, #40]
	ldr	ip, [r2, #28]
	ldr	r4, [r2, #36]
	str	r3, [sp]
	beq	.L26
.L75:
	cmp	r3, #3
	beq	.L27
	cmp	r3, #1
	beq	.L42
	ldr	lr, .L77+4
	add	r1, r1, #1
	smull	ip, lr, r1, lr
	asr	ip, r1, #31
	add	lr, lr, r1
	rsb	ip, ip, lr, asr #2
	rsb	ip, ip, ip, lsl #3
	subs	ip, r1, ip
	bne	.L29
	add	r4, r4, #1
	cmp	r4, #2
	movgt	r4, ip
	mov	ip, #1
	str	ip, [sp, #36]
.L29:
	cmp	r3, #3
	beq	.L36
	mov	ip, #1
	mov	r6, #3
	mov	r7, #56
	mov	r8, #112
	str	ip, [sp]
.L41:
	add	r3, r3, #1
	cmp	r3, #2
	bne	.L75
.L26:
	ldr	fp, .L77+8
	add	r0, r0, #1
	smull	lr, fp, r0, fp
	asr	r9, r0, #31
	rsb	r9, r9, fp, asr #1
	add	r9, r9, r9, lsl #2
	subs	r9, r0, r9
	bne	.L44
	add	r5, r5, #1
	cmp	r5, #2
	mov	r10, #1
	ble	.L76
	mov	lr, #3
	str	lr, [sp, #32]
	mov	lr, #100
	str	lr, [sp, #28]
	mov	lr, #88
	mov	r5, r9
	mov	fp, r10
	mov	r9, r10
	str	lr, [sp, #24]
	b	.L41
.L42:
	mov	lr, #2
	str	lr, [sp, #20]
	mov	lr, #0
	str	lr, [sp, #16]
	mov	lr, #84
	str	lr, [sp, #12]
	mov	lr, #96
	str	r3, [sp, #4]
	str	lr, [sp, #8]
	b	.L41
.L27:
	ldr	lr, [sp]
	ldr	r3, [sp, #36]
	cmp	lr, #0
	stmne	r2, {r7, r8}
	strne	r1, [r2, #24]
	strne	r6, [r2, #40]
	strne	ip, [r2, #28]
	cmp	r3, #0
	ldr	r3, [sp, #4]
	strne	r4, [r2, #36]
	cmp	r3, #0
	beq	.L32
	ldr	r3, [sp, #8]
	str	r3, [r2, #76]
	ldr	r3, [sp, #12]
	str	r3, [r2, #72]
	ldr	r3, [sp, #16]
	str	r3, [r2, #108]
	ldr	r3, [sp, #20]
	str	r3, [r2, #100]
.L32:
	cmp	fp, #0
	beq	.L33
	ldr	r3, [sp, #24]
	str	r3, [r2, #148]
	ldr	r3, [sp, #28]
	str	r3, [r2, #144]
	ldr	r3, [sp, #32]
	str	r0, [r2, #168]
	str	r3, [r2, #184]
	str	r9, [r2, #172]
.L33:
	mov	r1, #136
	mov	r3, #104
	cmp	r10, #0
	strne	r5, [r2, #180]
	str	r1, [r2, #220]
	str	r3, [r2, #216]
.L25:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L44:
	mov	lr, #3
	str	lr, [sp, #32]
	mov	lr, #100
	mov	r9, #1
	str	lr, [sp, #28]
	mov	lr, #88
	mov	fp, r9
	str	lr, [sp, #24]
	b	.L41
.L76:
	mov	lr, #3
	str	lr, [sp, #32]
	mov	lr, #100
	str	lr, [sp, #28]
	mov	lr, #88
	mov	r9, r10
	mov	fp, r10
	str	lr, [sp, #24]
	b	.L41
.L36:
	mov	ip, #112
	mov	lr, #56
	mov	r6, #1
	ldr	r7, [sp, #36]
	str	r3, [r2, #40]
	ldr	r3, [sp, #4]
	cmp	r7, #0
	strne	r4, [r2, #36]
	cmp	r3, #0
	str	r1, [r2, #24]
	str	ip, [r2, #4]
	str	lr, [r2]
	str	r6, [r2, #28]
	beq	.L39
	ldr	r3, [sp, #8]
	str	r3, [r2, #76]
	ldr	r3, [sp, #12]
	str	r3, [r2, #72]
	ldr	r3, [sp, #16]
	str	r3, [r2, #108]
	ldr	r3, [sp, #20]
	str	r3, [r2, #100]
.L39:
	cmp	fp, #0
	beq	.L40
	ldr	r3, [sp, #24]
	str	r3, [r2, #148]
	ldr	r3, [sp, #28]
	str	r3, [r2, #144]
	ldr	r3, [sp, #32]
	str	r0, [r2, #168]
	str	r3, [r2, #184]
	str	r9, [r2, #172]
.L40:
	cmp	r10, #0
	strne	r5, [r2, #180]
	b	.L25
.L78:
	.align	2
.L77:
	.word	instructionSprites
	.word	-1840700269
	.word	1717986919
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	drawInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInstructions, %function
drawInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #29
	ldr	r3, .L81
	ldr	lr, .L81+4
	ldr	r0, [r3, #148]
	ldr	r2, .L81+8
	ldr	ip, [r3, #36]
	ldr	r1, [r3, #4]
	ldr	r5, [r3, #28]
	and	r0, r0, lr
	orr	r0, r0, #16384
	and	r1, r1, lr
	add	r5, r5, ip, lsl #5
	strh	r0, [r2, #18]	@ movhi
	ldr	ip, [r3, #76]
	ldrb	r0, [r3]	@ zero_extendqisi2
	orr	r1, r1, #16384
	and	ip, ip, lr
	strh	r1, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	ldr	r1, [r3, #108]
	ldr	r0, [r3, #100]
	orr	ip, ip, #16384
	ldr	r6, [r3, #180]
	add	r0, r0, r1, lsl #5
	strh	ip, [r2, #10]	@ movhi
	ldr	r1, [r3, #172]
	ldr	ip, [r3, #220]
	lsl	r5, r5, #1
	and	lr, lr, ip
	add	r1, r1, r6, lsl #5
	ldrb	ip, [r3, #144]	@ zero_extendqisi2
	strh	r5, [r2, #4]	@ movhi
	ldrb	r5, [r3, #72]	@ zero_extendqisi2
	ldrb	r3, [r3, #216]	@ zero_extendqisi2
	lsl	r0, r0, #1
	lsl	r1, r1, #1
	strh	r5, [r2, #8]	@ movhi
	strh	lr, [r2, #26]	@ movhi
	strh	r4, [r2, #28]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	ip, [r2, #16]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	instructionSprites
	.word	511
	.word	shadowOAM
	.size	drawInstructions, .-drawInstructions
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
	push	{r4, lr}
	bl	updateInstructions
	bl	drawInstructions
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
	ldr	r3, .L90+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L89
.L83:
	pop	{r4, lr}
	bx	lr
.L89:
	ldr	r3, .L90+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+20
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L90+24
	ldr	r3, .L90+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+40
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L90+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L91:
	.align	2
.L90:
	.word	waitForVBlank
	.word	copyShadowOAM
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
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
	ldr	r3, .L94
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L94+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L95:
	.align	2
.L94:
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
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r5, #67108864
	ldr	r3, .L98
	mov	r2, r4
	strh	r4, [r5, #16]	@ movhi
	ldr	r1, [r3]
	strh	r4, [r5, #18]	@ movhi
	ldr	r0, .L98+4
	ldr	r3, .L98+8
	mov	lr, pc
	bx	r3
	mov	r3, #6272
	mov	r1, #256
	strh	r3, [r5, #8]	@ movhi
	ldr	r0, .L98+12
	ldr	r3, .L98+16
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r2, #32768
	ldr	r0, .L98+20
	ldr	r3, .L98+24
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #24
	ldr	r0, .L98+28
	ldr	r3, .L98+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+40
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L98+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L99:
	.align	2
.L98:
	.word	pauseSound_length
	.word	pauseSound_data
	.word	playSoundB
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
	ldr	r3, .L114
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L101
	ldr	r2, .L114+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L113
.L101:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L114+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L113:
	push	{r4, lr}
	ldr	r3, .L114+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+12
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L114+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L115:
	.align	2
.L114:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
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
	ldr	r0, .L118
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L118+4
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r2, #32768
	ldr	r0, .L118+8
	ldr	r3, .L118+12
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #24
	ldr	r0, .L118+16
	ldr	r3, .L118+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L118+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L118+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L118+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L118+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L118+40
	ldr	r3, .L118+44
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L118+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L119:
	.align	2
.L118:
	.word	winScreenPal
	.word	copyToBGPaletteMem
	.word	winScreenTiles
	.word	copyToCharBlock
	.word	winScreenMap
	.word	copyToScreenBlock
	.word	hideSprites
	.word	copyShadowOAM
	.word	stopSound
	.word	winSong_length
	.word	winSong_data
	.word	playSoundA
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
	ldr	r3, .L122
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L123:
	.align	2
.L122:
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
	ldr	r0, .L126
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L126+4
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r2, #32768
	ldr	r0, .L126+8
	ldr	r3, .L126+12
	mov	lr, pc
	bx	r3
	mov	r2, #1024
	mov	r1, #24
	ldr	r0, .L126+16
	ldr	r3, .L126+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+36
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L126+40
	ldr	r3, .L126+44
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L126+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L127:
	.align	2
.L126:
	.word	loseScreenPal
	.word	copyToBGPaletteMem
	.word	loseScreenTiles
	.word	copyToCharBlock
	.word	loseScreenMap
	.word	copyToScreenBlock
	.word	hideSprites
	.word	copyShadowOAM
	.word	stopSound
	.word	gameOverSound_length
	.word	gameOverSound_data
	.word	playSoundB
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
	ldr	r3, .L139
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+16
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L139+20
	ldrh	r1, [r2]
	ldr	r2, .L139+24
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L139+28
	strh	r1, [r3, #18]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L129
	ldr	r3, .L139+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L136
.L129:
	ldr	r3, .L139+36
	ldrsh	r3, [r3]
	cmp	r3, #0
	bne	.L137
	ldr	r2, .L139+40
	ldrsh	r1, [r2]
	cmp	r1, #0
	bne	.L138
	pop	{r4, lr}
	bx	lr
.L138:
	pop	{r4, lr}
	strh	r3, [r2]	@ movhi
	b	goToLose
.L137:
	pop	{r4, lr}
	b	goToWin
.L136:
	ldr	r3, .L139+44
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L129
.L140:
	.align	2
.L139:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	lastScreenOffsetAdjustment
	.word	copyShadowOAM
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	shouldWin
	.word	shouldLose
	.word	pauseSound
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
	ldr	r6, .L159
	ldr	r10, .L159+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L159+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L159+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L159+16
	ldr	r8, .L159+20
	ldr	r7, .L159+24
	ldr	fp, .L159+28
	ldr	r4, .L159+32
.L143:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L152
.L145:
	.word	.L150
	.word	.L149
	.word	.L148
	.word	.L147
	.word	.L146
	.word	.L144
.L144:
	tst	r0, #8
	beq	.L152
	ldr	r3, .L159+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L143
.L146:
	tst	r0, #8
	beq	.L152
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L143
.L147:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L143
.L148:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L143
.L149:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L143
.L150:
	tst	r0, #8
	beq	.L152
	tst	r3, #8
	beq	.L158
.L152:
	mov	r0, r3
	b	.L143
.L158:
	ldr	r3, .L159+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L143
.L160:
	.align	2
.L159:
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
	.comm	instructionSprites,288,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
