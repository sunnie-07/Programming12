class Button {
  // instance variables
  int x, y, w, h; // x, y is center
  boolean clicked;
  color highlight, normal;
  String text;
  PImage image;
  
  // constructors
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
  
  Button(PImage img, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    image = img;
    highlight = high;
    normal = norm;
    clicked = false;
  }
  
  // behaviour functions
  void showWithText() {
    drawRect();
    drawLabel();
    checkForClick();
  }
  
  void showWithImage() {
    drawRect();
    drawImage();
    checkForClick();
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
  
  void drawImage() {
    // image label
    imageMode(CENTER);
    image(image, x, y, h*0.8, h*0.8);
  }
  
  void checkForClick() {
    if(mouseReleased && onRect()) {
      clicked = true;
    } else {
      clicked = false; 
    }
  }
}
