//using fixed point with 64 so << 6
// << 6 means * 64, >> 6 means /64
//current sonic is Tall x Large
//Constants
#define ACCELERATION (int)(0.046875 * 64)
#define DECELERATION (int)(0.5 * 64)
#define FRICTION (int)(0.046875 * 64)
#define TOPSPEED (int)(6 * 64)
#define SLOPEFACTOR (int)(0.125 * 64)
#define SLOPEROLLUP (int)(0.078125 * 64)
#define SLOPEROLLDOWN (int)(0.3125 * 64)
#define FALL (int)(2.5 * 64) //tolerance ground speed for sticking to walls and ceilings
#define AIRACCELERATION (int)(0.09375 * 64) //air acceleration (2x acc)
#define JUMPFORCE (int)(6.5 * 64)
#define GRAVITY (int)(0.21875 * 64)

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
} SONIC;

extern SONIC player;
void initializeSonic();
void drawSonic();
void updateSonic();