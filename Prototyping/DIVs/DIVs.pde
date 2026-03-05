github/* DIVs 2D Rectangles
 */
//
println(displayWidth, displayHeight);
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;
//
//Population using unitless ratios (i.e. millimeters to pixels)
int paperWidth = 279;
int paperHeight = 216;
float DivX = appWidth * ??? / paperWidth;
float DivY = appHeight * ??? / paperHeight ;
float DivWidth = appWidth * ??? / paperWidth;
float DivHeight = appHeight * ??? / paperHeight;
//
//DIVs
//rect( DivX, DivY, DivWidth, DivHeight );
rect( DivX, DivY, DivWidth, DivHeight );
rect( songTitleDivX, songTitleDivY, songTitleDivWidth, songTitleDivHeight );
rect( LyricsDivX, LyricsDivY, LyricsDivWidth, LyricsDivHeight );
rect( ImageDivX, ImageDivY, ImageDivWidth, ImageDivHeight );
rect( ArtistDivX, ArtistDivY, ArtistDivWidth, ArtistDivHeight );
rect( DateDivX, DateDivY, DateDivWidth, DateDivHeight );
rect( GenreDivX, GenreDivY, GenreDivWidth, GenreDivHeight );
rect( PreviousSongDivX, PreviousSongDivY, PreviousSongDivWidth, PreviousSongDivHeight );
rect( Back30SecondsDivX, Back30SecondsDivY, Back30SecondsDivWidth, Back30SecondsDivHeight );
rect( Back10SecondsDivX, Back10SecondsDivY, Back10SecondsDivWidth, Back10SecondsDivHeight );
rect( PauseDivX, PauseDivY, PauseDivWidth, PauseDivHeight );
rect( PlayDivX, PlayDivY, PlayDivWidth, PlayDivHeight );
rect( FastForwardDivX, FastForwardDivY, FastForwardDivWidth, FastForwardDivHeight );
rect( FastFastForwardDivX, FastFastForwardDivY, FastFastForwardDivWidth, FastFastForwardDivHeight );
rect( NextSongDivX, NextSongDivY, NextSongDivWidth, NextSongDivHeight );
rect( MuteButtonDivX, MuteButtonDivY, MuteButtonDivWidth, MuteButtonDivHeight );
rect( LoopSongDivX, LoopSongDivY, LoopSongDivWidth, LoopSongDivHeight );
rect( ProgressBarDivX, ProgressBarDivY, ProgressBarDivWidth, ProgressBarDivHeight );
rect( ElapsedTimeDivX,  ElapsedTimeDivY,  ElapsedTimeDivWidth,  ElapsedTimeDivHeight );
rect( DurationTimeDivX, DurationTimeDivY, DurationTimeDivWidth, DurationTimeDivHeight );
float DivX = appWidth * 0.00 / Title;
float DivY = appHeight * 0.09 / Title ;
float DivWidth = appWidth * 0.85 / Title;
float DivHeight = appHeight * 0.02 / Title;

float DivX = appWidth * 0.00 / Lyrics;
float DivY = appHeight * 0.32 / Lyrics ;
float DivWidth = appWidth * 0.85 / Lyrics;
float DivHeight = appHeight * 0.03 / Lyrics;

float DivX = appWidth * 0.00 / Image;
float DivY = appHeight * 0.73 / Image ;
float DivX = appWidth * 0.85 / Image;
float DivY = appHeight * 0.03 / Image ;

float DivX = appWidth * 0.00 / PlayButtons;
float DivY = appHeight * 0.135 / PlayButtons ;
float DivWidth = appWidth * 0.02 / PlayButtons;
float DivHeight = appHeight * 0.25 / PlayButtons;

float DivX = appWidth * 0.00 / progressBar;
float DivY = appHeight * 0.235 / ProgressBar ;
float DivX = appWidth * 0.194 / ProgressBar;
float DivY = appHeight * 0.08 / ProgressBar ;

float DivX = appWidth * 0.00 / TimeLeft;
float DivY = appHeight * 0.245 / TimeLeft ;
float DivWidth = appWidth * 0.55 / TimeLeft;
float DivHeight = appHeight * 0.14 / Timeleft;
