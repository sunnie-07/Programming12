class GameObject {
  // instance variables
  PVector loc;
  float size;
  float lives;
  
  // constructors
  GameObject() {
    loc = new PVector(0, 0, 0);
    size = 10;
    lives = 1;
  }
  
  GameObject(float x, float y, float z, float s) {
    lives = 1;
    loc = new PVector(x, y, z);
    size = s;
  }
  
  // behaviour functions
  void act() { }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(white);
    noStroke();
    box(size);
    popMatrix();
  }
}
