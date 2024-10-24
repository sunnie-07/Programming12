// Sunny Bao
// Block 1-4
// Oct 9, 2024

import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

// BUTTON VARIABLES
Button gravityBtn;
Button FBodyBtn;
int gravity;
boolean makeFBodies;

//assets
PImage redBird;
PImage grassImg;

FPoly topPlatform; 
FPoly bottomPlatform;

float cloudX1;
float cloudX2;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();
  
  //load resources
  redBird = loadImage("red-bird.png");
  grassImg = loadImage("grassBlock.png");
  
  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
  
  // initialize cloud variables
  cloudX1 = -200;
  cloudX2 = -200;
  
  // initialize button variables
  gravityBtn = new Button("GRAVITY", width*0.1, height*0.9, 100, 60, green, blue);
  FBodyBtn = new Button("FBODIES", width*0.18, height*0.9, 100, 60, green, blue);
  gravity = 900;
  makeFBodies = true;
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.4, height*0.4);
  topPlatform.vertex(width*0.4, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(550, height*0.55);
  bottomPlatform.vertex(570, height*0.55);
  bottomPlatform.vertex(570, height*0.9);
  bottomPlatform.vertex(width-470, height*0.9);
  bottomPlatform.vertex(width-470, height*0.55);
  bottomPlatform.vertex(width-450, height*0.55);
  bottomPlatform.vertex(width-450, height*0.92);
  bottomPlatform.vertex(550, height*0.92);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  
  if (frameCount % 20 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
    makeGrass();
  }
  
  world.step();  //get box2D to calculate all the forces and new positions
  
  noStroke();
  fill(255);
  ellipse(cloudX1, 200, 140, 85);
  cloudX1 += 2.5;
  if(cloudX1 > width + 200) cloudX1 = -200;
  
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  
  ellipse(cloudX2, 400, 160, 100);
  cloudX2 += 4;
  if(cloudX2 > width + 200) cloudX2 = -200;
  
  // buttons
  gravityBtn.show();
  FBodyBtn.show();
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  if(makeFBodies) world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  if(makeFBodies) world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBlob box = new FBlob();
  box.setAsCircle(random(width), -5, 60, 4);
  
  // set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  
  //set physical properties
  box.setDensity(0.4);
  box.setFriction(1);
  box.setRestitution(0.9);
  if(makeFBodies) world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  if(makeFBodies) world.add(bird);
}

//===========================================================================================

void makeGrass() {
  FBox grass = new FBox(45, 45);
  grass.setPosition(random(width), -5);
  
  // set visuals
  grass.attachImage(grassImg);
  grassImg.resize(45, 45);
  
  // set physical properties
  grass.setDensity(0.2);
  grass.setFriction(1);
  grass.setRestitution(1);
  if(makeFBodies) world.add(grass);
}
