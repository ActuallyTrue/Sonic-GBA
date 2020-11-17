
#include "game.h"
#include "myLib.h"
#include "mario.h"
#include "Level1.h"

int currentScreenBlock = 10;
int currentTileMapDivision = 0;
short shouldWin;
short shouldLose;
void updateGame() {
    updatePlayer();
}

void updatePlayer() {
    updateSonic();
    // if (player.worldCol > 2709) {
    //     shouldWin = true;
    // }
    // if (player.worldRow > 256) {
    //     shouldLose = true;
    // }
}

void drawGame() {
    drawSonic();
}

void initializeGame() {
    hOff = 0;
    vOff = 0;
    initializeBackground();
    initializeSonic();
}

void initializeBackground() {
    //currentScreenBlock = 10;
    //currentTileMapDivision = 0;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_WIDE | BG_SCREENBLOCK(currentScreenBlock);
    copyToBGPaletteMem(Level1Pal, Level1PalLen >> 1);
    copyToCharBlock(Level1Tiles, 0, (Level1TilesLen >> 1));
    copyToScreenBlock(Level1Map, 10, (Level1MapLen >> 1));
}