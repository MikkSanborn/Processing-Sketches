
///////////////
// VARIABLES //
///////////////
ArrayList<Bubble> bubs;
int mode;
boolean done;
boolean popping;
///////////
// SETUP //
///////////

void setup() {
  fullScreen();
  bubs = new ArrayList<Bubble>();
  colorMode(HSB, 255, 255, 255);
  mode = 0;
  done = false;
  popping = false;
  
  background(0);
}

//////////
// DRAW //
//////////

void draw() {
  // background(0);
  noStroke();
  fill(0, 0, 0, 100);
  rect(-2, -2, width+4, height+4);
  
  if (mode == 0) {
    for (int i = 0; i<bubs.size(); i++) {
      bubs.get(i).move();
      if (bubs.get(i).popped()) {
        bubs.remove(i);
        i--;
      }
    }
    if (mousePressed) {
      bubs.add(new Bubble(mouseX, mouseY, (int)random(20, 50), random(1, 4), true));
    }
  } else if (mode == 1) {
    if (!popping) {
      if (mousePressed) {
        bubs.add(new Bubble(mouseX, mouseY, (int)random(20, 50), random(1, 4), false));
      }
    } else {
      for (int i = 0; i<bubs.size(); i++) {
        if (bubs.get(i).dista(mouseX, mouseY)<50 && mousePressed) {
          bubs.get(i).pop();
        }
        if (bubs.get(i).popped) {
          bubs.remove(i);
          i--;
        }
      }
    }
  }
  modeChange();
  if (keys['c']) {
    remAll();
  }
}


public void modeChange() {
  if (keys[' '] && !done) {
    if (mode == 1) {
      mode = 0;
      done = true;
    } else {
      mode++;
      done = true;
    }
    remAll();
  } else if (!keyPressed) {
    done = false;
  }
}

public void remAll() {
  while (bubs.size()>0)
    bubs.remove(0);
}





///////////////
// KEY STUFF //
///////////////

boolean[] keys = new boolean[1024];

void keyPressed() {
  if (!(key==CODED)) {
    keys[key]=true;
  }
}
void keyReleased() {
  if (!(key==CODED)) {
    keys[key]=false;
  }
}
