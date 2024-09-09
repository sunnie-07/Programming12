void cat(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  
  // face and ears
  base();
  
  // eyes
  eye(-46, -8);
  eye(46, -8);
  
  // mouth
  mouth();

  // wisker
  wisker(90, 0, -8);
  wisker(90, 15, 8);
  wisker(-140, -8, 8);
  wisker(-140, 20, -8);
  
  popMatrix();
}

void base() {
  noStroke();
  fill(orange);
  
  // face
  ellipse(0, 0, 250, 220);
  
  // ears
  triangle(-110, -20, -50, -100, -120, -125); 
  fill(pink);
  triangle(-105, -55, -60, -95, -111, -114);
  fill(orange);
  triangle(110, -20, 50, -100, 120, -125);
  fill(pink);
  triangle(105, -55, 60, -95, 111, -114);
}

void eye(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  noStroke();
  fill(blue);
  circle(0, 0, 30);
  fill(white);
  circle(-5, -5, 9);
  
  popMatrix();
}

void mouth() {
  fill(darkBrown);
  triangle(-12, 12, 12, 12, 0, 26);
  
  stroke(darkBrown);
  strokeWeight(5);
  line(0, 22, -14, 34);
  line(0, 22, 14, 34);
}

void wisker(float x, float y, float r) {
  pushMatrix();
  translate(x, y);
  rotate(radians(r));
  
  line(0, 0, 50, 0);
  
  popMatrix();
}
