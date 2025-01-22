class FCat extends FGameObject {
  // constructor
  FCat(float x, float y) {
    super();
    setName("npc cat");
    setPosition(x, y);
    setStatic(true);
  }
  
  // behaviour functions
  void act() {
    attachImg();
    collide();
  }
  
  void attachImg() {
    if (mapIndex == 0) attachImage(npcCat1);
    else if (mapIndex == 1) attachImage(npcCat2);
  }
  
  void collide() {
    if (isTouching("player")) {
      world.remove(this);
    }
  }
}
