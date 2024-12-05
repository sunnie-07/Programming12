// Sunny Bao
// Block 1-4
// Dec 3, 2024

import fisica.*;
FWorld world;

// MODE VARIABLES
int mode;
final int INTRO = 0;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

// COLOR VARIABLES
color white = #FFFFFF;
color black = #000000;
color darkGreen = #223440;

// PLAYER VARIABLES
FPlayer player;
PImage[] action;
PImage life;

// TERRAIN VARIABLES
ArrayList<FGameObject> terrain;
PImage grass;

// ENEMY VARIABLES
ArrayList<FGameObject> enemies;

// BACKGROUND IMAGE
PImage backgroundImg;

// MAP VARIABLES
PImage map;
int gridSize = 32;
float zoom = 2;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, qkey, ekey;

void setup() {
  size(1000, 700);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = GAME;
  
  Fisica.init(this);
  
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  
  loadImages();
  loadWorld(map);
  loadPlayer();
}

//===========================================================================================

void loadImages() {
  map = loadImage("map.png");
  backgroundImg = loadImage("BG.png");
  backgroundImg.resize(2500, 1050);
  
  life = loadImage("gameheart.png");
  
  grass = loadImage("grass.png");
  
  grass.resize(gridSize, gridSize);
}

void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  
  // load map
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      color s = img.get(x, y+1);
      color w = img.get(x-1, y);
      color e = img.get(x+1, y);
      
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      
      if (c == black) {
        b.attachImage(grass);
        b.setFriction(2);
        b.setName("grass");
        world.add(b);
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

//===========================================================================================

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == INSTRUCTIONS) {
    instructions();
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
