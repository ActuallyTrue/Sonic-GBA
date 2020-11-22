#include "mario.h"
#include "myLib.h"
#include "mariospritesheet.h"
#include "Level1CollisionMap.h"
#include "game.h"

MARIO player;
enum {IDLE, WALK, JUMP,  END};

void initializeSonic() {
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
}

void updateMario() {
    // Control movement
    short moveInput = false;

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
    if (BUTTON_PRESSED(BUTTON_A) && player.grounded) {
        player.grounded = false;
        player.rowVelocity = player.rowVelocity - JUMPFORCE;
        player.aniState = JUMP;
        player.numFrames = 0;
    }

    if (BUTTON_RELEASED(BUTTON_A) && !player.grounded) {
        if (player.rowVelocity < -4 * 64) {
            player.rowVelocity = -4 * 64;
        }
    }

    // boundary checks
    if (player.worldCol < 0) { 
        player.worldCol = 0;
        if (player.colVelocity != 0) {
            player.colVelocity = 0;
        }
    }
    checkCollisionWithMap();

    if (player.grounded) {
        player.rowVelocity = 0;
        if (player.aniState == JUMP) {
            player.aniState = IDLE;
            player.numFrames = 0;
        }
    } else {
        player.aniState = JUMP;
        player.numFrames = 0;
         player.rowVelocity += GRAVITY;
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

void drawMario() {
    shadowOAM[0].attr0 = (ROWMASK & (SHIFTDOWN(player.worldRow) - vOff) % 256) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
	shadowOAM[0].attr1 = (COLMASK & (SHIFTDOWN(player.worldCol) - hOff) % 256) | ATTR1_SMALL;
    //flips the player depending on its flip variable (which is changed when you move left and right)
    if (player.flip) {
        shadowOAM[0].attr1 |= ATTR1_HFLIP;
    } else {
        shadowOAM[0].attr1 &= ~ATTR1_HFLIP;
    }
	shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 2, player.curFrame * 2) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
}