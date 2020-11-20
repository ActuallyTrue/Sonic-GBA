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
void restoreBackground();
extern int currentScreenBlock;
extern int currentTileMapDivision;
extern short shouldWin;
extern short shouldLose;
# 3 "game.c" 2
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
# 4 "game.c" 2
# 1 "mario.h" 1
# 17 "mario.h"
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
# 5 "game.c" 2
# 1 "Level1.h" 1
# 22 "Level1.h"
extern const unsigned short Level1Tiles[8560];


extern const unsigned short Level1Map[11264];


extern const unsigned short Level1Pal[256];
# 6 "game.c" 2

int currentScreenBlock = 10;
int currentTileMapDivision = 0;
short shouldWin;
short shouldLose;
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
    hOff = 0;
    vOff = 0;
    initializeBackground();
    initializeSonic();
}

void initializeBackground() {
    currentScreenBlock = 10;
    currentTileMapDivision = 0;
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | (0 << 7) | (1 << 14) | ((currentScreenBlock) << 8);
    copyToBGPaletteMem(Level1Pal, 512 >> 1);
    copyToCharBlock(Level1Tiles, 0, (17120 >> 1));
    copyToScreenBlock(Level1Map, 10, (22528 >> 1));
}

void restoreBackground() {
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | (0 << 7) | (1 << 14) | ((currentScreenBlock) << 8);
    copyToBGPaletteMem(Level1Pal, 512 >> 1);
    copyToCharBlock(Level1Tiles, 0, (17120 >> 1));
    copyToScreenBlock(Level1Map, 10, (22528 >> 1));
}
