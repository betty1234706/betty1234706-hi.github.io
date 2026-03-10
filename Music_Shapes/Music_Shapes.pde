/* DIVs: 2D Rectangles(Horizontal layout)
*/

println(displayWidth, displayHeight);
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;

//Population using unitless ratios (i.e. millimeters to pixels)
float DivX = appWidth * 1/4;
float DivY = appHeight * 1/4;
float DivWidth = appWidth * 1/2;
float DivHeight = appHeight * 1/2;
//
float stopSymbolDivX = DivX + DivWidth*1/4;
float stopSymbolDivY = DivY +  DivHeight*1/4;
float stopSymbolDivWidth = DivWidth*1/2;
float stopSymbolivHeight = DivHeight*1/2;
//
float playSymbolDivX1 = DivX + DivWidth*1/4;
float playSymbolDivY2 = DivY +  DivHeight*1/4;
float playSymbolDivX3 = DivX + DivWidth*3/4;
float playSymbolDivY4 = DivY +  DivHeight*1/2;
float playSymbolDivX5 = DivX + DivWidth*1/4;
float playSymbolDivY6 = DivY +  DivHeight*3/4;
//
float muteSymbolDivX1 = DivX + DivWidth*1/4;
float muteSymbolDivY2 = DivY +  DivHeight*1/4;
float muteSymbolDivX3 = DivX + DivWidth*3/4;
float muteSymbolDivY4 = DivY +  DivHeight*3/4;
//
//Fast Forward 10 Sec Button
float ff10SymbolDivX1 = DivX + DivWidth*1/4;
float ff10SymbolDivY1 = DivY + DivHeight*1/4;
float ff10SymbolDivX2 = DivX + DivWidth*1/2;
float ff10SymbolDivY2 = DivY + DivHeight*1/4;
float ff10SymbolDivX3 = DivX + DivWidth*3/4;
float ff10SymbolDivY3 = DivY + DivHeight*1/2;
//
//Fast Forward 30 Sec Button
float ff30SymbolDivX1 = DivX + DivWidth*1/4;
float ff30SymbolDivY1 = DivY + DivHeight*1/4;
float ff30SymbolDivX2 = DivX + DivWidth*1/2;
float ff30SymbolDivY2 = DivY + DivHeight*3/4;
float ff30SymbolDivX3 = DivX + DivWidth*3/4;
float ff30SymbolDivY3 = DivY + DivHeight*1/2;
//
//Rewind 10 Sec Button
float rw10SymbolDivX1 = DivX + DivWidth*3/4;
float rw10SymbolDivY1 = DivY + DivHeight*1/4;
float rw10SymbolDivX2 = DivX + DivWidth*1/2;
float rw10SymbolDivY2 = DivY + DivHeight*1/4;
float rw10SymbolDivX3 = DivX + DivWidth*1/4;
float rw10SymbolDivY3 = DivY + DivHeight*1/2;
//
//Rewind 30 Sec Button
float rw30SymbolDivX1 = DivX + DivWidth*3/4;
float rw30SymbolDivY1 = DivY + DivHeight*1/4;
float rw30SymbolDivX2 = DivX + DivWidth*1/2;
float rw30SymbolDivY2 = DivY + DivHeight*3/4;
float rw30SymbolDivX3 = DivX + DivWidth*1/4;
float rw30SymbolDivY3 = DivY + DivHeight*1/2;
//
//Loop Button
float loopSymbolDivX1 = DivX + DivWidth*1/4;
float loopSymbolDivY1 = DivY + DivHeight*1/4;
float loopSymbolDivX2 = DivX + DivWidth*1/2;
float loopSymbolDivY2 = DivY + DivHeight*1/2;
float loopSymbolDivX3 = DivX + DivWidth*3/4;
float loopSymbolDivY3 = DivY + DivHeight*3/4;
//
//Shuffle Button
float shuffleSymbolDivX1 = DivX + DivWidth*1/4;
float shuffleSymbolDivY1 = DivY + DivHeight*1/4;
float shuffleSymbolDivX2 = DivX + DivWidth*3/4;
float shuffleSymbolDivY2 = DivY + DivHeight*1/4;
float shuffleSymbolDivX3 = DivX + DivWidth*1/4;
float shuffleSymbolDivY3 = DivY + DivHeight*3/4;
float shuffleSymbolDivX4 = DivX + DivWidth*3/4;
float shuffleSymbolDivY4 = DivY + DivHeight*3/4;
//DIVs
//rect( DivX, DivY, DivWidth, DivHeight );
rect( DivX, DivY, DivWidth, DivHeight );
//
rect( stopSymbolDivX, stopSymbolDivY, stopSymbolDivWidth, stopSymbolivHeight );
//triangle( playSymbolDivX1, playSymbolDivY2, playSymbolDivX3, playSymbolDivY4, playSymbolDivX5, playSymbolDivY6);
line( muteSymbolDivX1, muteSymbolDivY2, muteSymbolDivX3, muteSymbolDivY4 );
//
//Fast Forward 10 Sec
triangle( ff10SymbolDivX1, ff10SymbolDivY1, ff10SymbolDivX2, ff10SymbolDivY2, ff10SymbolDivX3, ff10SymbolDivY3 );
//
//Fast Forward 30 Sec
triangle( ff30SymbolDivX1, ff30SymbolDivY1, ff30SymbolDivX2, ff30SymbolDivY2, ff30SymbolDivX3, ff30SymbolDivY3 );
//
//Rewind 10 Sec
triangle( rw10SymbolDivX1, rw10SymbolDivY1, rw10SymbolDivX2, rw10SymbolDivY2, rw10SymbolDivX3, rw10SymbolDivY3 );
//
//Rewind 30 Sec
triangle( rw30SymbolDivX1, rw30SymbolDivY1, rw30SymbolDivX2, rw30SymbolDivY2, rw30SymbolDivX3, rw30SymbolDivY3 );
//
//Loop Button
line( loopSymbolDivX1, loopSymbolDivY1, loopSymbolDivX2, loopSymbolDivY2 );
line( loopSymbolDivX2, loopSymbolDivY2, loopSymbolDivX3, loopSymbolDivY3 );
//
//Shuffle Button
line( shuffleSymbolDivX1, shuffleSymbolDivY1, shuffleSymbolDivX2, shuffleSymbolDivY2 );
//
line( shuffleSymbolDivX3, shuffleSymbolDivY3, shuffleSymbolDivX4, shuffleSymbolDivY4 );
//
line( shuffleSymbolDivX3, shuffleSymbolDivY3, shuffleSymbolDivX4, shuffleSymbolDivY4 );
//
