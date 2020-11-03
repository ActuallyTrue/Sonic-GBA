//using fixed point with 64 so << 6
// << 6 means * 64, >> 6 means /64
//current sonic is Tall x Large
//Constants
#define ACCELERATION 3
#define DECELERATION 32
#define FRICTION 3
#define TOPSPEED 384
#define SLOPEFACTOR 8
#define SLOPEROLLUP 5
#define SLOPEROLLDOWN 20
#define FALL 160 //tolerance ground speed for sticking to walls and ceilings
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
    short spinDashing;
} SONIC;

extern SONIC player;
void initializeSonic();
void drawSonic();
void updateSonic();
void checkCollisionWithMap();