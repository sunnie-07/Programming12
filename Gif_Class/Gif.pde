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
      println(gif[i]);
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
