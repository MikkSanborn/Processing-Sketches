float x, y;
float w = 80;
float h = 40;
float offset = 25;
float skew = 2.5; // default = 1
float skewA = 1; // alt skew; default = 1

void setup() {
  size(500, 500);
  
  x = width/2;
  y = height/2;
}

void draw() {
  background(0);


  quad(x-w, y-h, x-w+(offset*skew), y-h-(offset*skewA), x+w+(offset*skew), y-h-(offset*skewA), x+w, y-h); // top
  quad(x+w, y-h, x+w, y+h, x+w+(offset*skew), y+h-(offset*skewA), x+w+(offset*skew), y-h-(offset*skewA)); // right
  // quad(x, y, x, y+h, x-w+(offset+skew), y-h-(offset*skewA), x+w+(offset*skew), y-h-(offset*skewA));
  
  rect(x-w, y-h, w*2, h*2);

  if (keyPressed) {
    if (key == 'x') {
      x++;
    } else if (key == 'X') {
      x--;
    }
    if (key == 'y') {
      y++;
    } else if (key == 'Y') {
      y--;
    }
    if (key == 'w') {
      w++;
    } else if (key == 'W') {
      w--;
    }
    if (key == 'h') {
      h++;
    } else if (key == 'H') {
      h--;
    }
    if (key == 's') {
      skew+=.1;
    } else if (key == 'S') {
      skew-=.1;
    }
    if (key == 'a') {
      skewA+=.1;
    } else if (key == 'A') {
      skewA-=.1;
    }
    if (key == 'd') {
      skew+=.1;
      skewA+=.1;
    } else if (key == 'D') {
      skew-=.1;
      skewA-=.1;
    }
  }
}
