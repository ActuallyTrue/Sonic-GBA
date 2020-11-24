#define ENEMYCOUNT 10
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
    int type;
    int active;
} ENEMY;

extern ITEMBLOCK itemBlocks[ITEMBLOCKCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern ITEM items[ITEMCOUNT];
extern ITEM fireBalls[FIREBALLCOUNT];
extern ITEM goal;
enum {COIN, MUSHROOM, FIREFLOWER};
enum {GOOMBA, CHOMPER};

void initializeItemBlocks();
void updateItemBlocks();
void ITEMCheckCollisionWithItemBlocks(ITEM* item);
void ITEMCheckCollisionWithCollisionMap(ITEM* item);
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
void updateItems();
void drawItems();
void drawGoal();
void drawFireBalls();