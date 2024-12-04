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
final int GAMEOVER = 3;

// COLOR VARIABLES
color white = #FFFFFF;

// PLAYER VARIABLES
FPlayer player;
PImage[] action;
PImage life;

// TERRAIN VARIABLES
ArrayList<FGameObject> terrain;

// ENEMY VARIABLES
ArrayList<FGameObject> enemies;

// BACKGROUND IMAGE
PImage backgroundImg;

// MAP VARIABLES
PImage map;
int gridSize = 32;
float zoom = 1.5;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, qkey, ekey;

void setup() {
  size(1400, 900);
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
  life = loadImage("gameheart.png");
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
    game();
  } else if (mode == GAME) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}

//===========================================================================================

void actWorld() {
  player.act();
  for(int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for(int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void drawWorld() {
  drawBG();
  
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
  
  // display lives
  if(player.lives == 3) {
    image(life, 20, 10, 35, 36);
    image(life, 55, 10, 35, 36);
    image(life, 90, 10, 35, 36);
  } else if(player.lives == 2) {
    image(life, 20, 10, 35, 36);
    image(life, 55, 10, 35, 36);
  } else if(player.lives == 1) {
    image(life, 20, 10, 35, 36);
  } else { }
}

void drawBG() {
  pushMatrix();
  translate(-player.getX()/2, -player.getY()/2);
  scale(1.2);
  image(backgroundImg, 0, 0, 2.5*height, height);
  popMatrix();
}
