int numSelected = 0;
float r = 20;

void setup() {
  size(800, 800);

  stroke(255);
  fill(255);
  strokeWeight(5);
  textSize(16);
}

void draw() {
  background(0);
  
  line(100, 160, 700, 680);
  line(280, 560, 220, 110);
  line(520, 700, 590, 180);
  
  text("1", 218, 252);
  text("2", 257, 277);
  text("3", 255, 321);
  text("4", 230, 302);
  text("5", 530, 523);
  text("6", 553, 540);
  text("7", 547, 576);
  text("8", 524, 559);
  
  println(numSelected);
  
  if (dist(mouseX, mouseY, 218, 252) < r) {
    print("Angle one is ");
    switch(numSelected) {
      case 0: 
        println("Angle 1");  // Does not execute
        break;
      case 1: 
        println("the same as Angle 1");
        break;
      case 2:
        println("supplementary to Angle 2");
        break;
      case 3:
        println("linearly paired with Angle 3");
        break;
      case 4:
        println("supplementary to Angle 4");
        break;
      case 5:
        println("correspondant to Angle 5");
        break;
      case 6:
        println("consecutively exterior to Angle 6");
        break;
      case 7:
        println("alternatively exterior to Angle 7");
        break;
      case 8:
        //println("
        break;
    }
  }
  if (dist(mouseX, mouseY, 257, 277) < r) {
  }
  if (dist(mouseX, mouseY, 255, 321) < r) {
  }
  if (dist(mouseX, mouseY, 230, 302) < r) {
  }
  if (dist(mouseX, mouseY, 530, 523) < r) {
  }
  if (dist(mouseX, mouseY, 553, 540) < r) {
  }
  if (dist(mouseX, mouseY, 547, 576) < r) {
  }
  if (dist(mouseX, mouseY, 524, 559) < r) {
  }
}

void mouseClicked() {
  if (dist(mouseX, mouseY, 218, 252) < r) { // check 1
    numSelected = 1;
  }
  if (dist(mouseX, mouseY, 257, 277) < r) {
    numSelected = 2;
  }
  if (dist(mouseX, mouseY, 255, 321) < r) {
    numSelected = 3;
  }
  if (dist(mouseX, mouseY, 230, 302) < r) {
    numSelected = 4;
  }
  if (dist(mouseX, mouseY, 530, 523) < r) {
    numSelected = 5;
  }
  if (dist(mouseX, mouseY, 553, 540) < r) {
    numSelected = 6;
  }
  if (dist(mouseX, mouseY, 547, 576) < r) {
    numSelected = 7;
  }
  if (dist(mouseX, mouseY, 524, 559) < r) {
    numSelected = 8;
  }
}
