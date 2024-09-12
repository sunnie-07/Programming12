void pattern3() {
  pushMatrix();
  translate(width/2, height/2);
  
  noStroke();
  int count = 1;
  float sides = 800;
  
  while(sides >= 10) {
    if(count % 2 == 0) {
      fill(#d9ed92);
      square(0, 0, sides);
    } else if(count % 2 == 1) {
      fill(#52b69a);
      square(0, 0, sides);
    }
    count++;
    rotate(radians(3.5));
    sides -= 25;
  }
  
  popMatrix();
  
  // buttons
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
