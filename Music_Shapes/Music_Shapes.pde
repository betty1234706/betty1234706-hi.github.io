/* DIVs: 2D Rectangles - Horizontal Layout */

println(displayWidth, displayHeight);
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;

// 9 buttons: Stop, Play, Mute, FF10, FF30, RW10, RW30, Loop, Shuffle
float buttonWidth = appWidth / 9;
float buttonHeight = appHeight;

// Center point for each button (vertically centered)
float centerY = appHeight / 2;

// STOP BUTTON (Button 0)
float stopDivX = 0 * buttonWidth;
float stopSymbolDivX = stopDivX + buttonWidth * 1/4;
float stopSymbolDivY = centerY - (buttonHeight * 1/4) / 2;
float stopSymbolDivWidth = buttonWidth * 1/2;
float stopSymbolDivHeight = buttonHeight * 1/4;

// PLAY BUTTON (Button 1)
float playDivX = 1 * buttonWidth;
float playSymbolDivX1 = playDivX + buttonWidth * 1/4;
float playSymbolDivY2 = centerY - (buttonHeight * 1/2) / 2;
float playSymbolDivX3 = playDivX + buttonWidth * 3/4;
float playSymbolDivY4 = centerY;
float playSymbolDivX5 = playDivX + buttonWidth * 1/4;
float playSymbolDivY6 = centerY + (buttonHeight * 1/2) / 2;

// MUTE BUTTON (Button 2)
float muteDivX = 2 * buttonWidth;
float muteSymbolDivX1 = muteDivX + buttonWidth * 1/4;
float muteSymbolDivY2 = centerY - (buttonHeight * 1/2) / 2;
float muteSymbolDivX3 = muteDivX + buttonWidth * 3/4;
float muteSymbolDivY4 = centerY + (buttonHeight * 1/2) / 2;

// FAST FORWARD 10 SEC BUTTON (Button 3)
float ff10DivX = 3 * buttonWidth;
float ff10SymbolDivX1 = ff10DivX + buttonWidth * 1/4;
float ff10SymbolDivY1 = centerY - (buttonHeight * 1/2) / 2;
float ff10SymbolDivX2 = ff10DivX + buttonWidth * 1/2;
float ff10SymbolDivY2 = centerY - (buttonHeight * 1/2) / 2;
float ff10SymbolDivX3 = ff10DivX + buttonWidth * 3/4;
float ff10SymbolDivY3 = centerY;

// FAST FORWARD 30 SEC BUTTON (Button 4)
float ff30DivX = 4 * buttonWidth;
float ff30SymbolDivX1 = ff30DivX + buttonWidth * 1/4;
float ff30SymbolDivY1 = centerY - (buttonHeight * 1/2) / 2;
float ff30SymbolDivX2 = ff30DivX + buttonWidth * 1/2;
float ff30SymbolDivY2 = centerY + (buttonHeight * 1/2) / 2;
float ff30SymbolDivX3 = ff30DivX + buttonWidth * 3/4;
float ff30SymbolDivY3 = centerY;

// REWIND 10 SEC BUTTON (Button 5)
float rw10DivX = 5 * buttonWidth;
float rw10SymbolDivX1 = rw10DivX + buttonWidth * 3/4;
float rw10SymbolDivY1 = centerY - (buttonHeight * 1/2) / 2;
float rw10SymbolDivX2 = rw10DivX + buttonWidth * 1/2;
float rw10SymbolDivY2 = centerY - (buttonHeight * 1/2) / 2;
float rw10SymbolDivX3 = rw10DivX + buttonWidth * 1/4;
float rw10SymbolDivY3 = centerY;

// REWIND 30 SEC BUTTON (Button 6)
float rw30DivX = 6 * buttonWidth;
float rw30SymbolDivX1 = rw30DivX + buttonWidth * 3/4;
float rw30SymbolDivY1 = centerY - (buttonHeight * 1/2) / 2;
float rw30SymbolDivX2 = rw30DivX + buttonWidth * 1/2;
float rw30SymbolDivY2 = centerY + (buttonHeight * 1/2) / 2;
float rw30SymbolDivX3 = rw30DivX + buttonWidth * 1/4;
float rw30SymbolDivY3 = centerY;

// LOOP BUTTON (Button 7)
float loopDivX = 7 * buttonWidth;
float loopSymbolDivX1 = loopDivX + buttonWidth * 1/4;
float loopSymbolDivY1 = centerY - (buttonHeight * 1/4) / 2;
float loopSymbolDivX2 = loopDivX + buttonWidth * 1/2;
float loopSymbolDivY2 = centerY;
float loopSymbolDivX3 = loopDivX + buttonWidth * 3/4;
float loopSymbolDivY3 = centerY + (buttonHeight * 1/4) / 2;

// SHUFFLE BUTTON (Button 8)
float shuffleDivX = 8 * buttonWidth;
float shuffleSymbolDivX1 = shuffleDivX + buttonWidth * 1/4;
float shuffleSymbolDivY1 = centerY - (buttonHeight * 1/4) / 2;
float shuffleSymbolDivX2 = shuffleDivX + buttonWidth * 3/4;
float shuffleSymbolDivY2 = centerY - (buttonHeight * 1/4) / 2;
float shuffleSymbolDivX3 = shuffleDivX + buttonWidth * 1/4;
float shuffleSymbolDivY3 = centerY + (buttonHeight * 1/4) / 2;
float shuffleSymbolDivX4 = shuffleDivX + buttonWidth * 3/4;
float shuffleSymbolDivY4 = centerY + (buttonHeight * 1/4) / 2;

// Draw button containers
for (int i = 0; i < 9; i++) {
  rect(i * buttonWidth, 0, buttonWidth, buttonHeight);
}

// Draw Stop Button
rect(stopSymbolDivX, stopSymbolDivY, stopSymbolDivWidth, stopSymbolDivHeight);

// Draw Play Button (Triangle)
triangle(playSymbolDivX1, playSymbolDivY2, playSymbolDivX3, playSymbolDivY4, playSymbolDivX5, playSymbolDivY6);

// Draw Mute Button (Line)
line(muteSymbolDivX1, muteSymbolDivY2, muteSymbolDivX3, muteSymbolDivY4);

// Draw Fast Forward 10 Sec
triangle(ff10SymbolDivX1, ff10SymbolDivY1, ff10SymbolDivX2, ff10SymbolDivY2, ff10SymbolDivX3, ff10SymbolDivY3);

// Draw Fast Forward 30 Sec
triangle(ff30SymbolDivX1, ff30SymbolDivY1, ff30SymbolDivX2, ff30SymbolDivY2, ff30SymbolDivX3, ff30SymbolDivY3);

// Draw Rewind 10 Sec
triangle(rw10SymbolDivX1, rw10SymbolDivY1, rw10SymbolDivX2, rw10SymbolDivY2, rw10SymbolDivX3, rw10SymbolDivY3);

// Draw Rewind 30 Sec
triangle(rw30SymbolDivX1, rw30SymbolDivY1, rw30SymbolDivX2, rw30SymbolDivY2, rw30SymbolDivX3, rw30SymbolDivY3);

// Draw Loop Button
line(loopSymbolDivX1, loopSymbolDivY1, loopSymbolDivX2, loopSymbolDivY2);
line(loopSymbolDivX2, loopSymbolDivY2, loopSymbolDivX3, loopSymbolDivY3);

// Draw Shuffle Button
line(shuffleSymbolDivX1, shuffleSymbolDivY1, shuffleSymbolDivX2, shuffleSymbolDivY2);
line(shuffleSymbolDivX3, shuffleSymbolDivY3, shuffleSymbolDivX4, shuffleSymbolDivY4);