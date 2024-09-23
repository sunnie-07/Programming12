void countdown() {
  countdown --;
  if(countdown == 180) {
    shadowText("3", width/2, height/2, 150, white, black); 
  }
  if(countdown == 121) {
    fill(orange);
    noStroke();
    square(width/2, height/2, 125);
  }
  if(countdown == 120) {
    shadowText("2", width/2, height/2, 150, white, black); 
  }
  if(countdown == 61) {
    fill(orange);
    square(width/2, height/2, 125);
  }
  if(countdown == 60) {
    shadowText("1", width/2, height/2, 150, white, black);
  }
  if(countdown <= 0) {
    mode = GAME; 
  }
}
