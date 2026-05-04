/* DIVs 2D Rectangles, Assignment - FINAL STABLE VERSION
 - All rect() moved to draw() so they stay visible
 - Includes: Title, Lyrics, Image, 88mm Right Boxes, 10 Buttons, Progress Bar
 - Fixed: No more <EOF> error
 */

// 1. Global Variables
int appWidth, appHeight;
int paperWidth = 279; 
int paperHeight = 216; 

void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
}

void draw() {
  background(255); // Clears screen to white every frame
  noFill();        
  stroke(0);       // Black outlines
  
  // --- 2. LEFT SIDE (85mm boxes from sketch) ---
  float leftX = appWidth * 7 / paperWidth;
  
  // Song Title
  rect(leftX, appHeight * 9 / paperHeight, appWidth * 85 / paperWidth, appHeight * 23 / paperHeight); 
  
  // Lyrics
  rect(leftX, appHeight * 35 / paperHeight, appWidth * 85 / paperWidth, appHeight * 38 / paperHeight); 

  // Image Box at (0, 73)
  rect(appWidth * 0 / paperWidth, appHeight * 73 / paperHeight, appWidth * 59 / paperWidth, appHeight * 40 / paperHeight);

  // --- 3. RIGHT SIDE (88mm boxes from sketch) ---
  float rightX = appWidth * 180 / paperWidth; 
  float rightW = appWidth * 88 / paperWidth;
  float rightH = appHeight * 19 / paperHeight;

  rect(rightX, appHeight * 9 / paperHeight, rightW, rightH);
  rect(rightX, appHeight * 35 / paperHeight, rightW, rightH);
  rect(rightX, appHeight * 60 / paperHeight, rightW, rightH);

  // --- 4. 10 BUTTON ROW (Y=135) ---
  float btnW_mm = 25.0; 
  float btnH_mm = 25.0;
  float btnY_mm = 135.0;
  float gap_mm = 2.0;
  
  float bW = appWidth * btnW_mm / paperWidth;
  float bH = appHeight * btnH_mm / paperHeight;
  float bY = appHeight * btnY_mm / paperHeight;

  for (int i = 0; i < 10; i++) {
    float xPos = appWidth * (i * (btnW_mm + gap_mm)) / paperWidth;
    rect(xPos, bY, bW, bH);
  }

  // --- 5. PROGRESS BAR (The long box at Y=235) ---
  float progX = appWidth * 0 / paperWidth;
  float progY = appHeight * 235 / paperHeight;
  float progW = appWidth * 194 / paperWidth;
  float progH = appHeight * 10 / paperHeight;
  
  rect(progX, progY, progW, progH); // This is your progress bar!

  // Shaded Progress Indicator (The little square)
  fill(100); 
  rect(appWidth * 50 / paperWidth, progY, appWidth * 10 / paperWidth, progH);
  noFill();

  // --- 6. TIME STAMP BOXES (Y=245) ---
  float timeY = appHeight * 245 / paperHeight;
  rect(appWidth * 0 / paperWidth, timeY, appWidth * 40 / paperWidth, appHeight * 14 / paperHeight);   // Elapsed
  rect(appWidth * 182 / paperWidth, timeY, appWidth * 42 / paperWidth, appHeight * 14 / paperHeight); // Remaining
  rect(appWidth * 224 / paperWidth, timeY, appWidth * 55 / paperWidth, appHeight * 14 / paperHeight); // Total

} // End of draw
