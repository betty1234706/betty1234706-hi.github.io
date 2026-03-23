/* Adpect Ratio
*/
//
//Display
fullScreen();
int appWidth = displayWidth;
int appHeight = displayHeight;
//
String upArrow = "..";
String dependanciesFolder = "Dependences/";
String imagesFolder = "Images/";
String imageName1 = "0x1900-000000-80-0-0";
String fileExtension = ".jpg";
String open = "/";
//
//Concatenation
//Note, Cut Out, See Absolute Pathway:
//See Relative Pathway: Dependencies\Images
String imageDirectory = upArrow + open + upArrow + open + upArrow + open + dependanciesFolder + open + imagesFolder + open;
String pathway1 = imageDirectory + imageName1 + fileExtension;
//String pathway2 = imageDirectory + imageName2 + fileExtension;
//String pathway3 = imageDirectory + imageName3 + fileExtension;
//println(pathway);
//
PImage image1 = loadImage( pathway1 );
//PImage image2 = loadImage( pathway2 );
//PImage image3 = loadImage( pathway3 );
//
//image(image1, 0, 0);
int imageWidth2 = 860;
int imageHeight2 = 529;
//image(image2, 0, 0);
//image(image3, 0, 0);
//
//Population: DIVs
int numberOfButtons = 13; //Half a button on either side as space, Center Button is Play
int widthOfButton = appWidth/numberOfButtons;
int beginningButtonSpace = widthOfButton;
float imageDivX = beginningButtonSpace;
float imageDivY = appHeight*4.5/20;
float imageDivWidth = appWidth*1/2 - beginningButtonSpace*1.5;
float imageDivHeight = appHeight*1.5/5; //1+1.5=2.5, half of the total height
//
//Image: Aspect Ratio Algorithm
//println( float(imageWidth2)/ float(imageHeight2) );
//Ternary Operator for As[pect Ratio: Q: greatOne v lessOne
float image2AspectRation_GreatOne = ( imageWidth2 > imageHeight2 ) ? float(imageWidth2) / float(imageHeight2) : float(imageHeight2) / float(imageWidth2 ) ;
println("Verify Image Aspect Ratio Greater than One:", image2AspectRation_GreatOne>=1, "\tActual Number:", image2AspectRation_GreatOne);
float imageWidthAdjusted2 = imageDivWidth;
println("Comparison of imageHeight2 and divHeight:", imageHeight2, imageDivHeight);
float imageHeightAdjusted1 = ( imageWidth2 >= imageDivWidth ) ? imageWidthAdjusted2 / image2AspectRation_GreatOne : imageWidthAdjusted2 * image2AspectRation_GreatOne ;
println("imageHeightAdjusted1", imageHeightAdjusted1);
println("Question: is this too big?", "\t\thint ... reposition image() above rect(div)");
// WHILE LOOP: decrease imageWidth to decrease the calculated imageHeight (% decrease within mutliplication assignment operator)
while ( imageHeightAdjusted1 > imageDivHeight ) {
  imageWidthAdjusted2 *= 0.99;
  imageHeightAdjusted1 = imageWidthAdjusted2 / image2AspectRation_GreatOne ; //CHANGE THIS
}//End WHILE
//
//CAUTION: might need to reposition rect(div) with image()
//DIV: Image
rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
//
image(image1, imageDivX, imageDivY, imageWidthAdjusted2, imageHeightAdjusted1);
//image(image2, 0, 0) ;
//image(image3, 0, 0);
