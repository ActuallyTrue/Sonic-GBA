
#include "game.h"
#include "myLib.h"
#include "sonic.h"
void updateGame() {
    updatePlayer();
}

void updatePlayer() {
    updateSonic();
}

void drawGame() {
    drawSonic();
}

void initializeGame() {
    initializeSonic();
}