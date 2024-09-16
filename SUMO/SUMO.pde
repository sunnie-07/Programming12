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

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  mode = GAME;
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
