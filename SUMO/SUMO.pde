// Sunny Bao
// Block 1-4
// Sep 16, 2024

// MODE VARIABLES
int mode;
final int INTRO = 0;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
final int COUNTDOWN = 5;

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
float angle;

// SCORE VARIABLES
float gameStart, countdown;
float scoreTimer;
int redScore, blueScore;
int numRounds;

// KEYBOARD VARIABLES
boolean akey, lkey;
int redTimer, blueTimer;

// TEXT VARIABLES
PFont candyBeans;

void setup() {
  size(1000, 600);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  // initiate variables
  reset();
  
  // text
  candyBeans = createFont("CandyBeans.otf", 100);
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
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == COUNTDOWN) {
    countdown();
  } else {
    println("Error: Mode = " + mode);
  }
}
