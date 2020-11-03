#include "sonic.h"
#include "myLib.h"
#include "sonicSprite.h"
#include "testcollisionmap.h"

SONIC player;

void initializeSonic() {
    copyToSpritePaletteMem(sonicSpritePal, sonicSpritePalLen >> 1);
    copyToCharBlock(sonicSpriteTiles, 4, sonicSpriteTilesLen >> 1);
    player.height = 32;
    player.width = 32;
    player.worldCol = SHIFTUP(208);
}

void updateSonic() {
    // Control movement
    short moveInput = false;
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.grounded) {
            if (player.colVelocity > 0) {
            player.colVelocity -= DECELERATION;
            } else {
                player.colVelocity -= ACCELERATION;
            }
        } else {
            if (player.colVelocity > 0) {
            player.colVelocity -= AIRACCELERATION;
            } else {
                player.colVelocity -= AIRACCELERATION;
            }
        }
        
        player.flip = false;
        moveInput = true;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.grounded) {
            if (player.colVelocity < 0) {
            player.colVelocity += DECELERATION;
            } else {
                player.colVelocity += ACCELERATION;
            }
        } else {
            if (player.colVelocity < 0) {
                player.colVelocity += AIRACCELERATION;
            } else {
                player.colVelocity += AIRACCELERATION;
            }
        }
        player.flip = true;
        moveInput = true;
    }
    short downPressed = false;
    if (BUTTON_HELD(BUTTON_DOWN)) {
        downPressed = true;
    }

    if (player.colVelocity > TOPSPEED) {
        player.colVelocity = TOPSPEED;
    }
    if (player.colVelocity < -TOPSPEED) {
        player.colVelocity = -TOPSPEED;
    }

    if (!moveInput) {
        if (player.colVelocity > 0) {
            player.colVelocity -= FRICTION;
            if (player.colVelocity < 0) {
                player.colVelocity = 0;
            }
        }
        if (player.colVelocity < 0) {
            player.colVelocity += FRICTION;
            if (player.colVelocity > 0) {
                player.colVelocity = 0;
            }
        }
        
    }
    if (BUTTON_PRESSED(BUTTON_A) && player.grounded && !downPressed) {
        player.grounded = false;

        player.rowVelocity = player.rowVelocity - JUMPFORCE;
    } else if (BUTTON_PRESSED(BUTTON_A) && player.grounded && downPressed) {
        player.spinDashing = true;
    }

    if (BUTTON_RELEASED(BUTTON_A) && !player.grounded) {
        if (player.rowVelocity < -4 * 64) {
            player.rowVelocity = -4 * 64;
        }
    }

    if (BUTTON_RELEASED(BUTTON_DOWN) && player.spinDashing) {
        player.colVelocity = player.flip ? TOPSPEED : -TOPSPEED;
        player.spinDashing = false;



    }

    // boundary checks
    if (player.worldCol < 0) { 
        player.worldCol = 0;
        if (player.colVelocity != 0) {
            player.colVelocity = 0;
        }
    }
    if (player.worldCol + player.width > SCREENWIDTH * 64) {
        player.worldCol = ((SCREENWIDTH * 64) - player.colVelocity) - (player.width - player.colVelocity);
        if (player.colVelocity != 0) {
            player.colVelocity = 0;
        }
    }

    if (player.worldRow < 0) { 
        player.worldRow = 0;
        if (player.rowVelocity != 0) {
            player.rowVelocity = 0;
        }
    }

    if (SHIFTDOWN(player.worldRow) + player.height > SCREENHEIGHT && !player.grounded) {
        player.worldRow = (SHIFTUP(SCREENHEIGHT) - player.rowVelocity) - (SHIFTUP(player.height) - player.rowVelocity);
        player.grounded = true;
    } else {
        player.rowVelocity += GRAVITY;
    }

    checkCollisionWithMap();

    if (player.grounded) {
        player.rowVelocity = 0;
    }

    player.worldCol += player.colVelocity;
    player.worldRow += player.rowVelocity;
}

void checkCollisionWithMap() {
    // short situation;
    // if (player.colVelocity > 0 && player.rowVelocity > 0) {
    //     situation = 0; //moving right and down
    // } else if (player.colVelocity < 0 && player.rowVelocity > 0) {
    //     situation = 2; //moving left and down
    // } else if (player.colVelocity > 0 && player.rowVelocity < 0) {
    //     situation = 3; //moving right and up
    // } else if (player.colVelocity < 0 && player.rowVelocity < 0) {
    //     situation = 4; //moving left and up
    // } else if (player.colVelocity == 0 && player.rowVelocity > 0) {
    //     //moving straight down
    // } else if (player.colVelocity == 0 && player.rowVelocity < 0) {
    //     //moving straight up
    // } else if (player.colVelocity > 0 && player.rowVelocity == 0) {
    //     //moving straight right
    // }

    // switch (situation) {
    //     case 0: //moving right and down
    //         int xIterator = player.worldCol;
    //         int yIterator = 0;
    //     break;
    //     case 1: //moving left and down

    //     break;
    //     case 2: //moving right and up

    //     break;
    //     case 3: //moving left and up

    //     break;
    // }
    if (player.colVelocity > 0) {
        for (int i = SHIFTDOWN(player.worldCol); i < SHIFTDOWN(player.worldCol + player.colVelocity); i++) {
            if (testcollisionmapBitmap[OFFSET(i + player.width - 1, SHIFTDOWN(player.worldRow), 240)] == 0x7FFF
            && testcollisionmapBitmap[OFFSET(i + player.width - 1, SHIFTDOWN(player.worldRow) + player.height - 1, 240)] == 0x7FFF) {
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
            if (testcollisionmapBitmap[OFFSET(i, SHIFTDOWN(player.worldRow), 240)] == 0x7FFF
            && testcollisionmapBitmap[OFFSET(i, SHIFTDOWN(player.worldRow) + player.height - 1, 240)] == 0x7FFF) {
                continue;
            } else {
                player.colVelocity = (SHIFTUP(i) - player.worldCol);
                player.worldCol += player.colVelocity;
                player.colVelocity = 0;
            }
        }
    }

    if (player.rowVelocity > 0) {
        for (int i = SHIFTDOWN(player.worldRow); i < SHIFTDOWN(player.worldRow + player.rowVelocity); i++) {
            if (testcollisionmapBitmap[OFFSET(SHIFTDOWN(player.worldCol), i + player.height - 1, 240)] == 0x7FFF
            && testcollisionmapBitmap[OFFSET(SHIFTDOWN(player.worldCol) + player.width - 2, i + player.height - 1, 240)] == 0x7FFF) {
                continue;
            } else {
                player.rowVelocity = (SHIFTUP(i) - player.worldRow) - 64;
                player.worldRow += player.rowVelocity;
                player.rowVelocity = 0;
                player.grounded = true;
            }
        }
    }

    if (testcollisionmapBitmap[OFFSET(SHIFTDOWN(player.worldCol), SHIFTDOWN(player.worldRow) + 1 + player.height - 1, 240)] == 0x7FFF
            && testcollisionmapBitmap[OFFSET(SHIFTDOWN(player.worldCol) + player.width - 1, SHIFTDOWN(player.worldRow) + 1 + player.height - 1, 240)] == 0x7FFF) {
                player.grounded = false;
    }

    if (player.rowVelocity < 0) {
        for (int i = SHIFTDOWN(player.worldRow); i > SHIFTDOWN(player.worldRow + player.rowVelocity); i--) {
            if (testcollisionmapBitmap[OFFSET(SHIFTDOWN(player.worldCol), i, 240)] == 0x7FFF
            && testcollisionmapBitmap[OFFSET(SHIFTDOWN(player.worldCol) + player.width - 2, i, 240)] == 0x7FFF) {
                continue;
            } else {
                player.rowVelocity = (SHIFTUP(i) - player.worldRow);  
            }
        }
    }
    
}

void drawSonic() {
    shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.worldRow)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
	shadowOAM[0].attr1 = (COLMASK & SHIFTDOWN(player.worldCol)) | ATTR1_MEDIUM;
    //flips the player depending on its flip variable (which is changed when you move left and right)
    if (player.flip) {
        shadowOAM[0].attr1 |= ATTR1_HFLIP;
    } else {
        shadowOAM[0].attr1 &= ~ATTR1_HFLIP;
    }
	shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
}