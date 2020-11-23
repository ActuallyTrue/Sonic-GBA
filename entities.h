#define ENEMYCOUNT 6
#define ITEMBLOCKCOUNT 7
#define ITEMCOUNT 6
#define FIREBALLCOUNT 3

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
} ENEMY;

extern ITEMBLOCK itemBlocks[ITEMBLOCKCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern ITEM items[ITEMCOUNT];
extern ITEM fireBalls[FIREBALLCOUNT];
enum {COIN, MUSHROOM, FIREFLOWER};

void initializeItemBlocks();
void updateItemBlocks();
void ITEMCheckCollisionWithItemBlocks(ITEM* item);
void ITEMCheckCollisionWithCollisionMap(ITEM* item);
void drawItemBlocks();
void intializeEnemies();
void initializeItems();
void initializeFireBalls();
void spawnItem();
void updateItems();
void drawItems();