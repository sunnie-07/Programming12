class FBat extends FGameObject {
  // instance variables
  FBox knife;
  int direction;
  int speed;
  int currentFrame;
  float timer;
  
  // constructor
  FBat(float x, float y) {
    super();
    setPosition(x, y);
    setName("bat");
    setRotatable(false);
    
    direction = R;
    speed = 50;
    currentFrame = 0;
    timer = 800;
  }
  
  // behaviour functions
  void act() {
    animate();
    collide();
    move();
    throwKnife();
  }
  
  void animate() {
    if (currentFrame >= bat.length) currentFrame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(bat[currentFrame]);
      if (direction == L) attachImage(reverseImage(bat[currentFrame]));
      currentFrame ++;
    }
  }
  
  void collide() {
    if (isTouching("invisibleWall")) {
      direction *= -1;
      setPosition(getX()+direction*2, getY());
    }
  }
  
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
  
  void throwKnife() {
    timer --;
    if (timer < 0) {
      FBox knife = new FBox(20, 20);
      knife.setName("knife");
      knife.setSensor(true);
      knife.attachImage(knifeImg);
      knife.setPosition(getX(), getY());
      knife.setAngularVelocity(radians(1000));
      world.add(knife);
      timer = 800;
    }
  }
}
