
//{{BLOCK(titleScreen)

//======================================================================
//
//	titleScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 446 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 28544 + 2048 = 31104
//
//	Time-stamp: 2020-11-03, 20:01:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TITLESCREEN_H
#define GRIT_TITLESCREEN_H

#define titleScreenTilesLen 28544
extern const unsigned short titleScreenTiles[14272];

#define titleScreenMapLen 2048
extern const unsigned short titleScreenMap[1024];

#define titleScreenPalLen 512
extern const unsigned short titleScreenPal[256];

#endif // GRIT_TITLESCREEN_H

//}}BLOCK(titleScreen)
