class FPlayer extends FBox { // inherit methods from parent class
  // constructor
  FPlayer() {
    super(gridSize, gridSize); // calling FBox constructor
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
    if(akey) setVelocity(-200, vy);
    if(dkey) setVelocity(200, vy);
    if(wkey) setVelocity(vx, -250);
  }
}
