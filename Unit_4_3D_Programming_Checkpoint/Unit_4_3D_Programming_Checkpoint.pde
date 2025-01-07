// Sunny Bao
// Block 1-4
// Jan 6, 2025

// COLOR VARIABLES
color orange = #F7BD98;

// ROTATION VARIABLES
float rotx, roty;


void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(255);
  
  ball(width/2-200, height/2-200, 0, orange, 80);
  ball(width/2, height/2, 0, orange, 80);
  ball(width/2+200, height/2-200, 0, orange, 80);
  ball(width/2-200, height/2+200, 0, orange, 80);
  ball(width/2+200, height/2+200, 0, orange, 80);
  
  cube(width/2, height/2-200, 0, orange, 100);
  cube(width/2-200, height/2, 0, orange, 100);
  cube(width/2+200, height/2, 0, orange, 100);
  cube(width/2, height/2+200, 0, orange, 100);
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z); // (x, y, z) - z is towards or away from the screen
  
  rotateX(rotx); // rotate around x-axis
  rotateY(roty); // rotate around y-axis
  // rotateZ(); // rotate around z-axis
  
  fill(c);
  stroke(0);
  strokeWeight(2);
  box(size); // rectangular prism (width, height, depth) or cube (side length)
  popMatrix();
}

void ball(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  
  rotateX(rotx);
  rotateY(roty);
  
  fill(c);
  strokeWeight(1);
  sphere(size);
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
