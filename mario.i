# 1 "mario.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mario.c"
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
# 322 "myLib.h"
typedef void (*ihp)(void);
# 342 "myLib.h"
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
# 6 "mario.c" 2
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
# 7 "mario.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 8 "mario.c" 2
# 1 "fireBallSound.h" 1


extern const unsigned int fireBallSound_sampleRate;
extern const unsigned int fireBallSound_length;
extern const signed char fireBallSound_data[];
# 9 "mario.c" 2
# 1 "coinSound.h" 1


extern const unsigned int coinSound_sampleRate;
extern const unsigned int coinSound_length;
extern const signed char coinSound_data[];
# 10 "mario.c" 2
# 1 "itemSpawnSound.h" 1


extern const unsigned int itemSpawnSound_sampleRate;
extern const unsigned int itemSpawnSound_length;
extern const signed char itemSpawnSound_data[];
# 11 "mario.c" 2
# 1 "jumpSound.h" 1


extern const unsigned int jumpSound_sampleRate;
extern const unsigned int jumpSound_length;
extern const signed char jumpSound_data[];
# 12 "mario.c" 2
# 1 "pauseSound.h" 1


extern const unsigned int pauseSound_sampleRate;
extern const unsigned int pauseSound_length;
extern const signed char pauseSound_data[];
# 13 "mario.c" 2
# 1 "powerDownSound.h" 1


extern const unsigned int powerDownSound_sampleRate;
extern const unsigned int powerDownSound_length;
extern const signed char powerDownSound_data[];
# 14 "mario.c" 2
# 1 "powerUpSound.h" 1


extern const unsigned int powerUpSound_sampleRate;
extern const unsigned int powerUpSound_length;
extern const signed char powerUpSound_data[];
# 15 "mario.c" 2


MARIO player;
enum {NORMAL, BIG};

void checkCollisionWithGoombas(ENEMY* goomba);

void initializeMario() {
    copyToSpritePaletteMem(mariospritesheetPal, 512 >> 1);
    copyToCharBlock(mariospritesheetTiles, 4, 32768 >> 1);
    player.height = 16;
    player.width = 16;
    player.worldCol = ((20) << 6);
    player.worldRow = ((223) << 6);
    player.curFrame = 0;
    player.aniCounter = 0;
    player.aniState = IDLE;
    player.hOff = hOff;
    player.vOff = vOff;
    player.powerUpState = NORMAL;
    player.invincible = 0;
    player.invincibilityCounter = 0;
    player.hide = 0;
    player.coinCount = 0;
}

void updateMario() {

    checkCollisionWithGoal();

    short moveInput = 0;

    if (((!(~(oldButtons) & ((1<<1)))) && (~(buttons) & ((1<<1)))) && player.powerUpState == FIREFLOWER) {
        for (int i = 0; i < 3; i++) {
            if (!fireBalls[i].active) {
                playSoundB(fireBallSound_data, fireBallSound_length, 0);
                fireBalls[i].active = 1;
                if (player.flip) {
                    fireBalls[i].worldCol = ((((player.worldCol) >> 6) + player.width) << 6);
                    fireBalls[i].colVelocity = ((3) << 6);
                } else {
                    fireBalls[i].worldCol = player.worldCol;
                    fireBalls[i].colVelocity = -((3) << 6);
                }
                fireBalls[i].worldRow = player.worldRow;
                fireBalls[i].rowVelocity = ((1) << 6);
                break;
            }
        }
    }

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
        player.flip = 0;
        moveInput = 1;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        player.colVelocity = player.running ? ((2) << 6) : ((1) << 6);
        if (player.grounded) {
            player.aniState = WALK;
            player.numFrames = 3;
        }
        player.flip = 1;
        moveInput = 1;
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
    checkCollisionWithMap();
    checkCollisionWithItemBlocks();
    if (!player.invincible) {
        checkCollisionWithEnemies();
    } else {
        if (player.invincibilityCounter % 2 == 0) {
            player.hide = !player.hide;
        }
        if (player.invincibilityCounter > 90) {
            player.invincible = 0;
            player.hide = 0;
            player.invincibilityCounter = 0;
        } else {
            player.invincibilityCounter++;
        }
    }
    short cheating = 0;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<8)))) {
        cheating = 1;
        player.rowVelocity = -((1) << 6);
        player.grounded = 0;
        player.rowVelocity = -416;
        player.aniState = JUMP;
        player.numFrames = 0;
    }
    if (!cheating && ((!(~(oldButtons) & ((1<<0)))) && (~(buttons) & ((1<<0)))) && player.grounded) {
        playSoundB(jumpSound_data, jumpSound_length, 0);
        player.grounded = 0;
        player.rowVelocity = -416;
        player.aniState = JUMP;
        player.numFrames = 0;
    }

    if (!cheating && (((~(oldButtons) & ((1<<0)))) && !(~(buttons) & ((1<<0)))) && !player.grounded) {
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
            player.rowVelocity += 14;
        }
    }

    checkCollisionWithMap();
    checkCollisionWithItemBlocks();


    if (player.worldCol < 0) {
        player.worldCol = 0;
        if (player.colVelocity != 0) {
            player.colVelocity = 0;
        }
    }

    if (player.worldRow + player.rowVelocity < 0) {
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
    checkCollisionWithItems();

}

void adjustScreenOffset() {
    if (player.rowVelocity < 0) {
        if (vOff > 0 && (((player.worldRow) >> 6) - vOff) % 256 <= 160/4) {

                if (vOff += ((player.rowVelocity) >> 6) > 0) {
                    vOff += ((player.rowVelocity) >> 6);
                    player.vOff += ((player.rowVelocity) >> 6);
                }

                if (vOff < 0) {
                    vOff = 0;
                    player.vOff = 0;
                }

        }
    }

    if (player.rowVelocity > 0) {
        if (vOff < 256 - 160 && (((player.worldRow) >> 6) - vOff) + player.height % 256 >= 160/2) {

                vOff += ((player.rowVelocity) >> 6);
                player.vOff += ((player.rowVelocity) >> 6);
                if (vOff > 256 - 160) {
                    vOff = 256 - 160;
                    player.vOff = 256 - 160;
                }
        }
    }

    if (player.colVelocity < 0) {
        if ((((player.worldCol) >> 6) - hOff) % 256 <= 240/2) {

                if (player.running) {
                    hOff += -2;
                    player.hOff += -2;
                } else {
                    hOff--;
                    player.hOff--;
                }
        }
    }

    if (player.colVelocity > 0) {
        if ((((player.worldCol) >> 6) - hOff) + player.width % 256 >= 240/2) {

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
    short originalHeight = player.height;
    player.width = 16;
    player.height = 27;
    if (player.grounded) {
        player.worldRow += -((player.height - originalHeight) << 6);
    }
}
void advanceToFireFlower() {
    player.powerUpState = FIREFLOWER;
    player.width = 16;
    player.height = 27;
}

void checkCollisionWithItems() {
    for (int i = 0; i < 6; i++) {
        if (items[i].active) {
            if (collision(((player.worldCol) >> 6), ((player.worldRow) >> 6), player.width, player.height, ((items[i].worldCol) >> 6), ((items[i].worldRow) >> 6), items[i].width, items[i].height)) {
                items[i].active = 0;
                items[i].worldCol = 0;
                items[i].worldRow = 0;
                switch(items[i].type) {
                    case COIN:
                        playSoundB(coinSound_data, coinSound_length, 0);
                        player.coinCount++;
                    break;
                    case MUSHROOM:
                        playSoundB(powerUpSound_data, powerUpSound_length, 0);
                        advanceToMushroom();
                    break;
                    case FIREFLOWER:
                        playSoundB(powerUpSound_data, powerUpSound_length, 0);
                        advanceToFireFlower();
                    break;
                }
            }
        }
    }
}

void checkCollisionWithItemBlocks() {
    for (int i = 0; i < 7; i++) {
        if (((((itemBlocks[i].worldCol) >> 6) - player.hOff) < 240 && (((itemBlocks[i].worldCol) >> 6) - player.hOff) + itemBlocks[i].width > 0)
        && ((((itemBlocks[i].worldRow) >> 6) - player.vOff) < 160 && (((itemBlocks[i].worldRow) >> 6) - player.vOff) > 0)) {
            if (player.colVelocity > 0) {
                for (int j = ((player.worldCol) >> 6); j < ((player.worldCol + player.colVelocity) >> 6); j++) {
                    if (collision(j,((player.worldRow) >> 6),player.width, player.height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                        j--;
                        player.colVelocity = (((j) << 6) - player.worldCol);
                        player.worldCol += player.colVelocity;
                        player.colVelocity = 0;
                        return;
                    }
                }
            }
            if (player.colVelocity < 0) {
                for (int j = ((player.worldCol) >> 6); j > ((player.worldCol + player.colVelocity) >> 6) && j > 0; j--) {
                    if (collision(j,((player.worldRow) >> 6), player.width, player.height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                        j++;
                        player.colVelocity = (((j) << 6) - player.worldCol);
                        player.worldCol += player.colVelocity;
                        player.colVelocity = 0;
                        return;
                    }
                }
            }
            if (player.rowVelocity < 0) {
                    for (int j = ((player.worldRow) >> 6); j > ((player.worldRow + player.rowVelocity) >> 6); j--) {
                        if (collision(((player.worldCol) >> 6), j, player.width, player.height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                            j++;
                            player.rowVelocity = (((j) << 6) - player.worldRow);
                            player.worldRow += player.rowVelocity;
                            if (collision(((player.worldCol) >> 6), ((player.worldRow) >> 6), player.width, player.height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {
                                player.worldRow = ((((itemBlocks[i].worldRow) >> 6) + itemBlocks[i].height + 1) << 6);
                            }
                            player.rowVelocity = ((1) << 6);
                            if (!itemBlocks[i].hit) {
                                playSoundB(itemSpawnSound_data, itemSpawnSound_length, 0);
                                itemBlocks[i].hit = 1;
                            }
                            return;
                        }
                    }
            }

            if (player.rowVelocity > 0) {
                for (int j = ((player.worldRow) >> 6); j < ((player.worldRow + player.rowVelocity) >> 6); j++) {
                    if (collision(((player.worldCol) >> 6),j, player.width, player.height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {

                        j--;
                        player.rowVelocity = (((j) << 6) - player.worldRow);
                        player.worldRow += player.rowVelocity;
                        player.rowVelocity = 0;
                        player.grounded = 1;
                        return;
                    }
                }
            }
            if (((player.worldRow) >> 6) < ((itemBlocks[i].worldRow) >> 6)) {
                if (collision(((player.worldCol) >> 6), ((player.worldRow) >> 6) + 1, player.width, player.height, ((itemBlocks[i].worldCol) >> 6), ((itemBlocks[i].worldRow) >> 6), itemBlocks[i].width, itemBlocks[i].height)) {
                    player.grounded = 1;
                    return;
                }
            }
        }
    }
}

void checkCollisionWithMap() {


    if (player.colVelocity > 0) {
        for (int i = ((player.worldCol) >> 6); i < ((player.worldCol + player.colVelocity) >> 6); i++) {
            if ((Level1CollisionMapBitmap[((((player.worldRow) >> 6))*(2816)+(i + player.width - 1))] == 0x7FFF || Level1CollisionMapBitmap[((((player.worldRow) >> 6))*(2816)+(i + player.width - 1))] == 0x03E0)
            && (Level1CollisionMapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(2816)+(i + player.width - 1))] == 0x7FFF || Level1CollisionMapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(2816)+(i + player.width - 1))] == 0x03E0)) {
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
            if ((Level1CollisionMapBitmap[((((player.worldRow) >> 6))*(2816)+(i))] == 0x7FFF || Level1CollisionMapBitmap[((((player.worldRow) >> 6))*(2816)+(i))] == 0x03E0)
            && (Level1CollisionMapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(2816)+(i))] == 0x7FFF || Level1CollisionMapBitmap[((((player.worldRow) >> 6) + player.height - 1)*(2816)+(i))] == 0x03E0)) {
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

    if (((player.worldRow) >> 6) + player.height >= 256) {
        shouldLose = 1;
    }

}

void checkCollisionWithEnemies() {
    for (int i = 0; i < 10; i++) {
        switch (enemies[i].type) {
            case GOOMBA:
                checkCollisionWithGoombas(&enemies[i]);
            break;
            case CHOMPER:
                if (collision(((player.worldCol) >> 6), ((player.worldRow) >> 6) + 1, player.width, player.height, ((enemies[i].worldCol) >> 6), ((enemies[i].worldRow) >> 6),
                 enemies[i].width, enemies[i].height)) {
                    takeDamage();
                }
            break;
        }
    }
}

void checkCollisionWithGoombas(ENEMY* goomba) {
    if (((((goomba->worldCol) >> 6) - player.hOff) < 240 && (((goomba->worldCol) >> 6) - player.hOff) + goomba->width > 0)
        && ((((goomba->worldRow) >> 6) - player.vOff) < 160 && (((goomba->worldRow) >> 6) - player.vOff) > 0)) {
            if (player.rowVelocity > 0) {
                for (int j = ((player.worldRow) >> 6); j < ((player.worldRow + player.rowVelocity) >> 6); j++) {
                    if (collision(((player.worldCol) >> 6),j, player.width, player.height, ((goomba->worldCol) >> 6), ((goomba->worldRow) >> 6), goomba->width, goomba->height)) {

                        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
                            player.grounded = 0;
                            player.rowVelocity = -(416 + 416/9);
                            player.aniState = JUMP;
                            player.numFrames = 0;
                            playSoundB(jumpSound_data, jumpSound_length, 0);
                        } else {
                            player.grounded = 0;
                            player.rowVelocity = -(416/2);
                            player.aniState = JUMP;
                            player.numFrames = 0;
                            playSoundB(jumpSound_data, jumpSound_length, 0);
                        }
                        killEnemy(goomba);
                        return;
                    }
                }
            }

            if (((player.worldRow) >> 6) < ((goomba->worldRow) >> 6) && !player.grounded) {
                if (collision(((player.worldCol) >> 6), ((player.worldRow) >> 6) + 1, player.width, player.height, ((goomba->worldCol) >> 6), ((goomba->worldRow) >> 6), goomba->width, goomba->height)) {
                    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
                        player.grounded = 0;
                        player.rowVelocity = -(416 + 416/9);
                        player.aniState = JUMP;
                        player.numFrames = 0;
                    } else {
                        player.grounded = 0;
                        player.rowVelocity = -(416/2);
                        player.aniState = JUMP;
                        player.numFrames = 0;
                    }
                    killEnemy(goomba);
                    return;
                }
            }

            if (player.rowVelocity < 0) {
                    for (int j = ((player.worldRow) >> 6); j > ((player.worldRow + player.rowVelocity) >> 6); j--) {
                        if (collision(((player.worldCol) >> 6),j, player.width, player.height, ((goomba->worldCol) >> 6), ((goomba->worldRow) >> 6), goomba->width, goomba->height)) {

                            takeDamage();
                            break;
                        }
                    }
            }
            if (player.colVelocity > 0) {
                for (int j = ((player.worldCol) >> 6); j < ((player.worldCol + player.colVelocity) >> 6); j++) {
                    if (collision(j,((player.worldRow) >> 6),player.width, player.height, ((goomba->worldCol) >> 6), ((goomba->worldRow) >> 6), goomba->width, goomba->height)) {

                        takeDamage();
                        return;
                    }
                }
            }
            if (player.colVelocity < 0) {
                for (int j = ((player.worldCol) >> 6); j > ((player.worldCol + player.colVelocity) >> 6) && j > 0; j--) {
                    if (collision(j,((player.worldRow) >> 6), player.width, player.height, ((goomba->worldCol) >> 6), ((goomba->worldRow) >> 6), goomba->width, goomba->height)) {

                        takeDamage();
                        break;
                    }
                }
            }

            if (player.grounded) {
                if (collision(((player.worldCol) >> 6), ((player.worldRow) >> 6), player.width, player.height, ((goomba->worldCol) >> 6), ((goomba->worldRow) >> 6), goomba->width, goomba->height)) {

                    takeDamage();
                    return;
                }
            }
        }
}

void checkCollisionWithGoal() {
    if (collision(((player.worldCol) >> 6), ((player.worldRow) >> 6), player.width, player.height, ((goal.worldCol) >> 6), ((goal.worldRow) >> 6), goal.width, goal.height)) {
        shouldWin = 1;
    }
}
void takeDamage() {
    player.invincible = 1;
    switch (player.powerUpState) {
        case NORMAL:
            shouldLose = 1;
        break;
        case MUSHROOM:
            playSoundB(powerDownSound_data, powerDownSound_length, 0);
            downToNormal();
        break;
        case FIREFLOWER:
            playSoundB(powerDownSound_data, powerDownSound_length, 0);
            advanceToMushroom();
        break;
    }
}

void drawMario() {
    switch(player.powerUpState) {
        case NORMAL:
            if(player.hide) {
                shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (0 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
            } else {
                shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (0 << 14) | (0 << 13) | (0 << 8);
            }
         shadowOAM[0].attr1 = (0x1FF & (((player.worldCol) >> 6) - hOff) % 256) | (1 << 14);
            shadowOAM[0].attr2 = ((player.curFrame * 2)*32 + (player.aniState * 2)) | ((0) << 10) | ((0) << 12);
        break;
        case BIG:
            if(player.hide) {
                shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (2 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
            } else {
                shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (2 << 14) | (0 << 13) | (0 << 8);
            }
         shadowOAM[0].attr1 = (0x1FF & (((player.worldCol) >> 6) - hOff) % 256) | (2 << 14);
            shadowOAM[0].attr2 = ((player.curFrame * 4)*32 + ((player.aniState + 4) * 2)) | ((0) << 10) | ((0) << 12);
        break;
        case FIREFLOWER:
            if(player.hide) {
                shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (2 << 14) | (0 << 13) | (0 << 8) | (2 << 8);
            } else {
                shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (2 << 14) | (0 << 13) | (0 << 8);
            }
            shadowOAM[0].attr0 = (0xFF & (((player.worldRow) >> 6) - vOff) % 256) | (2 << 14) | (0 << 13) | (0 << 8);
         shadowOAM[0].attr1 = (0x1FF & (((player.worldCol) >> 6) - hOff) % 256) | (2 << 14);
            shadowOAM[0].attr2 = ((player.curFrame * 4)*32 + ((player.aniState + 4) * 2)) | ((0) << 10) | ((1) << 12);
        break;
    }

    if (player.flip) {
        shadowOAM[0].attr1 |= (1 << 12);
    } else {
        shadowOAM[0].attr1 &= ~(1 << 12);
    }
}
