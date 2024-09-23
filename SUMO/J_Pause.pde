void pause() {  
  scoreTimer--;
  if(scoreTimer <= 0) { 
    redX = width/2-170;
    blueX = width/2+170;
    mode = GAME;
    gameStart = 3;
    countdown = 182;
  }
}
