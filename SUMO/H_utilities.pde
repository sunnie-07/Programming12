void shadowText(String text, float x, float y, float size, color c1, color c2) {
  textSize(size);
  fill(c2, 160);
  text(text, x+6.5, y+6.5);
  text(text, x+4, y+4);
  fill(c1);
  text(text, x, y);
}
