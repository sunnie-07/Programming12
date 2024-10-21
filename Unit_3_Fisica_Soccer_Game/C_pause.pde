void pause() {
  stroke(black);
  strokeWeight(8);
  fill(green);
  rect(width/2, height/2, 750, 400, 20);
  
  shadowText("PAUSE", width/2, height/2-12, 80, lightGreen, black);
  returnToGame.show();
}

void pauseClicks() {
  if(returnToGame.overRect()) mode = GAME;
}
