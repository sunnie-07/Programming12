void pattern1() {
  background(pink);
  noStroke();
  fill(darkPink);
  
  float x = 10;
  float y = height-10;
  float d = 10;
  
  while(x <= width && y >= -100) {
    circle(x, y, d);
    x += 60;
    if(x > width) {
      x = 10;
      y -= 60;
      d += 5;
    }
  }
  
  // buttons
  leftButton();
  rightButton();
}

void pattern1Clicks() {
  if(OnCircle(60, height/2, 35)) { // left button
    mode = PATTERN3;
  } else if(OnCircle(740, height/2, 35)) { // right button
    mode = PATTERN2;
  }
}
