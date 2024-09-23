void gameover() {
  if(redScore > blueScore) {
    background(red);
    shadowText("RED", width/2, height/2-55, 112, white, black);
    shadowText("WIN", width/2, height/2+55, 112, white, black);
  } else {
    background(blue);
    shadowText("BLUE", width/2, height/2-55, 112, white, black);
    shadowText("WIN", width/2, height/2+55, 112, white, black);
  }
}

void gameoverClicks() {
  mode = GAME;
  reset();
}
