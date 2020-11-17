#include "myLib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
OBJ_ATTR shadowOAM[128];
int hOff;
int vOff;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

void setPixel3(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int col, int row, unsigned char colorIndex)
{
    volatile unsigned short pixelData = videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2];
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
    videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2] = pixelData;
}

void drawRect3(int col, int row, int width, int height, unsigned short color) {
    drawHorizontalLine3(col, row, width, color);
    drawVerticalLine3(col, row, height, color);
    drawHorizontalLine3(col, row + (height), width, color);
    drawVerticalLine3(col + width, row, height, color);
}

// Draw a rectangle at the specified location and size in Mode 4
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
                DMANow(3, &biggerColor, &videoBuffer[OFFSET(col, row + r, SCREENWIDTH) >> 1], DMA_SOURCE_FIXED | width >> 1);
	        }
        break;
        case 1:
            for(int r = 0; r < height; r++) {
                DMANow(3, &biggerColor, &videoBuffer[OFFSET(col, row + r, SCREENWIDTH) >> 1], DMA_SOURCE_FIXED | (width - 1) >> 1);
                setPixel4(col + (width - 1), row + r, colorIndex);
	        }
        break;
        case 2:
            for(int r = 0; r < height; r++) {
                setPixel4(col , row + r, colorIndex);
                DMANow(3, &biggerColor, &videoBuffer[OFFSET(col + 1, row + r, SCREENWIDTH) >> 1], DMA_SOURCE_FIXED | (width - 1) >> 1);
	        }
        break;
        case 3:
            for(int r = 0; r < height; r++) {
                setPixel4(col , row + r, colorIndex);
                DMANow(3, &biggerColor, &videoBuffer[OFFSET(col + 1, row + r, SCREENWIDTH) >> 1], DMA_SOURCE_FIXED | (width - 2) >> 1);
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
    DMANow(3, &volatileColor, &videoBuffer[OFFSET(col, row, SCREENWIDTH)], DMA_SOURCE_FIXED | length);
    // for (int i = 0; i < length; ++i) {
    //     setPixel3(col+i, row, color);
    // }
}

void drawVerticalLine3(int col, int row, int length, u16 color) {
    for (int i = 0; i < length; ++i) {
        setPixel3(col, row+i, color);
    }
}

void drawFilledRectHori3(int col, int row, int width, int height, u16 color) {
    volatile u16 volatileColor = color;
    unsigned int ctrl = DMA_NOW |
                        DMA_SOURCE_FIXED |
                        DMA_DESTINATION_INCREMENT |
                        DMA_16 |
                        width;
    volatile u16* volatileVideoBuffer = videoBuffer;
    for(int r = 0; r < height; r++) {
        DMANow(3, &volatileColor, &volatileVideoBuffer[OFFSET(col, row + r, SCREENWIDTH)], ctrl);
    }
}

// Fill the entire screen with a single color
void fillScreen3(unsigned short color) {
    // TODO 4.1: Rewrite this function using DMA
    volatile unsigned int volatileColor = color | color << 16;
    unsigned int ctrl = DMA_SOURCE_FIXED |
                        DMA_DESTINATION_INCREMENT |
                        DMA_32 |
                        38400 / 2;
    volatile u16* volatileVideoBuffer = videoBuffer;
    DMANow(3, &volatileColor, volatileVideoBuffer, ctrl);
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex)
{
    volatile unsigned int biggerColor = colorIndex << 24 |
                        colorIndex << 16 |
                        colorIndex << 8 |
                        colorIndex;
    DMANow(3, &biggerColor, videoBuffer, DMA_SOURCE_FIXED | DMA_32 | ((SCREENWIDTH * SCREENHEIGHT)/4));
}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int col, int row, int width, int height, const unsigned short *image)
{
    for (int r = 0; r < height; r++)
    {
        DMANow(3, &image[OFFSET(0, r, width)], &videoBuffer[OFFSET(col, row + r, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int col, int row, int width, int height, const unsigned short *image)
{
    if (width % 4 == 0) {
        for (int r = 0; r < height; r++) {
            DMANow(3, &image[OFFSET(0, r, width >> 1)], &videoBuffer[OFFSET(col, row + r, SCREENWIDTH) >> 1], width >> 1);
        }
    }
}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image)
{

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image)
{
    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT / 2);
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage()
{

    if (REG_DISPCTL & DISP_BACKBUFFER)
    {
        videoBuffer = BACKBUFFER;
    }
    else
    {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // TODO 4.0: Complete this function
    // First, turn this channel of DMA off (cnt = 0)
    dma[channel].cnt = 0;

    // Second, set the source and destination registers of this DMA channel to the given parameters
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Finally, set the control to the given parameter, and bitwise-or DMA_ON to the end to turn it on
    dma[channel].cnt = cnt |
               DMA_ON;
}

void copyToBGPaletteMem(const u16* paletteToCopy, int paletteLength) {
    DMANow(3, paletteToCopy, PALETTE, paletteLength);
}

void copyToSpritePaletteMem(const u16* paletteToCopy, int paletteLength) 
{
    DMANow(3, paletteToCopy, SPRITEPALETTE, paletteLength);
}

void hideSprites() {
    for (int i = 0; i < 128; ++i) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void copyShadowOAM() {
    DMANow(3, shadowOAM, OAM, sizeof(shadowOAM) >> 1);
}

void copyToCharBlock(const u16* tilesToCopy, int charBlockNum, int tileLength) {
    DMANow(3, tilesToCopy, &CHARBLOCK[charBlockNum], tileLength);
}

void copyToScreenBlock(const u16* mapToCopy, int screenBlockNum, int mapLength) {
    DMANow(3, mapToCopy, &SCREENBLOCK[screenBlockNum], mapLength);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}