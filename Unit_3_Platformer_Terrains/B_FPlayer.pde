class FPlayer extends FGameObject { // inherit methods from parent class
  // instance variables
  int frame;
  int direction;
  final int L = -1;
  final int R = 1;
  
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
      setPosition(0, 0);
      setVelocity(0, 0);
    }
    
    if (isTouching("lava")) {
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
