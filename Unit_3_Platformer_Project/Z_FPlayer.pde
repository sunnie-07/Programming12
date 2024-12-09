class FPlayer extends FGameObject {
  // instance variables
  int frame;
  int direction;
  int lives;
  
  // constructor
  FPlayer() {
    super();
    setName("player");
    setPosition(gridSize+5, 600);
    setRotatable(false);
    
    frame = 0;
    direction = R;
    lives = 3;
  }
  
  // behavior functions
  void act() {
    input();
    collisions();
    animate();
  }
  
  void input() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if (abs(vy) < 0.01) {
      action = idle;
    }
    if (akey) {
      setVelocity(-180, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(180, vy);
      action = run;
      direction = R;
    }
    if (wkey && isTouching("grass")) {
      setVelocity(vx, -400);
    }
    if (abs(vy) > 0.01) {
      action = jump;
    }
  }
  
  void collisions() {
    if (lives == 0) {
    }
  }
  
  void animate() {
    if(frame >= action.length) frame = 0;
    if(frameCount % 9 == 0) {
      if (direction == R) attachImage(action[frame]);
      else if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
}
