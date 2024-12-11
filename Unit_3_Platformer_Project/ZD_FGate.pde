class FGate extends FGameObject {
  // instance variables
  boolean open;
  
  // constructor
  FGate(float x, float y) {
    super();
    setName("gate");
    setPosition(x, y);
    setStatic(true);
    
    open = false;
  }
  
  // behaviour functions
  void act() {
    animate();
    openGate();
  }
  
  void animate() {
    if (open == false) {
      attachImage(gate);
    } else {
      setSensor(true);
      setStatic(false);
    }
  }
  
  void openGate() {
    if (buttonPressed == 0) open = true;
    else open = false;
  }
}
