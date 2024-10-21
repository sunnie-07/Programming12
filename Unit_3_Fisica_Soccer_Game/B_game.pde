void game() {
  background(lightBlue);
  
  if(drawAssets) {
    makeLeftPlayer();
    makeRightPlayer(); 
    
    makeSoccerBall();
    
    makeLeftNetGrid();
    makeRightNetGrid();
    
    makeLeftNetSensor();
    makeRightNetSensor();
    
    drawAssets = false;
  }
  
  handlePlayerInput();
  bounceBall();
  if(hitNet(leftNetSensor)) {
    rightPScore++;
    resetPosition();
  }
  if(hitNet(rightNetSensor)) {
    leftPScore++;
    resetPosition();
  }
  
  world.step();
  world.draw();
  
  // score board
  textSize(35);
  fill(darkBlue);
  text(leftPScore, 43, 35); // left player score
  fill(turqoise);
  text(rightPScore, width-43, 35); // right player score
  
  // pause button
  pause.show();
  
  // gameover
  if(leftPScore+rightPScore == 3) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  if(pause.overRect()) mode = PAUSE;
}

//===========================================================================================

void makeLeftPlayer() {
  leftPlayer = new FBox(125, 125);
  leftPlayer.setPosition(width/2-240, height-180);
  
  // set visuals
  leftP.resize(125, 125);
  leftPlayer.attachImage(leftP);
  
  // set physical properties
  leftPlayer.setDensity(0.8);
  leftPlayer.setFriction(1);
  leftPlayer.setRestitution(0.4);
  leftPlayer.setGrabbable(false);
  leftPlayer.setRotatable(false);
  
  world.add(leftPlayer);
}

void makeRightPlayer() {
  rightPlayer = new FBox(110, 110);
  rightPlayer.setPosition(width/2+230, height-180);
  
  // set visuals
  rightP.resize(110, 110);
  rightPlayer.attachImage(rightP);
  
  // set physical properties
  rightPlayer.setDensity(0.8);
  rightPlayer.setFriction(1);
  rightPlayer.setRestitution(0.4);
  rightPlayer.setGrabbable(false);
  rightPlayer.setRotatable(false);
  
  world.add(rightPlayer);
}

//===========================================================================================

void makeSoccerBall() {
  if(squareBall == false) {
    roundSoccerBall();
  } else {
    squareSoccerBall();
  }
}

void roundSoccerBall() {
  roundSoccerB = new FCircle(65);
  roundSoccerB.setPosition(width/2, 200);
  
  // set visuals
  roundSoccerB.attachImage(roundSoccer);
  roundSoccer.resize(65, 65);
  
  // set physical properties
  roundSoccerB.setDensity(0.8);
  roundSoccerB.setFriction(1);
  roundSoccerB.setRestitution(0.95);
  roundSoccerB.setGrabbable(true);
  
  world.add(roundSoccerB);
}

void squareSoccerBall() {
  squareSoccerB = new FBox(55, 55);
  squareSoccerB.setPosition(width/2, 200);
  
  // set visuals
  squareSoccerB.attachImage(squareSoccer);
  squareSoccer.resize(55, 55);
  
  // set physical properties
  squareSoccerB.setDensity(0.8);
  squareSoccerB.setFriction(1);
  squareSoccerB.setRestitution(0.95);
  squareSoccerB.setGrabbable(true);
  
  world.add(squareSoccerB);
}

//===========================================================================================

void handlePlayerInput() {
  // left player
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if(wkey) leftPlayer.setVelocity(left_vx, -380); // jump up
  if(akey) leftPlayer.setVelocity(-300, left_vy); // move left
  if(dkey) leftPlayer.setVelocity(300, left_vy); // move right
  
  // right player
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  if(upkey) rightPlayer.setVelocity(right_vx, -380); // jump up
  if(leftkey) rightPlayer.setVelocity(-300, right_vy); // move left
  if(rightkey) rightPlayer.setVelocity(300, right_vy); // move right
}

boolean hitNet(FBox net) {
  if(squareBall == false) {
    ArrayList<FContact> rcontactList = roundSoccerB.getContacts();
    for(int i = 0; i < rcontactList.size(); i++) {
      FContact myRContact = rcontactList.get(i);
      if(myRContact.contains(net)) return true;
    }
    return false;
  } else {
    ArrayList<FContact> scontactList = squareSoccerB.getContacts();
    for(int i = 0; i < scontactList.size(); i++) {
      FContact mySContact = scontactList.get(i);
      if(mySContact.contains(net)) return true;
    }
    return false;
  }
}

void bounceBall() {
  ballTimer --;
  if(squareBall == false) {
    float roundBall_vx = roundSoccerB.getVelocityX();
    if(ballTimer < 0) {
      roundSoccerB.setVelocity(roundBall_vx, -1100);
      ballTimer = 1000;
    }
  } else {
    float squareBall_vx = squareSoccerB.getVelocityX();
    if(ballTimer < 0) {
      squareSoccerB.setVelocity(squareBall_vx, -1100);
      ballTimer = 1000;
    }
  }
}

//===========================================================================================

void makeLeftNetGrid() {
  leftNetGrid = new FBox(95, 192);
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
  rightNetGrid = new FBox(95, 192);
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

//===========================================================================================

void makeLeftNetSensor() {
  leftNetSensor = new FBox(5, 192);
  leftNetSensor.setPosition(55, height-164);
  
  // set visuals
  leftNetSensor.setFillColor(brown);
  leftNetSensor.setNoStroke();
  
  // set physical properties
  leftNetSensor.setStatic(true);
  leftNetSensor.setSensor(true);
  leftNetSensor.setGrabbable(false);
  
  world.add(leftNetSensor);
}

void makeRightNetSensor() {
  rightNetSensor = new FBox(5, 192);
  rightNetSensor.setPosition(width-55, height-164);
  
  // set visuals
  rightNetSensor.setFillColor(brown);
  rightNetSensor.setNoStroke();
  
  // set physical properties
  rightNetSensor.setStatic(true);
  rightNetSensor.setSensor(true);
  rightNetSensor.setGrabbable(false);
  
  world.add(rightNetSensor);
}
