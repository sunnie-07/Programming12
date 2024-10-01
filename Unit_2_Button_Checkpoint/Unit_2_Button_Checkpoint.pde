// Sunny Bao
// Block 1-4
// Oct 1, 2024

// VARIABLES
Button myButton;

void setup() {
  size(600, 600);
  background(255);
  
  myButton = new Button("HI", width/2, height/2, 200, 120, #F08080, #F5CBCB);
}

void draw() {
  myButton.show();
}
