void intro() {
  textFont(pixel);
  introGif.show();
  
  // title
  shadowText("MUSHFOREST", width/2, 103, 64, darkRed, black);
  image(mushrooms, width/2-260, 247, 520, 300);
  
  // buttons
  startBt.show();
  instru.show();
}

void introClicks() {
  if(startBt.overRect()) mode = GAME; 
  else if (instru.overRect()) mode = INSTRUCTIONS;
}
