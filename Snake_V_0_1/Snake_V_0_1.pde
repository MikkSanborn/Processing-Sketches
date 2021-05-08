int screen = 1; // 1 for game, home to be implemented
boolean paused;
float score = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  
  // display everything
  if (screen == 1) { // main 'play' screen
    
  }
}

class Snake {
  float[] x, y;
  float l; // length
  String interactionType;
  
  Snake (float x, float y, float l, String interactionType) {
    this.x = new float[1];
    this.y = new float[1];
    
    this.x[0] = x;
    this.y[0] = y;
    this.l = l;
    this.interactionType = interactionType;
  }
  
  void display() {
    noStroke();
    fill(#5e1f88); // head blue
    
    for (int i = 0; i < x.length; i++) {
      ellipse(x[i], y[i], 10, 10);
      fill(#29ea33); // body green
    }
    
    // eyes?
  }
  
  void move() {
    for (int i = 1; i < x.length; i++) {
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    
    if (interactionType.equals("Mouse")) {
      x[0] += mouseX/100;
      y[0] += mouseY/100;
    } else {
      println("Not implemented/check spelling");
    }
  }
  
  void eat() {
    
  }
}

class Apple {
  float x, y;
  float val; // score value
  
  Apple (float x, float y, float val) {
    this.x = x;
    this.y = y;
    this.val = val;
  }
  
  void display() {
    
  }
  
  void eaten() {
    
  }
}
