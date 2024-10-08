class Mover {
  // instance variables
  PVector loc; // location
  PVector vel; // velocity
  float d; // diameter
  
  // constructor
  Mover() {
    d = 100;
    loc = new PVector(random(0, width), random(0, height)); // (x, y) component of location
    vel = new PVector(1, 0); // (vx, vy) component of velocity
    vel.setMag(random(1, 3)); // sets magnitude of velocity
    vel.rotate(radians(random(0, 360))); // randomize the direction while keeping velocity the same
  }
  
  // behaviour functions
  // act function
  void act() {
    move();
    bounceOffEdge();
  }
  
  void move() {
    loc.add(vel); // equivalent to x += vx and y += vy
  }
  
  void bounceOffEdge() {
    if(loc.x < 0 || loc.x > width) vel.x = -vel.x; // access x component of PVector
    if(loc.y < 0 || loc.y > height) vel.y = -vel.y; // access y component of PVector
  }
  
  // show functions
  void showBody() {
    noStroke();
    fill(255, 50);
    circle(loc.x, loc.y, d);
  }
  
  void showConnections() {
    for(int i = 0; i < numOfMovers; i++) {
      Mover other = movers.get(i); // temporary mover
      float dist = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      if(dist <= 200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }
}
