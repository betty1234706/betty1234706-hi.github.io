/* DIVs 2D Rectangles - ULTIMATE SYMMETRICAL VERSION
 - Standardized Margins: All left-side elements share a single alignment line.
 - Dynamic Right Alignment: Right boxes hug the right margin perfectly.
 - Clean Button Loop: No staggered edges or rounding gaps.
 */

// 1. Global Variables
int appWidth, appHeight;
float paperWidth = 279.0;  
float paperHeight = 216.0; 

void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
}

void draw() {
  background(255); // White background
  noFill();        
  stroke(0);       // Black outlines
  strokeWeight(1); // Crisp 1-pixel lines
  
  // --- 2. SCALING & MARGINS ---
  float wScale = appWidth / paperWidth;
  float hScale = appHeight / paperHeight;
  
  // This 'margin' ensures everything on the left starts at the exact same spot
  float margin = 10.0 * wScale; 

  // --- 3. LEFT SIDE (Title, Lyrics, Image) ---
  float leftW = 85.0 * wScale;
  
  // Song Title
  rect(margin, 9.0 * hScale, leftW, 23.0 * hScale);  
  
  // Lyrics
  rect(margin, 35.0 * hScale, leftW, 38.0 * hScale); 

  // Image Box (Now aligned to the same margin as Title/Lyrics)
  rect(margin, 75.0 * hScale, 60.0 * wScale, 45.0 * hScale);

  // --- 4. RIGHT SIDE (Aligned to Right Margin) ---
  float rightW = 80.0 * wScale;
  // Calculate X by taking the full width and subtracting the box and the margin
  float rightX = appWidth - rightW - margin; 
  float rightH = 19.0 * hScale;

  rect(rightX, 9.0 * hScale, rightW, rightH);
  rect(rightX, 35.0 * hScale, rightW, rightH);
  rect(rightX, 60.0 * hScale, rightW, rightH);

  // --- 5. 10 BUTTON ROW (Y=135) ---
  float btnW_mm = 24.0; 
  float gap_mm = 3.0;
  float bW = btnW_mm * wScale;
  float bH = 25.0 * hScale;
  float bY = 135.0 * hScale;

  for (int i = 0; i < 10; i++) {
    // Buttons start at the margin and space out evenly
    float xPos = margin + (i * (btnW_mm + gap_mm)) * wScale;
    rect(xPos, bY, bW, bH);
  }

  // --- 6. PROGRESS BAR (Full Width) ---
  float progY = 180.0 * hScale;
  // This makes the bar stretch from the left margin to the right margin perfectly
  float progW = appWidth - (margin * 2); 
  float progH = 10.0 * hScale;
  
  rect(margin, progY, progW, progH); 

  // Shaded Progress Indicator
  fill(180); 
  rect(margin + (50.0 * wScale), progY, 15.0 * wScale, progH);
  noFill();

  // --- 7. TIME STAMP BOXES (Aligned to Progress Bar Edges) ---
  float timeY = 195.0 * hScale;
  float timeH = 14.0 * hScale;
  
  // Elapsed Time (Left)
  rect(margin, timeY, 40.0 * wScale, timeH); 
  
  // Remaining & Total (Right aligned)
  float totalW = 55.0 * wScale;
  float remainW = 45.0 * wScale;
  float totalX = appWidth - margin - totalW;
  float remainX = totalX - remainW;
  
  rect(remainX, timeY, remainW, timeH); // Remaining Box
  rect(totalX, timeY, totalW, timeH);   // Total Box

} // End of draw
