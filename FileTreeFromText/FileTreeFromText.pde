int n = 4;
String[] lines = loadStrings("tree" + n + ".txt");

size(500, 148600);
background(220);

fill(0);
textSize(10);

for (int i = 0; i < lines.length; i++) {
  text(lines[i], 10, 20+i*10);
}

save("tree" + n + ".png");
println("complete");
exit();
