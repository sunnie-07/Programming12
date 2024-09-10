void pattern1() {
  background(pink);
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
