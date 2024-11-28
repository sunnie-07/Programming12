class FLava extends FGameObject {
  // instance variables
  int currentFrame;
  
  // constructor
  FLava(float x, float y) {
    super();
    setName("lava");
    setPosition(x, y);
    setStatic(true);
    currentFrame = (int) random(0, 5);
  }
  
  // behaviour function
  void act() {
    if(currentFrame >= lavaGif.length) currentFrame = 0;
    attachImage(lavaGif[currentFrame]);
    if(frameCount % 18 == 0) currentFrame++;
  }
}
