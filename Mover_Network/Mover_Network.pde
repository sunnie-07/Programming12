// Sunny Bao
// Block 1-4
// Oct 7, 2024

// MOVERS
ArrayList<Mover> movers;
int numOfMovers = 50;

// COLOR VARIABLES
color blue = #3C62CE;

void setup() {
  size(800, 800);
  movers = new ArrayList(); // instantiate ArrayList
  
  for(int i = 0; i < numOfMovers; i++) {
    movers.add(new Mover()); // calling the constructor
                             // adding movers to the end of the list
  }
}

void draw() {
  background(blue);
  for(int i = 0; i < numOfMovers; i++) {
    Mover m = movers.get(i); // getting the mover out at index i (temporary)
    m.act();
    m.showBody();
    m.showConnections();
  }
}
