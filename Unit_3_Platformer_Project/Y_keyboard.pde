void keyPressed() {
  if (key == 'S' || key == 's') skey = true;
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'Q' || key == 'q') qkey = true;
  if (key == 'E' || key == 'e') ekey = true;
  if (key == 'Z' || key == 'z') zkey = true;
}

void keyReleased() {
  if (key == 'S' || key == 's') skey = false;
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'Q' || key == 'q') qkey = false;
  if (key == 'E' || key == 'e') ekey = false;
  if (key == 'Z' || key == 'z') zkey = false;
}
