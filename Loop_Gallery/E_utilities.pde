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
  tactileCircle(50, height/2, 30);  
  circle(50, height/2, 60);
  line(35, height/2, 60, height/2-15);
  line(35, height/2, 60, height/2+15);
}

void rightButton() {
  fill(white);
  tactileCircle(750, height/2, 30);  
  circle(750, height/2, 60);
  line(765, height/2, 740, height/2-15);
  line(765, height/2, 740, height/2+15);
}
