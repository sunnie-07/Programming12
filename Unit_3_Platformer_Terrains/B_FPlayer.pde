class FPlayer extends FGameObject { // inherit methods from parent class
  // constructor
  FPlayer() {
    super(); // calling FGameObject constructor
    setName("player");
    setPosition(0, 0);
    setFillColor(white);
    setNoStroke();
    setRotatable(false);
  }

  // behavior functions
  void act() {
    handleInput();

    if (isTouching("spike")) {
      setPosition(0, 0);
      setVelocity(0, 0);
    }
    
    if (isTouching("trampoline")) {
      setRestitution(1.25);
    } else {
      setRestitution(0);
    }
  }

  void handleInput() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if (akey) setVelocity(-180, vy);
    if (dkey) setVelocity(180, vy);
    if (wkey) setVelocity(vx, -200);
  }
}
