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
      if (mapIndex < 1) {
        mapIndex++;
        loadWorld(map[mapIndex]);

        world.add(player);
        player.setPosition(gridSize+5, 600);
        player.setVelocity(0, 0);
        player.lives = 3;

        buttonPressed = 3;
      } else if (mapIndex == 1) mode = GAMEOVER;
    }
  }
}
