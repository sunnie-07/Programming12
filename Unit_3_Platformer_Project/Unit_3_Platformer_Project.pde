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

// TERRAIN COLOR VARIABLES
color white = #FFFFFF;
color black = #000000;
color darkGreen = #223440;
color red = #e34545;
color grey = #9c9c9c;
color pink = #ed79e5;
color blue = #00b7ef;
color green = #22b14c;
color brown = #9e733f;
color yellow = #ffeb12;
color purple = #9914ff;
color orange = #f06c1f;
color lime = #00f088;
color darkBlue = #002aff;
color magenta = #e63cc9;
color turquoise = #40edbc;
color lightBrown = #d1b79b;

// COLOR PALETTE
color darkRed = #A23F30;

// TEXT VARIABLES
PFont pixel;

// GIF VARIABLES
Gif introGif;

// BUTTON VARIABLES
Button startBt, instru, instruReturn, pauseBt, pauseReturn;

// PLAYER VARIABLES
FPlayer player;
PImage[] idle;
PImage[] run;
PImage[] jump;
PImage[] action;
PImage life;
PImage heartBox;

// TERRAIN VARIABLES
ArrayList<FGameObject> terrain;
PImage grass, mushGround, stone, vine, water;
PImage buttonOn, buttonOff, gate, checkpoint, ladder;
PImage npcCat1, npcCat2;

// ENEMY VARIABLES
ArrayList<FGameObject> enemies;
PImage[] bat, skeleton;
PImage knifeImg;

// BACKGROUND IMAGE
PImage backgroundImg, mushrooms;

// MAP VARIABLES
PImage[] map;
int numMaps = 2;
int mapIndex = 0;
int gridSize = 32;
float zoom = 2;
int buttonPressed = 3;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, qkey, ekey, zkey;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  Fisica.init(this);
  
  // initialize gifs
  introGif = new Gif("introGif/frame_", "_delay-0.12s.gif", 12, 5, -350, 0, 1200, 800);
  
  // initialize buttons
  pixel = createFont("Daydream.ttf", 80);
  startBt = new Button("START", width/2-150, height-110, 150, 70, darkRed, black);
  instru = new Button("RULES", width/2+150, height-110, 150, 70, darkRed, black);
  instruReturn = new Button("RETURN", 135, 172, 102, 35, black, darkRed);
  pauseBt = new Button("PAUSE", width-68, 32, 102, 35, darkRed, black);
  pauseReturn = new Button("RETURN", width/2-171, height/2-100, 85, 28, black, darkRed);
  
  // player animations
  idle = new PImage[10];
  run = new PImage[4];
  jump = new PImage[1];
  
  // enemy animations
  bat = new PImage[8];
  skeleton = new PImage[6];
  
  // map variables
  map = new PImage[numMaps];
  
  loadImages();
  loadWorld(map[mapIndex]);
  loadPlayer();
}

//===========================================================================================

void loadImages() {
  for(int i = 0; i < numMaps; i++) {
    map[i] = loadImage("map" + i + ".png");
  }
  
  backgroundImg = loadImage("BG.png");
  backgroundImg.resize(2500, 1050);
  mushrooms = loadImage("mushrooms.png");
  
  life = loadImage("gameheart.png");
  
  grass = loadImage("grass.png");
  mushGround = loadImage("mushGround.png");
  stone = loadImage("stone.png");
  vine = loadImage("vine.png");
  water = loadImage("water.png");
  buttonOn = loadImage("buttonOn.png");
  buttonOff = loadImage("buttonOff.png");
  gate = loadImage("gate.png");
  checkpoint = loadImage("checkpoint.png");
  knifeImg = loadImage("knife.png");
  heartBox = loadImage("heartBox.png");
  ladder = loadImage("ladder.png");
  
  grass.resize(gridSize, gridSize);
  mushGround.resize(gridSize, gridSize);
  stone.resize(gridSize, gridSize);
  vine.resize(gridSize, gridSize);
  water.resize(gridSize, gridSize);
  buttonOn.resize(gridSize, gridSize);
  buttonOff.resize(gridSize, gridSize);
  gate.resize(gridSize, gridSize);
  checkpoint.resize(gridSize, gridSize);
  knifeImg.resize(20, 20);
  heartBox.resize(gridSize, gridSize);
  ladder.resize(gridSize, gridSize);
  
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
  
  // enemies
  for(int i = 0; i < 8; i++) {
    bat[i] = loadImage("bat/frame_" + i + "_delay-0.04s.gif");
    bat[i].resize(gridSize, gridSize);
  }
  
  for(int i = 0; i < 6; i++) {
    skeleton[i] = loadImage("skeleton/frame_" + i + "_delay-0.1s.gif");
    skeleton[i].resize(gridSize, gridSize);
  }
  
  npcCat1 = loadImage("npcCat1.png");
  npcCat2 = loadImage("npcCat2.png");
  
  npcCat1.resize(gridSize, gridSize);
  npcCat2.resize(gridSize, gridSize);
}

void loadWorld(PImage img) {
  world = new FWorld(-4000, -4000, 4000, 4000);
  world.setGravity(0, 900);
  
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  
  // load map
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      
      if (c == black) { // grass ground
        b.attachImage(grass);
        b.setFriction(2.5);
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
        b.setFriction(2.5);
        b.setName("stone");
        world.add(b);
      }
      
      else if (c == magenta) { // water
        b.attachImage(water);
        b.setSensor(true);
        b.setName("water");
        world.add(b);
      }
      
      else if (c == turquoise) { // ladder
        FLadder l = new FLadder(x*gridSize, y*gridSize);
        terrain.add(l);
        world.add(l);
      }
      
      else if (c == brown) { // button plate
        FButton bi = new FButton(x*gridSize, y*gridSize);
        terrain.add(bi);
        world.add(bi);
      }
      
      else if (c == pink) { // gate
        FGate g = new FGate(x*gridSize, y*gridSize);
        terrain.add(g);
        world.add(g);
      }
      
      else if (c == blue) { // checkpoint
        FCheckpoint cp = new FCheckpoint(x*gridSize, y*gridSize);
        terrain.add(cp);
        world.add(cp);
      }
      
      else if (c == green) { // vine
        b.attachImage(vine);
        b.setSensor(true);
        b.setName("vine");
        world.add(b);
      }
      
      else if (c == yellow) { // invisible wall
        b.setStatic(true);
        b.setNoFill();
        b.setNoStroke();
        b.setName("invisibleWall");
        world.add(b);
      }
      
      else if (c == orange) { // floating block
        b.setStatic(true);
        b.setNoFill();
        b.setNoStroke();
        b.setFriction(0);
        b.setName("floatBlock");
        world.add(b);
      }
      
      else if (c == purple) { // bat enemy
        FBat bt = new FBat(x*gridSize, y*gridSize);
        enemies.add(bt);
        world.add(bt);
      }
      
      else if (c == lime) { // life box
        FLifeBox hb = new FLifeBox(x*gridSize, y*gridSize);
        terrain.add(hb);
        world.add(hb);
      }
      
      else if (c == darkBlue) { // skeleton enemy
        FSkeleton st = new FSkeleton(x*gridSize, y*gridSize);
        enemies.add(st);
        world.add(st);
      }
      
      else if (c == lightBrown) { // npc cat
        FCat ct = new FCat(x*gridSize, y*gridSize);
        terrain.add(ct);
        world.add(ct);
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
