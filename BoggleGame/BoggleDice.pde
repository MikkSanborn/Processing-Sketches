class BoggleDice {
  char[] sides;
  short sideShown;
  
  BoggleDice(char[] sides) { // any length but 0 is ok
    if (sides.length == 0) {
      throw new IllegalArgumentException("Please add at least one side.");
    }
    this.sides = sides;
  }
  
  char[] getSides() {
    return sides;
  }
  
  char getSideShowing() {
    return sides[sideShown];
  }
  
  short getSideShowingRaw() {
    return sideShown;
  }
  
  int getSideCount() {
    return sides.length;
  }
  
  void randomize() {
    sideShown = (short) random(0, sides.length);
  }
}
