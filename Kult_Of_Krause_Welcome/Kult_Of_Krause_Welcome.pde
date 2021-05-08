float c;
int a;

void setup(){
  size(1200,800);
  colorMode(HSB,360,100,100);
  c=0;
  a=0;
}

void draw(){
  background(c%360,100,100);
  c=c+20;
  fill(0,0,0);
  textSize(150);
  if(a%400<200){
    text("Kult of Krause", 100, 480);
  } else {
    text("Welcome E", 200, 400);
    text("Block", 405, 580);
  }
  a++;
}
