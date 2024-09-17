// Sunny Bao
// Block 1-4
// Sep 16, 2024

// MODE VARIABLES
int mode;
final int INTRO = 0;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int GAMEOVER = 3;

// COLOR PALETTE
color lightOrange = #ffd166;
color orange = #F5AE34;
color white = #FFFFFF;
color beige = #f8dda4;
color black = #000000;
color red = #FA6560;
color blue = #60AEFA;
color grey = #555555;

// WRESTLER VARIABLES
float redX, blueX;
float redArm1, redArm2;
float blueArm1, blueArm2;

// SCORE VARIABLES
int redScore, blueScore;

// KEYBOARD VARIABLES
boolean akey, lkey;
int redTimer, blueTimer;

void setup() {
  size(1000, 600);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  mode = GAME;
  
  // initiate variables
  // red wrestler
  redX = width/2-185;
  redArm1 = redArm2 = 14;
  redTimer = 3;
  
  // blue wrestler
  blueX = width/2+185;
  blueArm1 = blueArm2 = -14;
  blueTimer = 5;
  
  // scores
  redScore = blueScore = 0;
}

void draw() {
  if (mode == INTRO) {  // mode framework
    intro();
  } else if (mode == INSTRUCTIONS) {
    instructions();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
