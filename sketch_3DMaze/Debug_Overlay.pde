public void displayDebugOverlay() {
  strokeWeight(1);
  stroke(255, 80);

  for (int i = 0; i <= width/50; i++) {
    if (i%4 == 0)
      strokeWeight(3);
    else 
    strokeWeight(1);

    line(i*50, 0, i*50, height);
  }

  for (int i = 0; i <= height/50; i++) {
    if (i%4 == 0)
      strokeWeight(3);
    else 
    strokeWeight(1);

    line(0, i*50, width, i*50);
  }

  pushStyle();
  textFont(georgiaItalic, 12);
  text("(" + mouseX + ", " + mouseY + ")", mouseX, mouseY);
  popStyle();
}
