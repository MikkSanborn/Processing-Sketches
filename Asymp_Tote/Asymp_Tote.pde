size(500, 500);
background(0);
noStroke();
fill(255);

for (int y = -250; y < 250; y++) {
  try {
    rect(width/2+y*1, height/2, 1, 250/y);
  } catch (Exception e) { // catches the error that would stop the program at 20/0.
  }
}
