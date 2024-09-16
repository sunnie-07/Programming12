void game() {
  // background
  background(lightOrange);
  strokeWeight(13);
  stroke(white);
  fill(orange);
  circle(width/2, height/2, 450);
  
  // left wrestler
  redWrestler(width/2-100);
}

void gameClicks() {
  
}

void redWrestler(float x) {
  pushMatrix();
  translate(x, height/2);
  
  // body
  fill(beige);
  strokeWeight(10);
  stroke(black);
  circle(0, 0, 140);
  
  // head
  circle(-50, 0, 110);
  fill(black);
  ellipse(-75, 0, 50, 85);
  
  popMatrix();
}
