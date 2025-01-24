class Rain extends GameObject {
  PVector vel;
  
  Rain() {
    super(random(-2000, 2000), height-gridSize*3, random(-2000, 2000), random(2, 3.5));
    vel = new PVector(0, 10, 0);
    vel.mult(random(1.5, 3));
  }
  
  void act() {
    loc.add(vel);
    if (loc.y >= height) {
      lives = 0;
    }
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(#8BAFFA);
    noStroke();
    box(size);
    popMatrix();
  }
}
