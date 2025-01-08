// Sunny Bao
// Block 1-4
// Jan 8, 2025

// COLOR VARIABLES
color orange = #F7BD98;

// IMAGE VARIABLES
PImage diamond;
PImage grassSide, grassTop, grassBottom;

// ROTATION VARIABLES
float rotx, roty;

void setup() {
  size(800, 800, P3D);
  textureMode(NORMAL);
  
  diamond = loadImage("Diamond.png");
  grassSide = loadImage("Grass_Block_Side.png");
  grassTop = loadImage("Grass_Block_Top_C.png");
  grassBottom = loadImage("Dirt_(texture)_JE2_BE2.png");
}

void draw() {
  background(255);
  
  // block(width/2, height/2, 0, 200, diamond, diamond, diamond, diamond, diamond, diamond);
  block(width/2, height/2, 0, 200, grassTop, grassBottom, grassSide, grassSide, grassSide, grassSide);
}

void block(float x, float y, float z, float s, PImage top, PImage bottom, PImage front, PImage back, PImage left, PImage right) {
  pushMatrix();
  translate(x, y, z);
  scale(s); // draw in terms of pixel size (1) and magnify with scale
  noStroke();
  
  rotateX(rotx);
  rotateY(roty);
  
  // top
  beginShape(QUADS); // groups of four vertexes
  texture(top);
  
  //    (x, y, z, textureX, textureY)
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  endShape();
  
  // bottom
  beginShape(QUADS);
  texture(bottom);
  
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  // front
  beginShape(QUADS);
  texture(front);
  
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  // back
  beginShape(QUADS);
  texture(back);
  
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  endShape();
  
  // left
  beginShape(QUADS);
  texture(left);
  
  vertex(0, 0, 1, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  // right
  beginShape(QUADS);
  texture(right);
  
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);
  
  endShape();
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
