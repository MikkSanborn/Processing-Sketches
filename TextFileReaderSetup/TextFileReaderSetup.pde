import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;


void setup() {
  size(500, 500);
}

void draw() {
  
}

public String[] getStringsFromTxt(String resourceLocation) {
  ArrayList<String> allLines = new ArrayList<String>();
  TextFileReader r = new TextFileReader(resourceLocation);
  String nextLine = r.nextLine();

  // Collect Text Data
  while (true) {
    try {
      if (!nextLine.equals(null)) {
        allLines.add(nextLine);
        nextLine = r.nextLine();
      } else break;
    } 
    catch (NullPointerException e) {
      break;
    }
  }

  String[] lines = new String[allLines.size()];

  for (int i = 0; i < lines.length; i++) {
    lines[i] = allLines.get(i);
    println(lines[i]);
  }

  return lines;
}
