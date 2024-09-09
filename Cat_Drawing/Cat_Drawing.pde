// Sunny Bao
// Block 1-4
// Sep 9, 2024

// COLOR VARIABLES
color lightBlue = #C4E7F0;
color darkBrown = #4D3612;
color blue = #3979F5;
color orange = #F2CF6C;
color white = #FFFFFF;
color pink = #FFDBE8;

void setup() {
  size(800, 800);
  background(lightBlue);
  
  for(int i = 0; i < 5; i++) {
    cat(random(100, width-100), random(100, height-100), random(0.6, 0.8));
  }
}
