float t1 = 0; 
float t2 = 0;
float t1i = 0.015;
float t2i = 0.02;
float w = 100;

ArrayList<Float> X = new ArrayList<Float>();
ArrayList<Float> Y = new ArrayList<Float>();
ArrayList<Float> Z = new ArrayList<Float>();

void setup() {
  size(500, 500, P3D);

  background(0);
  fill(0, 0, 200, 200);
  // noFill();
  strokeWeight(3);
  stroke(255);

  pushMatrix();
  translate(250, 250, -100);
  rotateY(QUARTER_PI);
  rotateZ(3.2*QUARTER_PI);
}

void draw() {
  background(0);

  pushMatrix();
  translate(250, 250, -100);

  strokeWeight(3);
  stroke(255);
  X.add(w*sin(t1));
  Y.add(w*cos(t1));
  Z.add(w*sin(t2));

  for (int i = 0; i < X.size(); i++) {
    strokeWeight(3);
    stroke(255);
    point(X.get(i), Y.get(i), Z.get(i));
  }

  popMatrix();
  
  pushMatrix();
  translate(250, 250, -100);
  rotateY(QUARTER_PI);
  rotateZ(3.2*QUARTER_PI);

  strokeWeight(1);
  stroke(80, 180, 80, 100);
  fill(0, 255, 255, 100);

  sphere(mouseX);
  println(mouseX);

  popMatrix();
  
  t1+=t1i;
  t2+=t2i;

  /*
  if (frameCount == 1) {
    pushMatrix();
    translate(250, 250, -100);
    rotateY(QUARTER_PI);
    rotateZ(3.2*QUARTER_PI);

    strokeWeight(1);
    stroke(80, 180, 80);
    fill(0, 255, 255);

    sphere(2*w);

    popMatrix();
  }
  */
}
