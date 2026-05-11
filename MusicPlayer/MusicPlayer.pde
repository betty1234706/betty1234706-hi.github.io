/* Music App, Final Project
 */
//
//Minim Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
/* Global Variables
 - Possible DIV-vars needed in draw(), etc.
 - MUST: Music Button-vars, possibly associated DIV-vars
 */
int appWidth, appHeight;
// MOVE THESE HERE so they can be "resolved" anywhere in the code
float paperWidth = 279.0;
float paperHeight = 216.0;

// DIV Variables
float titleX, titleY, titleW, titleH;
float lyricsX, lyricsY, lyricsW, lyricsH;
float imageX, imageY, imageW, imageH;
float rightX, rightW, rightH, rightY1, rightY2, rightY3;
float btnW, btnH, btnY, btnGap;
float progX, progY, progW, progH;
float timeY, timeH, timeElapsedW, timeRemainW, timeTotalW;
//
void setup() {
  //Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  //DIVs Population using unitless ratios
  
  // Left Side Population
  titleX = appWidth * 10.0 / paperWidth; 
  titleY = appHeight * 9.0 / paperHeight;
  titleW = appWidth * 85.0 / paperWidth;
  titleH = appHeight * 23.0 / paperHeight;

  lyricsX = appWidth * 10.0 / paperWidth;
  lyricsY = appHeight * 35.0 / paperHeight;
  lyricsW = appWidth * 85.0 / paperWidth;
  lyricsH = appHeight * 38.0 / paperHeight;

  imageX = appWidth * 10.0 / paperWidth;
  imageY = appHeight * 75.0 / paperHeight;
  imageW = appWidth * 60.0 / paperWidth;
  imageH = appHeight * 45.0 / paperHeight;

  // Right Side Population
  rightW = appWidth * 80.0 / paperWidth;
  rightX = appWidth - rightW - (appWidth * 10.0 / paperWidth); 
  rightH = appHeight * 19.0 / paperHeight;
  rightY1 = appHeight * 9.0 / paperHeight;
  rightY2 = appHeight * 35.0 / paperHeight;
  rightY3 = appHeight * 60.0 / paperHeight;

  // Button Row Population
  btnW = appWidth * 24.0 / paperWidth;
  btnH = appHeight * 25.0 / paperHeight;
  btnY = appHeight * 135.0 / paperHeight;
  btnGap = appWidth * 3.0 / paperWidth;

  // Progress Bar Population
  progX = appWidth * 10.0 / paperWidth;
  progY = appHeight * 180.0 / paperHeight;
  progW = appWidth - ((appWidth * 10.0 / paperWidth) * 2);
  progH = appHeight * 10.0 / paperHeight;

  // Time Stamp Population
  timeY = appHeight * 195.0 / paperHeight;
  timeH = appHeight * 14.0 / paperHeight;
  timeElapsedW = appWidth * 40.0 / paperWidth;
  timeTotalW = appWidth * 55.0 / paperWidth;
  timeRemainW = appWidth * 45.0 / paperWidth;
  
}//End Setup
//
void draw() {
  background(255); 
  
  // Draw DIVs
  noFill();
  stroke(0);
  rect(titleX, titleY, titleW, titleH);
  rect(lyricsX, lyricsY, lyricsW, lyricsH);
  rect(imageX, imageY, imageW, imageH);
  
  rect(rightX, rightY1, rightW, rightH);
  rect(rightX, rightY2, rightW, rightH);
  rect(rightX, rightY3, rightW, rightH);
  
  // Draw 10 Buttons
  for (int i = 0; i < 10; i++) {
    // Now paperWidth is global, so this line won't error anymore!
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    rect(xPos, btnY, btnW, btnH);
  }
  
  // Draw Progress Bar
  rect(progX, progY, progW, progH);
  
  // Draw Time Stamps
  rect(appWidth * 10.0 / paperWidth, timeY, timeElapsedW, timeH);
  rect(appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW - timeRemainW, timeY, timeRemainW, timeH);
  rect(appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW, timeY, timeTotalW, timeH);
}//End Draw
//
void mousePressed() {
}//End Mouse Pressed
//
void keyPressed() {
}//End Key Pressed
//
//End MAIN Program
