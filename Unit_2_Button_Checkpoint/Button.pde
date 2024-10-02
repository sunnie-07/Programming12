class Button {
  // instance variables
  int x, y, w, h; // x, y is center
  boolean clicked;
  color highlight, normal;
  String text;
  
  // constructor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }
  
  // behaviour functions
  void show() {
    drawRect();
    drawLabel();
    checkForClick();
  }
  
  boolean onRect() {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);
  }
  
  void drawRect() {
    // rectangle
    rectMode(CENTER);
    if(onRect()) {
      fill(highlight); 
    } else {
      fill(normal); 
    }
    stroke(0);
    strokeWeight(3);
    rect(x, y, w, h, 20);
  }
  
  void drawLabel() {
    // text label
    textAlign(CENTER, CENTER);
    if(onRect()) {
      fill(normal); 
    } else {
      fill(highlight); 
    }
    textSize(w/4);
    text(text, x, y);
  }
  
  void checkForClick() {
    if(mouseReleased && onRect()) {
      clicked = true;
    } else {
      clicked = false; 
    }
  }
}
