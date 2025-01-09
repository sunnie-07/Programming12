class FPlayer extends FGameObject {
  // instance variables
  int frame;
  int direction;
  int lives;
  float timer;
  
  // constructor
  FPlayer() {
    super();
    setName("player");
    setPosition(gridSize+5, 600);
    setRotatable(false);
    
    frame = 0;
    direction = R;
    lives = 3;
    timer = 200;
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
      setVelocity(vx, -450);
    }
    if (abs(vy) > 0.01) {
      action = jump;
    }
  }
  
  void collisions() {
    timer--;
    if (isTouching("knife") && timer < 0) {
      lives--;
      timer = 200;
    }
    
    else if (isTouching("skeleton") && timer < 0) {
      lives--;
      timer = 200;
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
