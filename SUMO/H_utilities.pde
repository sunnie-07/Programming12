void shadowText(String text, float x, float y, float size, color c1, color c2) {
  textSize(size);
  fill(c2, 160);
  text(text, x+6.5, y+6.5);
  text(text, x+4, y+4);
  fill(c1);
  text(text, x, y);
}

boolean collide() {
  return dist(redX, height/2, blueX, height/2) <= 138;
}

void collisionEffects(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(7);
  stroke(black);
  
  while(angle <= 360) {
    line(32, 0, 52, 0);
    angle += 45;
    rotate(radians(angle));
  }
  if(angle > 360) angle = 0;
  
  popMatrix();
}

void reset() {
  // red wrestler
  redX = width/2-170;
  redTimer = 2;
  
  // blue wrestler
  blueX = width/2+170;
  blueTimer = 2;
  
  // scores
  gameStart = 3;
  countdown = 182;
  scoreTimer = 60;
  redScore = blueScore = 0;
  numRounds = 3;
  
  angle = 0;
}
