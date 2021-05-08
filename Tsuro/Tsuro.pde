TileCollection deck;

Level level = Level.Debug;
int levelPlayable = 0;

void setup() {
  size(500, 500);

  

  deck = new TileCollection();

  deck.addTile(new Tile(new Path(1, 2), new Path(6, 10), new Path(11, 12), new Path(3, 7)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 10), new Path(7, 12), new Path(3, 11)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 10), new Path(3, 12), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 12), new Path(7, 10), new Path(3, 11)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 12), new Path(7, 11), new Path(3, 10)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 11), new Path(3, 12), new Path(7, 10)));
  deck.addTile(new Tile(new Path(1, 2), new Path(3, 10), new Path(7, 12), new Path(6, 11)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 7), new Path(10, 12), new Path(3, 11)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 7), new Path(10, 11), new Path(3, 12)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 7), new Path(3, 10), new Path(11, 12)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 3), new Path(10, 12), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 3), new Path(10, 11), new Path(7, 12)));
  deck.addTile(new Tile(new Path(1, 2), new Path(6, 3), new Path(10, 7), new Path(11, 12)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 10), new Path(3, 11), new Path(7, 12)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 10), new Path(3, 12), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 12), new Path(7, 10), new Path(3, 11)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 12), new Path(3, 10), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 11), new Path(7, 10), new Path(3, 12)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 11), new Path(3, 10), new Path(7, 12)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 7), new Path(10, 12), new Path(3, 11)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 7), new Path(10, 11), new Path(3, 12)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 3), new Path(10, 12), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 6), new Path(2, 3), new Path(10, 11), new Path(7, 12)));
  deck.addTile(new Tile(new Path(1, 10), new Path(2, 6), new Path(3, 12), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 10), new Path(2, 12), new Path(3, 11), new Path(7, 6)));
  deck.addTile(new Tile(new Path(1, 10), new Path(2, 12), new Path(3, 6), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 10), new Path(3, 12), new Path(6, 7), new Path(2, 11)));
  deck.addTile(new Tile(new Path(1, 10), new Path(2, 7), new Path(3, 12), new Path(6, 11)));
  deck.addTile(new Tile(new Path(2, 6), new Path(1, 12), new Path(3, 11), new Path(7, 10)));
  deck.addTile(new Tile(new Path(1, 12), new Path(2, 6), new Path(3, 10), new Path(7, 11)));
  deck.addTile(new Tile(new Path(1, 12), new Path(2, 10), new Path(6, 7), new Path(3, 11)));
  deck.addTile(new Tile(new Path(1, 12), new Path(2, 11), new Path(3, 10), new Path(6, 7)));
  deck.addTile(new Tile(new Path(1, 12), new Path(2, 11), new Path(3, 6), new Path(7, 10)));
  deck.addTile(new Tile(new Path(1, 11), new Path(2, 12), new Path(3, 6), new Path(7, 10)));
  deck.addTile(new Tile(new Path(1, 3), new Path(2, 6), new Path(7, 11), new Path(10, 12)));
  // deck.addTile(new Tile(new Path(1, 12), new Path(3, 10), new Path(3, 12), new Path(1, 10)));
  
  deck.shuffle();
  
  /*
      
   *  1  2  *
   3  4  5  6
   7  8  9 10
   * 11  12 *
   
   */

  for (int i = 0; i < deck.size(); i++) {
    deck.getTile(i).setW(width/6-2);
    deck.getTile(i).setH(height/6-2);
    deck.getTile(i).setX((i%6)*width/6+deck.getTile(i).getW()-width/12);
    deck.getTile(i).setY((i/6)*height/6+deck.getTile(i).getH()-height/12);
  }
}

void draw() {
  background(0);

  switch (level) {
  case LevelPlayable:
    break;
  case Main:
    break;
  case Tutorial:
    break;
  case Options:
    break;
  case Credits:
    break;
  case Debug:
    // deck.getTile(deck.size()-1).display();

    for (int i = 0; i < deck.size(); i++) {
      deck.getTile(i).display();
    }

    break;
  default:
    break;
  }
}

public enum Level {
  Main, Tutorial, Options, Credits, LevelPlayable, Debug
}
