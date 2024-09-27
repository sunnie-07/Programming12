class Mover {
  // instance variables
  float x, y;
  float r, g, b;
  
  // constructor
  Mover() {
    x = width/2;
    y = height/2;
    r = random(100, 255);
    g = random(100, 255);
    b = random(100, 255);
  }
  
  // behaviour functions
  void show() {
    stroke(0);
    fill(r, g, b);
    strokeWeight(5);
    circle(x, y, 100);
  }
  
  void act() {
    x += random(-2, 2);
    y += random(-2, 2);
  }
}
