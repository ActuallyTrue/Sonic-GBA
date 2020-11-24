# 1 "entities.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "entities.c"

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
# 3 "entities.c" 2
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
# 4 "entities.c" 2
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
# 5 "entities.c" 2
# 1 "Level1.h" 1
# 22 "Level1.h"
extern const unsigned short Level1Tiles[7504];


extern const unsigned short Level1Map[11264];


extern const unsigned short Level1Pal[256];
# 6 "entities.c" 2
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
# 7 "entities.c" 2
# 1 "Level1CollisionMap.h" 1
# 20 "Level1CollisionMap.h"
extern const unsigned short Level1CollisionMapBitmap[720896];
# 8 "entities.c" 2

ITEMBLOCK itemBlocks[7];
ENEMY enemies[10];
ITEM items[6];
ITEM fireBalls[3];
ITEM goal;

void initializeItemBlocks() {
    goal.worldCol = ((2681) << 6);
    goal.worldRow = ((155) << 6);
    goal.width = 26;
    goal.height = 26;
    for (int i = 0; i < 7; i++) {
        itemBlocks[i].height = 16;
        itemBlocks[i].width = 16;
        itemBlocks[i].hit = 0;
        itemBlocks[i].given = 0;
        shadowOAM[i + 1].attr2 = ((0)*32 + (30)) | ((0) << 10) | ((0) << 12);
        switch(i) {
            case 0:
                itemBlocks[i].worldCol = ((174) << 6);
                itemBlocks[i].worldRow = ((176) << 6);
                itemBlocks[i].type = MUSHROOM;
            break;
            case 1:
                itemBlocks[i].worldCol = ((190) << 6);
                itemBlocks[i].worldRow = ((176) << 6);
            break;
            case 2:
                itemBlocks[i].worldCol = ((222) << 6);
                itemBlocks[i].worldRow = ((128) << 6);
            break;
            case 3:
                itemBlocks[i].worldCol = ((238) << 6);
                itemBlocks[i].worldRow = ((128) << 6);
            break;
            case 4:
                itemBlocks[i].worldCol = ((414) << 6);
                itemBlocks[i].worldRow = ((144) << 6);
            break;
            case 5:
                itemBlocks[i].worldCol = ((702) << 6);
                itemBlocks[i].worldRow = ((176) << 6);
                itemBlocks[i].type = FIREFLOWER;
            break;
            case 6:
                itemBlocks[i].worldCol = ((1470) << 6);
                itemBlocks[i].worldRow = ((192) << 6);
            break;
        }
    }
}

void initializeEnemies() {
    for (int i = 0; i < 10; i++) {
        enemies[i].height = 16;
        enemies[i].width = 16;
        enemies[i].active = 1;
        enemies[i].numFrames = 3;
        switch(i) {
            case 0:
                enemies[i].worldCol = ((200) << 6);
                enemies[i].worldRow = ((224) << 6);
                enemies[i].colVelocity = ((1) << 6);
                enemies[i].type = GOOMBA;
            break;
            case 1:
                enemies[i].worldCol = ((385) << 6);
                enemies[i].worldRow = ((224) << 6);
                enemies[i].colVelocity = ((1) << 6);
                enemies[i].type = GOOMBA;
            break;
            case 2:
                enemies[i].worldCol = ((622) << 6);
                enemies[i].worldRow = ((208) << 6);
                enemies[i].type = CHOMPER;
            break;
            case 3:
                enemies[i].worldCol = ((969) << 6);
                enemies[i].worldRow = ((208) << 6);
                enemies[i].colVelocity = ((1) << 6);
                enemies[i].type = GOOMBA;
            break;
            case 4:
                enemies[i].worldCol = ((1013) << 6);
                enemies[i].worldRow = ((208) << 6);
                enemies[i].colVelocity = ((1) << 6);
                enemies[i].type = GOOMBA;
            break;
            case 5:
                enemies[i].worldCol = ((1069) << 6);
                enemies[i].worldRow = ((208) << 6);
                enemies[i].type = CHOMPER;
            break;
            case 6:
                enemies[i].worldCol = ((1182) << 6);
                enemies[i].worldRow = ((224) << 6);
                enemies[i].type = CHOMPER;
            break;
            case 7:
                enemies[i].worldCol = ((1254) << 6);
                enemies[i].worldRow = ((224) << 6);
                enemies[i].colVelocity = ((1) << 6);
                enemies[i].type = GOOMBA;
            break;
            case 8:
                enemies[i].worldCol = ((1485) << 6);
                enemies[i].worldRow = ((224) << 6);
                enemies[i].type = CHOMPER;
            break;
            case 9:
                enemies[i].worldCol = ((1887) << 6);
                enemies[i].worldRow = ((224) << 6);
                enemies[i].colVelocity = ((1) << 6);
                enemies[i].type = GOOMBA;
            break;
        }
    }
}

void initializeFireBalls() {
    for (int i = 0; i < 3; i++) {
        fireBalls[i].colVelocity = ((3) << 6);
        fireBalls[i].active = 0;
        fireBalls[i].height = 8;
        fireBalls[i].width = 8;
        fireBalls[i].worldCol = 0;
        fireBalls[i].worldRow = 0;
    }
}

void updateFireBalls() {
    for (int i = 0; i < 3; i++) {
        if (fireBalls[i].active) {
            FIREBALLCheckCollisionWithItemBlocks(&fireBalls[i]);
            FIREBALLCheckCollisionWithEnemies(&fireBalls[i]);
            FIREBALLCheckCollisionWithCollisionMap(&fireBalls[i]);
            fireBalls[i].worldCol += fireBalls[i].colVelocity;
            fireBalls[i].worldRow += fireBalls[i].rowVelocity;
            fireBalls[i].rowVelocity += 14;
        }
    }
}

void FIREBALLCheckCollisionWithEnemies(ITEM* fireBall) {
    for (int i = 0; i < 10; i++) {
        if (collision(((fireBall->worldCol) >> 6), ((fireBall->worldRow) >> 6), fireBall->width, fireBall->height, ((enemies[i].worldCol) >> 6),
            ((enemies[i].worldRow) >> 6), enemies[i].width, enemies[i].height)) {
            if (enemies[i].type == GOOMBA) {
                killEnemy(&enemies[i]);
            }
            fireBall->active = 0;
            fireBall->worldCol = 0;
            fireBall->worldRow = 0;
        }
    }
}
void FIREBALLCheckCollisionWithCollisionMap(ITEM* fireBall) {



    if (fireBall->rowVelocity > 0) {
        for (int i = ((fireBall->worldRow) >> 6); i < ((fireBall->worldRow + fireBall->rowVelocity) >> 6); i++) {
            if (Level1CollisionMapBitmap[((i + fireBall->height - 1)*(2816)+(((fireBall->worldCol) >> 6)))] == 0x7FFF
            && Level1CollisionMapBitmap[((i + fireBall->height - 1)*(2816)+(((fireBall->worldCol) >> 6) + fireBall->width - 2))] == 0x7FFF) {
                continue;
            } else {
                fireBall->rowVelocity = -416/2;
                return;
            }
        }
    }

    if (fireBall->colVelocity > 0) {
        for (int i = ((fireBall->worldCol) >> 6); i < ((fireBall->worldCol + fireBall->colVelocity) >> 6); i++) {
            if ((Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6))*(2816)+(i + fireBall->width - 1))] == 0x7FFF || Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6))*(2816)+(i + fireBall->width - 1))] == 0x03E0)
            && (Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6) + fireBall->height - 1)*(2816)+(i + fireBall->width - 1))] == 0x7FFF || Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6) + fireBall->height - 1)*(2816)+(i + fireBall->width - 1))] == 0x03E0)) {
                continue;
            } else {
                fireBall->active = 0;
                fireBall->worldCol = 0;
                fireBall->worldRow = 0;
                return;
            }
        }
    }
    if (fireBall->colVelocity < 0) {
        for (int i = ((fireBall->worldCol) >> 6); i > ((fireBall->worldCol + fireBall->colVelocity) >> 6) && i > 0; i--) {
            if ((Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6))*(2816)+(i))] == 0x7FFF || Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6))*(2816)+(i))] == 0x03E0)
            && (Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6) + fireBall->height - 1)*(2816)+(i))] == 0x7FFF || Level1CollisionMapBitmap[((((fireBall->worldRow) >> 6) + fireBall->height - 1)*(2816)+(i))] == 0x03E0)) {
                continue;
            } else {
                fireBall->active = 0;
                fireBall->worldCol = 0;
                fireBall->worldRow = 0;
                return;
            }
        }
    }

    if (((fireBall->worldCol) >> 6) <= 0) {
        fireBall->active = 0;
        fireBall->worldCol = 0;
        fireBall->worldRow = 0;
    }

    if (fireBall->rowVelocity < 0) {
        for (int i = ((fireBall->worldRow) >> 6); i > ((fireBall->worldRow + fireBall->rowVelocity) >> 6); i--) {
            if ((Level1CollisionMapBitmap[((i)*(2816)+(((fireBall->worldCol) >> 6)))] == 0x7FFF || Level1CollisionMapBitmap[((i)*(2816)+(((fireBall->worldCol) >> 6)))] == 0x03E0)
            && Level1CollisionMapBitmap[((i)*(2816)+(((fireBall->worldCol) >> 6) + fireBall->width - 2))] == 0x7FFF || Level1CollisionMapBitmap[((i)*(2816)+(((fireBall->worldCol) >> 6) + fireBall->width - 2))] == 0x03E0) {
                continue;
            } else {
                fireBall->active = 0;
                fireBall->worldCol = 0;
                fireBall->worldRow = 0;
            }
        }
    }

    if (((fireBall->worldRow) >> 6) + fireBall->height >= 256) {
        fireBall->active = 0;
        fireBall->worldCol = 0;
        fireBall->worldRow = 0;
    }
}

void FIREBALLCheckCollisionWithItemBlocks(ITEM* fireBall) {
        for (int i = 0; i < 7; i++) {
        if (((((itemBlocks[i].worldCol) >> 6) - player.hOff) < 240 && (((itemBlocks[i].worldCol) >> 6) - player.hOff) + itemBlocks[i].width > 0)
        && ((((itemBlocks[i].worldRow) >> 6) - player.vOff) < 160 && (((itemBlocks[i].worldRow) >> 6) - player.vOff) > 0)) {

            if (fireBall->rowVelocity > 0) {
                for (int j = ((fireBall->worldRow) >> 6); j < ((fireBall->worldRow + fireBall->rowVelocity) >> 6); j++) {
                    if (collision(((fireBall->worldCol) >> 6),j, fireBall->width, fireBall->height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                        fireBall->rowVelocity = -416/2;
                        return;
                    }
                }
            }

            if (fireBall->colVelocity > 0) {
                for (int j = ((fireBall->worldCol) >> 6); j < ((fireBall->worldCol + fireBall->colVelocity) >> 6); j++) {
                    if (collision(j,((fireBall->worldRow) >> 6),fireBall->width, fireBall->height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                        fireBall->active = 0;
                        fireBall->worldCol = 0;
                        fireBall->worldRow = 0;
                        return;
                    }
                }
            }
            if (fireBall->colVelocity < 0) {
                for (int j = ((fireBall->worldCol) >> 6); j > ((fireBall->worldCol + fireBall->colVelocity) >> 6) && j > 0; j--) {
                    if (collision(j,((fireBall->worldRow) >> 6), fireBall->width, fireBall->height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                        fireBall->active = 0;
                        fireBall->worldCol = 0;
                        fireBall->worldRow = 0;
                        return;
                    }
                }
            }
            if (fireBall->rowVelocity < 0) {
                    for (int j = ((fireBall->worldRow) >> 6); j > ((fireBall->worldRow + fireBall->rowVelocity) >> 6); j--) {
                        if (collision(((fireBall->worldCol) >> 6), j, fireBall->width, fireBall->height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                            fireBall->active = 0;
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
        for (int i = 0; i < 10; i++) {
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
    for (int i = 0; i < 10; i++) {
        if (goomba != &enemies[i]) {
            if (collision(((goomba->worldCol) >> 6), ((goomba->worldRow) >> 6), goomba->width, goomba->height, ((enemies[i].worldCol) >> 6),
             ((enemies[i].worldRow) >> 6), enemies[i].width, enemies[i].height)) {
                 goomba->colVelocity = -goomba->colVelocity;
             }
        }

    }
}
void GOOMBACheckCollisionWithCollisionMap(ENEMY* goomba) {


    if (goomba->colVelocity > 0) {
        for (int i = ((goomba->worldCol) >> 6); i < ((goomba->worldCol + goomba->colVelocity) >> 6); i++) {
            if ((Level1CollisionMapBitmap[((((goomba->worldRow) >> 6))*(2816)+(i + goomba->width - 1))] == 0x7FFF || Level1CollisionMapBitmap[((((goomba->worldRow) >> 6))*(2816)+(i + goomba->width - 1))] == 0x03E0)
            && (Level1CollisionMapBitmap[((((goomba->worldRow) >> 6) + goomba->height - 1)*(2816)+(i + goomba->width - 1))] == 0x7FFF || Level1CollisionMapBitmap[((((goomba->worldRow) >> 6) + goomba->height - 1)*(2816)+(i + goomba->width - 1))] == 0x03E0)) {
                continue;
            } else {
                goomba->colVelocity = -goomba->colVelocity;
                return;
            }
        }
    }
    if (goomba->colVelocity < 0) {
        for (int i = ((goomba->worldCol) >> 6); i > ((goomba->worldCol + goomba->colVelocity) >> 6) && i > 0; i--) {
            if ((Level1CollisionMapBitmap[((((goomba->worldRow) >> 6))*(2816)+(i))] == 0x7FFF || Level1CollisionMapBitmap[((((goomba->worldRow) >> 6))*(2816)+(i))] == 0x03E0)
            && (Level1CollisionMapBitmap[((((goomba->worldRow) >> 6) + goomba->height - 1)*(2816)+(i))] == 0x7FFF || Level1CollisionMapBitmap[((((goomba->worldRow) >> 6) + goomba->height - 1)*(2816)+(i))] == 0x03E0)) {
                continue;
            } else {
                goomba->colVelocity = -goomba->colVelocity;
                return;
            }
        }
    }

    if (((goomba->worldCol) >> 6) <= 0) {
        goomba->colVelocity = -goomba->colVelocity;
    }

}

void killEnemy(ENEMY* enemy) {
    enemy->active = 0;
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
    for (int i = 0; i < 7; i++) {
        if (itemBlocks[i].hit && !itemBlocks[i].given) {
            itemBlocks[i].given = 1;
            spawnItem(itemBlocks[i].worldCol, itemBlocks[i].worldRow - ((16) << 6), itemBlocks[i].type);
        }
    }
}

void initializeItems() {
    for (int i = 0; i < 6; i++) {
        items[i].active = 0;
        items[i].height = 16;
        items[i].width = 16;
    }
}

void spawnItem(int worldCol, int worldRow, int type) {
    for (int i = 0; i < 6; i++) {
        if (!items[i].active) {
            items[i].active = 1;
            items[i].worldCol = worldCol;
            items[i].worldRow = worldRow;
            items[i].type = type;
            items[i].grounded = 1;

            switch(type) {
                case COIN:
                    items[i].colVelocity = ((1) << 6);
                break;
                case MUSHROOM:
                    items[i].colVelocity = ((1) << 6);
                break;
                case FIREFLOWER:
                    items[i].colVelocity = 0;
                break;
            }
            return;
        }
    }
}

void drawEnemies() {
    for (int i = 0; i < 10; i++) {
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
    for (int i = 0; i < 6; i++) {
        if (items[i].active) {
            if (((((items[i].worldCol) >> 6) - player.hOff) < 240 && (((items[i].worldCol) >> 6) - player.hOff) + items[i].width > 0)
            && ((((items[i].worldRow) >> 6) - player.vOff) < 160 && (((items[i].worldRow) >> 6) - player.vOff) > 0)) {
                shadowOAM[i + 1 + 7].attr0 = (0xFF & (((items[i].worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
                shadowOAM[i + 1 + 7].attr1 = (0x1FF & (((items[i].worldCol) >> 6) - player.hOff)) | (1 << 14);
            } else {
                shadowOAM[i + 1 + 7].attr0 = (0xFF & (((items[i].worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
                shadowOAM[i + 1 + 7].attr1 = (0x1FF & (((items[i].worldCol) >> 6) - player.hOff)) | (1 << 14);
            }
        } else {
            shadowOAM[i + 1 + 7].attr0 = (0xFF & (((items[i].worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
        }
        switch (items[i].type) {
            case COIN:
                shadowOAM[i + 1 + 7].attr2 = ((4)*32 + (30)) | ((0) << 10) | ((0) << 12);
            break;
            case MUSHROOM:
                shadowOAM[i + 1 + 7].attr2 = ((8)*32 + (30)) | ((0) << 10) | ((0) << 12);
            break;
            case FIREFLOWER:
                shadowOAM[i + 1 + 7].attr2 = ((6)*32 + (30)) | ((0) << 10) | ((0) << 12);
            break;
        }
    }
}

void drawItemBlocks() {
    for (int i = 0; i < 7; i++) {
        if (((((itemBlocks[i].worldCol) >> 6) - player.hOff) < 240 && (((itemBlocks[i].worldCol) >> 6) - player.hOff) + itemBlocks[i].width > 0)
        && ((((itemBlocks[i].worldRow) >> 6) - player.vOff) < 160 && (((itemBlocks[i].worldRow) >> 6) - player.vOff) > 0)) {
            shadowOAM[i + 1].attr0 = (0xFF & (((itemBlocks[i].worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
            shadowOAM[i + 1].attr1 = (0x1FF & (((itemBlocks[i].worldCol) >> 6) - player.hOff)) | (1 << 14);
        } else {
            shadowOAM[i + 1].attr0 = (0xFF & (((itemBlocks[i].worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
            shadowOAM[i + 1].attr1 = (0x1FF & (((itemBlocks[i].worldCol) >> 6) - player.hOff)) | (1 << 14);
        }

        if (itemBlocks[i].hit) {
            shadowOAM[i + 1].attr2 = ((2)*32 + (30)) | ((0) << 10) | ((0) << 12);
        }

    }
}

void drawGoomba(ENEMY* goomba, int index) {
    if (goomba->active) {
        if (((((goomba->worldCol) >> 6) - player.hOff) < 240 && (((goomba->worldCol) >> 6) - player.hOff) + goomba->width > 0)
        && ((((goomba->worldRow) >> 6) - player.vOff) < 160 && (((goomba->worldRow) >> 6) - player.vOff) > 0)) {
            shadowOAM[index + 1 + 7 + 6].attr0 = (0xFF & (((goomba->worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
            shadowOAM[index + 1 + 7 + 6].attr1 = (0x1FF & (((goomba->worldCol) >> 6) - player.hOff)) | (1 << 14);
            shadowOAM[index + 1 + 7 + 6].attr2 = ((2)*32 + (0)) | ((0) << 10) | ((1) << 12);

            if (goomba->flip) {
                shadowOAM[index + 1 + 7 + 6].attr1 |= (1 << 12);
            } else {
                shadowOAM[index + 1 + 7 + 6].attr1 &= ~(1 << 12);
            }
        } else {
            shadowOAM[index + 1 + 7 + 6].attr0 = (0xFF & (((goomba->worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
            shadowOAM[index + 1 + 7 + 6].attr1 = (0x1FF & (((goomba->worldCol) >> 6) - player.hOff)) | (1 << 14);
        }
    } else {
        shadowOAM[index + 1 + 7 + 6].attr0 = (2 << 8);
    }
}

void drawChomper(ENEMY* chomper, int index) {
    if (chomper->active) {
        if (((((chomper->worldCol) >> 6) - player.hOff) < 240 && (((chomper->worldCol) >> 6) - player.hOff) + chomper->width > 0)
        && ((((chomper->worldRow) >> 6) - player.vOff) < 160 && (((chomper->worldRow) >> 6) - player.vOff) > 0)) {
            shadowOAM[index + 1 + 7 + 6].attr0 = (0xFF & (((chomper->worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
            shadowOAM[index + 1 + 7 + 6].attr1 = (0x1FF & (((chomper->worldCol) >> 6) - player.hOff)) | (1 << 14);
            shadowOAM[index + 1 + 7 + 6].attr2 = (((chomper->curFrame + 2) * 2)*32 + (0)) | ((0) << 10) | ((0) << 12);
        } else {
            shadowOAM[index + 1 + 7 + 6].attr0 = (0xFF & (((chomper->worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
            shadowOAM[index + 1 + 7 + 6].attr1 = (0x1FF & (((chomper->worldCol) >> 6) - player.hOff)) | (1 << 14);
        }
    } else {
        shadowOAM[index + 1 + 7 + 6].attr0 = (2 << 8);
    }
}

void drawGoal() {
    if (((((goal.worldCol) >> 6) - player.hOff) < 240 && (((goal.worldCol) >> 6) - player.hOff) + goal.width > 0)
        && ((((goal.worldRow) >> 6) - player.vOff) < 160 && (((goal.worldRow) >> 6) - player.vOff) > 0)) {
            shadowOAM[98].attr0 = (0xFF & (((goal.worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
            shadowOAM[98].attr1 = (0x1FF & (((goal.worldCol) >> 6) - player.hOff)) | (2 << 14);
        } else {
            shadowOAM[98].attr0 = (0xFF & (((goal.worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
            shadowOAM[98].attr1 = (0x1FF & (((goal.worldCol) >> 6) - player.hOff)) | (2 << 14);
    }

    shadowOAM[98].attr2 = ((10)*32 + (28)) | ((0) << 10) | ((0) << 12);

}

void drawFireBalls() {
    for (int i = 0; i < 3; i++) {
        if (fireBalls[i].active) {
            if (((((fireBalls[i].worldCol) >> 6) - player.hOff) < 240 && (((fireBalls[i].worldCol) >> 6) - player.hOff) + fireBalls[i].width > 0)
            && ((((fireBalls[i].worldRow) >> 6) - player.vOff) < 160 && (((fireBalls[i].worldRow) >> 6) - player.vOff) > 0)) {
                shadowOAM[i + 1 + 7 + 6 + 10].attr0 = (0xFF & (((fireBalls[i].worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
                shadowOAM[i + 1 + 7 + 6 + 10].attr1 = (0x1FF & (((fireBalls[i].worldCol) >> 6) - player.hOff)) | (0 << 14);
                shadowOAM[i + 1 + 7 + 6 + 10].attr2 = ((0)*32 + (29)) | ((0) << 10) | ((0) << 12);
            } else {
                shadowOAM[i + 1 + 7 + 6 + 10].attr0 = (0xFF & (((fireBalls[i].worldRow) >> 6) - player.vOff)) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
                shadowOAM[i + 1 + 7 + 6 + 10].attr1 = (0x1FF & (((fireBalls[i].worldCol) >> 6) - player.hOff)) | (0 << 14);
            }
        } else {
            shadowOAM[i + 1 + 7 + 6 + 10].attr0 = (2 << 8);
        }
    }

}

void drawCoinCount() {

    shadowOAM[124].attr0 = (0xFF & (0)) | (0 << 14) | (0 << 13) | (0 << 8);
    shadowOAM[124].attr1 = (0x1FF & (208)) | (0 << 14);
    shadowOAM[124].attr2 = ((0)*32 + (22)) | ((0) << 10) | ((1) << 12);


    shadowOAM[125].attr0 = (0xFF & (0)) | (0 << 14) | (0 << 13) | (0 << 8);
    shadowOAM[125].attr1 = (0x1FF & (216)) | (0 << 14);
    shadowOAM[125].attr2 = ((1)*32 + (22)) | ((0) << 10) | ((1) << 12);

    int onesPlace = player.coinCount / 10;
    int tensPlace = player.coinCount % 10;
    shadowOAM[126].attr0 = (0xFF & (0)) | (0 << 14) | (0 << 13) | (0 << 8);
    shadowOAM[126].attr1 = (0x1FF & (224)) | (0 << 14);
    shadowOAM[126].attr2 = ((onesPlace)*32 + (21)) | ((0) << 10) | ((1) << 12);
    shadowOAM[127].attr0 = (0xFF & (0)) | (0 << 14) | (0 << 13) | (0 << 8);
    shadowOAM[127].attr1 = (0x1FF & (232)) | (0 << 14);
    shadowOAM[127].attr2 = ((tensPlace)*32 + (21)) | ((0) << 10) | ((1) << 12);
}
