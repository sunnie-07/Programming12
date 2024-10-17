void game() {
  background(lightBlue);
  
  if(drawAssets) {
    makeLeftPlayer();
    makeRightPlayer(); 
    
    drawAssets = false;
  }
  
  world.step();
  world.draw();
}

void gameClicks() {
  
}

//===========================================================================================

void makeLeftPlayer() {
  FBox leftPlayer = new FBox(150, 150);
  leftPlayer.setPosition(width/2-240, height-150);
  
  // set visuals
  leftP.resize(150, 150);
  leftPlayer.attachImage(leftP);
  
  // set physical properties
  leftPlayer.setDensity(0.8);
  leftPlayer.setFriction(1);
  leftPlayer.setRestitution(0.4);
  leftPlayer.setGrabbable(false);
  
  world.add(leftPlayer);
}

void makeRightPlayer() {
  FBox rightPlayer = new FBox(135, 135);
  rightPlayer.setPosition(width/2+230, height-150);
  
  // set visuals
  rightP.resize(135, 135);
  rightPlayer.attachImage(rightP);
  
  // set physical properties
  rightPlayer.setDensity(0.8);
  rightPlayer.setFriction(1);
  rightPlayer.setRestitution(0.4);
  rightPlayer.setGrabbable(false);
  
  world.add(rightPlayer);
}
