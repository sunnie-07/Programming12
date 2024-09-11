// Sunny Bao
// Block 1-4
// Sep 10, 2024

// MODE VARIABLES
int mode;
final int PATTERN1 = 0;
final int PATTERN2 = 1;
final int PATTERN3 = 2;

// COLOR PALLETTE
color white = #FFFFFF;
color lightGrey = #B7B7B7;
color darkGrey = #3E3E3E;
color pink = #F5D7D7;
color darkPink = #DB048D;
color lightBlue = #D7ECF5;
color lightOrange = #F5DBB2;
// PATTERN 2
color blue1 = #012a4a;
color blue2 = #01497c;
color blue3 = #468faf;
color blue4 = #89c2d9;
color blue5 = #EAF5FF;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  mode = PATTERN1;
}

void draw() {
  if (mode == PATTERN1) {
    pattern1(); 
  } else if (mode == PATTERN2) {
    pattern2(); 
  } else if (mode == PATTERN3) {
    pattern3(); 
  } else {
    println("Error: Mode = " + mode); 
  }
}
