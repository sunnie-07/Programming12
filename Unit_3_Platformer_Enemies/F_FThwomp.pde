class FThwomp extends FGameObject {
  // instance variables
  float twpX;
  float twpY;
  
  // constructor
  FThwomp(float x, float y) {
    super(gridSize);
    setPosition(x+gridSize/2, y+gridSize/2);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
    
    twpX = x+gridSize/2;
    twpY = y+gridSize/2;
  }
  
  // behaviour functions
  void act() {
    animate();
    collide();
  }
  
  void animate() {
    if (player.getX()+gridSize < getX()-gridSize/2 || player.getX()+5 > getX()+(2*gridSize-gridSize/2)) {
      attachImage(sleepyThwomp);
      setPosition(twpX, twpY);
      setVelocity(0, 0);
      setStatic(true);
    } else if (player.getX()+gridSize > getX()-gridSize/2 && player.getX()+5 < getX()+(2*gridSize-gridSize/2)) {
      attachImage(angryThwomp);
      setStatic(false);
    }
  }
  
  void collide() {
    if (isTouching("player")) {
      player.lives--;
      player.setPosition(0, 0);
      player.setVelocity(0, 0);
    }
  }
}
