class FLadder extends FGameObject {
  // constructor
  FLadder(float x, float y) {
    super();
    setName("ladder");
    setPosition(x, y);
    setStatic(true);
    setSensor(true);
    attachImage(ladder);
  }
  
  // behaviour functions
  void act() {
    climb();
  }
  
  void climb() {
    if (isTouching("player") && qkey) {
      player.setVelocity(0, -200);
    }
  }
}
