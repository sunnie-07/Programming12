class FHammerBro extends FGameObject {
  // instance variables
  FBox hammer;
  int direction;
  int speed;
  int currentFrame;
  float timer;

  // constructor
  FHammerBro(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammerBro");
    setRotatable(false);

    direction = L;
    speed = 50;
    currentFrame = 0;
    timer = 500;
  }

  // behaviour functions
  void act() {
    animate();
    collide();
    move();
    throwHammer();
  }

  void animate() {
    if (currentFrame >= hammerBro.length) currentFrame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(hammerBro[currentFrame]);
      if (direction == L) attachImage(reverseImage(hammerBro[currentFrame]));
      currentFrame ++;
    }
  }

  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX()+direction*2, getY());
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }

  void throwHammer() {
    timer --;
    if (timer < 0) {
      FBox hammer = new FBox(gridSize, gridSize);
      hammer.setName("hammer");
      hammer.setSensor(true);
      hammer.attachImage(hammerImg);
      hammer.setPosition(getX(), getY());
      hammer.setVelocity(200*direction, -400);
      hammer.setAngularVelocity(radians(1000));
      world.add(hammer);
      timer = 500;
    }
  }
}
