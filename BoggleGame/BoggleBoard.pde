class BoggleBoard {
  ArrayList<BoggleDice> dice;
  int boardSize;
  float timePerGame; // minutes
  long timeStarted;
  
  BoggleBoard(int boardSize, float timePerGame) {
    if (boardSize < 4 || boardSize > 5) {
      throw new IllegalArgumentException("No default dice setup for size " + boardSize + ". Use the other constrctor, BoggleBoard(ArrayList<BoggleDice>)");
    }
    
    this.timePerGame = timePerGame;
    
    if (boardSize == 4) {
      // dice.add(BoggleDice1);
    } else if (boardSize == 5) {
      // dice.add blah blah blah
    }
  }
  
  ArrayList<BoggleDice> getBoardState() {
    return dice;
  }
  
  void drawBoard(float x, float y, float w, float h) {
    if (w <= 0 || h <= 0) {
      throw new IllegalArgumentException("w and h must be > 0");
    }
    
    // backdrop, timestamp (create/use timeElapsed)
    
    // squares/tiles
    
    // dice
    /* 
    for each dice
    draw getSideShowing on ("X"%boardSize, "Y"/boardSize)
    */
  }
  
  void randomize() {
    for (int i = 0; i < dice.size(); i++) {
      int chosen = (int) random(i+1, dice.size());
      dice.add(0, dice.remove(chosen));
      dice.get(0).randomize();
    }
  }
}
