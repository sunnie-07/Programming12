class FCheckpoint extends FGameObject {
  // constructor
  FCheckpoint(float x, float y) {
    super();
    setName("checkpoint");
    setPosition(x, y);
    setStatic(true);
    attachImage(checkpoint);
  }
  
  // behaviour functions
  void act() {
    nextLevel();
  }
  
  void nextLevel() {
    if (isTouching("player")) {
      mapIndex++;
      loadWorld(map[mapIndex]);
      
      world.add(player);
      player.setPosition(gridSize+5, 600);
      player.setVelocity(0, 0);
      
      buttonPressed = 3;
      player.lives = 3;
    }
  }
}
