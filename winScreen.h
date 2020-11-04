
//{{BLOCK(winScreen)

//======================================================================
//
//	winScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 457 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 29248 + 2048 = 31808
//
//	Time-stamp: 2020-11-03, 20:35:37
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define winScreenTilesLen 29248
extern const unsigned short winScreenTiles[14624];

#define winScreenMapLen 2048
extern const unsigned short winScreenMap[1024];

#define winScreenPalLen 512
extern const unsigned short winScreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(winScreen)
