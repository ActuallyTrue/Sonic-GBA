# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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
# 2 "myLib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
OBJ_ATTR shadowOAM[128];
int hOff;
int vOff;


DMA *dma = (DMA *)0x40000B0;

void setPixel3(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int col, int row, unsigned char colorIndex)
{
    volatile unsigned short pixelData = videoBuffer[((row)*(240)+(col)) / 2];
    if (col & 1)
    {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    }
    else
    {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col)) / 2] = pixelData;
}

void drawRect3(int col, int row, int width, int height, unsigned short color) {
    drawHorizontalLine3(col, row, width, color);
    drawVerticalLine3(col, row, height, color);
    drawHorizontalLine3(col, row + (height), width, color);
    drawVerticalLine3(col + width, row, height, color);
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {

    if (width == 1) {
        for (int i = 0; i < height; i++) {
            setPixel4(col, row + i, colorIndex);
        }
        return;
    }
    if (width == 2) {
        for (int i = 0; i < height; i++) {
            setPixel4(col, row + i, colorIndex);
            setPixel4(col + 1, row + i, colorIndex);
        }
        return;
    }
    u16 biggerColor = colorIndex << 8 | colorIndex;
    int scenario;
    if (col % 2 == 0 && width % 2 == 0) {
        scenario = 0;
    } else if (col % 2 == 0 && width % 2 == 1) {
        scenario = 1;
    } else if (col % 2 == 1 && width % 2 == 1) {
        scenario = 2;
    } else {
        scenario = 3;
    }
    switch (scenario) {
        case 0:
            for(int r = 0; r < height; r++) {
                DMANow(3, &biggerColor, &videoBuffer[((row + r)*(240)+(col)) >> 1], (2 << 23) | width >> 1);
         }
        break;
        case 1:
            for(int r = 0; r < height; r++) {
                DMANow(3, &biggerColor, &videoBuffer[((row + r)*(240)+(col)) >> 1], (2 << 23) | (width - 1) >> 1);
                setPixel4(col + (width - 1), row + r, colorIndex);
         }
        break;
        case 2:
            for(int r = 0; r < height; r++) {
                setPixel4(col , row + r, colorIndex);
                DMANow(3, &biggerColor, &videoBuffer[((row + r)*(240)+(col + 1)) >> 1], (2 << 23) | (width - 1) >> 1);
         }
        break;
        case 3:
            for(int r = 0; r < height; r++) {
                setPixel4(col , row + r, colorIndex);
                DMANow(3, &biggerColor, &videoBuffer[((row + r)*(240)+(col + 1)) >> 1], (2 << 23) | (width - 2) >> 1);
                setPixel4(col + (width - 1), row + r, colorIndex);
         }
        break;
    }
}

void drawFromPointToPoint3(int startingX, int startingY, int endingX, int endingY, u16 color) {
    if (startingX == endingX && startingY == endingX) {
        setPixel3(startingX, endingX, color);
    } else if (startingX == endingX) {
        if (endingY > startingY) {
            drawVerticalLine3(startingX, startingY, endingY - startingY, color);
        } else {
            drawVerticalLine3(startingX, endingY, startingY - endingY, color);
        }
        return;
    } else if (startingY == endingY) {
        if (endingX > startingX) {
            drawHorizontalLine3(startingX, startingY, endingX - startingX, color);
        } else {
            drawHorizontalLine3(endingX, startingY, startingX - endingX, color);
        }
        return;
    } else {
        if (startingX < endingX && startingY < endingY) {
            int iteratingX = startingX;
            int iteratingY = startingY;
            while (iteratingX <= endingX && iteratingY <= endingY) {
                setPixel3(iteratingX, iteratingY, color);
                iteratingX++;
                iteratingY++;
            }
            return;
        } else if (startingX > endingX && startingY > endingY) {
            int iteratingX = startingX;
            int iteratingY = startingY;
            while (iteratingX >= endingX && iteratingY >= endingY) {
                setPixel3(iteratingX, iteratingY, color);
                iteratingX--;
                iteratingY--;
            }
            return;
        } else if (startingX > endingX && startingY < endingY) {
            int iteratingX = startingX;
            int iteratingY = startingY;
            while (iteratingX >= endingX && iteratingY <= endingY) {
                setPixel3(iteratingX, iteratingY, color);
                iteratingX--;
                iteratingY++;
            }
            return;
        } else {
            int iteratingX = startingX;
            int iteratingY = startingY;
            while (iteratingX <= endingX && iteratingY >= endingY) {
                setPixel3(iteratingX, iteratingY, color);
                iteratingX++;
                iteratingY--;
            }
        }
        return;
    }
}

void drawHorizontalLine3(int col, int row, int length, u16 color) {
    volatile u16 volatileColor = color;
    DMANow(3, &volatileColor, &videoBuffer[((row)*(240)+(col))], (2 << 23) | length);



}

void drawVerticalLine3(int col, int row, int length, u16 color) {
    for (int i = 0; i < length; ++i) {
        setPixel3(col, row+i, color);
    }
}

void drawFilledRectHori3(int col, int row, int width, int height, u16 color) {
    volatile u16 volatileColor = color;
    unsigned int ctrl = (0 << 28) |
                        (2 << 23) |
                        (0 << 21) |
                        (0 << 26) |
                        width;
    volatile u16* volatileVideoBuffer = videoBuffer;
    for(int r = 0; r < height; r++) {
        DMANow(3, &volatileColor, &volatileVideoBuffer[((row + r)*(240)+(col))], ctrl);
    }
}


void fillScreen3(unsigned short color) {

    volatile unsigned int volatileColor = color | color << 16;
    unsigned int ctrl = (2 << 23) |
                        (0 << 21) |
                        (1 << 26) |
                        38400 / 2;
    volatile u16* volatileVideoBuffer = videoBuffer;
    DMANow(3, &volatileColor, volatileVideoBuffer, ctrl);
}


void fillScreen4(volatile unsigned char colorIndex)
{
    volatile unsigned int biggerColor = colorIndex << 24 |
                        colorIndex << 16 |
                        colorIndex << 8 |
                        colorIndex;
    DMANow(3, &biggerColor, videoBuffer, (2 << 23) | (1 << 26) | ((240 * 160)/4));
}


void drawImage3(int col, int row, int width, int height, const unsigned short *image)
{
    for (int r = 0; r < height; r++)
    {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image)
{
    if (width % 4 == 0) {
        for (int r = 0; r < height; r++) {
            DMANow(3, &image[((r)*(width >> 1)+(0))], &videoBuffer[((row + r)*(240)+(col)) >> 1], width >> 1);
        }
    }
}


void drawFullscreenImage3(const unsigned short *image)
{

    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image)
{
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage()
{

    if ((*(volatile unsigned short *)0x4000000) & (1 << 4))
    {
        videoBuffer = ((unsigned short *)0x600A000);
    }
    else
    {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1 << 4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt |
               (1 << 31);
}

void copyToBGPaletteMem(const u16* paletteToCopy, int paletteLength) {
    DMANow(3, paletteToCopy, ((unsigned short *)0x5000000), paletteLength);
}

void copyToSpritePaletteMem(const u16* paletteToCopy, int paletteLength)
{
    DMANow(3, paletteToCopy, ((unsigned short *)0x5000200), paletteLength);
}

void hideSprites() {
    for (int i = 0; i < 128; ++i) {
        shadowOAM[i].attr0 = (2 << 8);
    }
}

void copyShadowOAM() {
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), sizeof(shadowOAM) >> 1);
}

void copyToCharBlock(const u16* tilesToCopy, int charBlockNum, int tileLength) {
    DMANow(3, tilesToCopy, &((charblock *)0x6000000)[charBlockNum], tileLength);
}

void copyToScreenBlock(const u16* mapToCopy, int screenBlockNum, int mapLength) {
    DMANow(3, mapToCopy, &((screenblock *)0x6000000)[screenBlockNum], mapLength);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}
