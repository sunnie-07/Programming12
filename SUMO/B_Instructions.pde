void instructions() {
  // background
  background(lightOrange);
  
  // instructions
  shadowText("INSTRUCTIONS", width/2, 47, 78, orange, grey);
  shadowText("TEAM: PRESS 'A' TO ADVANCE", width/2+36, 190, 40, orange, grey);
  shadowText("RED", width/2-244, 190, 40, red, grey);
  shadowText("TEAM: PRESS 'L' TO ADVANCE", width/2+45, 245, 40, orange, grey);
  shadowText("BLUE", width/2-246, 245, 40, blue, grey);
  shadowText("IF YOU PUSH YOUR OPPONENT BEYOND", width/2, 320, 40, orange, grey);
  shadowText("THE WHITE OUTLINE OF THE CIRCLE", width/2, 375, 40, orange, grey);
  shadowText("YOU WIN!", width/2, 430, 40, orange, grey);
  shadowText("CLICK TO START", width/2, height-35, 40, orange, grey);
}

void instructionsClicks() {
  mode = GAME;
}
