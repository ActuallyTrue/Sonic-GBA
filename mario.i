# 1 "mario.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mario.c"
# 1 "mario.h" 1
# 20 "mario.h"
typedef struct {
    int worldRow;
    int worldCol;
    int rowVelocity;
    int colVelocity;
    int groundSpeed;
    int slope;
    int angle;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int flip;
    short grounded;
    short running;
    int hOff;
    int vOff;
} SONIC;

extern SONIC player;
void initializeSonic();
void drawSonic();
void updateSonic();
void checkCollisionWithMap();
void adjustScreenOffset();
# 2 "mario.c" 2
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 56 "myLib.h"
extern int hOff;
extern int vOff;
# 67 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 104 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, unsigned short color);
void fillScreen3(unsigned short color);
void drawFromPointToPoint3(int startingX, int startingY, int endingX, int endingY, u16 color);
void drawHorizontalLine3(int col, int row, int length, u16 color);
void drawVerticalLine3(int col, int row, int length, u16 color);
void drawFilledRectHori3(int col, int row, int width, int height, u16 color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
void copyToBGPaletteMem(const u16* paletteToCopy, int paletteLength);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 183 "myLib.h"
void hideSprites();
void copyToSpritePaletteMem(const u16* paletteToCopy, int paletteLength);
void copyShadowOAM();
void copyToCharBlock(const u16* tilesToCopy, int charBlockNum, int tileLength);
void copyToScreenBlock(const u16* mapToCopy, int screenBlockNum, int mapLength);






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rowVelocity;
    int colVelocity;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int flip;
} ANISPRITE;
# 231 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 246 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 286 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "mario.c" 2
# 1 "mariospritesheet.h" 1
# 21 "mariospritesheet.h"
extern const unsigned short mariospritesheetTiles[16384];


extern const unsigned short mariospritesheetPal[256];
# 4 "mario.c" 2
# 1 "Level1CollisionMap.h" 1
# 20 "Level1CollisionMap.h"
extern const unsigned short Level1CollisionMapBitmap[720896];
# 5 "mario.c" 2

SONIC player;
enum {IDLE, WALK, JUMP, END};

void initializeSonic() {
    copyToSpritePaletteMem(mariospritesheetPal, 512 >> 1);
    copyToCharBlock(mariospritesheetTiles, 4, 32768 >> 1);
    player.height = 16;
    player.width = 16;
    player.worldCol = ((20) << 6);
    player.worldRow = ((223) << 6);
    player.curFrame = 0;
    player.aniCounter = 0;
    player.aniState = IDLE;
}

void updateSonic() {

    short moveInput = 0;

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<1)))) {
        player.running = 1;
    }

    if ((((~(oldButtons) & ((1<<1)))) && !(~(buttons) & ((1<<1))))) {
        player.running = 0;
    }


    player.prevAniState = player.aniState;

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        player.colVelocity = player.running ? -((2) << 6) : -((1) << 6);
        if (player.grounded) {
            player.aniState = WALK;
            player.numFrames = 3;
        }
# 56 "mario.c"
        player.flip = 0;
        moveInput = 1;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        player.colVelocity = player.running ? ((2) << 6) : ((1) << 6);
        if (player.grounded) {
            player.aniState = WALK;
            player.numFrames = 3;
        }
# 78 "mario.c"
        player.flip = 1;
        moveInput = 1;
    }


    if (!player.running && player.colVelocity > 192) {
        player.colVelocity = 192;
    }
    if (!player.running && player.colVelocity < -192) {
        player.colVelocity = -192;
    }

    if (player.running && player.colVelocity > 384) {
        player.colVelocity = 384;
    }
    if (player.running && player.colVelocity < -384) {
        player.colVelocity = -384;
    }

    if (!moveInput) {
        if (player.grounded) {
            player.aniState = IDLE;
            player.numFrames = 0;
        }
        if (player.colVelocity > 0) {
            player.colVelocity -= 32;
            if (player.colVelocity < 0) {
                player.colVelocity = 0;
                player.aniState = IDLE;
                player.numFrames = 0;
            }
        }
        if (player.colVelocity < 0) {
            player.colVelocity += 32;
            if (player.colVelocity > 0) {
                player.colVelocity = 0;
                player.aniState = IDLE;
                player.numFrames = 0;
            }
        }

    }
    if (((!(~(oldButtons) & ((1<<0)))) && (~(buttons) & ((1<<0)))) && player.grounded) {
        player.grounded = 0;
        player.rowVelocity = player.rowVelocity - 416;
        player.aniState = JUMP;
        player.numFrames = 0;
    }

    if ((((~(oldButtons) & ((1<<0)))) && !(~(buttons) & ((1<<0)))) && !player.grounded) {
        if (player.rowVelocity < -4 * 64) {
            player.rowVelocity = -4 * 64;
        }
    }


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
         player.rowVelocity += 14;
    }



    player.worldCol += player.colVelocity;
    player.worldRow += player.rowVelocity;
    if (player.aniState == IDLE) {
            player.curFrame = 0;
            player.prevAniState = IDLE;
    } else {
        player.aniCounter++;
    }

    if (player.aniState != player.prevAniState) {
        player.curFrame = 0;
    }


    short framesBeforeChange = player.running ? 5 : 7;
    if (player.aniCounter % framesBeforeChange == 0) {
        if (++player.curFrame >= player.numFrames) {
            player.curFrame = 0;
        }
    }

    adjustScreenOffset();

}

void adjustScreenOffset() {
    if (player.rowVelocity < 0) {
        if (vOff > 0 && (((player.worldRow) >> 6) - vOff) % 256 <= 160/2) {

                if (vOff += ((player.rowVelocity) >> 6) > 0) {
                    vOff += ((player.rowVelocity) >> 6);
                }

                if (vOff < 0) {
                    vOff = 0;
                }

        }
    }

    if (player.rowVelocity > 0) {
        if (vOff < 256 - 160 && (((player.worldRow) >> 6) - vOff) + player.height % 256 >= 160/2) {

                if (vOff += ((player.rowVelocity) >> 6) < 256 - 160) {
                    vOff += ((player.rowVelocity) >> 6);
                }
                if (vOff > 256 - 160) {
                    vOff = 256 - 160;
                }
        }
    }

    if (player.colVelocity < 0) {
        if ((((player.worldCol) >> 6) - hOff) % 256 <= 240/2) {

                if (((player.colVelocity) >> 6) > -1) {
                    hOff--;
                } else {
                    hOff += ((player.colVelocity) >> 6);
                }
        }
    }

    if (player.colVelocity > 0) {
        if ((((player.worldCol) >> 6) - hOff) + player.width % 256 >= 240/2) {

                if (((player.colVelocity) >> 6) < 1) {
                    hOff++;
                } else {
                    hOff += ((player.colVelocity) >> 6);
                }

        }
    }

}

void checkCollisionWithMap() {
# 268 "mario.c"
    if (player.colVelocity > 0) {
        for (int i = ((player.worldCol) >> 6); i < ((player.worldCol + player.colVelocity) >> 6); i++) {
            if (Level1CollisionMapBitmap[((((player.worldRow) >> 6))*(2816)+(i + player.width - 1))] == 0x7FFF
            && Level1CollisionMapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(2816)+(i + player.width - 1))] == 0x7FFF) {
                continue;
            } else {
                player.colVelocity = (((i) << 6) - player.worldCol);
                player.worldCol += player.colVelocity;
                player.colVelocity = 0;
            }
        }
    }
    if (player.colVelocity < 0) {
        for (int i = ((player.worldCol) >> 6); i > ((player.worldCol + player.colVelocity) >> 6) && i > 0; i--) {
            if (Level1CollisionMapBitmap[((((player.worldRow) >> 6))*(2816)+(i))] == 0x7FFF
            && Level1CollisionMapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(2816)+(i))] == 0x7FFF) {
                continue;
            } else {
                player.colVelocity = (((i) << 6) - player.worldCol) + 64;
                player.worldCol += player.colVelocity;
                player.colVelocity = 0;
            }
        }
    }

    if (player.rowVelocity > 0) {
        for (int i = ((player.worldRow) >> 6); i < ((player.worldRow + player.rowVelocity) >> 6); i++) {
            if (Level1CollisionMapBitmap[((i + player.height - 1)*(2816)+(((player.worldCol) >> 6)))] == 0x7FFF
            && Level1CollisionMapBitmap[((i + player.height - 1)*(2816)+(((player.worldCol) >> 6) + player.width - 2))] == 0x7FFF) {
                continue;
            } else {
                player.rowVelocity = (((i) << 6) - player.worldRow) - 64;
                player.worldRow += player.rowVelocity;
                player.rowVelocity = 0;
                player.grounded = 1;
            }
        }
    }

    if (Level1CollisionMapBitmap[((((player.worldRow) >> 6) + 1 + player.height - 1)*(2816)+(((player.worldCol) >> 6)))] == 0x7FFF
        && Level1CollisionMapBitmap[((((player.worldRow) >> 6) + 1 + player.height - 1)*(2816)+(((player.worldCol) >> 6) + player.width - 1))] == 0x7FFF) {
        player.grounded = 0;
    }

    if (player.rowVelocity < 0) {
        for (int i = ((player.worldRow) >> 6); i > ((player.worldRow + player.rowVelocity) >> 6); i--) {
            if ((Level1CollisionMapBitmap[((i)*(2816)+(((player.worldCol) >> 6)))] == 0x7FFF || Level1CollisionMapBitmap[((i)*(2816)+(((player.worldCol) >> 6)))] == 0x03E0)
            && Level1CollisionMapBitmap[((i)*(2816)+(((player.worldCol) >> 6) + player.width - 2))] == 0x7FFF || Level1CollisionMapBitmap[((i)*(2816)+(((player.worldCol) >> 6) + player.width - 2))] == 0x03E0) {
                continue;
            } else {
                player.rowVelocity = (((i) << 6) - player.worldRow);
            }
        }
    }

}

void drawSonic() {
    shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (0 << 14) | (0 << 13) | (0 << 8);
 shadowOAM[0].attr1 = (0x1FF & (((player.worldCol) >> 6) - hOff) % 256) | (1 << 14);

    if (player.flip) {
        shadowOAM[0].attr1 |= (1 << 12);
    } else {
        shadowOAM[0].attr1 &= ~(1 << 12);
    }
 shadowOAM[0].attr2 = ((player.curFrame * 2)*32 + (player.aniState * 2)) | ((0) << 10) | ((0) << 12);
}
