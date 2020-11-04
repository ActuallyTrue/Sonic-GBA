#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "sonic.h"
#include "game.h"
#include "titleScreen.h"
#include "instructionScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "pauseScreen.h"

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

    goToStart();
}

// Sets up the start state
void goToStart() {
    //set up background for start screen
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(titleScreenPal, titleScreenPalLen >> 1);
    copyToCharBlock(titleScreenTiles, 0, titleScreenTilesLen >> 1);
    copyToScreenBlock(titleScreenMap, 24, titleScreenMapLen >> 1);
    hideSprites();
    copyShadowOAM();
    state = START;
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

void goToInstructions() {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(instructionScreenPal, instructionScreenPalLen >> 1);
    copyToCharBlock(instructionScreenTiles, 0, instructionScreenTilesLen >> 1);
    copyToScreenBlock(instructionScreenMap, 24, instructionScreenMapLen >> 1);
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initializeGame();
        goToGame();
    }
}

// Sets up the game state
void goToGame() {
    initializeBackground();
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    copyShadowOAM();
    if (BUTTON_PRESSED(BUTTON_START)) {
         goToPause();
    } else if (BUTTON_PRESSED(BUTTON_R)) {
        goToWin();
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        goToLose();
    }
    // if (shouldwin) {
    //     goToWin();
    // } else if (shouldLose) {
    //     goToLose();
    // } else 
}

// Sets up the pause state
void goToPause() {
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
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    //sets up background for win screen
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(winScreenPal, winScreenPalLen >> 1);
    copyToCharBlock(winScreenTiles, 0, winScreenTilesLen >> 1);
    copyToScreenBlock(winScreenMap, 24, winScreenMapLen >> 1);
    hideSprites();
    copyShadowOAM();
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
    //sets up background for lose state
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_8BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    copyToBGPaletteMem(loseScreenPal, loseScreenPalLen >> 1);
    copyToCharBlock(loseScreenTiles, 0, loseScreenTilesLen >> 1);
    copyToScreenBlock(loseScreenMap, 24, loseScreenMapLen >> 1);
    hideSprites();
    copyShadowOAM();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}