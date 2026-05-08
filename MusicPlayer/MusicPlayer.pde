import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
int appWidth, appHeight;
float wScale, hScale, margin;

// DIV Variables
float titleX, titleY, titleW, titleH;
float lyricsX, lyricsY, lyricsW, lyricsH;
float imageX, imageY, imageW, imageH;
float rightX, rightW, rightH, rightY1, rightY2, rightY3;
float btnW, btnH, btnY, btnGap;
float progX, progY, progW, progH;
float timeY, timeH, timeElapsedW, timeRemainW, timeTotalW;

void setup() {
  // Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  
  // DIVs Population using unitless ratios (millimeters to pixels)
  float paperWidth = 279.0;
  float paperHeight = 216.0;
  wScale = appWidth / paperWidth;
  hScale = appHeight / paperHeight;
  margin = 10.0 * wScale; // Standardized left/right margin

  // Left Side Population
  titleX = margin;
  titleY = 9.0 * hScale;
  titleW = 85.0 * wScale;
  titleH = 23.0 * hScale;

  lyricsX = margin;
  lyricsY = 35.0 * hScale;
  lyricsW = 85.0 * wScale;
  lyricsH = 38.0 * hScale;

  imageX = margin;
  imageY = 75.0 * hScale;
  imageW = 60.0 * wScale;
  imageH = 45.0 * hScale;

  // Right Side Population
  rightW = 80.0 * wScale;
  rightX = appWidth - rightW - margin; 
  rightH = 19.0 * hScale;
  rightY1 = 9.0 * hScale;
  rightY2 = 35.0 * hScale;
  rightY3 = 60.0 * hScale;

  // Button Row Population
  btnW = 24.0 * wScale;
  btnH = 25.0 * hScale;
  btnY = 135.0 * hScale;
  btnGap = 3.0 * wScale;

  // Progress Bar Population
  progX = margin;
  progY = 180.0 * hScale;
  progW = appWidth - (margin * 2);
  progH = 10.0 * hScale;

  // Time Stamp Population
  timeY = 195.0 * hScale;
  timeH = 14.0 * hScale;
  timeElapsedW = 40.0 * wScale;
  timeTotalW = 55.0 * wScale;
  timeRemainW = 45.0 * wScale;

}//End Setup

void draw() {
  background(255);
  noFill();
  stroke(0);
  
  // Draw DIVs
  rect(titleX, titleY, titleW, titleH);
  rect(lyricsX, lyricsY, lyricsW, lyricsH);
  rect(imageX, imageY, imageW, imageH);
  
  rect(rightX, rightY1, rightW, rightH);
  rect(rightX, rightY2, rightW, rightH);
  rect(rightX, rightY3, rightW, rightH);
  
  // Draw 10 Buttons
  for (int i = 0; i < 10; i++) {
    float xPos = margin + (i * (btnW + btnGap));
    rect(xPos, btnY, btnW, btnH);
  }
  
  // Draw Progress Bar
  rect(progX, progY, progW, progH);
  
  // Shaded Progress Indicator (Static for now)
  fill(200);
  rect(progX + (50 * wScale), progY, 15 * wScale, progH);
  noFill();
  
  // Draw Time Stamps
  rect(margin, timeY, timeElapsedW, timeH); // Elapsed
  rect(appWidth - margin - timeTotalW - timeRemainW, timeY, timeRemainW, timeH); // Remaining
  rect(appWidth - margin - timeTotalW, timeY, timeTotalW, timeH); // Total

}//End Draw

void mousePressed() {
}//End Mouse Pressed

void keyPressed() {
}//End Key Pressed

//End MAIN Program
