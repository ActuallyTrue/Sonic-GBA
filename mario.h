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

//Jumping Constants
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