float[] x;
float[] y;

float x_off = 0;
float y_off = 0;
final float dx = .005;
final float dy = .005;

final float noise_precision = .00125;
final float max_off = 10;

void setup() {
  size(1600, 900);

  float w = 25;
  float h = 25;

  x = new float[(int) (width/w)+4];
  y = new float[(int) (height/h)+4];

  for (int i = 0; i < x.length; i++) {
    x[i] = -w+w*i;
  }
  for (int i = 0; i < y.length; i++) {
    y[i] = -h+h*i;
  }
}

void draw() {
  background(0);

  float[] x_n = x.clone();
  float[] y_n = y.clone();

  for (int i = 0; i < x_n.length; i++) {
    for (int j = 0; j < y_n.length; j++) {
      /*
      float w = 50;
       noStroke();
       fill(noise(x[i]*noise_precision+x_off, y[j]*noise_precision)*255);
       rect(i*w, j*w, w, w);*/
      x_n[i]+=noise(x[i]*noise_precision+x_off, y[j]*noise_precision)*max_off-max_off/2;
      y_n[j]+=noise(x[i]*noise_precision, y[j]*noise_precision+y_off)*max_off-max_off/2;
    }
  }

  noFill();
  noStroke();
  //fill(122);
  //stroke(122);

  for (int i = 0; i < x.length-1; i++) {
    for (int j = 0; j < y.length-1; j++) {
      float h = noise(x[i]*noise_precision/5+x_off/2, y[j]*noise_precision/2.5)*1.5-.2;
      float s = noise(x[i]*noise_precision+x_off*2, y[j]*noise_precision);
      float b = noise(x[i]*noise_precision+x_off, y[j]*noise_precision+y_off);
      int col = java.awt.Color.HSBtoRGB(h, s, b);
      fill(col);
      int col2 = java.awt.Color.HSBtoRGB(h, s, b*.9);
      stroke(col2);
      triangle(x_n[i], y_n[j], x_n[i+1], y_n[j], x_n[i], y_n[j+1]);
      triangle(x_n[i+1], y_n[j+1], x_n[i+1], y_n[j], x_n[i], y_n[j+1]);
    }
  }

  x_off+=dx;
  y_off+=dy;
}
