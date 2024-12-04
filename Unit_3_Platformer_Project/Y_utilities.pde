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
