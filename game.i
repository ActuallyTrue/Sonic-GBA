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
void lastScreenOffsetAdjustment();
extern int currentScreenBlock;
extern int currentTileMapDivision;
extern short shouldWin;
extern short shouldLose;
# 2 "game.c" 2
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
# 322 "myLib.h"
typedef void (*ihp)(void);
# 342 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "game.c" 2
# 1 "mario.h" 1
# 19 "mario.h"
typedef struct {
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
    short hide;
    short flip;
    short grounded;
    short running;
    int hOff;
    int vOff;
    short powerUpState;
    short invincible;
    int invincibilityCounter;
    int coinCount;
} MARIO;


enum {IDLE, WALK, JUMP};

extern MARIO player;
void initializeMario();
void drawMario();
void updateMario();
void advanceToMushroom();
void advanceToFireFlower();
void downToNormal();
void checkCollisionWithItemBlocks();
void checkCollisionWithItems();
void checkCollisionWithMap();
void checkCollisionWithEnemies();
void checkCollisionWithGoal();
void takeDamage();
void adjustScreenOffset();
# 4 "game.c" 2
# 1 "Level1.h" 1
# 22 "Level1.h"
extern const unsigned short Level1Tiles[7504];


extern const unsigned short Level1Map[11264];


extern const unsigned short Level1Pal[256];
# 5 "game.c" 2
# 1 "entities.h" 1





typedef struct {
    int worldRow;
    int worldCol;
    int width;
    int height;
    int hit;
    int given;
    int type;
} ITEMBLOCK;

typedef struct {
    int worldRow;
    int worldCol;
    int width;
    int height;
    int rowVelocity;
    int colVelocity;
    int type;
    int active;
    int grounded;
} ITEM;

typedef struct {
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
    int type;
    int active;
} ENEMY;

extern ITEMBLOCK itemBlocks[7];
extern ENEMY enemies[10];
extern ITEM items[6];
extern ITEM fireBalls[3];
extern ITEM goal;
enum {COIN, MUSHROOM, FIREFLOWER};
enum {GOOMBA, CHOMPER};

void initializeItemBlocks();
void updateItemBlocks();
void GOOMBACheckCollisionWithEnemies(ENEMY* goomba);
void GOOMBACheckCollisionWithCollisionMap(ENEMY* goomba);
void FIREBALLCheckCollisionWithItemBlocks(ITEM* fireBall);
void FIREBALLCheckCollisionWithEnemies(ITEM* fireBall);
void FIREBALLCheckCollisionWithCollisionMap(ITEM* fireBall);
void killEnemy(ENEMY* enemy);
void drawItemBlocks();
void initializeEnemies();
void initializeItems();
void initializeFireBalls();
void updateFireBalls();
void updateEnemies();
void drawEnemies();
void drawChomper(ENEMY* chomper, int index);
void drawGoomba(ENEMY* goomba, int index);
void updateGoomba(ENEMY* goomba);
void updateChomper(ENEMY* chomper);
void spawnItem();
void drawItems();
void drawGoal();
void drawFireBalls();
void drawCoinCount();
# 6 "game.c" 2

int currentScreenBlock = 10;
int currentTileMapDivision = 0;
short shouldWin;
short shouldLose;
void updateGame() {
    updatePlayer();
    updateEnemies();
    updateItemBlocks();
    updateFireBalls();
}

void updatePlayer() {
    updateMario();
}

void drawGame() {
    drawMario();
    drawItemBlocks();
    drawItems();
    drawEnemies();
    drawGoal();
    drawFireBalls();
    drawCoinCount();
}

void initializeGame() {
    hOff = 0;
    vOff = 0;
    shouldLose = 0;
    shouldWin = 0;
    initializeBackground();
    initializeMario();
    initializeItemBlocks();
    initializeItems();
    initializeEnemies();
    initializeFireBalls();
}

void initializeBackground() {
    currentScreenBlock = 10;
    currentTileMapDivision = 0;
    vOff = 256 - 160;
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | (0 << 7) | (1 << 14) | ((currentScreenBlock) << 8);
    copyToBGPaletteMem(Level1Pal, 512 >> 1);
    copyToCharBlock(Level1Tiles, 0, (15008 >> 1));
    copyToScreenBlock(Level1Map, 10, (22528 >> 1));
}

void restoreBackground() {
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | (0 << 7) | (1 << 14) | ((currentScreenBlock) << 8);
    copyToBGPaletteMem(Level1Pal, 512 >> 1);
    copyToCharBlock(Level1Tiles, 0, (15008 >> 1));
    copyToScreenBlock(Level1Map, 10, (22528 >> 1));
}

void lastScreenOffsetAdjustment() {
    if (currentScreenBlock == 10 && hOff < 0) {
        hOff = 0;
        player.hOff = 0;
    }

    if (currentScreenBlock == 19 && hOff >= 512 - 240 - 20) {
        hOff = 512 - 240 - 20;
        player.hOff = 2816 - 240 - 20;
    } else {
        if (hOff >= 256 && currentScreenBlock < 19) {
            currentScreenBlock++;
            hOff -= 256;
            (*(volatile unsigned short *)0x4000008) = ((0) << 2) | (0 << 7) | (1 << 14) | ((currentScreenBlock) << 8);
        }
        if (hOff < 0 && currentScreenBlock > 10) {
            currentScreenBlock--;
            hOff += 256;
            (*(volatile unsigned short *)0x4000008) = ((0) << 2) | (0 << 7) | (1 << 14) | ((currentScreenBlock) << 8);
        }
    }
}
