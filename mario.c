#include "mario.h"
#include "myLib.h"
#include "mariospritesheet.h"
#include "Level1CollisionMap.h"
#include "game.h"
#include "entities.h"
#include "sound.h"
#include "fireBallSound.h"
#include "coinSound.h"
#include "itemSpawnSound.h"
#include "jumpSound.h"
#include "pauseSound.h"
#include "powerDownSound.h"
#include "powerUpSound.h"


MARIO player;
enum {IDLE, WALK, JUMP,  END};
enum {NORMAL, BIG};

void checkCollisionWithGoombas(ENEMY* goomba);

void initializeMario() {
    copyToSpritePaletteMem(mariospritesheetPal, mariospritesheetPalLen >> 1);
    copyToCharBlock(mariospritesheetTiles, 4, mariospritesheetTilesLen >> 1);
    player.height = 16;
    player.width = 16;
    player.worldCol = SHIFTUP(20);
    player.worldRow = SHIFTUP(223);
    player.curFrame = 0;
    player.aniCounter = 0;
    player.aniState = IDLE;
    player.hOff = hOff;
    player.vOff = vOff;
    player.powerUpState = NORMAL;
    player.invincible = false;
    player.invincibilityCounter = 0;
    player.hide = false;
}

void updateMario() {

    checkCollisionWithGoal();
    // Control movement
    short moveInput = false;

    if (BUTTON_PRESSED(BUTTON_B) && player.powerUpState == FIREFLOWER) {
        for (int i = 0; i < FIREBALLCOUNT; i++) {
            if (!fireBalls[i].active) {
                playSoundB(fireBallSound_data, fireBallSound_length, false);
                fireBalls[i].active = true;
                if (player.flip) {
                    fireBalls[i].worldCol = SHIFTUP(SHIFTDOWN(player.worldCol) + player.width);
                    fireBalls[i].colVelocity = SHIFTUP(3);
                } else {
                    fireBalls[i].worldCol = player.worldCol;
                    fireBalls[i].colVelocity = -SHIFTUP(3);
                }
                fireBalls[i].worldRow = player.worldRow;
                fireBalls[i].rowVelocity = SHIFTUP(1);
                break;
            }
        }
    }

    if (BUTTON_HELD(BUTTON_B)) {
        player.running = true;
    }

    if (BUTTON_RELEASED(BUTTON_B)) {
        player.running = false;
    }

    //keeps previous animation state so that I can tell if the state changed.
    player.prevAniState = player.aniState;

    if(BUTTON_HELD(BUTTON_LEFT)) {
        player.colVelocity = player.running ? -SHIFTUP(2) : -SHIFTUP(1);
        if (player.grounded) {
            player.aniState = WALK;
            player.numFrames = WALKFRAMES;
        }
        // if (player.grounded) {
        //     if (player.colVelocity > 0) {
        //     player.colVelocity = SHIFTUP(-1);//-= DECELERATION;
        //     } else {
        //         player.colVelocity = SHIFTUP(-2);//-= player.running ? RUNNINGACCELERATION : WALKINGACCELERATION;
        //     }
        // } else {
        //     if (player.colVelocity > 0) {
        //     player.colVelocity = SHIFTUP(-1);//-= AIRACCELERATION;
        //     } else {
        //         player.colVelocity = SHIFTUP(-1);//-= AIRACCELERATION;
        //     }
        // }
        
        player.flip = false;
        moveInput = true;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player.colVelocity = player.running ? SHIFTUP(2) : SHIFTUP(1);
        if (player.grounded) {
            player.aniState = WALK;
            player.numFrames = WALKFRAMES;
        }
        // if (player.grounded) {
        //     if (player.colVelocity < 0) {
        //     player.colVelocity = SHIFTUP(1);//+= DECELERATION;
        //     } else {
        //         player.colVelocity = SHIFTUP(1);//+= player.running ? RUNNINGACCELERATION : WALKINGACCELERATION;
        //     }
        // } else {
        //     if (player.colVelocity < 0) {
        //         player.colVelocity = SHIFTUP(1);//+= AIRACCELERATION;
        //     } else {
        //         player.colVelocity = SHIFTUP(1);//+= AIRACCELERATION;
        //     }
        // }
        player.flip = true;
        moveInput = true;
    }

    //top speed checks
    if (!player.running && player.colVelocity > WALKINGTOPSPEED) {
        player.colVelocity = WALKINGTOPSPEED;
    }
    if (!player.running && player.colVelocity < -WALKINGTOPSPEED) {
        player.colVelocity = -WALKINGTOPSPEED;
    }

    if (player.running && player.colVelocity > TOPSPEED) {
        player.colVelocity = TOPSPEED;
    }
    if (player.running && player.colVelocity < -TOPSPEED) {
        player.colVelocity = -TOPSPEED;
    }

    if (!moveInput) {
        if (player.grounded) {
            player.aniState = IDLE;
            player.numFrames = 0;
        }
        if (player.colVelocity > 0) {
            player.colVelocity -= DECELERATION;
            if (player.colVelocity < 0) {
                player.colVelocity = 0;
                player.aniState = IDLE;
                player.numFrames = 0;
            }
        }
        if (player.colVelocity < 0) {
            player.colVelocity += DECELERATION;
            if (player.colVelocity > 0) {
                player.colVelocity = 0;
                player.aniState = IDLE;
                player.numFrames = 0;
            }
        }
        
    }
    checkCollisionWithMap();
    checkCollisionWithItemBlocks();
    if (!player.invincible) {
        checkCollisionWithEnemies();
    } else {
        if (player.invincibilityCounter % 2 == 0) {
            player.hide = !player.hide;
        }
        if (player.invincibilityCounter > 90) {
            player.invincible = false;
            player.hide = false;
            player.invincibilityCounter = 0;
        } else {
            player.invincibilityCounter++;
        }
    }
    short cheating = false;
    if (BUTTON_HELD(BUTTON_R)) {
        cheating = true;
        player.rowVelocity = -SHIFTUP(1);
        player.grounded = false;
        player.rowVelocity = -JUMPFORCE;
        player.aniState = JUMP;
        player.numFrames = 0;
    }
    if (!cheating && BUTTON_PRESSED(BUTTON_A) && player.grounded) {
        playSoundB(jumpSound_data, jumpSound_length, false);
        player.grounded = false;
        player.rowVelocity = -JUMPFORCE;
        player.aniState = JUMP;
        player.numFrames = 0;
    }

    if (!cheating && BUTTON_RELEASED(BUTTON_A) && !player.grounded) {
        if (player.rowVelocity < -4 * 64) {
            player.rowVelocity = -4 * 64;
        }
    }
    

    if (player.grounded) {
        player.rowVelocity = 0;
        if (player.aniState == JUMP) {
            player.aniState = IDLE;
            player.numFrames = 0;
        }
    } else {
        player.aniState = JUMP;
        player.numFrames = 0;
        if (!cheating) {
            player.rowVelocity += GRAVITY;
        }
    }

    checkCollisionWithMap();
    checkCollisionWithItemBlocks();

    // boundary checks
    if (player.worldCol < 0) { 
        player.worldCol = 0;
        if (player.colVelocity != 0) {
            player.colVelocity = 0;
        }
    }

    if (player.worldRow  + player.rowVelocity < 0) { 
        player.worldRow = 0;
        if (player.rowVelocity != 0) {
            player.rowVelocity = 0;
        }
    }
    

    player.worldCol += player.colVelocity;
    player.worldRow += player.rowVelocity;
    if (player.aniState == IDLE) {
            player.curFrame = 0;
            player.prevAniState = IDLE;
    } else {
        player.aniCounter++;
    }

    if (player.aniState != player.prevAniState) { //this means you changed states
        player.curFrame = 0;
    }

    //only change animation frames every 5 or 7 frames depending on if you're running.
    short framesBeforeChange = player.running ? 5 : 7;
    if (player.aniCounter % framesBeforeChange == 0) {
        if (++player.curFrame >= player.numFrames) {
            player.curFrame = 0;
        }
    }

    adjustScreenOffset();
    checkCollisionWithItems();
    
}

void adjustScreenOffset() {
    if (player.rowVelocity < 0) { //if you're moving up
        if (vOff > 0 && (SHIFTDOWN(player.worldRow) - vOff)  % 256 <= SCREENHEIGHT/4) {
                // Update background offset variable if the above is true
                if (vOff += SHIFTDOWN(player.rowVelocity) > 0) {
                    vOff += SHIFTDOWN(player.rowVelocity);
                    player.vOff += SHIFTDOWN(player.rowVelocity);
                }

                if (vOff < 0) {
                    vOff = 0;
                    player.vOff = 0;
                }
                
        }
    }

    if (player.rowVelocity > 0) { //if you're moving down
        if (vOff < 256 - SCREENHEIGHT && (SHIFTDOWN(player.worldRow) - vOff) + player.height  % 256 >= SCREENHEIGHT/2) {
                // Update background offset variable if the above is true
                vOff += SHIFTDOWN(player.rowVelocity);
                player.vOff += SHIFTDOWN(player.rowVelocity); 
                if (vOff > 256 - SCREENHEIGHT) {
                    vOff = 256 - SCREENHEIGHT;
                    player.vOff = 256 - SCREENHEIGHT;
                }
        }
    }
    
    if (player.colVelocity < 0) { //if you're moving left
        if ((SHIFTDOWN(player.worldCol) - hOff)  % 256 <= SCREENWIDTH/2) {
                // Update background offset variable if the above is true
                // if (SHIFTDOWN(player.colVelocity) > -1) {
                //     hOff--;
                //     player.hOff--;
                // } else {
                //     hOff += SHIFTDOWN(player.colVelocity);
                //     player.hOff += SHIFTDOWN(player.colVelocity);
                // }
                if (player.running) {
                    hOff += -2;
                    player.hOff += -2;
                } else {
                    hOff--;
                    player.hOff--;
                }
        }
    }
    
    if (player.colVelocity > 0) { //if you're moving right
        if ((SHIFTDOWN(player.worldCol) - hOff) + player.width % 256 >= SCREENWIDTH/2) {
                // Update background offset variable if the above is true
                // if (SHIFTDOWN(player.colVelocity) < 1) {
                //     hOff++;
                //     player.hOff++;
                // } else {
                //     hOff += SHIFTDOWN(player.colVelocity);
                //     player.hOff += SHIFTDOWN(player.colVelocity);
                // }
                if (player.running) {
                    hOff += 2;
                    player.hOff += 2;
                } else {
                    hOff++;
                    player.hOff++;
                }
                
        }
    }
    
}

void downToNormal() {
    player.powerUpState = NORMAL;
    player.width = 16;
    player.height = 16;
}

void advanceToMushroom() {
    player.powerUpState = BIG;
    player.width = 16;
    player.height = 27;
}
void advanceToFireFlower() {
    player.powerUpState = FIREFLOWER;
    player.width = 16;
    player.height = 27;
}

void checkCollisionWithItems() {
    for (int i = 0; i < ITEMCOUNT; i++) {
        if (items[i].active) {
            if (collision(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow), player.width, player.height, SHIFTDOWN(items[i].worldCol), SHIFTDOWN(items[i].worldRow), items[i].width, items[i].height)) {
                items[i].active = false;
                items[i].worldCol = 0;
                items[i].worldRow = 0;
                switch(items[i].type) {
                    case COIN:
                        playSoundB(coinSound_data, coinSound_length, false);
                    break;
                    case MUSHROOM:
                        playSoundB(powerUpSound_data, powerUpSound_length, false);
                        advanceToMushroom();
                    break;
                    case FIREFLOWER:
                        playSoundB(powerUpSound_data, powerUpSound_length, false);
                        advanceToFireFlower();
                    break;
                }
            }
        }
    }
}

void checkCollisionWithItemBlocks() {
    for (int i = 0; i < ITEMBLOCKCOUNT; i++) {
        if (((SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(itemBlocks[i].worldCol) - player.hOff) + itemBlocks[i].width > 0)
        && ((SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(itemBlocks[i].worldRow) - player.vOff) > 0)) { //this means it's on the screen
            if (player.colVelocity > 0) { // moving right
                for (int j = SHIFTDOWN(player.worldCol); j < SHIFTDOWN(player.worldCol + player.colVelocity); j++) {
                    if (collision(j,SHIFTDOWN(player.worldRow),player.width, player.height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the left
                        j--;
                        player.colVelocity = (SHIFTUP(j) - player.worldCol);
                        player.worldCol += player.colVelocity;
                        player.colVelocity = 0;
                        return;
                    }
                }
            }
            if (player.colVelocity < 0) { //moving left
                for (int j = SHIFTDOWN(player.worldCol); j > SHIFTDOWN(player.worldCol + player.colVelocity) && j > 0; j--) {
                    if (collision(j,SHIFTDOWN(player.worldRow), player.width, player.height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the right
                        j++;
                        player.colVelocity = (SHIFTUP(j) - player.worldCol);
                        player.worldCol += player.colVelocity;
                        player.colVelocity = 0;
                        return;
                    }
                }
            }
            if (player.rowVelocity < 0) { // moving up
                    for (int j = SHIFTDOWN(player.worldRow); j > SHIFTDOWN(player.worldRow + player.rowVelocity); j--) {
                        if (collision(SHIFTDOWN(player.worldCol), j, player.width, player.height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                            //if this is true, you collided from the bottom
                            j++;
                            player.rowVelocity = (SHIFTUP(j) - player.worldRow); 
                            player.worldRow += player.rowVelocity;
                            if (collision(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow), player.width, player.height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                                player.worldRow = SHIFTUP(SHIFTDOWN(itemBlocks[i].worldRow) + itemBlocks[i].height + 1);
                            }
                            player.rowVelocity = SHIFTUP(1);
                            itemBlocks[i].hit = true;
                            playSoundB(itemSpawnSound_data, itemSpawnSound_length, false);
                            return;
                        }
                    }
            }

            if (player.rowVelocity > 0) { // moving down
                for (int j = SHIFTDOWN(player.worldRow); j < SHIFTDOWN(player.worldRow + player.rowVelocity); j++) {
                    if (collision(SHIFTDOWN(player.worldCol),j, player.width, player.height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                        //if this is true, you collided from the top
                        j--;
                        player.rowVelocity = (SHIFTUP(j) - player.worldRow);
                        player.worldRow += player.rowVelocity;
                        player.rowVelocity = 0;
                        player.grounded = true;
                        return;
                    }
                }
            }
            if (SHIFTDOWN(player.worldRow) < SHIFTDOWN(itemBlocks[i].worldRow)) {
                if (collision(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow) + 1, player.width, player.height, SHIFTDOWN(itemBlocks[i].worldCol), SHIFTDOWN(itemBlocks[i].worldRow), itemBlocks[i].width, itemBlocks[i].height)) {
                    //player.worldRow = SHIFTUP(SHIFTDOWN(itemBlocks[i].worldRow) - player.height);
                    //player.rowVelocity = 0;
                    player.grounded = true;
                    return;
                }
            } 
        } 
    }
}

void checkCollisionWithMap() {
    //0x03E0 means green (can go through from bottom, can't go through from top)
    //0x7FFF means white
    if (player.colVelocity > 0) {
        for (int i = SHIFTDOWN(player.worldCol); i < SHIFTDOWN(player.worldCol + player.colVelocity); i++) {
            if ((Level1CollisionMapBitmap[OFFSET(i + player.width - 1, SHIFTDOWN(player.worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + player.width - 1, SHIFTDOWN(player.worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i + player.width - 1, SHIFTDOWN(player.worldRow) + player.height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i + player.width - 1, SHIFTDOWN(player.worldRow) + player.height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                player.colVelocity = (SHIFTUP(i) - player.worldCol);
                player.worldCol += player.colVelocity;
                player.colVelocity = 0;
            }
        }
    }
    if (player.colVelocity < 0) {
        for (int i = SHIFTDOWN(player.worldCol); i > SHIFTDOWN(player.worldCol + player.colVelocity) && i > 0; i--) {
            if ((Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(player.worldRow), 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(player.worldRow), 2816)] == 0x03E0)
            && (Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(player.worldRow) + player.height - 1, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(i, SHIFTDOWN(player.worldRow) + player.height - 1, 2816)] == 0x03E0)) {
                continue;
            } else {
                player.colVelocity = (SHIFTUP(i) - player.worldCol) + 64;
                player.worldCol += player.colVelocity;
                player.colVelocity = 0;
            }
        }
    }

    if (player.rowVelocity > 0) {
        for (int i = SHIFTDOWN(player.worldRow); i < SHIFTDOWN(player.worldRow + player.rowVelocity); i++) {
            if (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol), i + player.height - 1, 2816)] == 0x7FFF
            && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol) + player.width - 2, i + player.height - 1, 2816)] == 0x7FFF) {
                continue;
            } else {
                player.rowVelocity = (SHIFTUP(i) - player.worldRow) - 64;
                player.worldRow += player.rowVelocity;
                player.rowVelocity = 0;
                player.grounded = true;
            }
        }
    }

    if (Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow) + 1 + player.height - 1, 2816)] == 0x7FFF
        && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol) + player.width - 1, SHIFTDOWN(player.worldRow) + 1 + player.height - 1, 2816)] == 0x7FFF) {
        player.grounded = false;
    }

    if (player.rowVelocity < 0) {
        for (int i = SHIFTDOWN(player.worldRow); i > SHIFTDOWN(player.worldRow + player.rowVelocity); i--) {
            if ((Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol), i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol), i, 2816)] == 0x03E0)
            && Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol) + player.width - 2, i, 2816)] == 0x7FFF || Level1CollisionMapBitmap[OFFSET(SHIFTDOWN(player.worldCol) + player.width - 2, i, 2816)] == 0x03E0) {
                continue;
            } else {
                player.rowVelocity = (SHIFTUP(i) - player.worldRow);  
            }
        }
    }

    if (SHIFTDOWN(player.worldRow) + player.height >= 256) {
        shouldLose = true;
    }
    
}

void checkCollisionWithEnemies() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        switch (enemies[i].type) {
            case GOOMBA:
                checkCollisionWithGoombas(&enemies[i]);
            break;
            case CHOMPER:
                if (collision(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow) + 1, player.width, player.height, SHIFTDOWN(enemies[i].worldCol), SHIFTDOWN(enemies[i].worldRow),
                 enemies[i].width, enemies[i].height)) {
                    takeDamage();
                }
            break;
        }
    }
}

void checkCollisionWithGoombas(ENEMY* goomba) {
    if (((SHIFTDOWN(goomba->worldCol) - player.hOff) < SCREENWIDTH  && (SHIFTDOWN(goomba->worldCol) - player.hOff) + goomba->width > 0)
        && ((SHIFTDOWN(goomba->worldRow) - player.vOff) < SCREENHEIGHT  && (SHIFTDOWN(goomba->worldRow) - player.vOff) > 0)) { //this means it's on the screen

            if (player.rowVelocity > 0) { // moving down
                for (int j = SHIFTDOWN(player.worldRow); j < SHIFTDOWN(player.worldRow + player.rowVelocity); j++) {
                    if (collision(SHIFTDOWN(player.worldCol),j, player.width, player.height, SHIFTDOWN(goomba->worldCol), SHIFTDOWN(goomba->worldRow), goomba->width, goomba->height)) {
                        //if this is true, you collided from the top
                        if (BUTTON_HELD(BUTTON_A)) {
                            player.grounded = false;
                            player.rowVelocity = -(JUMPFORCE + JUMPFORCE/9);
                            player.aniState = JUMP;
                            player.numFrames = 0;
                            playSoundB(jumpSound_data, jumpSound_length, false);
                        } else {
                            player.grounded = false;
                            player.rowVelocity = -(JUMPFORCE/2);
                            player.aniState = JUMP;
                            player.numFrames = 0;
                            playSoundB(jumpSound_data, jumpSound_length, false);
                        }
                        killEnemy(goomba);
                        return;
                    }
                }
            }

            if (SHIFTDOWN(player.worldRow) < SHIFTDOWN(goomba->worldRow)) {
                if (collision(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow) + 1, player.width, player.height, SHIFTDOWN(goomba->worldCol), SHIFTDOWN(goomba->worldRow), goomba->width, goomba->height)) {
                    if (BUTTON_HELD(BUTTON_A)) {
                        player.grounded = false;
                        player.rowVelocity = -(JUMPFORCE + JUMPFORCE/9);
                        player.aniState = JUMP;
                        player.numFrames = 0;
                    } else {
                        player.grounded = false;
                        player.rowVelocity = -(JUMPFORCE/2);
                        player.aniState = JUMP;
                        player.numFrames = 0;
                    }
                    killEnemy(goomba);
                    return;
                }
            } 

            if (player.rowVelocity < 0) { // moving up
                    for (int j = SHIFTDOWN(player.worldRow); j > SHIFTDOWN(player.worldRow + player.rowVelocity); j--) {
                        if (collision(SHIFTDOWN(player.worldCol),j, player.width, player.height, SHIFTDOWN(goomba->worldCol), SHIFTDOWN(goomba->worldRow), goomba->width, goomba->height)) {
                            //if this is true, you collided from the bottom
                            takeDamage();
                            break;
                        }
                    }
            }
            if (player.colVelocity > 0) { // moving right
                for (int j = SHIFTDOWN(player.worldCol); j < SHIFTDOWN(player.worldCol + player.colVelocity); j++) {
                    if (collision(j,SHIFTDOWN(player.worldRow),player.width, player.height, SHIFTDOWN(goomba->worldCol), SHIFTDOWN(goomba->worldRow), goomba->width, goomba->height)) {
                        //if this is true, you collided from the left
                        takeDamage();
                        return;
                    }
                }
            }
            if (player.colVelocity < 0) { //moving left
                for (int j = SHIFTDOWN(player.worldCol); j > SHIFTDOWN(player.worldCol + player.colVelocity) && j > 0; j--) {
                    if (collision(j,SHIFTDOWN(player.worldRow), player.width, player.height, SHIFTDOWN(goomba->worldCol), SHIFTDOWN(goomba->worldRow), goomba->width, goomba->height)) {
                        //if this is true, you collided from the right
                        takeDamage();
                        break;
                    }
                }
            }
        } 
}

void checkCollisionWithGoal() {
    if (collision(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow), player.width, player.height, SHIFTDOWN(goal.worldCol), SHIFTDOWN(goal.worldRow), goal.width, goal.height)) {
        shouldWin = true;
    }
}
void takeDamage() {
    player.invincible = true;
    switch (player.powerUpState) {
        case NORMAL:
            shouldLose = true;
        break;
        case MUSHROOM:
            playSoundB(powerDownSound_data, powerDownSound_length, false);
            downToNormal();   
        break;
        case FIREFLOWER:
            playSoundB(powerDownSound_data, powerDownSound_length, false);
            advanceToMushroom();
        break;
    }
}

void drawMario() {
    switch(player.powerUpState) {
        case NORMAL:
            if(player.hide) {
                shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
            } else {
                shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            }
	        shadowOAM[0].attr1 = (COLMASK & (SHIFTDOWN(player.worldCol) - hOff) % 256) | ATTR1_SMALL; 
            shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 2, player.curFrame * 2) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
        break;
        case BIG:
            if(player.hide) {
                shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_TALL | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
            } else {
                shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_TALL | ATTR0_4BPP | ATTR0_REGULAR;
            }
	        shadowOAM[0].attr1 = (COLMASK & (SHIFTDOWN(player.worldCol) - hOff) % 256) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_TILEID((player.aniState + 4) * 2, player.curFrame * 4) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
        break;
        case FIREFLOWER:
            if(player.hide) {
                shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_TALL | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_HIDE;
            } else {
                shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_TALL | ATTR0_4BPP | ATTR0_REGULAR;
            }
            shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_TALL | ATTR0_4BPP | ATTR0_REGULAR;
	        shadowOAM[0].attr1 = (COLMASK & (SHIFTDOWN(player.worldCol) - hOff) % 256) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_TILEID((player.aniState + 4) * 2, player.curFrame * 4) | ATTR2_PRIORITY(0) | ATTR2_PALROW(1);
        break;
    }
	//flips the player depending on its flip variable (which is changed when you move left and right)
    if (player.flip) {
        shadowOAM[0].attr1 |= ATTR1_HFLIP;
    } else {
        shadowOAM[0].attr1 &= ~ATTR1_HFLIP;
    }
}