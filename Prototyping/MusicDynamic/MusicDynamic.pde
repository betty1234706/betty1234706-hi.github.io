
//Library - Minim
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;  //initates entire class
int numberOfSongs = 1; // Best Practice
int numberOfSoundEffects = 1; // Fixed: added 's' to match usage below
AudioPlayer[] playlist = new AudioPlayer[ numberOfSongs ];
AudioPlayer[] soundeffects = new AudioPlayer[ numberOfSoundEffects ]; // Fixed: changed size variable to match
int currentSong = numberOfSongs - numberOfSongs; //ZERO, Math Property
//
void setup() {
  //Display
  size( 700, 500); 
  int appwidth = width; //Best Practice
  int appHeight = height;
  //
  //Music Loading - STRUCTURED Review
  minim = new Minim(this); //Mandatory
  
  String upArrow = "..";
  String open = "/";
  String musicFolder = "Music"; 
  String soundEffectsFolder = "Sound Effects"; 
  String dependanciesFolder = "Dependencies"; 
  String songName1 = "Swim";
  String soundEffect1 = "The_Simplest_Sting";
  String fileExtension_mp3 = ".mp3";
  //
  String musicDirectory = upArrow + open + upArrow + open + dependanciesFolder + open + musicFolder + open ; 
  String soundEffectsDirectory = upArrow + open + upArrow + open + dependanciesFolder + open + soundEffectsFolder + open ; 
  String pathway = musicDirectory + songName1 + fileExtension_mp3; 
  
  println(pathway);
  
  // Fixed: 'playlist' was lowercase in declaration but 'playList' in usage
  playlist[ currentSong ] = minim.loadFile( pathway ); 
  
  pathway = soundEffectsDirectory + soundEffect1 + fileExtension_mp3; 
  println(pathway);
  
  // Fixed: 'soundeffects' was lowercase in declaration but 'soundEffects' in usage
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
