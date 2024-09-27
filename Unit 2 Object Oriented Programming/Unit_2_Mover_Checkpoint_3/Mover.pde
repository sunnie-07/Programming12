class Mover {
  // instance variables
  float x, y;
  float size;
  
  // constructor
  Mover() {
    x = width/2;
    y = height/2;
    size = random(50, 150);
  }
  
  // behaviour functions
  void show() {
    stroke(0);
    fill(255);
    strokeWeight(5);
    circle(x, y, size);
  }
  
  void act() {
    x += random(-2, 2);
    y += random(-2, 2);
  }
}
