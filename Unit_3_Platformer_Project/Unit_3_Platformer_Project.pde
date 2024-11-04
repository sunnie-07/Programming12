// Sunny Bao
// Block 1-4
// Nov 4, 2024

import fisica.*;
FWorld world;

// COLOR VARIABLES
color white = #FFFFFF;
color blue = #2F3699;
color lightBlue = #B0C7F5;

// MAP VARIABLES
PImage map;
int gridSize = 32;

void setup() {
  size(600, 600);
  background(lightBlue);
  Fisica.init(this);

  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map = loadImage("map.png");

  // load map
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y); // gets the color of image at (x, y)
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

void draw() {
  world.step();
  world.draw();
}
