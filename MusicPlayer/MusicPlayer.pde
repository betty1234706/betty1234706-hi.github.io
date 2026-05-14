/* Music App, Final Project
 */
//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
// Global Variables
int appWidth, appHeight;
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

// Image Variables & Pathway Concatenation
PImage musicPic;
String upArrow = "..";
String dependanciesFolder = "Dependences/";
String imagesFolder = "Images/";
String imageName1 = "0x1900-000000-80-0-0";
String fileExtension = ".jpg";
String open = "/";

// Aspect Ratio Adjusted Variables
float imageWidthAdjusted, imageHeightAdjusted;
boolean playImage = true; 

void setup() {
  // Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  
  // 1. Pathway Concatenation
  String imageDirectory = upArrow + open + dependanciesFolder + imagesFolder; 
  String pathway1 = imageDirectory + imageName1 + fileExtension;
  musicPic = loadImage(pathway1); 

  // 2. DIVs Population (Using your specific ratios)
  titleX = appWidth * 10.0 / paperWidth; 
  titleY = appHeight * 9.0 / paperHeight;
  titleW = appWidth * 85.0 / paperWidth;
  titleH = appHeight * 23.0 / paperHeight;

  lyricsX = appWidth * 10.0 / paperWidth;
  lyricsY = appHeight * 35.0 / paperHeight;
  lyricsW = appWidth * 85.0 / paperWidth;
  lyricsH = appHeight * 38.0 / paperHeight;

  // The box for the image
  imageX = appWidth * 10.0 / paperWidth;
  imageY = appHeight * 75.0 / paperHeight;
  imageW = appWidth * 60.0 / paperWidth;
  imageH = appHeight * 45.0 / paperHeight;

  // 3. Aspect Ratio Algorithm
  if (musicPic != null) {
    float musicPicAspectRatio = (float)musicPic.width / (float)musicPic.height;
    imageWidthAdjusted = imageW;
    imageHeightAdjusted = imageWidthAdjusted / musicPicAspectRatio;
    while (imageHeightAdjusted > imageH) {
      imageWidthAdjusted *= 0.99;
      imageHeightAdjusted = imageWidthAdjusted / musicPicAspectRatio;
    }
  }

  // Right Side Boxes
  rightW = appWidth * 80.0 / paperWidth;
  rightX = appWidth - rightW - (appWidth * 10.0 / paperWidth); 
  rightH = appHeight * 19.0 / paperHeight;
  rightY1 = appHeight * 9.0 / paperHeight;
  rightY2 = appHeight * 35.0 / paperHeight;
  rightY3 = appHeight * 60.0 / paperHeight;

  // --- BUTTON POPULATION ---
  // We calculate these once in setup so they don't move
  btnW = appWidth * 24.0 / paperWidth;
  btnH = appHeight * 25.0 / paperHeight;
  btnY = appHeight * 135.0 / paperHeight; // Adjusted to be below the image
  btnGap = appWidth * 3.0 / paperWidth;

  // Progress bar
  progX = appWidth * 10.0 / paperWidth;
  progY = appHeight * 180.0 / paperHeight;
  progW = appWidth - ((appWidth * 10.0 / paperWidth) * 2);
  progH = appHeight * 10.0 / paperHeight;

  // Time stamps
  timeY = appHeight * 195.0 / paperHeight;
  timeH = appHeight * 14.0 / paperHeight;
  timeElapsedW = appWidth * 40.0 / paperWidth;
  timeTotalW = appWidth * 55.0 / paperWidth;
  timeRemainW = appWidth * 45.0 / paperWidth;
  
} // End Setup

void draw() {
  background(255); 
  
  // --- DRAWING DIV BORDERS ---
  noFill(); stroke(0);
  rect(titleX, titleY, titleW, titleH);
  rect(lyricsX, lyricsY, lyricsW, lyricsH);
  rect(imageX, imageY, imageW, imageH); 
  
  rect(rightX, rightY1, rightW, rightH);
  rect(rightX, rightY2, rightW, rightH);
  rect(rightX, rightY3, rightW, rightH);

  // --- DRAWING THE IMAGE ---
  if (playImage == true && musicPic != null) {
    float xOffset = (imageW - imageWidthAdjusted) / 2.0;
    float yOffset = (imageH - imageHeightAdjusted) / 2.0;
    image(musicPic, imageX + xOffset, imageY + yOffset, imageWidthAdjusted, imageHeightAdjusted);
  }
  
  // --- DRAWING ALL 10 BUTTONS ---
  for (int i = 0; i < 10; i++) {
    // This formula ensures all 10 buttons line up horizontally
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    
    // Hover effect
    if (mouseX > xPos && mouseX < xPos + btnW && mouseY > btnY && mouseY < btnY + btnH) {
      fill(220); 
    } else {
      fill(255);
    }
    
    rect(xPos, btnY, btnW, btnH);
    
    // Basic symbols for reference
    fill(0);
    if (i == 4) triangle(xPos+btnW*0.3, btnY+btnH*0.3, xPos+btnW*0.3, btnY+btnH*0.7, xPos+btnW*0.7, btnY+btnH*0.5); // Play
    if (i == 0) rect(xPos+btnW*0.3, btnY+btnH*0.3, btnW*0.4, btnH*0.4); // Stop
  }
  
  // --- PROGRESS AND TIME ---
  noFill();
  rect(progX, progY, progW, progH);
  rect(appWidth * 10.0 / paperWidth, timeY, timeElapsedW, timeH);
  rect(appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW - timeRemainW, timeY, timeRemainW, timeH);
  rect(appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW, timeY, timeTotalW, timeH);

} // End Draw

void mousePressed() {
  // Check all 10 buttons for clicks
  for (int i = 0; i < 10; i++) {
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    if (mouseX > xPos && mouseX < xPos + btnW && mouseY > btnY && mouseY < btnY + btnH) {
      if (i == 4) playImage = true; 
      if (i == 0) playImage = false;
    }
  }
} // End MousePressed

void keyPressed() {
} // End KeyPressed

// End MAIN Program
