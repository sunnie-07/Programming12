class FPlayer extends FGameObject { // inherit methods from parent class
  // instance variables
  int frame;
  int direction;
  
  // constructor
  FPlayer() {
    super(); // calling FGameObject constructor
    setName("player");
    setPosition(0, 0);
    setFillColor(white);
    setNoStroke();
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
    if (wkey) {
      setVelocity(vx, -200);
    }
    if (abs(vy) > 0.01) {
      action = jump;
    }
  }
  
  void collisions() {
    if (isTouching("spike")) {
      lives--;
    }
    
    if (isTouching("lava")) {
      lives--;
    }
    
    if (lives == 0) {
      setPosition(0, 0);
      setVelocity(0, 0);
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
