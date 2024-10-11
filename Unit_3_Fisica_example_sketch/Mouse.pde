void mousePressed() {
  if(gravityBtn.overRect() && gravity == 900) {
    gravity = 0;
  } else if(gravityBtn.overRect() && gravity == 0) {
    gravity = 900;
  }
  world.setGravity(0, gravity);
  if(FBodyBtn.overRect()) makeFBodies = !makeFBodies;
}
