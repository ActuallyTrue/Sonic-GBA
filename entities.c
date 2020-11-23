
#include "game.h"
#include "myLib.h"
#include "mario.h"
#include "Level1.h"
#include "entities.h"
#include "Level1CollisionMap.h"

ITEMBLOCK itemBlocks[ITEMBLOCKCOUNT];
ENEMY enemies[ENEMYCOUNT];
ITEM items[ITEMCOUNT];
ITEM fireBalls[FIREBALLCOUNT];

void initializeItemBlocks() {
    for (int i = 0; i < ITEMBLOCKCOUNT; i++) {
        itemBlocks[i].height = 16;
        itemBlocks[i].width = 16;
        itemBlocks[i].hit = false;
        itemBlocks[i].given = false;
        shadowOAM[i + 1].attr2 = ATTR2_TILEID(30, 0) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
        switch(i) {
            case 0:
                itemBlocks[i].worldCol = SHIFTUP(174);
                itemBlocks[i].worldRow = SHIFTUP(176);
                itemBlocks[i].type = MUSHROOM;
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
                itemBlocks[i].type = FIREFLOWER;
            break;
            case 6:
                itemBlocks[i].worldCol = SHIFTUP(1470);
                itemBlocks[i].worldRow = SHIFTUP(192);
            break;
        }
    }
}

void updateItemBlocks() {
    for (int i = 0; i < ITEMBLOCKCOUNT; i++) {
        if (itemBlocks[i].hit && !itemBlocks[i].given) {
            itemBlocks[i].given = true;
            spawnItem(itemBlocks[i].worldCol, itemBlocks[i].worldRow - SHIFTUP(16), itemBlocks[i].type);
        }
    }
}

void initializeItems() {
    for (int i = 0; i < ITEMCOUNT; i++) {
        items[i].active = false;
        items[i].height = 16;
        items[i].width = 16;
    }
}

void spawnItem(int worldCol, int worldRow, int type) {
    for (int i = 0; i < ITEMCOUNT; i++) {
        if (!items[i].active) {
            items[i].active = true;
            items[i].worldCol = worldCol;
            items[i].worldRow = worldRow;
            items[i].type = type;
            items[i].grounded = true;

            switch(type) {
                case COIN:
                    items[i].colVelocity = 0;
                break;
                case MUSHROOM:
                    items[i].colVelocity = SHIFTUP(1);
                break;
                case FIREFLOWER:
                    items[i].colVelocity = 0;
                break;
            }
            return;
        }
    }
}

void updateItems() {
    for (int i = 0; i < ITEMCOUNT; i++) {
        if (items[i].active) {
            items[i].active = true;
            ITEMCheckCollisionWithCollisionMap(&items[i]);
            ITEMCheckCollisionWithItemBlocks(&items[i]);
            if (items[i].grounded) {
                items[i].rowVelocity = 0;
            } else {
                items[i].rowVelocity += GRAVITY;
            }
            items[i].worldCol += items[i].colVelocity;
        }
    }
}

void ITEMCheckCollisionWithItemBlocks(ITEM* item) {
    for (int i = 0; i < ITEMBLOCKCOUNT; i++) {
        if (((SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) + itemBlocks[i].width > 0)
        && ((SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) > 0)) { //this means it's on the screen
            if (item->rowVelocity < 0) { // moving up
                    for (int j = SHIFTDOWN(item->worldRow); j > SHIFTDOWN(item->worldRow + item->rowVelocity); j--) {
                        if (collision(SHIFTDOWN(item->worldCol),j, item->width, item->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                            //if this is true, you collided from the bottom
                            j++;
                            item->rowVelocity = (SHIFTUP(j) - item->worldRow); 
                            item->worldRow += item->rowVelocity;
                            item->rowVelocity = 0;
                            item->grounded = true;
                            itemBlocks[i].hit = true;
                            break;
                        }
                    }
            }
            if (item->colVelocity > 0) { // moving right
                for (int j = SHIFTDOWN(item->worldCol); j < SHIFTDOWN(item->worldCol + item->colVelocity); j++) {
                    if (collision(j,SHIFTDOWN(item->worldRow), item->width, item->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the left
                        j--;
                        item->colVelocity = (SHIFTUP(j) - item->worldCol);
                        item->worldCol += item->colVelocity;
                        item->colVelocity = 0;
                        return;
                    }
                }
            }
            if (item->colVelocity < 0) { //moving left
                for (int j = SHIFTDOWN(item->worldCol); j > SHIFTDOWN(item->worldCol + item->colVelocity) && i > 0; j--) {
                    if (collision(j,SHIFTDOWN(item->worldRow), item->width, item->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the right
                        j++;
                        item->colVelocity = (SHIFTUP(j) - item->worldCol);
                        item->worldCol += item->colVelocity;
                        item->colVelocity = 0;
                        break;
                    }
                }
            }

            if (item->rowVelocity > 0) { // moving down
                for (int j = SHIFTDOWN(item->worldRow); j < SHIFTDOWN(item->worldRow + item->rowVelocity); j++) {
                    if (collision(SHIFTDOWN(item->worldCol),j, item->width, item->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the top
                        j--;
                        item->rowVelocity = (SHIFTUP(j) - item->worldRow);
                        item->worldRow += item->rowVelocity;
                        item->rowVelocity = 0;
                        item->grounded = true;
                        break;
                    }
                }
            }
            if (SHIFTDOWN(item->worldRow) < SHIFTDOWN(itemBlocks[i].worldRow)) {
                if (collision(SHIFTDOWN(item->worldCol), SHIFTDOWN(item->worldRow) + 1, item->width, item->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                    item->grounded = true;
                }
            } 
        } 
    }
}
void ITEMCheckCollisionWithCollisionMap(ITEM* item) {
    //0x03E0 means green (can go through from bottom, can't go through from top)
    //0x7FFF means white
    if (item->colVelocity > 0) { //moving right
        for (int i = SHIFTDOWN(item->worldCol); i < SHIFTDOWN(item->worldCol + item->colVelocity); i++) {
            if ((Level1CollisionMapBitmap[OFFSET(i + item->width - 1, SHIFTDOWN(item->worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + item->width - 1, SHIFTDOWN(item->worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i + item->width - 1, SHIFTDOWN(item->worldRow) + item->height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + item->width - 1, SHIFTDOWN(item->worldRow) + item->height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                item->colVelocity = (SHIFTUP(i) - item->worldCol);
                item->worldCol += item->colVelocity;
                item->colVelocity = -item->colVelocity;
            }
        }
    }
    if (item->colVelocity < 0) { //moving left
        for (int i = SHIFTDOWN(item->worldCol); i > SHIFTDOWN(item->worldCol + item->colVelocity) && i > 0; i--) {
            if ((Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(item->worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(item->worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(item->worldRow) + item->height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(item->worldRow) + item->height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                item->colVelocity = (SHIFTUP(i) - item->worldCol) + 64;
                item->worldCol += item->colVelocity;
                item->colVelocity = -item->colVelocity;
            }
        }
    }

    if (item->rowVelocity > 0) { //moving down
        for (int i = SHIFTDOWN(item->worldRow); i < SHIFTDOWN(item->worldRow + item->rowVelocity); i++) {
            if (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol), i + item->height - 1, 2816)] == 0x7FFF
            && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol) + item->width - 2, i + item->height - 1, 2816)] == 0x7FFF) {
                continue;
            } else {
                item->rowVelocity = (SHIFTUP(i) - item->worldRow) - 64;
                item->worldRow += item->rowVelocity;
                item->rowVelocity = 0;
                item->grounded = true;
            }
        }
    }

    if (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol), SHIFTDOWN(item->worldRow) + 1 + item->height - 1, 2816)] == 0x7FFF
        && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol) + item->width - 1, SHIFTDOWN(item->worldRow) + 1 + item->height - 1, 2816)] == 0x7FFF) {
        item->grounded = false;
    }

    if (item->rowVelocity < 0) {//moving up
        for (int i = SHIFTDOWN(item->worldRow); i > SHIFTDOWN(item->worldRow + item->rowVelocity); i--) {
            if ((Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol), i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol), i, 2816)] == 0x03E0)
            && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol) + item->width - 2, i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol) + item->width - 2, i, 2816)] == 0x03E0) {
                continue;
            } else {
                item->rowVelocity = (SHIFTUP(i) - item->worldRow);  
            }
        }
    }

    if (SHIFTDOWN(item->worldRow) + item->height >= 256) {
        item->active = false;
    }
    
}

void drawItems() {
    for (int i = 0; i < ITEMCOUNT; i++) {
        if (items[i].active) {
            if (((SHIFTDOWN(items[i].worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(items[i].worldCol) - player.hOff) + items[i].width > 0)
            && ((SHIFTDOWN(items[i].worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(items[i].worldRow) - player.vOff) > 0)) {
                shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(items[i].worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
                shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr1 = (COLMASK & (SHIFTDOWN(items[i].worldCol) - player.hOff)) | ATTR1_SMALL;
            } else {
                shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(items[i].worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
                shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr1 = (COLMASK & (SHIFTDOWN(items[i].worldCol) - player.hOff)) | ATTR1_SMALL;
            }
        } else {
            shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(items[i].worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
        }
        switch (items[i].type) {
            case COIN:
                shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr2 = ATTR2_TILEID(30, 4) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
            break;
            case MUSHROOM:
                shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr2 = ATTR2_TILEID(30, 8) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
            break;
            case FIREFLOWER:
                shadowOAM[i + 1 + ITEMBLOCKCOUNT].attr2 = ATTR2_TILEID(30, 6) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
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