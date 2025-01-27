void game() {
  drawBG();
  drawWorld();
  actWorld();
  drawLives();
  pauseBt.show();
  
  if (player.lives == 0) {
    player.setPosition(gridSize+5, 600);
    player.setVelocity(0, 0);
    player.lives = 3;
  }
}

void gameClicks() {
  if(pauseBt.overRect()) mode = PAUSE;
}

//===========================================================================================

void actWorld() {
  player.act();
  for(int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for(int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void drawBG() {
  if (zkey) {
    image(backgroundImg, 0, 0);
  } else {
    float xoff = map(player.getX(), 0, 64*gridSize, 550, 0);
    float yoff = map(player.getY(), 0, 64*gridSize, 550, 0);
    image(backgroundImg, int(xoff-800), int(yoff-400));
  }
}

void drawWorld() {
  pushMatrix();
  if (zkey) {
    zoom = 0.397;
    translate(0,0);
  }
  else {
    zoom = 2;
    translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  }
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void drawLives() {
  if(player.lives == 3) {
    image(life, 20, 10, 35, 36);
    image(life, 55, 10, 35, 36);
    image(life, 90, 10, 35, 36);
  } else if(player.lives == 2) {
    image(life, 20, 10, 35, 36);
    image(life, 55, 10, 35, 36);
  } else if(player.lives == 1) {
    image(life, 20, 10, 35, 36);
  } else { }
}
