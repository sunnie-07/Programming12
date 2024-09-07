// Sunny Bao
// Block 1-4
// Sep 5, 2024

// COLOR VARIABLES
color blue = #BBDDFA;
color darkBlue = #5261FC;
color green = #8ED888;
color darkBrown = #55350C;
color magenta = #ED819C;
color lightBlue = #DAEFF0;
color orange = #FA9E60;
color yellow = #F5DA43;
color brown = #D8AB67;
color darkGreen = #1EC925;
color nightBlue = #2A2B67;
color lightYellow = #F3F5C1;

// ANIMATION VARIABLES
float sunX, sunY;
float moonX, moonY;
boolean day;

void setup() {
  size(800, 800);
  
  // initiate sun
  sunX = -80;
  sunY = 550;
  
  // initiate moon
  moonX = -80;
  moonY = 550;
  
  // boolean
  day = true;
}

void draw() {
  noStroke();
  if(day == true) {
    moonX = -80;
    moonY = 550;
    // sky
    background(blue);
  
    // sun
    fill(yellow);
    circle(sunX, sunY, 150);
    
    // move sun
    sunX += 2;
    sunY -= 1.5;
    if(sunY <= -140) day = false;
  } else {
    sunX = -80;
    sunY = 550;
    // sky
    background(nightBlue);
  
    // moon
    fill(lightYellow);
    circle(moonX, moonY, 150);
    fill(nightBlue);
    circle(moonX+40, moonY-40, 150);
    
    // move moon
    moonX += 2;
    moonY -= 1.5;
    if(moonY <= -140) day = true;
  }
  
  // grass
  fill(green);
  rect(0, 500, 800, 300);
   
  // house
  stroke(darkBrown);
  strokeWeight(2);
  fill(darkBlue);
  square(380, 350, 300);
  
  // roof
  fill(magenta);
  triangle(380, 350, 680, 350, 530, 220);
  
  // windows
  fill(lightBlue);
  ellipse(440, 500, 80, 100);
  line(440, 450, 440, 550);
  line(400, 500, 480, 500);
  
  ellipse(620, 500, 80, 100);
  line(620, 450, 620, 550);
  line(580, 500, 660, 500);
  
  // door
  fill(orange);
  rect(500, 550, 60, 100);
}
