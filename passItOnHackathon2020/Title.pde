class Title {

  PFont font;
  boolean transition;
  float x;
  public Title() {
    font = createFont("data//JMH Typewriter.ttf", 55);
    transition = false;
    x = width;
  }

  public void display() {
    fill(255);
    textFont(font);
    PImage wood = loadImage("wood2.jpg");
    colorMode(RGB);
    background(0);

    pushMatrix();
    translate(-x, 0);
    //imageMode(CORNER);
    //image(wood, 0, 0, width, height);
    gb.drawBoard();
    
    //pushMatrix();
    //rotate(PI);
    //imageMode(CENTER);
    //image(wood, width/2+width, height/2, width, height);
    //popMatrix();
    fill(0, 0, 0, 30);
    rectMode(CENTER);
    rect(width/2+width, height/2 + 100, 400, 100);
    textSize(30);
    fill(0);
    textSize(100);
    text("Switchboard Defense", width/2-textWidth("Switchboard Defense")/2+width, height/2 - 100);
    textSize(60);
    fill(0);
    stroke(0);
    strokeWeight(3);
    text("Play", width/2-textWidth("Play")/2+width, height/2 +125);
    popMatrix();
    if (transition) {
      x-=20;
    }
    if (x==0) {
      switchToSettingUp();
    }
    if (mousePressed == true && mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 - 50 && mouseY < height/2 + 150) {
      transition = true;
    }
  }

  public void click() {
  }
}
