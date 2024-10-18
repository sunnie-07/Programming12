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
color brown = #C99E70;

// FISICA
FWorld world;

// ASSETS
PImage leftP;
PImage rightP;
PImage soccerGrid;

FPoly ground;
FPoly leftNet;
FPoly rightNet;

boolean drawAssets;

// PLAYERS
FBox leftPlayer;
FBox rightPlayer;

// KEYBOARD VARIABLES
boolean wkey, akey, dkey; // left player
boolean upkey, rightkey, leftkey; // right player

void setup() {
  size(1400, 700);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = GAME;
  
  // initialize variables
  drawAssets = true;
  
  // load resources
  leftP = loadImage("leftPlayer.png");
  rightP = loadImage("rightPlayer.png");
  soccerGrid = loadImage("grid.png");
  
  // initialize world
  createWorld();
  
  // add assets to world
  makeGround();
  makeLeftNet();
  makeRightNet();
}

//===========================================================================================

void createWorld() {
  // init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges(lightBlue);
}

void makeGround() {
  ground = new FPoly();
  
  // vertices of platform
  ground.vertex(0, height);
  ground.vertex(width, height);
  ground.vertex(width, height-55);
  ground.vertex(0, height-55);
  
  // define properties
  ground.setStatic(true);
  ground.setFillColor(green);
  ground.setNoStroke();
  ground.setFriction(0.2);
  
  world.add(ground);
}

void makeLeftNet() {
  leftNet = new FPoly();
  
  // vertices of left net
  leftNet.vertex(40, height-55);
  leftNet.vertex(160, height-55);
  leftNet.vertex(160, height-68.5);
  leftNet.vertex(55, height-68.5);
  leftNet.vertex(55, height-260);
  leftNet.vertex(150, height-260);
  leftNet.vertex(150, height-275);
  leftNet.vertex(40, height-275);
  
  // define properties
  leftNet.setStatic(true);
  leftNet.setGrabbable(false);
  leftNet.setFillColor(brown);
  leftNet.setNoStroke();
  leftNet.setFriction(0.2);
  
  world.add(leftNet);
}

void makeRightNet() {
  rightNet = new FPoly();
  
  // vertices of right net
  rightNet.vertex(width-40, height-55);
  rightNet.vertex(width-160, height-55);
  rightNet.vertex(width-160, height-68.5);
  rightNet.vertex(width-55, height-68.5);
  rightNet.vertex(width-55, height-260);
  rightNet.vertex(width-150, height-260);
  rightNet.vertex(width-150, height-275);
  rightNet.vertex(width-40, height-275);
  
  // define properties
  rightNet.setStatic(true);
  rightNet.setGrabbable(false);
  rightNet.setFillColor(brown);
  rightNet.setNoStroke();
  rightNet.setFriction(0.2);
  
  world.add(rightNet);
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
