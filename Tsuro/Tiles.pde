class Tile {
  float cx, cy;
  float w, h; // overall width

  float L, R, T, B, cL, cR, cT, cB;

  Path[] p = new Path[4]; // paths

  Tile(float cx, float cy, float w, float h, Path p1, Path p2, Path p3, Path p4) {
    this.cx = cx;
    this.cy = cy;
    this.w = w;
    this.h = h;
    this.p[0] = p1;
    this.p[1] = p2;
    this.p[2] = p3;
    this.p[3] = p4;

    L = cx-w/2;
    R = cx+w/2;
    T = cy-h/2;
    B = cy+w/2;

    cL = cx-w/6;
    cR = cx+w/6;
    cT = cy-h/6;
    cB = cy+h/6;
  }

  Tile(Path p1, Path p2, Path p3, Path p4) {
    this.cx = 25; // or 0
    this.cy = 25; //
    this.w = 50; // 
    this.h = 50; //
    this.p[0] = p1;
    this.p[1] = p2;
    this.p[2] = p3;
    this.p[3] = p4;

    L = cx-w/2;
    R = cx+w/2;
    T = cy-h/2;
    B = cy+w/2;

    cL = cx-w/6;
    cR = cx+w/6;
    cT = cy-h/6;
    cB = cy+h/6;
  }

  /*
   L (x)    R (x)
   |        |
   *  1  2  * - T (y)
   3  4  5  6   - cT
   7  8  9 10   - cB
   * 11  12 * - B (y)
   |  |
   cL  cR
   */

  void display() {
    L = cx-w/2;
    R = cx+w/2;
    T = cy-h/2;
    B = cy+w/2;

    cL = cx-w/6;
    cR = cx+w/6;
    cT = cy-h/6;
    cB = cy+h/6;

    noStroke();
    fill(211, 100, 30);
    rect(L, T, w, h, 8);

    noFill();
    strokeWeight(3);
    stroke(255);

    for (int i = 0; i < 4; i++) {
      int start = p[i].getStart();
      int end = p[i].getEnd();

      // Path
      float sX, sY, eX, eY; // start (x, y), end (x, y)

      if (start == 3 || start == 7) { // set start X pos
        sX = L;
      } else if (start == 1|| start == 11) {
        sX = cL;
      } else if (start == 2 || start == 12) {
        sX = cR;
      } else if (start == 6 || start == 10) {
        sX = R;
      } else {
        sX = cx;
      }

      if (start == 1 || start == 2) { // set start Y pos
        sY = T;
      } else if (start == 3 || start == 6) {
        sY = cT;
      } else if (start == 7 || start == 10) {
        sY = cB;
      } else if (start == 11 || start == 12) {
        sY = B;
      } else {
        sY = cy;
      }

      if (end == 3 || end == 7) { // set end X pos
        eX = L;
      } else if (end == 1 || end == 11) {
        eX = cL;
      } else if (end == 2 || end == 12) {
        eX = cR;
      } else if (end == 6 || end == 10) {
        eX = R;
      } else {
        eX = cx;
      }

      if (end == 1 || end == 2) { // set end Y pos
        eY = T;
      } else if (end == 3 || end == 6) {
        eY = cT;
      } else if (end == 7 || end == 10) {
        eY = cB;
      } else if (end == 11 || end == 12) {
        eY = B;
      } else {
        eY = cy;
      }

      // CONTROL POINTS
      float c1x, c1y, c2x, c2y; // control points

      if (start == 1 || start == 3) {
        c1x = cL;
        c1y = cT;
      } else if (start == 2 || start == 6) {
        c1x = cR;
        c1y = cT;
      } else if (start == 7 || start == 11) {
        c1x = cL;
        c1y = cB;
      } else if (start == 10 || start == 12) {
        c1x = cR;
        c1y = cB;
      } else {
        c1x = cx;
        c1y = cy;
      }

      if (end == 1 || end == 3) {
        c2x = cL;
        c2y = cT;
      } else if (end == 2 || end == 6) {
        c2x = cR;
        c2y = cT;
      } else if (end == 7 || end == 11) {
        c2x = cL;
        c2y = cB;
      } else if (end == 10 || end == 12) {
        c2x = cR;
        c2y = cB;
      } else {
        c2x = cx;
        c2y = cy;
      }

      // set stroke

      bezier(sX, sY, c1x, c1y, c2x, c2y, eX, eY);
    }
  }

  boolean equals(Tile that) {
    int countTrue = 0; // count of ones that are true

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (i != j && this.p[i].equals(that.p[j])) {
          countTrue++;
          break;
        }
      }
    }
    return countTrue == 4;
  }

  void setX(float x) {
    this.cx = x;
  }

  void setY(float y) {
    this.cy = y;
  }

  void setW(float w) {
    this.w = w;
  }

  void setH(float h) {
    this.h = h;
  }

  float getX() {
    return cx;
  }

  float getY() {
    return cy;
  }

  float getW() {
    return w;
  }

  float getH() {
    return h;
  }
}

import java.util.Collections;

class Path {
  int start, end;

  Path(int start, int end) {
    this.start = start;
    this.end = end;
  }

  int getStart() {
    return start;
  }

  int getEnd() {
    return end;
  }

  boolean equals(Path that) {
    return ((this.start == that.start && this.end == that.end) || (this.start == that.end && this.end == that.start));
  }
}

class TileCollection {
  ArrayList<Tile> tiles = new ArrayList<Tile>();

  TileCollection () {
  }

  void addTile(Tile t) {
    tiles.add(t);
  }

  Tile[] getTiles() {
    Tile[] t = new Tile[tiles.size()];

    for (int i = 0; i < tiles.size(); i++) {
      t[i] = tiles.get(i);
    }

    return t;
  }

  Tile getTile(int i) {
    return tiles.get(i);
  }

  void removeTile(Tile t) {
    for (int i = 0; i < tiles.size(); i++) {
      if (t.equals(tiles.get(i))) {
        tiles.remove(i);
        return;
      }
    }
  }

  int size() {
    return tiles.size();
  }
  
  void shuffle() {
    Collections.shuffle(tiles);
  }
}
