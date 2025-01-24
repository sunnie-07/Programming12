class Particle extends GameObject {
  PVector vel;
  float lifespan;
  
  Particle(PVector loc) {
    super(loc.x, loc.y, loc.z, random(5, 7));
    vel = PVector.random3D();
    vel.mult(random(2.5, 5));
    lifespan = 255;
  }
  
  void act() {
    loc.add(vel);
    lifespan -= 4.2;
    if (lifespan <= 0) {
      lives = 0;
    }
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(white, lifespan);
    noStroke();
    box(size);
    popMatrix();
  }
}
