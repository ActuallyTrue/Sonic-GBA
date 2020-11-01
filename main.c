#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
    hideSprites();
    copyShadowOAM();
    state = START;
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initializeGame();
        goToGame();
    }
}

// Sets up the game state
void goToGame() {
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    copyShadowOAM();
    // if (shouldwin) {
    //     goToWin();
    // } else if (shouldLose) {
    //     goToLose();
    // } else if (BUTTON_PRESSED(BUTTON_START)) {
    //     goToPause();
    // }
}

// Sets up the pause state
void goToPause() {
    //sets up background for pause screen
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(24);
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