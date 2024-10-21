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
color lightGreen = #B9D8A4;
color lightBlue = #C1E4FF;
color brown = #C99E70;
color white = #FFFFFF;
color black = #000000;
color darkBlue = #6074D3;
color turqoise = #17BCB8;

// FISICA
FWorld world;

// ASSETS
PImage leftP;
PImage rightP;
PImage soccerGrid;
PImage roundSoccer;
PImage squareSoccer;

FPoly ground;
FPoly leftNet;
FPoly rightNet;

boolean drawAssets;

// PLAYERS AND BALLS
FBox leftPlayer;
FBox rightPlayer;

FBox leftNetGrid;
FBox leftNetSensor;

FBox rightNetGrid;
FBox rightNetSensor;

boolean squareBall;
FCircle roundSoccerB;
FBox squareSoccerB;
float ballTimer;

// SCORES
int leftPScore, rightPScore;

// KEYBOARD VARIABLES
boolean wkey, akey, dkey; // left player
boolean upkey, rightkey, leftkey; // right player

// GIF VARIABLES
Gif soccerGif, skyGif;

// BUTTON VARIABLES
PFont pixel;
Button roundB, squareB;
Button pause, returnToGame;

void setup() {
  size(1400, 700);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  // initialize variables
  drawAssets = true;
  squareBall = false;
  
  leftPScore = 0;
  rightPScore = 0;
  
  ballTimer = 1000;
  
  // initialize gifs
  soccerGif = new Gif("soccerGif/frame_", "_delay-0.1s.gif", 8, 2, 0, 0, width, height);
  skyGif = new Gif("skyGif/frame_", "_delay-0.08s.gif", 48, 2, 0, 0, width, height);
  
  // initialize buttons
  pixel = createFont("Daydream.ttf", 80);
  roundB = new Button("ROUND SOCCER", width/2-210, height-65, 300, 40, lightGreen, black);
  squareB = new Button("SQUARE SOCCER", width/2+210, height-65, 300, 40, lightGreen, black);
  pause = new Button("PAUSE", width/2, 35, 175, 38, lightGreen, black);
  returnToGame = new Button("RETURN", width/2-260, height/2-160, 200, 50, lightGreen, black);
  
  // load resources
  leftP = loadImage("leftPlayer.png");
  rightP = loadImage("rightPlayer.png");
  soccerGrid = loadImage("grid.png");
  roundSoccer = loadImage("roundBall.png");
  squareSoccer = loadImage("squareBall.png");
  
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
  world.setGravity(0, 900);
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
  } else {
    println("Error: Mode = " + mode);
  }
}
