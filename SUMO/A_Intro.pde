void intro() {
  // background
  background(lightOrange);
  
  // mascot red wrestler
  mascotRedWrestler();
  mascotBlueWrestler();
  
  // title
  textFont(candyBeans);
  shadowText("SUMO", width/2, height/2-20, 200, orange, grey);
  shadowText("CLICK TO START", width/2, height-39, 44, orange, grey);
}

void introClicks() {
  mode = INSTRUCTIONS;
}
