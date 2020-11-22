
#include "game.h"
#include "myLib.h"
#include "mario.h"
#include "Level1.h"
#include "entities.h"

ITEMBLOCK itemBlocks[ITEMBLOCKCOUNT];
ENEMY enemies[ENEMYCOUNT];

void initializeItemBlocks() {
    for (int i = 0; i < ITEMBLOCKCOUNT; i++) {
        itemBlocks[i].height = 16;
        itemBlocks[i].width = 16;
        shadowOAM[i + 1].attr2 = ATTR2_TILEID(30, 0) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
        switch(i) {
            case 0:
                itemBlocks[i].worldCol = SHIFTUP(174);
                itemBlocks[i].worldRow = SHIFTUP(176);
            break;
            case 1:
                itemBlocks[i].worldCol = SHIFTUP(190);
                itemBlocks[i].worldRow = SHIFTUP(176);
            break;
            case 2:
                itemBlocks[i].worldCol = SHIFTUP(222);
                itemBlocks[i].worldRow = SHIFTUP(128);
            break;
            case 3:
                itemBlocks[i].worldCol = SHIFTUP(238);
                itemBlocks[i].worldRow = SHIFTUP(128);
            break;
            case 4:
                itemBlocks[i].worldCol = SHIFTUP(414);
                itemBlocks[i].worldRow = SHIFTUP(144);
            break;
            case 5:
                itemBlocks[i].worldCol = SHIFTUP(702);
                itemBlocks[i].worldRow = SHIFTUP(176);
            break;
            case 6:
                itemBlocks[i].worldCol = SHIFTUP(1470);
                itemBlocks[i].worldRow = SHIFTUP(192);
            break;
        }
    }
}

void drawItemBlocks() {
    for (int i = 0; i < ITEMBLOCKCOUNT; i++) {
        if (((SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) + itemBlocks[i].width > 0)
        && ((SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) > 0)) {
            shadowOAM[i + 1].attr0 = (ROWMASK & (SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            shadowOAM[i + 1].attr1 = (COLMASK & (SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff)) | ATTR1_SMALL;
        } else {
            shadowOAM[i + 1].attr0 = (ROWMASK & (SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
            shadowOAM[i + 1].attr1 = (COLMASK & (SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff)) | ATTR1_SMALL;
        }

        if (itemBlocks[i].hit) {
            shadowOAM[i + 1].attr2 = ATTR2_TILEID(30, 2) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
        }
        
    }
}