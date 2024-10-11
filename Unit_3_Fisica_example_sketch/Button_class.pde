class Button {
  // instance variables
  float x, y, w, h; // x, y is center
  color highlight, normal;
  String text;
  
  // constructors
  Button(String t, float _x, float _y, float _w, float _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
  }
  
  // behaviour functions
  void show() {
    drawRect();
    drawLabel();
  }
  
  // components of the behaviour functions
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
    stroke(120);
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
  
  boolean overRect() {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);
  }
}
