void pattern3() {
  background(lightOrange);
  leftButton();
  rightButton();
}

void pattern3Clicks() {
  if(OnCircle(60, height/2, 35)) { // left button
    mode = PATTERN2;
  } else if(OnCircle(740, height/2, 35)) { // right button
    mode = PATTERN1;
  }
}
