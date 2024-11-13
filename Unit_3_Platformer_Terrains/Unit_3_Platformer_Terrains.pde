// Sunny Bao
// Block 1-4
// Nov 7, 2024

import fisica.*;
FWorld world;

// COLOR VARIABLES
color white = #FFFFFF;
color black = #000000;
color skyBlue = #AADFFF;
color lightBlue = #99D9EA;
color green = #22b14c;
color brown = #9e733f;
color red = #d12121;  

// PLAYER VARIABLES
FPlayer player;

// TERRAIN VARIABLES
PImage ice, lava, stone, treeTrunk;
PImage treeIntersect, treetopCenter, treetopE, treetopW;

// MAP VARIABLES
PImage map;
int gridSize = 32;
float zoom = 1.5;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, qkey, ekey;
boolean upkey, downkey, leftkey, rightkey, spacekey;

void setup() {
  size(600, 600);
  Fisica.init(this);

  loadImages();
  loadWorld(map);
  loadPlayer();
}

//===========================================================================================

void loadImages() {
  map = loadImage("map.png");
  
  ice = loadImage("ice.jpg");
  lava = loadImage("lava.png");
  stone = loadImage("stone.jpg");
  treeTrunk = loadImage("treeTrunk.png");
  treeIntersect = loadImage("tree_intersect.png");
  treetopCenter = loadImage("treetop_center.png");
  treetopE = loadImage("treetop_e.png");
  treetopW = loadImage("treetop_w.png");
  
  ice.resize(gridSize, gridSize);
  lava.resize(gridSize, gridSize);
  stone.resize(gridSize, gridSize);
  treeTrunk.resize(gridSize, gridSize);
  treeIntersect.resize(gridSize, gridSize);
  treetopCenter.resize(gridSize, gridSize);
  treetopE.resize(gridSize, gridSize);
  treetopW.resize(gridSize, gridSize);
}

void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  
  // load map
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y); // color of current pixel
      color s = img.get(x, y+1); // color below current pixel
      color w = img.get(x-1, y); // color west of current pixel
      color e = img.get(x+1, y); // color east of current pixel
      
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      
      if(c == black) { // stone block
        b.attachImage(stone);
        b.setFriction(4);
        b.setName("stone"); // appears in the contactList in this name
        world.add(b);
      }
      
      else if(c == lightBlue) { // ice block
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }
      
      else if(c == brown) { // tree trunk block
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("tree trunk");
        world.add(b);
      }
      
      else if(c == green) { // tree leaves
        b.setFriction(2);
        b.setName("treetop");
        if(s == brown) { // tree intersection
          b.attachImage(treeIntersect);
          world.add(b);
        }
        else if(w == green & e == green) { // mid piece
          b.attachImage(treetopCenter);
          world.add(b);
        }
        else if(w != green) { // west endcap
          b.attachImage(treetopW);
          world.add(b);
        }
        else if(e != green) { // east endcap
          b.attachImage(treetopE);
          world.add(b);
        }
      }
      
      else if(c == red) { // lava block
        b.attachImage(lava);
        b.setName("lava");
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
  background(skyBlue);
  drawWorld();
  
  player.act();
}

//===========================================================================================

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
