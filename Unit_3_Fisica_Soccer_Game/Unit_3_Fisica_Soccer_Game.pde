// Sunny Bao
// Block 1-4
// Oct 15, 2024

import fisica.*;

// MODE VARIABLES
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int PLAYERPAUSE = 4;
final int COUNTDOWN = 5;

// COLOR VARIABLES
color green = #499F68;
color lightBlue = #C1E4FF;

// FISICA
FWorld world;

// ASSETS
PImage leftP;
PImage rightP;

FPoly ground;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey; // left player
boolean upkey, downkey, rightkey, leftkey; // right player

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  mode = GAME;
  
  // initialize variables
  reset();
  
  // load resources
  leftP = loadImage("leftPlayer.png");
  rightP = loadImage("rightPlayer.png");
  
  // initialize world
  createWorld();
  
  // add ground to world
  makeGround();
}

//===========================================================================================

void createWorld() {
  // init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
}

void makeGround() {
  ground = new FPoly();
  
  // vertices of the platform
  ground.vertex(0, height);
  ground.vertex(width, height);
  ground.vertex(width, height-50);
  ground.vertex(0, height-50);
  
  // define properties
  ground.setStatic(true);
  ground.setFillColor(green);
  ground.setNoStroke();
  ground.setFriction(0.2);
  
  world.add(ground);
}

//===========================================================================================

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PLAYERPAUSE) {
    playerpause();
  } else if (mode == COUNTDOWN) {
    countdown();
  } else {
    println("Error: Mode = " + mode);
  }
}

void handlePlayerInput() {
  
}
