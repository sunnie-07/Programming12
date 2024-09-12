void pattern1() {
  background(#ffe5ec);
  noStroke();
  fill(#ff8fab);
  
  float x = 3;
  float y = height-10;
  float d = 10;
  
  while(x <= width && y >= -100) {
    circle(x, y, d);
    x += 61;
    if(x > width) {
      x = 3;
      y -= 61;
      d += 5.3;
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
