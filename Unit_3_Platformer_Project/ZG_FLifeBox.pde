class FLifeBox extends FGameObject {
  // constructor
  FLifeBox(float x, float y) {
    super();
    setName("heartBox");
    setPosition(x, y);
    setStatic(true);
    attachImage(heartBox);
  }
  
  // behaviour functions
  void act() {
    collide();
  }
  
  void collide() {
    if (isTouching("player")) {
      if (player.lives < 3) {
        player.lives++;
        world.remove(this);
        terrain.remove(this);
      }
    }
  }
}
