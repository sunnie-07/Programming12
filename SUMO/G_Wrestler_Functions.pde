void redWrestler(float x) {
  pushMatrix();
  translate(x, height/2);
  
  // shadow
  noStroke();
  fill(grey, 110);
  ellipse(-24, 15, 140, 125);
  
  // body
  fill(beige);
  strokeWeight(10);
  stroke(black);
  circle(0, 0, 135);
  
  // arms
  ellipse(14, -61, 90, 32);
  ellipse(14, 61, 90, 32);
  
  // head
  circle(-50, 0, 110);
  
  // face
  fill(black);
  circle(-31, -18, 8);
  noStroke();
  fill(beige);
  square(-42, -18, 20);
  
  strokeWeight(10);
  stroke(black);
  fill(black);
  circle(-31, 18, 8);
  noStroke();
  fill(beige);
  square(-42, 18, 20);
  
  // head cont.
  fill(black);
  strokeWeight(10);
  stroke(black);
  circle(-115, 0, 50);
  
  noStroke();
  fill(red);
  triangle(-75, 0, -123, -16, -123, 16);
  
  strokeWeight(10);
  stroke(black);
  fill(black);
  ellipse(-75, 0, 50, 82);
  
  popMatrix();
}

void moveRedWrestler() {
  // move red wrestler
  if(akey == true) {
    redX += 12;
    redTimer --;
    if(redTimer <= 0) {
      akey = false;
    }
  }
  
  // collision
  if(collide() && akey == true && redTimer > 0) {
    blueX = redX + 158;
    collisionEffects((redX + blueX)/2, height/2); 
  }
  
  if(redX > blueX - 140) {
    redX = blueX - 140;
  }
}

void blueWrestler(float x) {
  pushMatrix();
  translate(x, height/2);
  
  // shadow
  noStroke();
  fill(grey, 110);
  circle(-21, 15, 135);
  
  // body
  fill(beige);
  strokeWeight(10);
  stroke(black);
  circle(0, 0, 135);
  
  // arms
  ellipse(-14, -61, 90, 32);
  ellipse(-14, 61, 90, 32);
  
  // head
  circle(50, 0, 110);
  
  // face
  fill(black);
  circle(31, -18, 8);
  noStroke();
  fill(beige);
  square(43, -18, 20);
  
  strokeWeight(10);
  stroke(black);
  fill(black);
  circle(31, 18, 8);
  noStroke();
  fill(beige);
  square(43, 18, 20);
  
  // head cont.
  fill(black);
  strokeWeight(10);
  stroke(black);
  circle(115, 0, 50);
  
  noStroke();
  fill(blue);
  triangle(75, 0, 123, -16, 123, 16);
  
  strokeWeight(10);
  stroke(black);
  fill(black);
  ellipse(75, 0, 50, 82);
  
  popMatrix();
}

void moveBlueWrestler() {
  // move blue wrestler
  if(lkey == true) {
    blueX -= 12;
    blueTimer --;
    if(blueTimer <= 0) {
      lkey = false;
    }
  }
  
  if(collide() && lkey == true && blueTimer > 0) {
    redX = blueX - 158;
    collisionEffects((redX + blueX)/2, height/2); 
  }
  
  if(blueX < redX + 140) {
    blueX = redX + 140;
  }
}
