class FPlayer extends FBox { // inherit methods from parent class
  // constructor
  FPlayer() {
    super(gridSize-8, gridSize-8); // calling FBox constructor
    setPosition(300, 0);
    setFillColor(white);
    setNoStroke();
    setRotatable(false);
    setGrabbable(false);
  }
  
  // behavior functions
  void act() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if(akey) setVelocity(-180, vy);
    if(dkey) setVelocity(180, vy);
    if(wkey) setVelocity(vx, -200);
  }
}
