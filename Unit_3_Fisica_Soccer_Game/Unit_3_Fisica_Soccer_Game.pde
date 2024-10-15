// Sunny Bao
// Block 1-4
// Oct 15, 2024

import fisica.*;

// FISICA
FWorld world;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey; // left player
boolean upkey, downkey, rightkey, leftkey; // right player

void setup() {
  size(800, 600);
  createWorld();
}

void createWorld() {
  // init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}

void draw() {
  
}

void handlePlayerInput() {
  
}
