void game() {
  // background
  background(lightOrange);
  strokeWeight(15);
  stroke(white);
  fill(orange);
  circle(width/2, height/2, 550);
  
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
  
  // exit button
  fill(white);
  circle(width/2, height, 120);
  
  // wrestlers
  blueWrestler(blueX);
  redWrestler(redX);
  
  moveRedWrestler();
  moveBlueWrestler();
}

void gameClicks() {
  
}
