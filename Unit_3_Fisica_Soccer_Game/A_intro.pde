void intro() {
  soccerGif.show();
  
  // title
  textFont(pixel);
  shadowText("CRAZY SOCCER!", width/2, 92, 70, lightGreen, black);
  
  // buttons
  roundB.show();
  squareB.show();
}

void introClicks() {
  if(roundB.overRect()) {
    squareBall = false;
    mode = GAME;
  } else if (squareB.overRect()) {
    squareBall = true;
    mode = GAME;
  }
}
