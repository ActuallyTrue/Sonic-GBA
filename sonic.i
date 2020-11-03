# 1 "sonic.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sonic.c"
# 1 "sonic.h" 1
# 18 "sonic.h"
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
    short spinDashing;
} SONIC;

extern SONIC player;
void initializeSonic();
void drawSonic();
void updateSonic();
void checkCollisionWithMap();
# 2 "sonic.c" 2
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 101 "myLib.h"
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
# 180 "myLib.h"
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
# 228 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 243 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 283 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "sonic.c" 2
# 1 "sonicSprite.h" 1
# 21 "sonicSprite.h"
extern const unsigned short sonicSpriteTiles[16384];


extern const unsigned short sonicSpritePal[256];
# 4 "sonic.c" 2
# 1 "testcollisionmap.h" 1
# 20 "testcollisionmap.h"
extern const unsigned short testcollisionmapBitmap[38400];
# 5 "sonic.c" 2

SONIC player;

void initializeSonic() {
    copyToSpritePaletteMem(sonicSpritePal, 512 >> 1);
    copyToCharBlock(sonicSpriteTiles, 4, 32768 >> 1);
    player.height = 32;
    player.width = 32;
    player.worldCol = ((208) << 6);
}

void updateSonic() {

    short moveInput = 0;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.grounded) {
            if (player.colVelocity > 0) {
            player.colVelocity -= 32;
            } else {
                player.colVelocity -= 3;
            }
        } else {
            if (player.colVelocity > 0) {
            player.colVelocity -= 6;
            } else {
                player.colVelocity -= 6;
            }
        }

        player.flip = 0;
        moveInput = 1;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.grounded) {
            if (player.colVelocity < 0) {
            player.colVelocity += 32;
            } else {
                player.colVelocity += 3;
            }
        } else {
            if (player.colVelocity < 0) {
                player.colVelocity += 6;
            } else {
                player.colVelocity += 6;
            }
        }
        player.flip = 1;
        moveInput = 1;
    }
    short downPressed = 0;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        downPressed = 1;
    }

    if (player.colVelocity > 384) {
        player.colVelocity = 384;
    }
    if (player.colVelocity < -384) {
        player.colVelocity = -384;
    }

    if (!moveInput) {
        if (player.colVelocity > 0) {
            player.colVelocity -= 3;
            if (player.colVelocity < 0) {
                player.colVelocity = 0;
            }
        }
        if (player.colVelocity < 0) {
            player.colVelocity += 3;
            if (player.colVelocity > 0) {
                player.colVelocity = 0;
            }
        }

    }
    if (((!(~(oldButtons) & ((1<<0)))) && (~(buttons) & ((1<<0)))) && player.grounded && !downPressed) {
        player.grounded = 0;

        player.rowVelocity = player.rowVelocity - 416;
    } else if (((!(~(oldButtons) & ((1<<0)))) && (~(buttons) & ((1<<0)))) && player.grounded && downPressed) {
        player.spinDashing = 1;
    }

    if ((((~(oldButtons) & ((1<<0)))) && !(~(buttons) & ((1<<0)))) && !player.grounded) {
        if (player.rowVelocity < -4 * 64) {
            player.rowVelocity = -4 * 64;
        }
    }

    if ((((~(oldButtons) & ((1<<7)))) && !(~(buttons) & ((1<<7)))) && player.spinDashing) {
        player.colVelocity = player.flip ? 384 : -384;
        player.spinDashing = 0;



    }


    if (player.worldCol < 0) {
        player.worldCol = 0;
        if (player.colVelocity != 0) {
            player.colVelocity = 0;
        }
    }
    if (player.worldCol + player.width > 240 * 64) {
        player.worldCol = ((240 * 64) - player.colVelocity) - (player.width - player.colVelocity);
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

    if (((player.worldRow) >> 6) + player.height > 160 && !player.grounded) {
        player.worldRow = (((160) << 6) - player.rowVelocity) - (((player.height) << 6) - player.rowVelocity);
        player.grounded = 1;
    } else {
        player.rowVelocity += 14;
    }

    checkCollisionWithMap();

    if (player.grounded) {
        player.rowVelocity = 0;
    }

    player.worldCol += player.colVelocity;
    player.worldRow += player.rowVelocity;
}

void checkCollisionWithMap() {
# 174 "sonic.c"
    if (player.colVelocity > 0) {
        for (int i = ((player.worldCol) >> 6); i < ((player.worldCol + player.colVelocity) >> 6); i++) {
            if (testcollisionmapBitmap[((((player.worldRow) >> 6))*(240)+(i + player.width - 1))] == 0x7FFF
            && testcollisionmapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(240)+(i + player.width - 1))] == 0x7FFF) {
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
            if (testcollisionmapBitmap[((((player.worldRow) >> 6))*(240)+(i))] == 0x7FFF
            && testcollisionmapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(240)+(i))] == 0x7FFF) {
                continue;
            } else {
                player.colVelocity = (((i) << 6) - player.worldCol);
                player.worldCol += player.colVelocity;
                player.colVelocity = 0;
            }
        }
    }

    if (player.rowVelocity > 0) {
        for (int i = ((player.worldRow) >> 6); i < ((player.worldRow + player.rowVelocity) >> 6); i++) {
            if (testcollisionmapBitmap[((i + player.height - 1)*(240)+(((player.worldCol) >> 6)))] == 0x7FFF
            && testcollisionmapBitmap[((i + player.height - 1)*(240)+(((player.worldCol) >> 6) + player.width - 2))] == 0x7FFF) {
                continue;
            } else {
                player.rowVelocity = (((i) << 6) - player.worldRow) - 64;
                player.worldRow += player.rowVelocity;
                player.rowVelocity = 0;
                player.grounded = 1;
            }
        }
    }

    if (testcollisionmapBitmap[((((player.worldRow) >> 6) + 1 + player.height - 1)*(240)+(((player.worldCol) >> 6)))] == 0x7FFF
            && testcollisionmapBitmap[((((player.worldRow) >> 6) + 1 + player.height - 1)*(240)+(((player.worldCol) >> 6) + player.width - 1))] == 0x7FFF) {
                player.grounded = 0;
    }

    if (player.rowVelocity < 0) {
        for (int i = ((player.worldRow) >> 6); i > ((player.worldRow + player.rowVelocity) >> 6); i--) {
            if (testcollisionmapBitmap[((i)*(240)+(((player.worldCol) >> 6)))] == 0x7FFF
            && testcollisionmapBitmap[((i)*(240)+(((player.worldCol) >> 6) + player.width - 2))] == 0x7FFF) {
                continue;
            } else {
                player.rowVelocity = (((i) << 6) - player.worldRow);
            }
        }
    }

}

void drawSonic() {
    shadowOAM[0].attr0 = (0xFF & ((player.worldRow) >> 6)) | (0 << 14) | (0 << 13) | (0 << 8);
 shadowOAM[0].attr1 = (0x1FF & ((player.worldCol) >> 6)) | (2 << 14);

    if (player.flip) {
        shadowOAM[0].attr1 |= (1 << 12);
    } else {
        shadowOAM[0].attr1 &= ~(1 << 12);
    }
 shadowOAM[0].attr2 = ((player.curFrame * 4)*32 + (player.aniState * 4)) | ((0) << 10) | ((0) << 12);
}
