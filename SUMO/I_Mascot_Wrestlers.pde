void mascotRedWrestler() {
  pushMatrix();
  translate(158, 315);
  rotate(radians(90));
 
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

void mascotBlueWrestler() {
  pushMatrix();
  translate(width-158, 303);
  rotate(radians(-90));
  
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
