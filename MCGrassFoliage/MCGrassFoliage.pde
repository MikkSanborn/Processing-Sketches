size(256, 256);

for (int x = 0; x < width; x ++) {
  for (int y = 0; y < height; y++) {
    stroke(random(40, 120), random(20, 40), random(80, 160));
    point(x, y);
  }
}

save("grass.png");

for (int x = 0; x < width; x ++) {
  for (int y = 0; y < height; y++) {
    stroke(random(40, 120), random(80, 160), random(20, 40));
    point(x, y);
  }
}

save("foliage.png");

println("Done");

exit();
