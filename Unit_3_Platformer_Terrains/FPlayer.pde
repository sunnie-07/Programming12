class FPlayer extends FBox { // inherit methods from parent class
  // constructor
  FPlayer() {
    super(gridSize-5, gridSize-5); // calling FBox constructor
    setPosition(65, 0);
    setFillColor(white);
    setNoStroke();
    setRotatable(false);
    setGrabbable(false);
  }
  
  // behavior functions
  void act() {
    handleInput();
    checkCollisions();
  }
  
  void handleInput() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if(akey) setVelocity(-180, vy);
    if(dkey) setVelocity(180, vy);
    if(wkey) setVelocity(vx, -200);
  }
  
  void checkCollisions() {
    ArrayList<FContact> contacts = getContacts();
    for(int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if(fc.contains("lava")) {
        setPosition(65, 0);
      }
    }
  }
}
