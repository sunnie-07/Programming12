void pattern2() {
  background(lightBlue);
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
