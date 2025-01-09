// Sunny Bao
// Block 1-4
// Jan 9, 2025

// KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey;

// CAMERA VARIABLES
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;

void setup() {
  size(800, 600, P3D);
  textureMode(NORMAL);
  
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
}

void draw() {
  background(0);
  drawFloor();
  controlCamera();
}

void drawFloor() {
  stroke(255);
  for (int i = -2000; i <= 2000; i += 100) {
    line(i, height, -2000, i, height, 2000);
    line(-2000, height, i, 2000, height, i);
  }
}

void controlCamera() {
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  if (wkey) eyeZ -= 10;
  if (skey) eyeZ += 10;
  if (akey) eyeX -= 10;
  if (dkey) eyeX += 10;
  
  focusX = eyeX;
  focusY = eyeY;
  focusZ = eyeZ - 10;
}
