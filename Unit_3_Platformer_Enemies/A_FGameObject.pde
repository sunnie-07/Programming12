class FGameObject extends FBox {
  // instance variables
  final int L = -1;
  final int R = 1;

  // constructor
  FGameObject() {
    super(gridSize, gridSize);
  }
  
  FGameObject(int s) {
    super(2*s, 2*s);
  }
  
  // behaviour functions
  void act() { }
  
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
