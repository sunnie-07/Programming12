void instructions() {
  strokeWeight(5);
  fill(darkRed);
  rect(width/2, height/2, 670, 535, 25);
  
  shadowText("RULES", width/2, 168, 40, white, black);
  instruReturn.show();
  
  fill(white);
  textSize(25);
  text("Find all three buttons in", width/2, 270);
  text("each map to free the cat!", width/2-4, 310);
  text("Be careful of enemies!", width/2-38, 380);
}

void instructionsClicks() {
  if(instruReturn.overRect()) mode = INTRO;
}
