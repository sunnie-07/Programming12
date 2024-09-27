// Sunny Bao
// Block 1-4
// Sep 27, 2024

// VARIABLES
Mover[] myMovers; // creates an array of Movers
int num = 50;

void setup() {
  size(600, 600);
  
  myMovers = new Mover[num]; // instantiate array
  for(int i = 0; i < num; i++) {
    myMovers[i] = new Mover(); // calling constructor
  }
}

void draw() {
  background(0);
  for(int i = 0; i < num; i++) {
    myMovers[i].show(); // calling behaviour functions
    myMovers[i].act();
  }
}
