class Mover {
  // instance variables
  float x, y;
  
  // constructor
  Mover() {
    x = width/2;
    y = height/2;
  }
  
  // behaviour functions
  void show() {
    stroke(0);
    fill(225);
    strokeWeight(5);
    circle(x, y, 100);
  }
  
  void act() {
    x += random(-2, 2);
    y += random(-2, 2);
  }
}
