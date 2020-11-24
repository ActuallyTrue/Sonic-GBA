#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "mario.h"
#include "game.h"
#include "titleScreen.h"
#include "instructionScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "pauseScreen.h"
#include "Level1.h"
#include "sound.h"
#include "gameSong.h"
#include "gameOverSound.h"
#include "titleSong.h"
#include "winSong.h"
#include "pauseSound.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    hideSprites();
    copyShadowOAM();

    buttons = BUTTONS;
    oldButtons = 0;

    setupInterrupts();
    setupSounds();

    goToStart();
}

// Sets up the start state
void goToStart() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    //set up background for start screen
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(titleScreenPal, titleScreenPalLen >> 1);
    copyToCharBlock(titleScreenTiles, 0, titleScreenTilesLen >> 1);
    copyToScreenBlock(titleScreenMap, 24, titleScreenMapLen >> 1);
    hideSprites();
    copyShadowOAM();
    stopSound();
    playSoundA(titleSong_data, titleSong_length, true);
    state = START;
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

void goToInstructions() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(instructionScreenPal, instructionScreenPalLen >> 1);
    copyToCharBlock(instructionScreenTiles, 0, instructionScreenTilesLen >> 1);
    copyToScreenBlock(instructionScreenMap, 24, instructionScreenMapLen >> 1);
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSong_data, gameSong_length, 1);
        initializeGame();
        initializeBackground();
        goToGame();
    }
}

// Sets up the game state
void goToGame() {
    restoreBackground();
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    lastScreenOffsetAdjustment();
    copyShadowOAM();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    } if (shouldWin) {
        goToWin();
    } else if (shouldLose) {
        shouldLose = false;
        goToLose();
    }
}

// Sets up the pause state
void goToPause() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    playSoundB(pauseSound_data, pauseSound_length, false);
    //sets up background for pause screen
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(pauseScreenPal, pauseScreenPalLen >> 1);
    copyToCharBlock(pauseScreenTiles, 0, pauseScreenTilesLen >> 1);
    copyToScreenBlock(pauseScreenMap, 24, pauseScreenMapLen >> 1);
    hideSprites();
    copyShadowOAM();
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    //sets up background for win screen
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(winScreenPal, winScreenPalLen >> 1);
    copyToCharBlock(winScreenTiles, 0, winScreenTilesLen >> 1);
    copyToScreenBlock(winScreenMap, 24, winScreenMapLen >> 1);
    hideSprites();
    copyShadowOAM();

    stopSound();
    playSoundA(winSong_data, winSong_length, 1);
    state = WIN;
}

// Runs every frame of the win state
void win() {
    //updateWin();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    //sets up background for lose state
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(loseScreenPal, loseScreenPalLen >> 1);
    copyToCharBlock(loseScreenTiles, 0, loseScreenTilesLen >> 1);
    copyToScreenBlock(loseScreenMap, 24, loseScreenMapLen >> 1);
    hideSprites();
    copyShadowOAM();
    stopSound();
    //playSoundA(loseSong_data, loseSong_length, 1);
    playSoundB(gameOverSound_data, gameOverSound_length, 0);
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}