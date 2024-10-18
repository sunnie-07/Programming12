void keyPressed() {
  if(key == 'w' || key == 'W') wkey = true;
  if(key == 'a' || key == 'A') akey = true;
  if(key == 'd' || key == 'D') dkey = true;
  if(keyCode == UP) upkey = true;
  if(keyCode == LEFT) leftkey = true;
  if(keyCode == RIGHT) rightkey = true;
}

void keyReleased() {
  if(key == 'w' || key == 'W') wkey = false;
  if(key == 'a' || key == 'A') akey = false;
  if(key == 'd' || key == 'D') dkey = false;
  if(keyCode == UP) upkey = false;
  if(keyCode == LEFT) leftkey = false;
  if(keyCode == RIGHT) rightkey = false;
}
