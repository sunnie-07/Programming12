void game() {
  // background
  background(lightOrange);
  strokeWeight(15);
  stroke(white);
  fill(orange);
  circle(width/2, height/2, 550);
  
  // score board
  noStroke();
  fill(white);
  circle(width/2, 0, 120);
  
  // exit button
  circle(width/2, height, 120);
  
  // wrestlers
  redWrestler(redX);
  blueWrestler(blueX);
  
  // move red wrestler
  if(akey == true) {
    redX += 5.5;
    redTimer --;
    if(redTimer <= 0) {
      akey = false;
    }
  }
  
  // move blue wrestler
  if(lkey == true) {
    blueX -= 5.5;
    blueTimer --;
    if(blueTimer <= 0) {
      lkey = false;
    }
  }
}

void gameClicks() {
  
}

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
  ellipse(redArm1, -61, 90, 32);
  ellipse(redArm2, 61, 90, 32);
  
  // head
  circle(-50, 0, 110);
  fill(black);
  circle(-115, 0, 50);
  
  noStroke();
  fill(red);
  triangle(-75, 0, -123, -16, -123, 16);
  
  strokeWeight(10);
  stroke(black);
  fill(black);
  ellipse(-75, 0, 50, 82);
  
  // face
  circle(-30, -18, 8);
  circle(-30, 18, 8);
  
  popMatrix();
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
  ellipse(blueArm1, -61, 90, 32);
  ellipse(blueArm2, 61, 90, 32);
  
  // head
  circle(50, 0, 110);
  fill(black);
  circle(115, 0, 50);
  
  noStroke();
  fill(blue);
  triangle(75, 0, 123, -16, 123, 16);
  
  strokeWeight(10);
  stroke(black);
  fill(black);
  ellipse(75, 0, 50, 82);
  
  // face
  circle(30, -18, 8);
  circle(30, 18, 8);
  
  popMatrix();
}
