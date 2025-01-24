void move() {
  if (wkey && canMoveForward()) {
    eyeX += cos(LRHeadAngle)*12;
    eyeZ += sin(LRHeadAngle)*12;
  }
  if (skey && canMoveBackward()) {
    eyeX -= cos(LRHeadAngle)*12;
    eyeZ -= sin(LRHeadAngle)*12;
  }
  if (akey && canMoveLeft()) {
    eyeX -= cos(LRHeadAngle + PI/2)*12;
    eyeZ -= sin(LRHeadAngle + PI/2)*12;
  }
  if (dkey && canMoveRight()) {
    eyeX += cos(LRHeadAngle + PI/2)*12;
    eyeZ += sin(LRHeadAngle + PI/2)*12;
  }

  if (skipFrame == false) {
    LRHeadAngle += (mouseX - pmouseX)*0.008;
    UDHeadAngle += (mouseY - pmouseY)*0.008;
  }

  if (UDHeadAngle > PI/2.5) UDHeadAngle = PI/2.5;
  if (UDHeadAngle < -PI/2.5) UDHeadAngle = -PI/2.5;

  focusX = eyeX + cos(LRHeadAngle)*300;
  focusZ = eyeZ + sin(LRHeadAngle)*300;
  focusY = eyeY + tan(UDHeadAngle)*300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  
  fwdx = eyeX + cos(LRHeadAngle)*150;
  fwdy = eyeY;
  fwdz = eyeZ + sin(LRHeadAngle)*150;
  
  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;
  
  if (map.get(mapx, mapy) == white) return true;
  else return false;
}

boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;
  
  leftx = eyeX + cos(LRHeadAngle-radians(90))*150;
  lefty = eyeY;
  leftz = eyeZ + sin(LRHeadAngle-radians(90))*150;
  
  mapx = int(leftx+2000)/gridSize;
  mapy = int(leftz+2000)/gridSize;
  
  if (map.get(mapx, mapy) == white) return true;
  else return false;
}

boolean canMoveRight() {
  float rightx, righty, rightz;
  int mapx, mapy;
  
  rightx = eyeX + cos(LRHeadAngle+radians(90))*150;
  righty = eyeY;
  rightz = eyeZ + sin(LRHeadAngle+radians(90))*150;
  
  mapx = int(rightx+2000)/gridSize;
  mapy = int(rightz+2000)/gridSize;
  
  if (map.get(mapx, mapy) == white) return true;
  else return false;
}

boolean canMoveBackward() {
  float bwdx, bwdy, bwdz;
  int mapx, mapy;
  
  bwdx = eyeX + cos(LRHeadAngle+radians(180))*150;
  bwdy = eyeY;
  bwdz = eyeZ + sin(LRHeadAngle+radians(180))*150;
  
  mapx = int(bwdx+2000)/gridSize;
  mapy = int(bwdz+2000)/gridSize;
  
  if (map.get(mapx, mapy) == white) return true;
  else return false;
}
