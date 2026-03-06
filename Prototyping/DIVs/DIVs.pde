/* DIVs 2D Rectangles
*/
//+
println(displayWidth, displayHeight);
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;
//
//Population using unitless ratios (i.e. millimeters to pixels)
int paperWidth = 279;
int paperHeight = 216;
float DivX = appWidth * 197 / paperWidth;
float DivY = appHeight * 260 / paperHeight ;
float DivWidth = appWidth * 197 / paperWidth;
float DivHeight = appHeight * 260 / paperHeight;
//
//DIVs
//rect( DivX, DivY, DivWidth, DivHeight );
rect( DivX, DivY, DivWidth, DivHeight );
//rect( songtitleDivX, songtitleDivY, songtitleDivWidth, songtitleDivHeight );
//rect( lyricsDivX, LyricsDivY, LyricsDivWidth, LyricsDivHeight );
//rect( imageDivX, ImageDivY, ImageDivWidth, ImageDivHeight );
//rect( artistDivX, ArtistDivY, ArtistDivWidth, ArtistDivHeight );
//rect( dateDivX, DateDivY, DateDivWidth, DateDivHeight );
//rect( genreDivX, GenreDivY, GenreDivWidth, GenreDivHeight );
//rect( previousSongDivX, PreviousSongDivY, PreviousSongDivWidth, PreviousSongDivHeight );
//rect( back30SecondsDivX, Back30SecondsDivY, Back30SecondsDivWidth, Back30SecondsDivHeight );
//rect( back10SecondsDivX, Back10SecondsDivY, Back10SecondsDivWidth, Back10SecondsDivHeight );
//rect( pauseDivX, PauseDivY, PauseDivWidth, PauseDivHeight );
//rect( playDivX, PlayDivY, PlayDivWidth, PlayDivHeight );
//rect( fastForwardDivX, FastForwardDivY, FastForwardDivWidth, FastForwardDivHeight );
//rect( fastFastForwardDivX, FastFastForwardDivY, FastFastForwardDivWidth, FastFastForwardDivHeight );
//rect( nextSongDivX, NextSongDivY, NextSongDivWidth, NextSongDivHeight );
//rect( mutebuttonDivX, MuteButtonDivY, MuteButtonDivWidth, MuteButtonDivHeight );
//rect( loopSongDivX, LoopSongDivY, LoopSongDivWidth, LoopSongDivHeight );
//rect( progressBarDivX, ProgressBarDivY, ProgressBarDivWidth, ProgressBarDivHeight );
//rect( elapsedTimeDivX,  ElapsedTimeDivY,  ElapsedTimeDivWidth,  ElapsedTimeDivHeight );
//rect( durationTimeDivX, DurationTimeDivY, DurationTimeDivWidth, DurationTimeDivHeight );
*/
//
float songTitleDivX = appWidth * 42.0 / paperwidth;
float songTitleDivY = appHeight * 9.0 / paperheight ;
float songTitleDivWidth = appWidth * 85.0 / paperwidth;
float songTitleDivHeight = appHeight * 2.0 / paperheight;
rect( songtitleDivX, songtitleDivY, songtitleDivWidth, songtitleDivHeight );
float lyricsDivX = appWidth * 42.0 / paperwidth;
float lyricsDivY = appHeight * 32.0 / paperheight ;
float lyricsDivWidth = appWidth * 85.0 / paperwidth;
float lyricsDivHeight = appHeight * 3.0 / paperheight;
rect( lyricsDivX, LyricsDivY, LyricsDivWidth, LyricsDivHeight );
float ImageDivX = appWidth * 42.0 / paperwidth;
float ImageDivY = appHeight * 73.0 / paperheight ;
float ImageDivX = appWidth * 5.0 / paperwidth;
float ImageDivY = appHeight * 3.0 / paperheight ;
rect( imageDivX, ImageDivY, ImageDivWidth, ImageDivHeight );
float PlayButtonsDivX = appWidth * 0.00 / paperwidth ;
float PlayButtonsDivY = appHeight * 135.0 / paperheight ;
float PlayButtonsDivWidth = appWidth * 2.0 / paperwidth;
float PlayButtonsDivHeight = appHeight * 25.0 / paperheight;
//
float progressBarDivX = appWidth * 0.00 / paperwidth;
float progressBarDivY = appHeight * 235.0 / paperheight ;
float progressBarDivX = appWidth * 194.0 / paperwidth;
float progressBarDivY = appHeight * 8.0 / paperheight ;
rect( progressBarDivX, ProgressBarDivY, ProgressBarDivWidth, ProgressBarDivHeight );
float TimeLeftDivX = appWidth * 0.00 / paperwidth;
float TimeLeftDivY = appHeight * 245.0 / paperheight ;
float TimeLeftDivWidth = appWidth * 55.0 / paperwidth;
float TimeLeftDivHeight = appHeight * 14.0 / paperheight;
rect( elapsedTimeDivX,  ElapsedTimeDivY,  ElapsedTimeDivWidth,  ElapsedTimeDivHeight );
