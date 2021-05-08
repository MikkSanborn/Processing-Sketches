size(1920, 1080);

strokeWeight(1);
colorMode(HSB, 360, 100, 100);

for (int x = 0; x < width; x++) {
  stroke(x*1.0/width*360, 100, 100);
  line(x, 0, x, height);
}

save("overlay.png");
