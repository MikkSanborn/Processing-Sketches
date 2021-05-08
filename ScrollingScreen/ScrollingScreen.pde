Direction scrollDir;
float screenX, screenY;
float scrollSpeed = 2.5; // changes over time?

void setup() {
  size(500, 500);
  
  screenX = 0;
  screenY = 0;
  
  scrollDir = Direction.Left;
  
  strokeWeight(3);
  stroke(255);
  textSize(20);
}

void draw() {
  pushMatrix();
  translate(screenX, screenY);
  background(0);
  
  stroke(255);
  strokeWeight(3);
  for(int i = 0; i < width; i++) {
    line(-width*5+i*10, 0, -width*5+i*10, height);
  }
  
  switch (scrollDir) {
    case Left:
      screenX+=scrollSpeed;
      break;
    case Right:
      screenX-=scrollSpeed;
      break;
    case Up:
      screenY-=scrollSpeed;
      break;
    case Down:
      screenY+=scrollSpeed;
      break;
    case Static:
      break;
    default:
      break;
  }
  
  popMatrix();
  
  drawDir();
}

void drawDir() {
  noStroke();
  fill(0);
  rect(width-20, 0, 20, 20);
  fill(255);
  switch (scrollDir) {
    case Left:
      text("L", width-16, 16);
      break;
    case Right:
      text("R", width-16, 16);
      break;
    case Up:
      text("U", width-16, 16);
      break;
    case Down:
      text("D", width-16, 16);
      break;
    case Static:
      text("", width-16, 16);
      break;
    default:
      break;
  }
}

void mouseClicked() {
  switch (scrollDir) {
    case Left:
      scrollDir = Direction.Right;
      break;
    case Right:
      scrollDir = Direction.Up;
      break;
    case Up:
      scrollDir = Direction.Down;
      break;
    case Down:
      scrollDir = Direction.Left;
      break;
    case Static:
      break;
    default:
      break;
  }
  
}

enum Direction {
  Left, Right, Up, Down, Static
}
