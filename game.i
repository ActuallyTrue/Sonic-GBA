# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"

# 1 "game.h" 1
void updateGame();
void updatePlayer();
void drawGame();
void initializeGame();
void initializeBackground();
# 3 "game.c" 2
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
# 4 "game.c" 2
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
# 5 "game.c" 2
# 1 "testmap.h" 1
# 22 "testmap.h"
extern const unsigned short testmapTiles[832];


extern const unsigned short testmapMap[1024];


extern const unsigned short testmapPal[256];
# 6 "game.c" 2
# 1 "testcollisionmap.h" 1
# 20 "testcollisionmap.h"
extern const unsigned short testcollisionmapBitmap[38400];
# 7 "game.c" 2
void updateGame() {
    updatePlayer();
}

void updatePlayer() {
    updateSonic();
}

void drawGame() {
    drawSonic();
}

void initializeGame() {
    initializeBackground();
    initializeSonic();
}

void initializeBackground() {
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | (0 << 7) | (0 << 14) | ((8) << 8);
    copyToBGPaletteMem(testmapPal, 512 >> 1);
    copyToCharBlock(testmapTiles, 0, 1664 >> 1);
    copyToScreenBlock(testmapMap, 8, 2048 >> 1);
}
