void pause() {
  strokeWeight(5);
  fill(darkRed);
  rect(width/2, height/2, 450, 250, 25);
  
  shadowText("PAUSED", width/2, height/2-6, 40, white, black);
  pauseReturn.show();
}

void pauseClicks() {
  if(pauseReturn.overRect()) mode = GAME;
}
