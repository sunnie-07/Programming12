void keyPressed() {
  // red wrestler
  if(redTimer > 0) {
    if(key == 'a' || key == 'A') akey = true;
  }
  
  // blue wrestler
  if(blueTimer > 0) {
    if(key == 'l' || key == 'L') lkey = true;
  }
}

void keyReleased() {
  // red wrestler
  if(key == 'a' || key == 'A') {
    akey = false;
    redTimer = 5;
  }
  
  // blue wrestler
  if(key == 'l' || key == 'L') {
    lkey = false;
    blueTimer = 5;
  }
}
