// Sunny Bao
// Block 1-4
// Oct 1, 2024

// OBJECTS
Button myButton1;
Button myButton2;
color  backgroundColor;

// MOUSE VARIABLES
boolean mouseReleased;
boolean wasPressed;

// COLOR PALLETTE
color pink = #F08080;
color lightPink = #F5CBCB;
color blue = #2CB3F5;
color lightBlue = #B4E7FF;

void setup() {
  size(600, 600);
  backgroundColor = 255;
  
  myButton1 = new Button("PINK", width/2-135, height/2, 200, 120, pink, lightPink);
  myButton2 = new Button("BLUE", width/2+135, height/2, 200, 120, blue, lightBlue);
}

void draw() {
  background(backgroundColor);
  myButton1.show();
  myButton2.show();
  
  if(myButton1.clicked) backgroundColor = pink;
  if(myButton2.clicked) backgroundColor = blue;
}
