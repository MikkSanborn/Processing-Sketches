
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;

float[] screenDrawTimes = {2, 3.2, 3, 3, 1, 0.5, 0.8};
int afr = 60;
float[] timeRanges;

short textSize = 32;

String[] lines; // = getLines("C:\\Users\\sanbo\\Documents\\Processing\\FileWriteAndRead\\data\\readable.txt");

int frames = 0;

void setup() {
  size(500, 500);

  timeRanges = new float[screenDrawTimes.length+1];

  timeRanges[0] = 0; // starts at 0, then goes to screenDrawTimes[0], ...

  for (int i = 0; i < screenDrawTimes.length; i++) {
    timeRanges[i+1] = timeRanges[i]+screenDrawTimes[i];
  }

  textSize(textSize);
  lines = getLines("C:\\Users\\sanbo\\Documents\\Processing\\FileWriteAndRead\\data\\readable.txt");

  frameRate(afr);

  background(0);
}

void draw() {
  fill(0, 1);
  noStroke();
  rect(0, 0, width, height);

  drawScreen(frames);

  frames++;
}

void keyReleased() {
  if (key == 's') {
    String[] lines = {"\r\nLine 1", "\r\nLine 2"};
    try {
      write("ALPHA2Gamma.txt", lines);
    } 
    catch (IOException e) {
      println("Failed");
    }
  } else if (key == 'r') {
    background(0);
    frames = 0;
    lines = getLines("C:\\Users\\sanbo\\Documents\\Processing\\FileWriteAndRead\\data\\readable.txt");
  }
}

void drawScreen(int fCount) {
  float timeElapsed = 1.0*fCount/afr;

  for (int i = 0; i < timeRanges.length-1; i++) {
    if (timeElapsed >= timeRanges[i] && timeElapsed < timeRanges[i+1]) {
      show(i+1);
      return;
    }
  }

  show(timeRanges.length);
}

String[] getLines(String loc) {
  TextFileReader r = null;
  try {
    r = new TextFileReader(loc);
  } 
  catch (Exception e) {
    println(e);
    return null;
  }
  ArrayList<String> allLines = new ArrayList<String>();
  String nextLine = r.nextLine();

  while (true) {
    try {
      if (!nextLine.equals(null)) {
        allLines.add(nextLine);
        nextLine = r.nextLine();
      }
    } 
    catch (NullPointerException e) {
      break;
    }
  }

  String[] finalList = new String[allLines.size()];

  for (int i = 0; i < finalList.length; i++) {
    finalList[i] = allLines.get(i);
  }

  return finalList;
}

void show(int n) {
  // set defaults
  noFill();
  noStroke();
  textSize(12);

  if (n == 1) {
    fill(20, 213, 146.3);
    strokeWeight(3);
    stroke(255);
    rect(10, 10, 100, 200);
    fill(255);
  } else if (n == 2) {
    fill(20, 213, 196.3);
    strokeWeight(3);
    stroke(255);
    ellipse(100, 200, 100, 200);
  } else if (n == 3) {
    fill(200, 23, 16.3);
    strokeWeight(3);
    stroke(255);
    rect(80, 210, 100, 200);
  }

  fill(255);
  try {
    text(lines[n-1], 150+n*textSize/2, 100+n*textSize/2);
  } 
  catch (ArrayIndexOutOfBoundsException e) {
  }
}
