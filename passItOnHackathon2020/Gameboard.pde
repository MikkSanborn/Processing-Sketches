class Gameboard {
  PImage plugboard_img = loadImage("plugboard.png");
  PFont font;
  int enigma = 0;

  Gameboard() {
    font = createFont("data//JMH Typewriter.ttf", 55);
  }

  void drawBoard() {
    PImage woodTex = loadImage("data//wood2.jpg");
    image(woodTex,0,0,2*width,height);
    image(plugboard_img, 0, 0);
    
    fill(255);
    textFont(font);
    textAlign(CENTER);
    text("$"+p1.money, 1150, height-65);
    
    textSize(35);
    textAlign(CORNER);
    text("Health:", 50,height-100);
    rectMode(CORNER);
    stroke(255);
    strokeWeight(5);
    noFill();
    rect(50, height-65, 250, 25);
    
    float health = map(p1.health, 0, 1000, 0, 250);
    fill(255);
    rect(50, height-65, health, 25);
    
    textSize(100);
    text("______", 400, height-65);
    if(enigma >= 1)
      text("E", 405, height-65);
    if(enigma >= 2)
    text("N", 475, height-65);
    if(enigma >= 3)
    text("I", 558, height-65);
    if(enigma >= 4)
    text("G", 625, height-65);
    if(enigma >= 5)
    text("M", 695, height-65);
    if(enigma >= 6){
    text("A", 770, height-65);
     //switchToGameOver();
    }
    
    if (mouseX <  1000 && mouseX > 925 && (mouseY > height-125) && (mouseY < height-45)) {
      colorMode(RGB);
      fill(200, 200, 200);
      colorMode(HSB);
    } else {
      fill(255);
    }
    triangle(925, height-45, 925, height-125, 1000, height-85);
    
    if (mouseX <  1000 && mouseX > 925 && (mouseY > height-125) && (mouseY < height-45)) {
      if(mousePressed){switchToRunning();}
    }
    
    showPlugs();
    showWires();
  }



  void showPlugs() {
    for (int i = 0; i<plugs.size(); i++) {
      plugs.get(i).display();
    }
  }

  void showWires() {
    for (int i = 0; i<wires.size(); i++) {
      wires.get(i).display();
    }
  }

  void showTowers() {
    for (int i = 0; i<towers.size(); i++) {
      towers.get(i).display();
    }
  }  

  void updateEnemies() {
    if (e.size()>0) {
      e.get(0).updateAll();
    }
  }

  void runLevel() {
    Level l = levels.get(curr_level-1);
    // println("runLevel()");
    l.runWave();
  }


  void controlTowers() {
    for (int i = 0; i<towers.size(); i++) {
      towers.get(i).setTarget();
      towers.get(i).shoot();
    }
  }
  void powerProjectiles() {
    for(int i = 0; i<proj.size(); i++){
      proj.get(i).display();
      if(proj.get(i).move()){
        proj.remove(i);
      }
    }
  }
}
