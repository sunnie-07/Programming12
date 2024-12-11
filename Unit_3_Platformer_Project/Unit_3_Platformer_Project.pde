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
color red = #e34545;
color grey = #9c9c9c;
color pink = #ed79e5;
color blue = #00b7ef;
color green = #22b14c;
color brown = #9e733f;

// TEXT VARIABLES
PFont pixel;

// PLAYER VARIABLES
FPlayer player;
PImage[] idle;
PImage[] run;
PImage[] jump;
PImage[] action;
PImage life;

// TERRAIN VARIABLES
ArrayList<FGameObject> terrain;
PImage grass, mushGround, stone, vine;
PImage buttonOn, buttonOff, gate;

// ENEMY VARIABLES
ArrayList<FGameObject> enemies;

// BACKGROUND IMAGE
PImage backgroundImg;

// MAP VARIABLES
PImage map;
int gridSize = 32;
float zoom = 2;

// MAP 1 PUZZLES
int buttonPressed = 3;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, qkey, ekey;

void setup() {
  size(1000, 700);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = GAME;
  
  Fisica.init(this);
  
  // act lists
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  
  // player animations
  idle = new PImage[10];
  run = new PImage[4];
  jump = new PImage[1];
  
  // initialize font
  pixel = createFont("Daydream.ttf", 80);
  
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
  mushGround = loadImage("mushGround.png");
  stone = loadImage("stone.png");
  vine = loadImage("vine.png");
  buttonOn = loadImage("buttonOn.png");
  buttonOff = loadImage("buttonOff.png");
  gate = loadImage("gate.png");
  
  grass.resize(gridSize, gridSize);
  mushGround.resize(gridSize, gridSize);
  stone.resize(gridSize, gridSize);
  vine.resize(gridSize, gridSize);
  buttonOn.resize(gridSize, gridSize);
  buttonOff.resize(gridSize, gridSize);
  gate.resize(gridSize, gridSize);
  
  for(int i = 0; i < 10; i++) { // idle
    idle[i] = loadImage("charSprite/idle" + i + ".png");
    idle[i].resize(gridSize, gridSize);
  }
  
  for(int i = 0; i < 4; i++) { // run
    run[i] = loadImage("charSprite/right" + i + ".png");
    run[i].resize(gridSize, gridSize);
  }
  
  jump[0] = loadImage("charSprite/jump0.png"); // jump
  jump[0].resize(gridSize, gridSize);
  
  action = idle;
}

void loadWorld(PImage img) {
  world = new FWorld(-4000, -4000, 4000, 4000);
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
      
      if (c == black) { // grass ground
        b.attachImage(grass);
        b.setFriction(2);
        b.setName("grass");
        world.add(b);
      }
      
      else if (c == red) { // mushrooms on ground
        b.attachImage(mushGround);
        b.setSensor(true);
        b.setName("mushroom ground");
        world.add(b);
      }
      
      else if (c == grey) { // stone
        b.attachImage(stone);
        b.setFriction(2);
        b.setName("stone");
        world.add(b);
      }
      
      else if (c == brown) { // button plate
        FButtonPlate bi = new FButtonPlate(x*gridSize, y*gridSize);
        terrain.add(bi);
        world.add(bi);
      }
      
      else if (c == pink) { // gate
        FGate g = new FGate(x*gridSize, y*gridSize);
        terrain.add(g);
        world.add(g);
      }
      
      else if (c == blue) { // next level
        
      }
      
      else if (c == green) { // vine
        b.attachImage(vine);
        b.setSensor(true);
        b.setName("vine");
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
