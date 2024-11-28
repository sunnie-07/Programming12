class FGoomba extends FGameObject {
  // instance variables
  int direction;
  int speed;
  int currentFrame;
  
  // constructor
  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    
    direction = L;
    speed = 50;
    currentFrame = 0;
  }
  
  // behaviour functions
  void act() {
    animate();
    collide();
    move();
  }
  
  void animate() {
    if (currentFrame >= goomba.length) currentFrame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(goomba[currentFrame]);
      if (direction == L) attachImage(reverseImage(goomba[currentFrame]));
      currentFrame ++;
    }
  }
  
  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize+10) {
        world.remove(this); // remove the goomba that's calling the function
        enemies.remove(this);
      } else {
        player.lives--;
        player.setPosition(0, 0);
        player.setVelocity(0, 0);
      }
    }
  }
  
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
