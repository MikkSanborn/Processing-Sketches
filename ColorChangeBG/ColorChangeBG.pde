float t = 0;

float R = 200;
float G = 30;
float B = 20;

float DR = 0;
float DG = 0;
float DB = 0;

float cOff = 0.05;
float lim = 4;

void setup() {
  size(500, 500);

  textSize(24);

  background(R, G, B);
}

void draw() {
  fill(R, G, B, 180);
  rect(-2, -2, width+2, height+2);

  pushMatrix();
  translate(width/2, height/2);
  rotate(TWO_PI*cos(sin(t))+1.412);
  scale(1+.75*sin(t));

  fill(255-R, 255-G, 255-B);
  text("Yaaaay!", -textWidth("Yaaaay!")/2, 8);

  popMatrix();

  R+=DR;
  G+=DG;
  B+=DB;

  if (R > 255)
    R = 255;
  else if (R < 0) 
    R = 0;
  if (G > 255)
    G = 255;
  else if (G < 0) 
    G = 0;
  if (B > 255)
    B = 255;
  else if (B < 0) 
    B = 0;

  DR+=random(-cOff, cOff);
  DG+=random(-cOff, cOff);
  DB+=random(-cOff, cOff);

  if (DR > lim)
    DR = lim;
  else if (DR < -lim)
    DR = -lim;
  if (DG > lim)
    DG = lim;
  else if (DG < -lim)
    DG = -lim;
  if (DB > lim)
    DB = lim;
  else if (DB < -lim)
    DB = -lim;


  println(DR + "\t\t" + DG + "\t\t" + DB);

  t+=0.0033;
}
