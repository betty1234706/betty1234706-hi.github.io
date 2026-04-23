

//Library - Minim
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;  //initates entire class
int numberOfSongs = 3; // Best Practice
int numberOfSoundEffects = 1; //
AudioPlayer[] playlist = new AudioPlayer[ numberOfSongs ];
AudioPlayer[] soundeffects = new AudioPlayer[ numberOfSoundEffects ]; // 
int currentSong = numberOfSongs - numberOfSongs; //ZERO, Math Property
//
void setup() {
  //Display
  size( 700, 500); 
  //fullScreen(); //displayWidth //displayHeight
  int appwidth = width; //Best Practice
  int appHeight = height;
  //
  //Music Loading - STRUCTURED Review
  minim = new Minim(this); //Mandatory 
  String upArrow = "..";
  String open = "/";
  String MusicFolder = "Music"; 
  String soundEffectsFolder = "Sound Effects/"; 
  String dependencesFolder = "Dependences/"; 
  String songName1 = "TWICE (트와이스) - What is Love_ [MP3 Audio] [5th Mini Album]";
  String soundEffect1 = "The_Simplest_Sting";
  String fileExtension_mp3 = ".mp3";
  
  //
  String musicDirectory = upArrow + open + upArrow + open + dependencesFolder + open + MusicFolder + open ; 
  String soundEffectsDirectory = upArrow + open + upArrow + open + dependencesFolder + open + soundEffectsFolder + open ; 
  String pathway = musicDirectory + songName1 + fileExtension_mp3; 
  
  println(pathway);
  
  playlist[ currentSong ] = minim.loadFile( pathway ); 
  
  pathway = soundEffectsDirectory + soundEffect1 + fileExtension_mp3; 
  println(pathway);
  
  soundeffects[currentSong] = minim.loadFile( pathway ); 
  //
  if ( playlist[currentSong]==null || soundeffects[currentSong]==null ) { 
    println("The Play List or Sound Effects did not load properly");
    printArray(playlist);
    printArray(soundeffects);
  } else {
    playlist[currentSong].play();
    printArray(playlist);
  }
}//End Setup
//
void draw()
{
}//End Draw
//
void mousePressed()
{
}//End Mouse Pressed
//
void keyPressed()
{
}//End Key Pressed
//
//End MAIN Program
