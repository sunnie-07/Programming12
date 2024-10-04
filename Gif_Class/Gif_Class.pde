// Sunny Bao
// Block 1-4
// Oct 4, 2024

// GIF VARIABLES
Gif arcade;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  arcade = new Gif("frame_", "_delay-0.15s.gif", 12, 5, width/2, height/2);
}

void draw() {
  arcade.show();
}
