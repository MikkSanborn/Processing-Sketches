void setup() {
  size(301, 301);
  noLoop();
  background(0);
}
 
void draw() {
  strokeWeight(3);
  stroke(#66C1FC);
  line(0, 300, 300, 300);
  stroke(#F55719);
  line(150, 0, 150, 300);
  //translate(0, height);
  //scale(1, -1);
  stroke(255);
  strokeWeight(1);
  float xWert = -4; // x-off
  float step = 8.0/width; // x-width
  // loop from left to right     
  for (float i = 0; i < width; i++) {
    xWert += step;  // I modified this !!!!!!!!!!!!!!!!
    float yWert = height - parabel(xWert) * 18.8125; 
    point(i, yWert);
    println("i:"
      +i 
      +", yWert:"
      +yWert 
      +", xWert:"
      +xWert);
  }
}
 
float parabel(float x) {
  float r;
  r = x*x;
  return r;
}
