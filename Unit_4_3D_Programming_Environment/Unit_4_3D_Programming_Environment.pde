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

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey;

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
  eyeY = 8.4*height/10;
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
}

void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFocalPoint();
  controlCamera();
  drawFloor(-2000, 2000, height, 100); // floor
  drawFloor(-2000, 2000, height-gridSize*3, 100); // ceiling
  drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == black) { // wood plank
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, wood, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, wood, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, wood, gridSize);
      }
      else if (c == dullBlue) { // red brick
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, brick, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, brick, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, brick, gridSize);
      }
    }
  }
}

void drawFloor(float x, float y, float z, float n) {
  stroke(255);
  for (int i = -2000; i <= 2000; i += n) {
    line(i, z, x, i, z, y);
    line(x, z, i, y, z, i);
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void controlCamera() {
  if (wkey) {
    eyeX += cos(LRHeadAngle)*12;
    eyeZ += sin(LRHeadAngle)*12;
  }
  if (skey) {
    eyeX -= cos(LRHeadAngle)*12;
    eyeZ -= sin(LRHeadAngle)*12;
  }
  if (akey) {
    eyeX -= cos(LRHeadAngle + PI/2)*12;
    eyeZ -= sin(LRHeadAngle + PI/2)*12;
  }
  if (dkey) {
    eyeX += cos(LRHeadAngle + PI/2)*12;
    eyeZ += sin(LRHeadAngle + PI/2)*12;
  }

  if (skipFrame == false) {
    LRHeadAngle += (mouseX - pmouseX)*0.008;
    UDHeadAngle += (mouseY - pmouseY)*0.008;
  }

  if (UDHeadAngle > PI/2.5) UDHeadAngle = PI/2.5;
  if (UDHeadAngle < -PI/2.5) UDHeadAngle = -PI/2.5;

  focusX = eyeX + cos(LRHeadAngle)*300;
  focusZ = eyeZ + sin(LRHeadAngle)*300;
  focusY = eyeY + tan(UDHeadAngle)*300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}
