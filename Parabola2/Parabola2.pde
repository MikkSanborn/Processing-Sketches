size(500, 500);
noFill();
background(0);
strokeWeight(1);
stroke(255);

for (float x = 0; x < width; x+= 0.0625) {
  for (int n = -1; n <= 1; n+=2) {
    point(width/2+x*n*4, 100+x*x);
  }
}
println("comlete");
