// Sunny Bao
// Block 1-4
// Jan 9, 2025

import java.awt.Robot;

// COLOR VARIABLES
color white = #FFFFFF;
color black = #000000; // wook plank
color dullBlue = #7092be; // red brick

// TEXTURES
PImage wood, brick;

// MAP VARIABLES
int gridSize;
PImage map;

// GAME OBJECT VARIABLES
ArrayList<GameObject> objects;

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, spacekey;

// CAMERA VARIABLES
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float LRHeadAngle, UDHeadAngle;
Robot rbt;
boolean skipFrame;

void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);

  wkey = akey = skey = dkey = false;

  eyeX = width/2;
  eyeY = 8.5*height/10;
  eyeZ = height/2;
  focusX = width/2;
  focusY = height/2;
  focusZ = height/2-100;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;

  LRHeadAngle = radians(270);
  noCursor();
  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;

  // initialize map
  map = loadImage("3Dmap.png");
  gridSize = 100;

  // initialize texture
  wood = loadImage("wood.png");
  brick = loadImage("brick.png");
  
  // game objects
  objects = new ArrayList();
}

void draw() {
  background(0);
  
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
  drawFocalPoint();
  move();
  drawFloor(-2000, 2000, height, gridSize); // floor
  drawFloor(-2000, 2000, height-gridSize*4, gridSize); // ceiling
  drawMap();
  
  // game objects
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) objects.remove(i);
    else i++;
  }
  
  if (spacekey) {
    Snowball b = new Snowball();
    objects.add(b);
  }
  
  Rain r = new Rain();
  objects.add(r);
}
