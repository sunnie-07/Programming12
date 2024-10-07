class Mover {
  // instance variables
  float x, y; // location
  float vx, vy; // velocity
  float d; // diameter
  
  // constructor
  Mover() {
    d = 100;
    x = random(0, width);
    y = random(0, height);
    vx = random(-1, 1);
    vy = random(-1, 1);
  }
  
  // behaviour functions
  // act function
  void act() {
    move();
    bounceOffEdge();
  }
  
  void move() {
    x += vx;
    y += vy;
  }
  
  void bounceOffEdge() {
    if(x < 0 || x > width) vx = -vx;
    if(y < 0 || y > height) vy = -vy;
  }
  
  // show functions
  void showBody() {
    noStroke();
    fill(255, 50);
    circle(x, y, d);
  }
  
  void showConnections() {
    for(int i = 0; i < numOfMovers; i++) {
      float dist = dist(x, y, movers[i].x, movers[i].y);
      if(dist <= 200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(x, y, movers[i].x, movers[i].y);
      }
    }
  }
}
