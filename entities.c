
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
ITEM goal;

void initializeItemBlocks() {
    goal.worldCol = SHIFTUP(2681);
    goal.worldRow = SHIFTUP(155);
    goal.width = 26;
    goal.height = 26;
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

void initializeEnemies() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].height = 16;
        enemies[i].width = 16;
        enemies[i].active = true;
        enemies[i].numFrames = 3;
        switch(i) {
            case 0: //first goomba
                enemies[i].worldCol = SHIFTUP(200);
                enemies[i].worldRow = SHIFTUP(224);
                enemies[i].colVelocity = SHIFTUP(1);
                enemies[i].type = GOOMBA;
            break;
            case 1: //second goomba
                enemies[i].worldCol = SHIFTUP(385);
                enemies[i].worldRow = SHIFTUP(224);
                enemies[i].colVelocity = SHIFTUP(1);
                enemies[i].type = GOOMBA;
            break;
            case 2: //first chomper
                enemies[i].worldCol = SHIFTUP(622);
                enemies[i].worldRow = SHIFTUP(208);
                enemies[i].type = CHOMPER;
            break;
            case 3: //third goomba
                enemies[i].worldCol = SHIFTUP(969);
                enemies[i].worldRow = SHIFTUP(208);
                enemies[i].colVelocity = SHIFTUP(1);
                enemies[i].type = GOOMBA;
            break;
            case 4: //fourth goomba
                enemies[i].worldCol = SHIFTUP(1013);
                enemies[i].worldRow = SHIFTUP(208);
                enemies[i].colVelocity = SHIFTUP(1);
                enemies[i].type = GOOMBA;
            break;
            case 5: //second chomper
                enemies[i].worldCol = SHIFTUP(1069);
                enemies[i].worldRow = SHIFTUP(208);
                enemies[i].type = CHOMPER;
            break;
            case 6: //third chomper
                enemies[i].worldCol = SHIFTUP(1182);
                enemies[i].worldRow = SHIFTUP(224);
                enemies[i].type = CHOMPER;
            break;
            case 7: //fifth goomba
                enemies[i].worldCol = SHIFTUP(1254);
                enemies[i].worldRow = SHIFTUP(224);
                enemies[i].colVelocity = SHIFTUP(1);
                enemies[i].type = GOOMBA;
            break;
            case 8: //fourth chomper
                enemies[i].worldCol = SHIFTUP(1485);
                enemies[i].worldRow = SHIFTUP(224);
                enemies[i].type = CHOMPER;
            break;
            case 9: //sixth goomba
                enemies[i].worldCol = SHIFTUP(1887);
                enemies[i].worldRow = SHIFTUP(224);
                enemies[i].colVelocity = SHIFTUP(1);
                enemies[i].type = GOOMBA;
            break;
        }
    }
}

void initializeFireBalls() {
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        fireBalls[i].colVelocity = SHIFTUP(3);
        fireBalls[i].active = false;
        fireBalls[i].height = 8;
        fireBalls[i].width = 8;
        fireBalls[i].worldCol = 0;
        fireBalls[i].worldRow = 0;
    }
}

void updateFireBalls() {
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        if (fireBalls[i].active) {
            FIREBALLCheckCollisionWithItemBlocks(&fireBalls[i]);
            FIREBALLCheckCollisionWithEnemies(&fireBalls[i]);
            FIREBALLCheckCollisionWithCollisionMap(&fireBalls[i]);
            fireBalls[i].worldCol += fireBalls[i].colVelocity;
            fireBalls[i].worldRow += fireBalls[i].rowVelocity;
            fireBalls[i].rowVelocity += GRAVITY;
        }
    }
}

void FIREBALLCheckCollisionWithEnemies(ITEM* fireBall) {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (collision(SHIFTDOWN(fireBall->worldCol), SHIFTDOWN(fireBall->worldRow), fireBall->width, fireBall->height, SHIFTDOWN(enemies[i].worldCol),
            SHIFTDOWN(enemies[i].worldRow), enemies[i].width, enemies[i].height)) {
            if (enemies[i].type == GOOMBA) {
                killEnemy(&enemies[i]);
            }
            fireBall->active = false;
            fireBall->worldCol = 0;
            fireBall->worldRow = 0;
        }
    }
}
void FIREBALLCheckCollisionWithCollisionMap(ITEM* fireBall) {
    //0x03E0 means green (can go through from bottom, can't go through from top)
    //0x7FFF means white

    if (fireBall->rowVelocity > 0) { //moving down
        for (int i = SHIFTDOWN(fireBall->worldRow); i < SHIFTDOWN(fireBall->worldRow + fireBall->rowVelocity); i++) {
            if (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(fireBall->worldCol), i + fireBall->height - 1, 2816)] == 0x7FFF
            && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(fireBall->worldCol) + fireBall->width - 2, i + fireBall->height - 1, 2816)] == 0x7FFF) {
                continue;
            } else {
                fireBall->rowVelocity = -JUMPFORCE/2;
                //fireBall->worldRow += fireBall->rowVelocity;
                //fireBall->rowVelocity = 0;
                return;
            }
        }
    }

    if (fireBall->colVelocity > 0) { //moving right
        for (int i = SHIFTDOWN(fireBall->worldCol); i < SHIFTDOWN(fireBall->worldCol + fireBall->colVelocity); i++) {
            if ((Level1CollisionMapBitmap[OFFSET(i + fireBall->width - 1, SHIFTDOWN(fireBall->worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + fireBall->width - 1, SHIFTDOWN(fireBall->worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i + fireBall->width - 1, SHIFTDOWN(fireBall->worldRow) + fireBall->height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + fireBall->width - 1, SHIFTDOWN(fireBall->worldRow) + fireBall->height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                fireBall->active = false;
                fireBall->worldCol = 0;
                fireBall->worldRow = 0;
                return;
            }
        }
    }
    if (fireBall->colVelocity < 0) { //moving left
        for (int i = SHIFTDOWN(fireBall->worldCol); i > SHIFTDOWN(fireBall->worldCol + fireBall->colVelocity) && i > 0; i--) {
            if ((Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(fireBall->worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(fireBall->worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(fireBall->worldRow) + fireBall->height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(fireBall->worldRow) + fireBall->height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                fireBall->active = false;
                fireBall->worldCol = 0;
                fireBall->worldRow = 0;
                return;
            }
        }
    }

    if (SHIFTDOWN(fireBall->worldCol) <= 0) {
        fireBall->active = false;
        fireBall->worldCol = 0;
        fireBall->worldRow = 0;
    }

    if (fireBall->rowVelocity < 0) {//moving up
        for (int i = SHIFTDOWN(fireBall->worldRow); i > SHIFTDOWN(fireBall->worldRow + fireBall->rowVelocity); i--) {
            if ((Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(fireBall->worldCol), i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(fireBall->worldCol), i, 2816)] == 0x03E0)
            && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(fireBall->worldCol) + fireBall->width - 2, i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(fireBall->worldCol) + fireBall->width - 2, i, 2816)] == 0x03E0) {
                continue;
            } else {
                fireBall->active = false;
                fireBall->worldCol = 0;
                fireBall->worldRow = 0;
            }
        }
    }

    if (SHIFTDOWN(fireBall->worldRow) + fireBall->height >= 256) {
        fireBall->active = false;
        fireBall->worldCol = 0;
        fireBall->worldRow = 0;
    }
}

void FIREBALLCheckCollisionWithItemBlocks(ITEM* fireBall) {
        for (int i = 0; i < ITEMBLOCKCOUNT; i++) {
        if (((SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) + itemBlocks[i].width > 0)
        && ((SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) > 0)) { //this means it's on the screen
            
            if (fireBall->rowVelocity > 0) { // moving down
                for (int j = SHIFTDOWN(fireBall->worldRow); j < SHIFTDOWN(fireBall->worldRow + fireBall->rowVelocity); j++) {
                    if (collision(SHIFTDOWN(fireBall->worldCol),j, fireBall->width, fireBall->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the top
                        fireBall->rowVelocity = -JUMPFORCE/2;
                        //fireBall->worldRow += fireBall->rowVelocity;
                        //fireBall->rowVelocity = 0;
                        return;
                    }
                }
            }
            
            if (fireBall->colVelocity > 0) { // moving right
                for (int j = SHIFTDOWN(fireBall->worldCol); j < SHIFTDOWN(fireBall->worldCol + fireBall->colVelocity); j++) {
                    if (collision(j,SHIFTDOWN(fireBall->worldRow),fireBall->width, fireBall->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the left
                        fireBall->active = false;
                        fireBall->worldCol = 0;
                        fireBall->worldRow = 0;
                        return;
                    }
                }
            }
            if (fireBall->colVelocity < 0) { //moving left
                for (int j = SHIFTDOWN(fireBall->worldCol); j > SHIFTDOWN(fireBall->worldCol + fireBall->colVelocity) && j > 0; j--) {
                    if (collision(j,SHIFTDOWN(fireBall->worldRow), fireBall->width, fireBall->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the right
                        fireBall->active = false;
                        fireBall->worldCol = 0;
                        fireBall->worldRow = 0;
                        return;
                    }
                }
            }
            if (fireBall->rowVelocity < 0) { // moving up
                    for (int j = SHIFTDOWN(fireBall->worldRow); j > SHIFTDOWN(fireBall->worldRow + fireBall->rowVelocity); j--) {
                        if (collision(SHIFTDOWN(fireBall->worldCol), j, fireBall->width, fireBall->height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                            //if this is true, you collided from the bottom
                            fireBall->active = false;
                            fireBall->worldCol = 0;
                            fireBall->worldRow = 0;
                            return;
                        }
                    }
            }
        } 
    }
}

void updateEnemies() {
        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (enemies[i].active) {
                switch (enemies[i].type) {
                case GOOMBA:
                    updateGoomba(&enemies[i]);
                break;
                case CHOMPER:
                    updateChomper(&enemies[i]);
                break;
            }
        }      
    }
}

void updateGoomba(ENEMY* goomba) {
    GOOMBACheckCollisionWithEnemies(goomba);
    GOOMBACheckCollisionWithCollisionMap(goomba);
    if (goomba->aniCounter % 15 == 0) {
        goomba->flip = !goomba->flip;
    }
    goomba->worldCol += goomba->colVelocity;
    goomba->aniCounter++;
}

void GOOMBACheckCollisionWithEnemies(ENEMY* goomba) {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (goomba != &enemies[i]) {
            if (collision(SHIFTDOWN(goomba->worldCol), SHIFTDOWN(goomba->worldRow), goomba->width, goomba->height, SHIFTDOWN(enemies[i].worldCol),
             SHIFTDOWN(enemies[i].worldRow), enemies[i].width, enemies[i].height)) {
                 goomba->colVelocity = -goomba->colVelocity;
             }
        }
        
    }
}
void GOOMBACheckCollisionWithCollisionMap(ENEMY* goomba) {
    //0x03E0 means green (can go through from bottom, can't go through from top)
    //0x7FFF means white
    if (goomba->colVelocity > 0) { //moving right
        for (int i = SHIFTDOWN(goomba->worldCol); i < SHIFTDOWN(goomba->worldCol + goomba->colVelocity); i++) {
            if ((Level1CollisionMapBitmap[OFFSET(i + goomba->width - 1, SHIFTDOWN(goomba->worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + goomba->width - 1, SHIFTDOWN(goomba->worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i + goomba->width - 1, SHIFTDOWN(goomba->worldRow) + goomba->height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + goomba->width - 1, SHIFTDOWN(goomba->worldRow) + goomba->height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                // i--;
                // goomba->colVelocity = (SHIFTUP(i) - goomba->worldCol);
                // goomba->worldCol += goomba->colVelocity;
                goomba->colVelocity = -goomba->colVelocity;
                return;
            }
        }
    }
    if (goomba->colVelocity < 0) { //moving left
        for (int i = SHIFTDOWN(goomba->worldCol); i > SHIFTDOWN(goomba->worldCol + goomba->colVelocity) && i > 0; i--) {
            if ((Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(goomba->worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(goomba->worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(goomba->worldRow) + goomba->height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(goomba->worldRow) + goomba->height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                // i--;
                // goomba->colVelocity = (SHIFTUP(i) - goomba->worldCol);
                // goomba->worldCol += goomba->colVelocity;
                goomba->colVelocity = -goomba->colVelocity;
                return;
            }
        }
    }

    if (SHIFTDOWN(goomba->worldCol) <= 0) {
        goomba->colVelocity = -goomba->colVelocity;
    }

    // if (goomba->rowVelocity > 0) { //moving down
    //     for (int i = SHIFTDOWN(goomba->worldRow); i < SHIFTDOWN(goomba->worldRow + goomba->rowVelocity); i++) {
    //         if (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol), i + goomba->height - 1, 2816)] == 0x7FFF
    //         && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol) + goomba->width - 2, i + goomba->height - 1, 2816)] == 0x7FFF) {
    //             continue;
    //         } else {
    //             goomba->rowVelocity = (SHIFTUP(i) - goomba->worldRow) - 64;
    //             goomba->worldRow += goomba->rowVelocity;
    //             goomba->rowVelocity = 0;
    //         }
    //     }
    // }

    // // if (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol), SHIFTDOWN(goomba->worldRow) + 1 + goomba->height - 1, 2816)] == 0x7FFF
    // //     && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol) + goomba->width - 1, SHIFTDOWN(goomba->worldRow) + 1 + goomba->height - 1, 2816)] == 0x7FFF) {
    // // }

    // if (goomba->rowVelocity < 0) {//moving up
    //     for (int i = SHIFTDOWN(goomba->worldRow); i > SHIFTDOWN(goomba->worldRow + goomba->rowVelocity); i--) {
    //         if ((Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol), i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol), i, 2816)] == 0x03E0)
    //         && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol) + goomba->width - 2, i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(goomba->worldCol) + goomba->width - 2, i, 2816)] == 0x03E0) {
    //             continue;
    //         } else {
    //             goomba->rowVelocity = (SHIFTUP(i) - goomba->worldRow);  
    //         }
    //     }
    // }

    // if (SHIFTDOWN(goomba->worldRow) + goomba->height >= 256) {
    //     goomba->active = false;
    // }
    
}

void killEnemy(ENEMY* enemy) {
    enemy->active = false;
    enemy->worldCol = 0;
    enemy->worldRow = 0;
}
void updateChomper(ENEMY* chomper) {
    if (chomper->aniCounter % 15 == 0) {
        if (++chomper->curFrame >= chomper->numFrames) {
            chomper->curFrame = 0;
        }
    }
    chomper->aniCounter++;
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
            && (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol) + item->width - 2, i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(item->worldCol) + item->width - 2, i, 2816)] == 0x03E0)) {
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

void drawEnemies() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        switch (enemies[i].type) {
            case GOOMBA:
                drawGoomba(&enemies[i], i);
            break;
            case CHOMPER:
                drawChomper(&enemies[i], i);
            break;
        }
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

void drawGoomba(ENEMY* goomba, int index) {
    if (goomba->active) {
        if (((SHIFTDOWN(goomba->worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(goomba->worldCol) - player.hOff) + goomba->width > 0)
        && ((SHIFTDOWN(goomba->worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(goomba->worldRow) - player.vOff) > 0)) { //this means it's on screen
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(goomba->worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr1 = (COLMASK & (SHIFTDOWN(goomba->worldCol) - player.hOff)) | ATTR1_SMALL;
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr2 = ATTR2_TILEID(0, 2) | ATTR2_PRIORITY(0) | ATTR2_PALROW(1);
            //flips the goomba depending on its flip variable
            if (goomba->flip) {
                shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr1 |= ATTR1_HFLIP;
            } else {
                shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr1 &= ~ATTR1_HFLIP;
            }
        } else {
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(goomba->worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr1 = (COLMASK & (SHIFTDOWN(goomba->worldCol) - player.hOff)) | ATTR1_SMALL;
        }
    } else {
        shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr0 = ATTR0_HIDE;
    }
}

void drawChomper(ENEMY* chomper, int index) {
    if (chomper->active) {
        if (((SHIFTDOWN(chomper->worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(chomper->worldCol) - player.hOff) + chomper->width > 0)
        && ((SHIFTDOWN(chomper->worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(chomper->worldRow) - player.vOff) > 0)) { //this means it's on screen
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(chomper->worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr1 = (COLMASK & (SHIFTDOWN(chomper->worldCol) - player.hOff)) | ATTR1_SMALL;
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr2 = ATTR2_TILEID(0, (chomper->curFrame + 2) * 2) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
        } else {
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(chomper->worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
            shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr1 = (COLMASK & (SHIFTDOWN(chomper->worldCol) - player.hOff)) | ATTR1_SMALL;
        }
    } else {
        shadowOAM[index + 1 + ITEMBLOCKCOUNT + ITEMCOUNT].attr0 = ATTR0_HIDE;
    }
}

void drawGoal() {
    if (((SHIFTDOWN(goal.worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(goal.worldCol) - player.hOff) + goal.width > 0)
        && ((SHIFTDOWN(goal.worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(goal.worldRow) - player.vOff) > 0)) { // this means it's on screen
            shadowOAM[98].attr0 = (ROWMASK & (SHIFTDOWN(goal.worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            shadowOAM[98].attr1 = (COLMASK & (SHIFTDOWN(goal.worldCol) - player.hOff)) | ATTR1_MEDIUM;
        } else {
            shadowOAM[98].attr0 = (ROWMASK & (SHIFTDOWN(goal.worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
            shadowOAM[98].attr1 = (COLMASK & (SHIFTDOWN(goal.worldCol) - player.hOff)) | ATTR1_MEDIUM;
    }

    shadowOAM[98].attr2 = ATTR2_TILEID(28, 10) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);

}

void drawFireBalls() {
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        if (fireBalls[i].active) {
            if (((SHIFTDOWN(fireBalls[i].worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(fireBalls[i].worldCol) - player.hOff) + fireBalls[i].width > 0)
            && ((SHIFTDOWN(fireBalls[i].worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(fireBalls[i].worldRow) - player.vOff) > 0)) { //this means it's on screen
                shadowOAM[i + 1 + ITEMBLOCKCOUNT + ITEMCOUNT + ENEMYCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(fireBalls[i].worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
                shadowOAM[i + 1 + ITEMBLOCKCOUNT + ITEMCOUNT + ENEMYCOUNT].attr1 = (COLMASK & (SHIFTDOWN(fireBalls[i].worldCol) - player.hOff)) | ATTR1_TINY;
                shadowOAM[i + 1 + ITEMBLOCKCOUNT + ITEMCOUNT + ENEMYCOUNT].attr2 = ATTR2_TILEID(29, 0) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
            } else {
                shadowOAM[i + 1 + ITEMBLOCKCOUNT + ITEMCOUNT + ENEMYCOUNT].attr0 = (ROWMASK & (SHIFTDOWN(fireBalls[i].worldRow) - player.vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
                shadowOAM[i + 1 + ITEMBLOCKCOUNT + ITEMCOUNT + ENEMYCOUNT].attr1 = (COLMASK & (SHIFTDOWN(fireBalls[i].worldCol) - player.hOff)) | ATTR1_TINY;
            }
        } else {
            shadowOAM[i + 1 + ITEMBLOCKCOUNT + ITEMCOUNT + ENEMYCOUNT].attr0 = ATTR0_HIDE;
        }
    }
    
}