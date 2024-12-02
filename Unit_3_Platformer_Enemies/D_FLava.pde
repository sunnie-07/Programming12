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
    animate();
    collide();
  }
  
  void animate() {
    if(currentFrame >= lavaGif.length) currentFrame = 0;
    attachImage(lavaGif[currentFrame]);
    if(frameCount % 18 == 0) currentFrame++;
  }
  
  void collide() {
    if (isTouching("player")) {
      player.lives--;
      player.setPosition(0, 0);
      player.setVelocity(0, 0);
    }
  }
}
