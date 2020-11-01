
#include "game.h"
#include "myLib.h"
#include "sonic.h"
#include "testmap.h"
#include "testcollisionmap.h"
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
    initializeBackground();
    initializeSonic();
}

void initializeBackground() {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(8);
    copyToBGPaletteMem(testmapPal, testmapPalLen >> 1);
    copyToCharBlock(testmapTiles, 0, testmapTilesLen >> 1);
    copyToScreenBlock(testmapMap, 8, testmapMapLen >> 1);
}