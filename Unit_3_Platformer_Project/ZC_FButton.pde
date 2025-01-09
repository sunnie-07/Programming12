class FButton extends FGameObject {
  // instance variables
  boolean isOn;
  float timer;
  
  // constructor
  FButton(float x, float y) {
    super();
    setName("buttonPlate");
    setPosition(x, y);
    setStatic(true);
    
    isOn = false;
    timer = 100;
  }
  
  // behaviour functions
  void act() {
    press();
    animate();
  }
  
  void press() {
    timer --;
    if (isTouching("player") && timer < 0) {
      isOn = !isOn;
      timer = 100;
    }
  }
  
  void animate() {
    if (isOn == false) {
      attachImage(buttonOff);
      if (buttonPressed != 3 && isTouching("player") && timer == 100) buttonPressed ++;
    } else if (isOn == true) {
      attachImage(buttonOn);
      if (isTouching("player") && timer == 100) buttonPressed --;
    }
  }
}
