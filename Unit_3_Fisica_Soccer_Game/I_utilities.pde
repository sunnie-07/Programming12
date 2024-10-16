// text effect
void shadowText(String text, float x, float y, float size, color c1, color c2) {
  textSize(size);
  fill(c2, 160);
  text(text, x+6.5, y+6.5);
  text(text, x+4, y+4);
  fill(c1);
  text(text, x, y);
}

// reset
void reset() {
  
}

// button class
class Button {
  // instance variables
  float x, y, w, h;
  color highlight, normal;
  String text;
  PImage image;
  
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
  
  Button(PImage img, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    image = img;
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
    imageMode(CENTER);
    if(onRect()) {
      fill(normal); 
    } else {
      fill(highlight); 
    }
    if(image == null) {
      textSize(w/4);
      text(text, x, y);
    } else {
      image(image, x, y, h*0.8, h*0.8);
    }
  }
  
  boolean overRect() {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);
  }
}

// gif class
class Gif {
  // instance variables
  PImage[] gif;
  int currentFrame;
  int numFrames; // number of frames of the gif
  float speed; // speed of the gif
  float x, y, w, h; // coordinates and size of gif
  
  // constructors
  Gif(String before, String after, int num, float s, float _x, float _y) {
    gif = new PImage[num];
    numFrames = num;
    speed = s;
    currentFrame = 0;
    x = _x;
    y = _y;
    
    // load images
    for(int i = 0; i < numFrames; i++) {
      gif[i] = loadImage(before + i + after);
    }
    
    w = gif[0].width;
    h = gif[0].height;
  }
  
  Gif(String before, String after, int num, float s, float _x, float _y, float _w, float _h) {
    this(before, after, num, s, _x, _y); // calls the other constructor
    w = _w;
    h = _h;
  }
  
  // behaviour functions
  void show() {
    if(currentFrame == numFrames) currentFrame = 0;
    image(gif[currentFrame], x, y, w, h);
    if(frameCount % speed == 0) currentFrame++;
  }
}
