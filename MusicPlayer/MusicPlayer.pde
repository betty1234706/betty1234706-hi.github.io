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

// Minim Variables
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
int currentSong = 0; 

// Image Variables
PImage[] albumArt = new PImage[numberOfSongs];

// DIV Variables
float titleX, titleY, titleW, titleH;
float lyricsX, lyricsY, lyricsW, lyricsH;
float imageX, imageY, imageW, imageH;
float rightX, rightW, rightH, rightY1, rightY2, rightY3;
float btnW, btnH, btnY, btnGap;
float progX, progY, progW, progH;
float timeY, timeH, timeElapsedW, timeRemainW, timeTotalW;
float exitX, exitY, exitW, exitH;

PFont uiFont; 

void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  
  // Initialize Minim
  minim = new Minim(this);
  
  // Folder pathways matching your directory layout
  String upArrow = "..";
  String open = "/";
  String dependenciesFolder = "Dependences";
  String musicFolder = "Music";
  String imageFolder = "Images"; 
  
  String musicDirectory = upArrow + open + upArrow + open + dependenciesFolder + open + musicFolder + open; 
  String imageDirectory = upArrow + open + upArrow + open + dependenciesFolder + open + imageFolder + open; 
  
  // Load all 3 songs from the working directory path
  playList[0] = minim.loadFile(musicDirectory + "Tweak.mp3"); 
  playList[1] = minim.loadFile(musicDirectory + "Touch (ft Yeonjun) by KATSEYE.mp3");
  playList[2] = minim.loadFile(musicDirectory + "TWICE (트와이스) - What is Love_ [MP3 Audio] [5th Mini Album].mp3");
  
  // Load all 3 images from your custom Dependences/Images/ directory path
  albumArt[0] = loadImage(imageDirectory + "0x1900-000000-80-0-0.jpg");
  albumArt[1] = loadImage(imageDirectory + "Touch Katseye Ft.Yeonjun.jpg");
  albumArt[2] = loadImage(imageDirectory + "Twice.png");
  
  // Safety fallback checks for audio
  if (playList[0] == null && playList[1] != null) playList[0] = playList[1];
  if (playList[1] == null) playList[1] = playList[0];
  if (playList[2] == null) playList[2] = playList[0];

  // DIVs Population using layout scales
  titleX = appWidth * 10.0 / paperWidth; titleY = appHeight * 9.0 / paperHeight;
  titleW = appWidth * 85.0 / paperWidth; titleH = appHeight * 23.0 / paperHeight;

  lyricsX = appWidth * 10.0 / paperWidth; lyricsY = appHeight * 35.0 / paperHeight;
  lyricsW = appWidth * 85.0 / paperWidth; lyricsH = appHeight * 38.0 / paperHeight;

  imageX = appWidth * 10.0 / paperWidth; imageY = appHeight * 75.0 / paperHeight;
  imageW = appWidth * 60.0 / paperWidth; imageH = appHeight * 45.0 / paperHeight;

  rightW = appWidth * 80.0 / paperWidth; rightX = appWidth - rightW - (appWidth * 10.0 / paperWidth); 
  rightH = appHeight * 19.0 / paperHeight;
  rightY1 = appHeight * 9.0 / paperHeight; rightY2 = appHeight * 35.0 / paperHeight; rightY3 = appHeight * 60.0 / paperHeight;

  // Grid math configured cleanly for 11 distinct navigation buttons
  btnW = appWidth * 21.5 / paperWidth; btnH = appHeight * 25.0 / paperHeight;
  btnY = appHeight * 135.0 / paperHeight; btnGap = appWidth * 3.0 / paperWidth;

  progX = appWidth * 10.0 / paperWidth; progY = appHeight * 180.0 / paperHeight;
  progW = appWidth - ((appWidth * 10.0 / paperWidth) * 2); progH = appHeight * 10.0 / paperHeight;

  timeY = appHeight * 195.0 / paperHeight; timeH = appHeight * 14.0 / paperHeight;
  timeElapsedW = appWidth * 40.0 / paperWidth; timeTotalW = appWidth * 55.0 / paperWidth; timeRemainW = appWidth * 45.0 / paperWidth;
  
  exitW = appWidth * 8.0 / paperWidth; exitH = appHeight * 8.0 / paperHeight; exitX = appWidth - exitW; exitY = 0;
  
  uiFont = createFont("Arial", 12); 
} 

void draw() {
  background(255); 
  
  // --- DRAWING THE TEXTS ---
  fill(255, 0, 0); // Sets font colors to red
  textFont(uiFont); 
  textAlign(CENTER, CENTER);
  
  // Dynamic Title based on current track selection
  String currentTitle = "";
  switch(currentSong) {
    case 0:
      currentTitle = "Tweak";
      break;
    case 1:
      currentTitle = "Touch (ft Yeonjun) - KATSEYE";
      break;
    case 2:
      currentTitle = "What is Love - TWICE";
      break;
    default:
      currentTitle = "Music Player";
      break;
  }
  
  textSize(titleH * 0.45); 
  text(currentTitle, titleX, titleY, titleW, titleH);
  
  textSize(rightH * 0.5);
  text("Now Playing: Song " + (currentSong + 1), rightX, rightY1, rightW, rightH);
  text("Track Type: MP3", rightX, rightY2, rightW, rightH);
  text("Total Tracks: " + numberOfSongs, rightX, rightY3, rightW, rightH);
  
  // Dynamic Release Date printed in the box above the images (Lyrics Box Area)
  String releaseDate = "";
  switch(currentSong) {
    case 0:
      releaseDate = "Released: March 6, 2026";
      break;
    case 1:
      releaseDate = "Released: October 11, 2024";
      break;
    case 2:
      releaseDate = "Released: April 9, 2018";
      break;
    default:
      releaseDate = "Unknown Date";
      break;
  }
  
  textSize(lyricsH * 0.3);
  text(releaseDate, lyricsX, lyricsY, lyricsW, lyricsH);
  
  // --- DRAWING THE BOTTOM LEFT IMAGE BOX ---
  if (albumArt[currentSong] != null) {
    image(albumArt[currentSong], imageX, imageY, imageW, imageH);
    noFill();
    stroke(0);
    rect(imageX, imageY, imageW, imageH);
  } else {
    fill(230);
    stroke(0);
    rect(imageX, imageY, imageW, imageH);
    fill(100);
    textSize(imageH * 0.12);
    text("[Missing Image File]", imageX + imageW/2, imageY + imageH/2);
  }

  // --- DRAWING DIV BORDERS (Excluding the image box to prevent overlapping) ---
  noFill(); stroke(0);
  rect(titleX, titleY, titleW, titleH); 
  rect(lyricsX, lyricsY, lyricsW, lyricsH); 
  rect(rightX, rightY1, rightW, rightH); 
  rect(rightX, rightY2, rightW, rightH); 
  rect(rightX, rightY3, rightW, rightH);

  // --- DRAWING ALL 11 BUTTONS ---
  for (int i = 0; i < 11; i++) {
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
      rect(cX - btnW*0.16, cY - btnH*0.2, btnW*0.1, btnH*0.4); rect(cX + btnW*0.06, cY - btnH*0.2, btnW*0.1, btnH*0.4);
    } 
    else if (i == 6) { // Forward 10s
      noFill(); arc(cX, cY, btnW*0.4, btnH*0.4, 0, PI + HALF_PI);
      fill(0); triangle(cX, cY - (btnH * 0.2), cX - btnW*0.1, cY - (btnH * 0.2) - btnH*0.08, cX - btnW*0.1, cY - (btnH * 0.2) + btnH*0.08);
    } 
    else if (i == 7) { // Skip Forward
      triangle(cX - btnW*0.15, cY - btnH*0.18, cX - btnW*0.15, cY + btnH*0.18, cX + btnW*0.1, cY); rect(cX + btnW*0.14, cY - btnH*0.18, btnW*0.08, btnH*0.36);
    } 
    else if (i == 8) { // Fast Forward
      triangle(cX, cY - btnH*0.18, cX, cY + btnH*0.18, cX + btnW*0.2, cY); triangle(cX - btnW*0.2, cY - btnH*0.18, cX - btnW*0.2, cY + btnH*0.18, cX, cY);
    } 
    else if (i == 9) ellipse(cX, cY, btnW*0.4, btnH*0.4); // Record
    else if (i == 10) { // Next Song Button (Double Arrow Layout)
      triangle(cX - btnW*0.15, cY - btnH*0.18, cX - btnW*0.15, cY + btnH*0.18, cX + btnW*0.05, cY);
      triangle(cX + btnW*0.05, cY - btnH*0.18, cX + btnW*0.05, cY + btnH*0.18, cX + btnW*0.25, cY);
    }
  }
  
  // --- PROGRESS AND TIME TRACKING ---
  noFill(); stroke(0); rect(progX, progY, progW, progH); 
  int currentMs = (playList[currentSong] != null) ? playList[currentSong].position() : 0;
  int totalMs = (playList[currentSong] != null) ? playList[currentSong].length() : 151000; 
  fill(180); rect(progX, progY, map(currentMs, 0, totalMs, 0, progW), progH);
  
  noFill(); stroke(0);
  float elapsedBoxX = appWidth * 10.0 / paperWidth;
  float totalBoxX = appWidth - (appWidth * 10.0 / paperWidth) - timeTotalW;
  float remainBoxX = totalBoxX - timeRemainW;
  rect(elapsedBoxX, timeY, timeElapsedW, timeH); rect(remainBoxX, timeY, timeRemainW, timeH); rect(totalBoxX, timeY, timeTotalW, timeH);
  
  fill(0); textSize(timeH * 0.7); textAlign(CENTER, CENTER);
  text(nf((currentMs / 1000) / 60, 2) + ":" + nf((currentMs / 1000) % 60, 2), elapsedBoxX, timeY, timeElapsedW, timeH);
  text("-" + nf(((totalMs - currentMs) / 1000) / 60, 2) + ":" + nf(((totalMs - currentMs) / 1000) % 60, 2), remainBoxX, timeY, timeRemainW, timeH);
  text(nf((totalMs / 1000) / 60, 2) + ":" + nf((totalMs / 1000) % 60, 2), totalBoxX, timeY, timeTotalW, timeH);

  // --- TOP CORNER EXIT APPLICATION ---
  stroke(0); fill((mouseX > exitX && mouseX < exitX + exitW && mouseY > exitY && mouseY < exitY + exitH) ? color(255, 0, 0) : 255);
  rect(exitX, exitY, exitW, exitH);
  fill((mouseX > exitX && mouseX < exitX + exitW && mouseY > exitY && mouseY < exitY + exitH) ? 255 : 0);
  textSize(exitH * 0.6); text("X", exitX, exitY, exitW, exitH);
} 

void mousePressed() {
  if (mouseX > exitX && mouseX < exitX + exitW && mouseY > exitY && mouseY < exitY + exitH) exit();

  for (int i = 0; i < 11; i++) {
    float xPos = (appWidth * 10.0 / paperWidth) + (i * (btnW + btnGap));
    if (mouseX > xPos && mouseX < xPos + btnW && mouseY > btnY && mouseY < btnY + btnH) {
      
      if (playList[currentSong] != null) {
        
        // Button 0: STOP
        if (i == 0) { 
          playList[currentSong].pause(); 
          playList[currentSong].rewind(); 
        } 
        
        // Button 1: REWIND (Skip back 5 seconds)
        else if (i == 1) { 
          playList[currentSong].skip(-5000); 
        } 
        
        // Button 2: BACK (Previous Track)
        else if (i == 2) {
          playList[currentSong].pause(); 
          playList[currentSong].rewind();
          currentSong = (currentSong - 1 + numberOfSongs) % numberOfSongs; 
          if (playList[currentSong] != null) playList[currentSong].play();
        } 
        
        // Button 3: REVERSE 10 SECONDS
        else if (i == 3) { 
          playList[currentSong].skip(-10000); 
        } 
        
        // Button 4: PLAY
        else if (i == 4) { 
          playList[currentSong].play(); 
        } 
        
        // Button 5: PAUSE
        else if (i == 5) { 
          playList[currentSong].pause(); 
        } 
        
        // Button 6: FORWARD 10 SECONDS
        else if (i == 6) { 
          playList[currentSong].skip(10000); 
        } 
        
        // Button 7: SKIP FORWARD (Skip ahead 30 seconds)
        else if (i == 7) { 
          playList[currentSong].skip(30000); 
        } 
        
        // Button 8: FAST FORWARD (Skip ahead 5 seconds)
        else if (i == 8) { 
          playList[currentSong].skip(5000); 
        } 
        
        // Button 9: RECORD CIRCLE (Re-purposed to act as Mute/Unmute Toggler)
        else if (i == 9) {
          if (playList[currentSong].isMuted()) { 
            playList[currentSong].unmute(); 
          } else { 
            playList[currentSong].mute(); 
          }
        } 
        
        // Button 10: NEXT SONG
        else if (i == 10) {
          playList[currentSong].pause(); 
          playList[currentSong].rewind();
          currentSong = (currentSong + 1) % numberOfSongs;
          if (playList[currentSong] != null) playList[currentSong].play();
        }
      }
    }
  }
}
void keyPressed() {}
// End MAIN Program
