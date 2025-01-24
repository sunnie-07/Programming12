void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == black) { // wood plank
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, wood, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, wood, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, wood, gridSize);
      }
      else if (c == dullBlue) { // red brick
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, brick, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, brick, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, brick, gridSize);
      }
    }
  }
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  int x = start;
  int z = start;
  while (z < end) {
    texturedCube(x, level, z, wood, gap);
    x += gap;
    if (x >= end) {
      x = start;
      z += gap;
    }
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  fill(white);
  sphere(5);
  popMatrix();
}
