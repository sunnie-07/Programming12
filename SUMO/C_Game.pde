void game() {
  // background
  background(lightOrange);
  strokeWeight(16);
  stroke(white);
  fill(orange);
  circle(width/2, height/2, 470);
  
  // score board
  noStroke();
  fill(white);
  circle(width/2, 0, 120);
  textSize(40);
  fill(red);
  text(redScore, width/2-27.5, 21);
  fill(black);
  text(":", width/2, 21);
  fill(blue);
  text(blueScore, width/2+27.5, 21);
  
  // number of rounds
  fill(white);
  circle(width/2, height, 120);
  fill(black);
  textSize(44);
  text(numRounds, width/2, height-28);
  
  // countdown
  gameStart --;
  if(gameStart > 0) {
    mode = COUNTDOWN; 
  }
  
  // wrestlers
  blueWrestler(blueX);
  redWrestler(redX);
  
  moveRedWrestler();
  moveBlueWrestler();
  
  // winning
  if(blueX >= width/2+345) {
    redScore ++;
    numRounds --;
    mode = PAUSE;
  } else if(redX <= width/2-345) {
    blueScore ++;
    numRounds --;
    mode = PAUSE;
  }
  if((redX == width/2-170) && (blueX == width/2+170)) {
    scoreTimer = 60;
  }
  
  // gameover
  if(numRounds == 0) {
    mode = GAMEOVER; 
  }
}

void gameClicks() {
  
}
