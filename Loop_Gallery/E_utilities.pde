void tactileCircle(float x, float y, float r) {
  if(dist(x, y, mouseX, mouseY) < r) {
    strokeWeight(3.5);
    stroke(lightGrey);
  }
  else {
    strokeWeight(3);
    stroke(darkGrey); 
  }
}

boolean OnCircle(float x, float y, float r) {
  return dist(x, y, mouseX, mouseY) < r;
}

void leftButton() {
  fill(white);
  tactileCircle(60, height/2, 35);  
  circle(60, height/2, 70);
  line(45, height/2, 70, height/2-15);
  line(45, height/2, 70, height/2+15);
}

void rightButton() {
  fill(white);
  tactileCircle(740, height/2, 35);  
  circle(740, height/2, 70);
  line(755, height/2, 730, height/2-15);
  line(755, height/2, 730, height/2+15);
}
