class FBridge extends FGameObject {
  // constructor
  FBridge(float x, float y) {
    super();
    setName("bridge");
    setPosition(x, y);
    attachImage(bridge);
    setStatic(true);
  }
  
  // behaviour function
  void act() {
    if(isTouching("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}
