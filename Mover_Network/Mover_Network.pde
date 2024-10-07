// Sunny Bao
// Block 1-4
// Oct 7, 2024

// MOVERS
Mover[] movers;
int numOfMovers = 50;

// COLOR VARIABLES
color blue = #3C62CE;

void setup() {
  size(800, 800);
  movers = new Mover[numOfMovers]; // instantiate array
  
  for(int i = 0; i < numOfMovers; i++) {
    movers[i] = new Mover(); // calling the constructor
  }
}

void draw() {
  background(blue);
  for(int i = 0; i < numOfMovers; i++) {
    movers[i].act();
    movers[i].showBody();
    movers[i].showConnections();
  }
}
