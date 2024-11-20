class FGameObject extends FBox {
  // constructor
  FGameObject() {
    super(gridSize, gridSize);
  }

  // behaviour functions
  void act() {
  }

  boolean isTouching(String s) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(s)) {
        return true;
      }
    }
    return false;
  }
}
