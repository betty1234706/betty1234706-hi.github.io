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
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  
  // 1. Pathway Concatenation
  String imageDirectory = upArrow + open + dependanciesFolder + imagesFolder; 
  String pathway1 = imageDirectory + imageName1 + fileExtension;
  musicPic = loadImage(pathway1); 

  // 2. DIVs Population
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

  // 3. Aspect Ratio Algorithm - HORIZONTAL FIT
  if (musicPic != null) {
    float imgRatio = (float)musicPic.width / (float)musicPic.height;
    imageWidthAdjusted = imageW; 
    imageHeightAdjusted = imageWidthAdjusted / imgRatio;
  }

  rightW = appWidth * 80.0 / paperWidth;
  rightX = appWidth - rightW - (appWidth * 10.0 / paperWidth); 
  rightH = appHeight * 19.0 / paperHeight;
  rightY1 = appHeight * 9.0 / paperHeight;
  rightY2 = appHeight * 35.0 / paperHeight;
  rightY3 = appHeight * 60.0 / paperHeight;

  btnW = appWidth * 24.0 / paperWidth;
  btnH = appHeight * 25.0 / paperHeight;
  btnY = appHeight * 135.0 / paperHeight; 
  btnGap = appWidth * 3.0 / paperWidth;

  progX = appWidth * 10.0 / paperWidth;
  progY = appHeight * 180.0 / paperHeight;
  progW = appWidth - ((appWidth * 10.0 / paperWidth) * 2);
  progH = appHeight * 10.0 / paperHeight;

  timeY = appHeight * 195.0 / paperHeight;
  timeH = appHeight * 14.0 / paperHeight;
  timeElapsedW = appWidth * 40.0 / paperWidth;
  timeTotalW = appWidth * 55.0 / paperWidth;
  timeRemainW = appWidth * 45.0 / paperWidth;
  
} // End Setup

void draw() {
  background(255); 
  
  // --- DRAWING THE IMAGE ---
  if (playImage == true && musicPic != null) {
    float yOffset = (imageH - imageHeightAdjusted) / 2.0;
    image(musicPic, imageX, imageY + yOffset, imageWidthAdjusted, imageHeightAdjusted);
    
    noStroke(); fill(255);
    rect(imageX, imageY - 100, imageW, 100); 
    rect(imageX, imageY + imageH, imageW, 100); 
  }
  
  // --- DRAWING DIV BORDERS ---
  noFill(); stroke(0);
  rect(titleX, titleY, titleW, titleH);
  rect(lyricsX, lyricsY, lyricsW, lyricsH);
  rect(imageX, imageY, imageW, imageH); 
  rect(rightX, rightY1, rightW, rightH);
  rect(rightX, rightY2, rightW, rightH);
  rect(rightX, rightY3, rightW, rightH);

  // --- DRAWING ALL 10 BUTTONS ---
  for (int i = 0; i < 10; i++) {
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    fill((mouseX > xPos && mouseX < xPos + btnW && mouseY > btnY && mouseY < btnY + btnH) ? 220 : 255);
    rect(xPos, btnY, btnW, btnH);
    
    fill(0); stroke(0);
    float cX = xPos + btnW/2;
    float cY = btnY + btnH/2;

    if (i == 0) { // Stop
      rect(cX - btnW*0.2, cY - btnH*0.2, btnW*0.4, btnH*0.4);
    } 
    else if (i == 1) { // Rewind
      triangle(cX, cY, cX + btnW*0.2, cY - btnH*0.18, cX + btnW*0.2, cY + btnH*0.18);
      triangle(cX - btnW*0.2, cY, cX, cY - btnH*0.18, cX, cY + btnH*0.18);
    } 
    else if (i == 2) { // Back
      rect(cX - btnW*0.22, cY - btnH*0.18, btnW*0.08, btnH*0.36);
      triangle(cX + btnW*0.15, cY - btnH*0.18, cX + btnW*0.15, cY + btnH*0.18, cX - btnW*0.1, cY);
    } 
    else if (i == 3) { // Button 4: Reverse 10s Loop (Triangle points LEFT)
      noFill(); 
      arc(cX, cY, btnW*0.4, btnH*0.4, -HALF_PI, PI);
      fill(0); 
      float triTipX = cX;
      float triTipY = cY - (btnH * 0.2);
      triangle(triTipX, triTipY, triTipX + btnW*0.1, triTipY - btnH*0.08, triTipX + btnW*0.1, triTipY + btnH*0.08);
    } 
    else if (i == 4) { // Play
      triangle(cX - btnW*0.15, cY - btnH*0.25, cX - btnW*0.15, cY + btnH*0.25, cX + btnW*0.25, cY);
    } 
    else if (i == 5) { // Pause
      rect(cX - btnW*0.16, cY - btnH*0.2, btnW*0.1, btnH*0.4);
      rect(cX + btnW*0.06, cY - btnH*0.2, btnW*0.1, btnH*0.4);
    } 
    else if (i == 6) { // Button 7: Forward 10s Loop (Triangle points RIGHT)
      noFill(); 
      arc(cX, cY, btnW*0.4, btnH*0.4, 0, PI + HALF_PI);
      fill(0); 
      float triTipX = cX;
      float triTipY = cY - (btnH * 0.2);
      triangle(triTipX, triTipY, triTipX - btnW*0.1, triTipY - btnH*0.08, triTipX - btnW*0.1, triTipY + btnH*0.08);
    } 
    else if (i == 7) { // Skip Forward
      triangle(cX - btnW*0.15, cY - btnH*0.18, cX - btnW*0.15, cY + btnH*0.18, cX + btnW*0.1, cY);
      rect(cX + btnW*0.14, cY - btnH*0.18, btnW*0.08, btnH*0.36);
    } 
    else if (i == 8) { // Fast Forward
      triangle(cX, cY - btnH*0.18, cX, cY + btnH*0.18, cX + btnW*0.2, cY);
      triangle(cX - btnW*0.2, cY - btnH*0.18, cX - btnW*0.2, cY + btnH*0.18, cX, cY);
    } 
    else if (i == 9) { // Record
      ellipse(cX, cY, btnW*0.4, btnH*0.4);
    }
  }
  
  // --- PROGRESS AND TIME ---
  noFill(); stroke(0);
  rect(progX, progY, progW, progH);
  rect(appWidth * 10.0 / paperWidth, timeY, timeElapsedW, timeH);
  rect(appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW - timeRemainW, timeY, timeRemainW, timeH);
  rect(appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW, timeY, timeTotalW, timeH);

} // End Draw

void mousePressed() {
  for (int i = 0; i < 10; i++) {
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    if (mouseX > xPos && mouseX < xPos + btnW && mouseY > btnY && mouseY < btnY + btnH) {
      if (i == 4) playImage = true; 
      if (i == 0) playImage = false;
    }
  }
}

void keyPressed() {}
// End MAIN Program
