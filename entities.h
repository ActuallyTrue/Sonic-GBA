#define ENEMYCOUNT 6
#define ITEMBLOCKCOUNT 7

typedef struct {
    int worldRow;
    int worldCol;
    int width;
    int height;
    int hit;
} ITEMBLOCK;

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

void initializeItemBlocks();
void drawItemBlocks();
void intializeEnemies();