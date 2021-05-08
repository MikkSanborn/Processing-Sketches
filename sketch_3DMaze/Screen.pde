public void display() {
  background(0);
  // switch (E.l)
  switch(Environment.level) {
  case -1:
    displayMain();
    break;
  case -2:
    displayLevelSelect();
    break;
  default:
    Environment.level = -404;
    displayErrorScreen();
    background(255);
    break;
  }
}

public HitButton Main_Play = new HitButton(250, 150, 300, 100, color(120), color(255), color(200));

public void displayMain() {
  // buttons, gif/video bg?
  background(0);

  String s = "Main";

  Main_Play.display();
  if (Main_Play.hit() && mousePressed) {
    ;
  }

  fill(255);
  text(s, width/2-textWidth(s)/2, 100);
}

public void displayLevelSelect() {
  background(0);
}

public void displayErrorScreen() {
  background(0);
  // text "something went wrong"
  // button "Main"
}

/*
Level ID's:
 -1 = Main
 -2 = Level Select
 
 -404 = Error screen. Button to return to main
 
 Levels - 
 0 = Intro
 1 = More complex
 2
 3 = Full Screen
 4 = Small screen, 2/3 layers
 
 */
