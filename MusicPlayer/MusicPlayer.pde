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
/* Global Variables
 - Possible DIV-vars needed in draw(), etc.
 - MUST: Music Button-vars, possibly associated DIV-vars
 */
int appWidth, appHeight;
float paperWidth = 279.0;
float paperHeight = 216.0;

// Minim Variables
Minim minim;
AudioPlayer song;

// DIV Variables
float titleX, titleY, titleW, titleH;
float lyricsX, lyricsY, lyricsW, lyricsH;
float imageX, imageY, imageW, imageH;
float rightX, rightW, rightH, rightY1, rightY2, rightY3;
float btnW, btnH, btnY, btnGap;
float progX, progY, progW, progH;
float timeY, timeH, timeElapsedW, timeRemainW, timeTotalW;

// Text Setup, includes text & font variables
// Literal Text ... String Variables
String topTxt = "Girlset";
String tweakTxt = "Tweak";
String[] rightTexts = {"Little Miss", "2025", "Song 1"}; // Condensed into an array
PFont uiFont; 

// Font Size Variables, correlated with DIV-Height Variables
float fontSizeTitle, fontSizeRight, fontSizeTime;

// Image Variables & Pathway Concatenation
PImage musicPic;
String upArrow = "..", dependanciesFolder = "Dependences/", imagesFolder = "Images/", imageName1 = "0x1900-000000-80-0-0", fileExtension = ".jpg", open = "/";

// Aspect Ratio Adjusted Variables
float imageWidthAdjusted, imageHeightAdjusted;
boolean playImage = false; 

void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  
  // Initialize Minim
  minim = new Minim(this);
  song = minim.loadFile("tweak.mp3"); 
  
  // 1. Pathway Concatenation
  musicPic = loadImage(upArrow + open + dependanciesFolder + imagesFolder + imageName1 + fileExtension); 

  // 2. DIVs Population using unitless ratios
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

  if (musicPic != null) {
    imageWidthAdjusted = imageW; 
    imageHeightAdjusted = imageWidthAdjusted / ((float)musicPic.width / (float)musicPic.height);
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
  
  uiFont = createFont("Arial", 12); 
  fontSizeTitle = titleH * 0.6; 
  fontSizeRight = rightH * 0.5;
  fontSizeTime = timeH * 0.7;
} // End Setup

void draw() {
  background(255); 
  if (song != null && song.isPlaying()) playImage = true;
  
  // --- DRAWING THE IMAGE (ALWAYS VISIBLE) ---
  if (musicPic != null) {
    image(musicPic, imageX, imageY + (imageH - imageHeightAdjusted) / 2.0, imageWidthAdjusted, imageHeightAdjusted);
    noStroke(); fill(255);
    rect(imageX, imageY - 100, imageW, 100); 
    rect(imageX, imageY + imageH, imageW, 100); 
  }
  
  // --- DRAWING THE RED TEXTS (ALWAYS VISIBLE) ---
  fill(255, 0, 0); textFont(uiFont); textAlign(CENTER, CENTER);
  
  textSize(fontSizeTitle);
  text(topTxt, titleX, titleY, titleW, titleH);
  text(tweakTxt, lyricsX, lyricsY, lyricsW, lyricsH);
  
  textSize(fontSizeRight);
  float[] rightYPositions = {rightY1, rightY2, rightY3};
  for (int i = 0; i < 3; i++) {
    text(rightTexts[i], rightX, rightYPositions[i], rightW, rightH);
  }
  
  // --- DRAWING DIV BORDERS ---
  noFill(); stroke(0);
  rect(titleX, titleY, titleW, titleH);
  rect(lyricsX, lyricsY, lyricsW, lyricsH);
  rect(imageX, imageY, imageW, imageH); 
  for (float rY : rightYPositions) rect(rightX, rY, rightW, rightH);

  // --- DRAWING ALL 10 BUTTONS ---
  for (int i = 0; i < 10; i++) {
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    fill((mouseX > xPos && mouseX < xPos + btnW && mouseY > btnY && mouseY < btnY + btnH) ? 220 : 255);
    rect(xPos, btnY, btnW, btnH);
    
    fill(0); stroke(0);
    float cX = xPos + btnW/2, cY = btnY + btnH/2;

    if (i == 0)      rect(cX - btnW*0.2, cY - btnH*0.2, btnW*0.4, btnH*0.4); // Stop
    else if (i == 1) { // Rewind
      triangle(cX, cY, cX + btnW*0.2, cY - btnH*0.18, cX + btnW*0.2, cY + btnH*0.18);
      triangle(cX - btnW*0.2, cY, cX, cY - btnH*0.18, cX, cY + btnH*0.18);
    } 
    else if (i == 2) { // Back
      rect(cX - btnW*0.22, cY - btnH*0.18, btnW*0.08, btnH*0.36);
      triangle(cX + btnW*0.15, cY - btnH*0.18, cX + btnW*0.15, cY + btnH*0.18, cX - btnW*0.1, cY);
    } 
    else if (i == 3) { // Reverse 10s
      noFill(); arc(cX, cY, btnW*0.4, btnH*0.4, -HALF_PI, PI);
      fill(0); triangle(cX, cY - (btnH * 0.2), cX + btnW*0.1, cY - (btnH * 0.2) - btnH*0.08, cX + btnW*0.1, cY - (btnH * 0.2) + btnH*0.08);
    } 
    else if (i == 4) triangle(cX - btnW*0.15, cY - btnH*0.25, cX - btnW*0.15, cY + btnH*0.25, cX + btnW*0.25, cY); // Play
    else if (i == 5) { // Pause
      rect(cX - btnW*0.16, cY - btnH*0.2, btnW*0.1, btnH*0.4);
      rect(cX + btnW*0.06, cY - btnH*0.2, btnW*0.1, btnH*0.4);
    } 
    else if (i == 6) { // Forward 10s
      noFill(); arc(cX, cY, btnW*0.4, btnH*0.4, 0, PI + HALF_PI);
      fill(0); triangle(cX, cY - (btnH * 0.2), cX - btnW*0.1, cY - (btnH * 0.2) - btnH*0.08, cX - btnW*0.1, cY - (btnH * 0.2) + btnH*0.08);
    } 
    else if (i == 7) { // Skip Forward
      triangle(cX - btnW*0.15, cY - btnH*0.18, cX - btnW*0.15, cY + btnH*0.18, cX + btnW*0.1, cY);
      rect(cX + btnW*0.14, cY - btnH*0.18, btnW*0.08, btnH*0.36);
    } 
    else if (i == 8) { // Fast Forward
      triangle(cX, cY - btnH*0.18, cX, cY + btnH*0.18, cX + btnW*0.2, cY);
      triangle(cX - btnW*0.2, cY - btnH*0.18, cX - btnW*0.2, cY + btnH*0.18, cX, cY);
    } 
    else if (i == 9) ellipse(cX, cY, btnW*0.4, btnH*0.4); // Record
  }
  
  // --- PROGRESS AND TIME (POWERED BY MINIM) ---
  noFill(); stroke(0); rect(progX, progY, progW, progH); 
  
  int currentMs = (song != null) ? song.position() : 0;
  int totalMs = (song != null) ? song.length() : 151000; 
  
  fill(180); rect(progX, progY, map(currentMs, 0, totalMs, 0, progW), progH);
  
  noFill(); stroke(0);
  float elapsedBoxX = appWidth * 10.0 / paperWidth;
  float totalBoxX = appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW;
  float remainBoxX = totalBoxX - timeRemainW;
  
  rect(elapsedBoxX, timeY, timeElapsedW, timeH);
  rect(remainBoxX, timeY, timeRemainW, timeH);
  rect(totalBoxX, timeY, timeTotalW, timeH);
  
  fill(0); textSize(fontSizeTime);
  text(nf((currentMs / 1000) / 60, 2) + ":" + nf((currentMs / 1000) % 60, 2), elapsedBoxX, timeY, timeElapsedW, timeH);
  text("-" + nf(((totalMs - currentMs) / 1000) / 60, 2) + ":" + nf(((totalMs - currentMs) / 1000) % 60, 2), remainBoxX, timeY, timeRemainW, timeH);
  text(nf((totalMs / 1000) / 60, 2) + ":" + nf((totalMs / 1000) % 60, 2), totalBoxX, timeY, timeTotalW, timeH);
} // End Draw

void mousePressed() {
  for (int i = 0; i < 10; i++) {
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    if (mouseX > xPos && mouseX < xPos + btnW && mouseY > btnY && mouseY < btnY + btnH) {
      if (i == 4 && song != null) song.play();
      if (i == 5 && song != null) song.pause();
      if (i == 0 && song != null) { song.pause(); song.rewind(); playImage = false; }
    }
  }
} // End Mouse Pressed

void keyPressed() {}
// End MAIN Program
