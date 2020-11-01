
//{{BLOCK(testmap)

//======================================================================
//
//	testmap, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 52 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1664 + 2048 = 4224
//
//	Time-stamp: 2020-11-01, 16:30:25
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TESTMAP_H
#define GRIT_TESTMAP_H

#define testmapTilesLen 1664
extern const unsigned short testmapTiles[832];

#define testmapMapLen 2048
extern const unsigned short testmapMap[1024];

#define testmapPalLen 512
extern const unsigned short testmapPal[256];

#endif // GRIT_TESTMAP_H

//}}BLOCK(testmap)
