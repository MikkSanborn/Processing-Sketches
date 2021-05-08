int cols = 500;

int[] pillars = new int[cols];
int sortType = 0;

float w, h;
boolean sorting = false;
int inQuestion = -1;

int sortCount = 0;

boolean normalDraw = true;

void setup() {
  size(1801, 250);
  colorMode(HSB, width, 100, 100);

  // frameRate(2000);

  w = (float) width/cols;
  h = (float) height/cols;

  for (int i = 0; i < cols; i++) {
    pillars[i] = i;
  }
  // randomize();

  noStroke();
  fill(0);
}

void draw() {
  background(255);

  fill(0);
  noStroke();

  fill(100, 90, 90);
  rect(w*inQuestion+(1.0*w/8), height, 3.0*w/4, -height);

  fill(0);
  noStroke();

  for (int i = 0; i < cols; i++) {
    if (normalDraw) {
      fill(1.0*pillars[i]*width/cols, 100, 100);
      rect(w*i+(1.0*w/8), height, 3.0*w/4, -h*pillars[i]-h);
    } else {
      stroke(1.0*pillars[i]*width/cols, 100, 100);
      fill(1.0*pillars[i]*width/cols, 100, 100);
      strokeWeight(1);
      rect(w*i+(1.0*w/8), height-h*pillars[i]-h, 3.0*w/4, 1.5*w/4);
      if (i < cols-1) {
        stroke(1.0*pillars[i]*width/cols, 100, 100);
        strokeWeight(3);
        line(w*i+(1.0*w/8)+w/2.0, height-h*pillars[i], w*(i+1)+(1.0*w/8)+w/2, height-h*pillars[i+1]);
      }
    }
  }

  if (sorting) {
    if (sortType == 0) {
      sorting = !sortPillar(); // checks and runs.
      for (int i = 0; i < sortCount; i++) {
        sortPillar();
      }
    }
  } else {
    inQuestion = -1;
  }

  if (keyPressed && key == 'q') {
    sortPillars(); // one full iteration
  }
}

void mouseClicked() {
  // sortPillar(); // one pillar swap
  sortPillar();
}

void mouseWheel() {
  sortPillars(); // one full iteration
  // sortPillar();
}

void randomize() {
  // randomize
  boolean[] used = new boolean[cols];

  for (int i = 0; i < cols; i++) {
    used[i] = false;
  }

  for (int i = 0; i < cols; i++) {
    int x = findRandomUnused(used);
    used[x] = true;

    pillars[i] = x;
  }
}

void keyPressed() {
  if (key == 'r') {
    randomize();
  }
  if (key == 's') {
    sorting = !sorting;
  }
  if (key == 'f') {
    sortAll();
  }
}

int findRandomUnused(boolean[] isUsed) {
  int x;
  while (true) {
    x = (int) random(0, cols);

    if (!isUsed[x]) {
      return x;
    }
  }
}

boolean sortPillar() {
  for (int i = 0; i < cols-1; i++) {
    if (pillars[i] > pillars[i+1]) {
      int temp = pillars[i];
      pillars[i] = pillars[i+1];
      pillars[i+1] = temp;
      inQuestion = i;
      return false; // swaps one per time
    }
  }

  inQuestion = -1;
  return true;
}

boolean sortPillars() {
  boolean finished = true;

  for (int i = 0; i < cols-1; i++) {
    if (pillars[i] > pillars[i+1]) {
      int temp = pillars[i];
      pillars[i] = pillars[i+1];
      pillars[i+1] = temp;
      finished = false;
      inQuestion = i+1;
      fill(255, 200, 255);
    }
  }

  if (!finished) {
    rect(w*inQuestion+(1.0*w/8), height, 2*3.0*w/4, -height);
  }

  return finished;
}

void sortAll() {
  boolean finished = false;

  while (!finished) {
    finished = sortPillars(); // keeps calling the sort until is finished
  }
}
