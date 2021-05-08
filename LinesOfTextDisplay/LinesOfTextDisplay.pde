String[] linesFromFile;
int posInLines;

void setup() {
  size(1000, 600);
  linesFromFile = loadStrings("linesOfText.txt");
  posInLines = 0;
}

void draw() {
  background(0);

  textSize(30);
  if (frameCount < 3 * frameRate) {      //play scene1 for 3 seconds
    scene1();
  } else if (frameCount < 7 * frameRate) {    //play scene2 for the next 4 seconds
    scene2();
  } else if (frameCount < 12 * frameRate) {    //play scene2 for the next 5 seconds
    scene3();
  } else if (frameCount < 15 * frameRate) {    //play scene2 for the next 3 seconds
    scene4();
  } else {              //play the end scene after that
    end();
  }
}

void scene1() {
  posInLines = 0;          //set the position you want in the array
  fill(255);            //set a color for the text
  text(linesFromFile[posInLines], 0, 30);    //draw the text from the array at position (0,30)
}

void scene2() {          //each scene follows the pattern for scene1
  posInLines = 1;
  fill(255, 0, 0);
  text(linesFromFile[posInLines], 30, 60);
}

void scene3() {
  posInLines = 2;
  fill(255, 0, 255);
  text(linesFromFile[posInLines], 60, 90);
}

void scene4() {
  posInLines = 3;
  fill(0, 0, 255);
  text(linesFromFile[posInLines], 90, 120);
}

void end() {
  fill(255);
  text("The, th-the, th-the, that's all folks", 0, 300);
}
