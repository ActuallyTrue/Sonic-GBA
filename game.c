#include "game.h"
#include "myLib.h"
#include "mario.h"
#include "Level1.h"
#include "entities.h"

int currentScreenBlock = 10;
int currentTileMapDivision = 0;
short shouldWin;
short shouldLose;
void updateGame() {
    updateItems();
    updatePlayer();
    updateEnemies();
    updateItemBlocks();
    updateFireBalls();
}

void updatePlayer() {
    updateMario();
}

void drawGame() {
    drawMario();
    drawItemBlocks();
    drawItems();
    drawEnemies();
    drawGoal();
    drawFireBalls();
}

void initializeGame() {
    hOff = 0;
    vOff = 0;
    shouldLose = false;
    shouldWin = false;
    initializeBackground();
    initializeMario();
    initializeItemBlocks();
    initializeItems();
    initializeEnemies();
    initializeFireBalls();
}

void initializeBackground() {
    currentScreenBlock = 10;
    currentTileMapDivision = 0;
    vOff = 256 - SCREENHEIGHT;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_WIDE | BG_SCREENBLOCK(currentScreenBlock);
    copyToBGPaletteMem(Level1Pal, Level1PalLen >> 1);
    copyToCharBlock(Level1Tiles, 0, (Level1TilesLen >> 1));
    copyToScreenBlock(Level1Map, 10, (Level1MapLen >> 1));
}

void restoreBackground() {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_WIDE | BG_SCREENBLOCK(currentScreenBlock);
    copyToBGPaletteMem(Level1Pal, Level1PalLen >> 1);
    copyToCharBlock(Level1Tiles, 0, (Level1TilesLen >> 1));
    copyToScreenBlock(Level1Map, 10, (Level1MapLen >> 1));
}

void lastScreenOffsetAdjustment() {
    if (currentScreenBlock == 10 && hOff < 0) {
        hOff = 0;
        player.hOff = 0;
    }

    if (currentScreenBlock == 19 && hOff >= 512 - SCREENWIDTH - 20) {
        hOff = 512 - SCREENWIDTH - 20;
        player.hOff = 2816 - SCREENWIDTH - 20;
    } else {
        if (hOff >= 256 && currentScreenBlock < 19) {
            currentScreenBlock++;
            hOff -= 256;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_WIDE | BG_SCREENBLOCK(currentScreenBlock);
        }
        if (hOff < 0 && currentScreenBlock > 10) {
            currentScreenBlock--;
            hOff += 256;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_WIDE | BG_SCREENBLOCK(currentScreenBlock);
        }
    }
}