// Sunny Bao
// Block 1-4
// Oct 1, 2024

// BUTTON VARIABLES
Button myButton1;
Button myButton2;

// MOUSE VARIABLES
boolean mouseReleased;
boolean wasPressed;

// COLOR PALLETTE
color backgroundC;
color pink = #F08080;
color lightPink = #F5CBCB;
color blue = #2CB3F5;
color lightBlue = #B4E7FF;

// IMAGE VARIABLES
PImage cat;

void setup() {
  size(600, 600);
  backgroundC = 255;
  
  // initialize image
  cat = loadImage("Cat.jpeg");
  
  // initialize buttons
  myButton1 = new Button(cat, width/2-135, height/2, 200, 120, pink, lightPink);
  myButton2 = new Button("BLUE", width/2+135, height/2, 200, 120, blue, lightBlue);
}

void draw() {
  background(backgroundC);
  
  myButton1.showWithImage();
  myButton2.showWithText();
  
  click();
  if(myButton1.clicked) backgroundC = myButton1.normal;
  if(myButton2.clicked) backgroundC = myButton2.normal;
}
