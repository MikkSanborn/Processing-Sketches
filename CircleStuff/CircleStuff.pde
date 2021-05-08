float t = 0;
float dt = 0.05;
float r = 200;

void setup() {
  size(500, 500);

  textMode(CENTER);

  stroke(255);
  strokeWeight(3);
  noFill();
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  background(0);

  strokeWeight(1);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);

  float b = r*sin(t)+r*cos(t)/tan(t);
  line(-width/2, -(-width/2)/tan(t)+b, width/2, -(width/2)/tan(t)+b);
  line(-width/2, -tan(t)*(width/2), width/2, tan(t)*(width/2));

  noFill();
  arc(0, 0, r/4.0, r/4.0, t%TWO_PI, 0);

  strokeWeight(3);
  ellipse(0, 0, r*2, r*2);

  strokeWeight(10);
  point(r*cos(t), r*sin(t));

  fill(255);
  text("p", (r+25)*cos(t), (r+25)*sin(t));

  // y = mx + b
  // b = y - mx

  popMatrix();

  t-=dt;
}
