void game() {
  background(lightBlue);
  
  if(drawAssets) {
    makeLeftPlayer();
    makeRightPlayer(); 
    
    makeLeftNetGrid();
    makeRightNetGrid();
    
    drawAssets = false;
  }
  
  handlePlayerInput();
  
  world.step();
  world.draw();
}

void gameClicks() {
  
}

//===========================================================================================

void makeLeftPlayer() {
  leftPlayer = new FBox(140, 140);
  leftPlayer.setPosition(width/2-240, height-150);
  
  // set visuals
  leftP.resize(140, 140);
  leftPlayer.attachImage(leftP);
  
  // set physical properties
  leftPlayer.setDensity(0.8);
  leftPlayer.setFriction(1);
  leftPlayer.setRestitution(0.2);
  leftPlayer.setGrabbable(false);
  
  world.add(leftPlayer);
}

void makeRightPlayer() {
  rightPlayer = new FBox(125, 125);
  rightPlayer.setPosition(width/2+230, height-150);
  
  // set visuals
  rightP.resize(125, 125);
  rightPlayer.attachImage(rightP);
  
  // set physical properties
  rightPlayer.setDensity(0.8);
  rightPlayer.setFriction(1);
  rightPlayer.setRestitution(0.2);
  rightPlayer.setGrabbable(false);
  
  world.add(rightPlayer);
}

//===========================================================================================

void handlePlayerInput() {
  // left player
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if(wkey) leftPlayer.setVelocity(left_vx, -300); // jump up
  
  // right player
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
}

//===========================================================================================

void makeLeftNetGrid() {
  FBox leftNetGrid = new FBox(95, 192);
  leftNetGrid.setPosition(102, height-164);
  
  // set visuals
  soccerGrid.resize(95, 192);
  leftNetGrid.attachImage(soccerGrid);
  
  // set physical properties
  leftNetGrid.setStatic(true);
  leftNetGrid.setSensor(true);
  leftNetGrid.setGrabbable(false);
  
  world.add(leftNetGrid);
}

void makeRightNetGrid() {
  FBox rightNetGrid = new FBox(95, 192);
  rightNetGrid.setPosition(width-102, height-164);
  
  // set visuals
  soccerGrid.resize(95, 192);
  rightNetGrid.attachImage(soccerGrid);
  
  // set physical properties
  rightNetGrid.setStatic(true);
  rightNetGrid.setSensor(true);
  rightNetGrid.setGrabbable(false);
  
  world.add(rightNetGrid);
}
