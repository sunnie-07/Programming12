// Sunny Bao
// Block 1-4
// Nov 4, 2024

import fisica.*;
FWorld world;

// COLOR VARIABLES
color white = #FFFFFF;
color blue = #2F3699;
color lightBlue = #B0C7F5;

// PLAYER VARIABLES
FPlayer player;

// MAP VARIABLES
PImage map;
int gridSize = 32;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, qkey, ekey;
boolean upkey, downkey, leftkey, rightkey, spacekey;

void setup() {
  size(600, 600);
  Fisica.init(this);

  map = loadImage("map.png");
  loadWorld(map);
  loadPlayer();
}

//===========================================================================================

void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  
  // load map
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y); // gets the color of image at (x, y)
      if (c == blue) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setFillColor(blue);
        b.setNoStroke();
        b.setStatic(true);
        b.setGrabbable(false);
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
  background(lightBlue);
  world.step();
  world.draw();
  
  player.act();
}
