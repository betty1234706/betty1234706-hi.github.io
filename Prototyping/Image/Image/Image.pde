/* Adpect Ratio
*/
//
//Display
fullScreen();
//
String upArrow = "..";
String dependanciesFolder = "Dependences/";
String imagesFolder = "Images/";
String imageName1 = "0x1900-000000-80-0-0";
String imageName2= " basketball";
String imageName3= "Volleyball";
String fileExtension = ".jpg";
String open = "/";
//
//Concatenation
//Note, Cut Out, See Absolute Pathway:
//See Relative Pathway: Dependencies\Images
String imageDirectory = upArrow + open + upArrow + open + dependanciesFolder + open + imagesFolder + open;
String pathway1 = imageDirectory + imageName1 + fileExtension;
String pathway2 = imageDirectory + imageName2 + fileExtension;
String pathway3 = imageDirectory + imageName3 + fileExtension;
//println(pathway);
//
PImage image1 = loadImage( pathway1 );
PImage image2 = loadImage( pathway2 );
PImage image3 = loadImage( pathway3 );
//
image(image1, 0, 0);
image(image2, 0, 0);
image(image3, 0, 0);
