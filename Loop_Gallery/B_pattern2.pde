void pattern2() {  
  float x = 0;
  float y = 0;
  int count = 1;
  
  while(x <= width+100 && y <= height+100) {
    circles(x, y);
    x += 150;
    if(x > width+100) {
      count ++;
      y += 40;
      if(count % 2 == 0) x = 75;
      else if(count % 2 == 1) x = 0;
    }
  }
  
  // buttons
  leftButton();
  rightButton();
}

void pattern2Clicks() {
  if(OnCircle(60, height/2, 35)) { // left button
    mode = PATTERN1;
  } else if(OnCircle(740, height/2, 35)) { // right button
    mode = PATTERN3;
  }
}

void circles(float x, float y) {
  noStroke();
  fill(blue1);
  circle(x, y, 150);
  fill(blue2);
  circle(x, y, 120);
  fill(blue3);
  circle(x, y, 90);
  fill(blue4);
  circle(x, y, 60);
  fill(blue5);
  circle(x, y, 30);
}
