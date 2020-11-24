//using fixed point with 64 so << 6
// << 6 means * 64, >> 6 means /64
//current sonic is Tall x Large
//Constants
#define WALKINGACCELERATION 3
#define RUNNINGACCELERATION 6
#define DECELERATION 32
#define FRICTION 3
#define WALKINGTOPSPEED 192
#define TOPSPEED 384
#define SLOPEROLLDOWN 20
#define AIRACCELERATION 6 //air acceleration (2x acc)
#define JUMPFORCE 416
#define GRAVITY 14

//Animation constants
#define WALKFRAMES 3

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
} MARIO;

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