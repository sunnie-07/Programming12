// text effect
void shadowText(String text, float x, float y, float size, color c1, color c2) {
  textSize(size);
  fill(c2);
  text(text, x+5.5, y+5.5);
  text(text, x+3, y+3);
  fill(c1);
  text(text, x, y);
}

// reverse image
PImage reverseImage( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );

  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
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

// button class
class Button {
  // instance variables
  float x, y, w, h;
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
    stroke(0);
    strokeWeight(5);
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
    textSize(w/14);
    text(text, x, y-3.2);
  }
  
  boolean overRect() {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);
  }
}
