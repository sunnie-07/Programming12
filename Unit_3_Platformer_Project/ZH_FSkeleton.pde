class FSkeleton extends FGameObject {
  // instance variables
  int direction;
  int speed;
  int currentFrame;
  
  // constructor
  FSkeleton(float x, float y) {
    super();
    setName("skeleton");
    setPosition(x, y);
    setRotatable(false);
    
    direction = L;
    speed = 40;
    currentFrame = 0;
  }
  
  // behaviour functions
  void act() {
    move();
  }
  
  void move() {
    if (player.getX() > getX() && player.direction == R) {
      animate(R);
      setVelocity(speed*R, 0);
    } else if (player.getX() < getX() && player.direction == L) {
      animate(L);
      setVelocity(speed*L, 0);
    } else if (player.getX() > getX() && player.direction == L) {
      attachImage(skeleton[0]);
    } else if (player.getX() < getX() && player.direction == R) {
      attachImage(reverseImage(skeleton[0]));
    }
  }
  
  void animate(int d) {
    if (currentFrame >= skeleton.length) currentFrame = 0;
    if (frameCount % 5 == 0) {
      if (d == R) attachImage(skeleton[currentFrame]);
      if (d == L) attachImage(reverseImage(skeleton[currentFrame]));
      currentFrame ++;
    }
  }
}
