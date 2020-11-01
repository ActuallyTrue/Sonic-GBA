#include "sonic.h"
#include "myLib.h"
#include "sonicSprite.h"

SONIC player;

void initializeSonic() {
    copyToSpritePaletteMem(sonicSpritePal, sonicSpritePalLen >> 1);
    copyToCharBlock(sonicSpriteTiles, 4, sonicSpriteTilesLen >> 1);
    player.height = 64 << 6;
    player.width = 32 << 6;
}

void updateSonic() {
    // Control movement
    short buttonPressed = false;
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
        buttonPressed = true;
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
        buttonPressed = true;
    }

    if (player.colVelocity > TOPSPEED) {
        player.colVelocity = TOPSPEED;
    }
    if (player.colVelocity < -TOPSPEED) {
        player.colVelocity = -TOPSPEED;
    }

    if (!buttonPressed) {
        if (player.colVelocity > 0) {
            player.colVelocity -= FRICTION;
            if (player.colVelocity < 0) {
                player.colVelocity = 0;
            }
        }
        if (player.colVelocity < 0) {
            player.colVelocity -= FRICTION;
            if (player.colVelocity > 0) {
                player.colVelocity = 0;
            }
        }
        
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        player.grounded = false;

        player.rowVelocity = player.rowVelocity - JUMPFORCE;
    }

    if (BUTTON_RELEASED(BUTTON_A)) {
        if (player.rowVelocity < -4 * 64) {
            player.rowVelocity = -4 * 64;
        }
    }

    // boundary checks
    if (player.worldCol < 0) { 
        player.worldCol = 0;
    }
    if (player.worldCol + player.width > SCREENWIDTH * 64) {
        player.worldCol = ((SCREENWIDTH * 64) - player.colVelocity) - (player.width - player.colVelocity);
    }

    if (player.worldRow + player.height > SCREENHEIGHT * 64 && !player.grounded) {
        player.worldRow = ((SCREENHEIGHT * 64) - player.rowVelocity) - (player.height - player.rowVelocity);
        player.grounded = true;
    } else {
        player.rowVelocity += GRAVITY;
    }

    if (player.grounded) {
        player.rowVelocity = 0;
    }

    player.worldCol += player.colVelocity;
    player.worldRow += player.rowVelocity;
} 

void drawSonic() {
    shadowOAM[0].attr0 = (ROWMASK & (int)(player.worldRow/64)) | ATTR0_TALL | ATTR0_4BPP | ATTR0_REGULAR;
	shadowOAM[0].attr1 = (COLMASK & (int)(player.worldCol / 64)) | ATTR1_LARGE;
    //flips the player depending on its flip variable (which is changed when you move left and right)
    if (player.flip) {
        shadowOAM[0].attr1 |= ATTR1_HFLIP;
    } else {
        shadowOAM[0].attr1 &= ~ATTR1_HFLIP;
    }
	shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);
}