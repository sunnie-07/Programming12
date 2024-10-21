void gameover() {
  skyGif.show();
  
  if(leftPScore > rightPScore) {
    shadowText("LEFT WINS!", width/2, height/2-5, 60, darkBlue, black);
  } else if(rightPScore > leftPScore) {
    shadowText("RIGHT WINS!", width/2, height/2-5, 60, turqoise, black);
  }
}
