/*

 Order of creation:
 
 I. Basic game
 - To understand the ideas, complexity, and working mechanics
 II. Rebuilt game with more customizability
 - TileSpace class for tiles? Resizable boards (4x4?)? Different win-cons?
 III. Add a possibility for a TTTBoard to be a TileSpace
 - Also make sure that once placed, the only playable region is in the referenced location
 
 */

// CURRENTLY STEP : I

TicTacToeBoard ttt;

void setup() {
  size(500, 500);

  ttt = new TicTacToeBoard();

  ttt.setTile(0, 0, 'X');
  ttt.setTile(0, 1, 'O');
  ttt.setTile(0, 2, 'X');
  ttt.setTile(1, 0, 'X');
  ttt.setTile(1, 1, 'O');
  ttt.setTile(1, 2, 'X');
  ttt.setTile(2, 0, 'O');
  ttt.setTile(2, 1, 'X');
  ttt.setTile(2, 2, 'O');

  ttt.printBoard();
}

void draw() {
  exit();
}

class TicTacToeBoard {
  // has 3x3 (9) data entries (either a board, an 'x', 'o', or [black]
  byte[][] tiles = new byte[3][3]; // [x][y]
  byte player_turn = 0; // who's turn is it now? 0 = none, 1 = p1, 2 = p2, -1 = p1 wins, -2 = p2 wins, -3 = cat's
  char p1;
  char p2;

  TicTacToeBoard() {
    player_turn = 1;
    p1 = 'X';
    p2 = 'O';
  }

  boolean setTile(int x, int y, char value) { // returns success
    if (x > tiles.length || y > tiles[x].length) throw new IllegalArgumentException("invalid coord");
    if (value != p1 && value != p2) throw new IllegalArgumentException("value must be the same char as p1 or p2");

    if (tiles[x][y] != 0) {
      println("space already filled with: " + (tiles[x][y] == 1 ? p1:p2));
      return false; // already filled.
    } else {
      // value is not p1 OR p2
      if (value == p1) {
        tiles[x][y] = 1;
        updateGameState();
        return true;
      } else if (value == p2) {
        tiles[x][y] = 2;
        updateGameState();
        return true;
      } else {
        println("?");
        return false;
      }
    }
  }

  int getGameState() { // -3 = cats, -2 = p2 wins, -1 = p1 wins, 0 = ?, 1 = p1 turn, 2 = p2 turn
    
    return player_turn;
  }

  boolean updateGameState() { // did someone win?
    // use binary summation to see if someone wins?
    int sum = 0;
    for (int y = 0; y < tiles[0].length; y++) {
      for (int x = 0; x < tiles.length; x++) {
        if (tiles[x][y] == p1) {
          sum+=(x+1)*2;
        } else if (tiles[x][y] == p2) {
          sum-=(x+1)*2;
        } // else nothing
      }
      if (sum == 14) {
        player_turn = -1;
      } else if (sum == -14) {
        player_turn = -2;
      }
    }
    return false;
  }

  void printBoard() {
    print(this.toString());
  }

  String toString() {
    String out = "";
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        out+=" ";
        if (tiles[x][y] == 0) {
          out+="";
        } else if (tiles[x][y] == 1) {
          out+=p1;
        } else if (tiles[x][y] == 2) {
          out+=p2;
        } else {
          out+="?";
        }
        out+=x != 2 ? " |":" ";
      }
      out+=(y != 2 ? "\r\n---+---+---":"\r\n")+"\r\n"; // +"\r\n" to accomadate the "ln" in "println" (ref. printBoard)
    }
    return out;
  }
}
