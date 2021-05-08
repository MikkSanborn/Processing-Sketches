// Every now and then it seems to freeze. If you find the cause, please make a fork with the fix.

PImage bgpic;
String bgploc = "bg.jpg";

Boolean showDebugInfo = false;

float h = 180; // change this to adjust the color of the text

int level;
int levelsave;
Boolean ballactive;
Boolean paused;
float waitWin;
float timer;
float hs1 = 0;
float hs2 = 0;
float hs3 = 0;
float sI; // speedIndex 
Boolean clickBounce = true;
Boolean stop = false;
float afr;

Ball bmain;
BackButton backHome;
BackButton pause;
BallSelectorPanel BSP;

//Level 1
BounceTriangle t1;
BounceTriangle t2;
BounceTriangle t3;
BounceTriangle t4;
BounceTriangle t5;
BounceTriangle t6;
SlowRect t7;
SlowRect t8;
BounceTriangle t9;
SlowRect t10;

//Level 2
BounceTriangle t11;
BounceTriangle t12;
BounceTriangle t13;
BounceTriangle t14;
BounceTriangle t15;
BounceTriangle t16;
SlowRect t17;
BounceTriangle t18;
SlowRect t19;
BounceTriangle t20;
BounceTriangle t21;
BounceTriangle t22;
BounceTriangle t23;
SlowRect t24;
SlowRect t25;
SlowRect t26;
SlowRect t27;
BounceTriangle t28;

//Level 3
BounceTriangle t29;
BounceTriangle t30;
BounceTriangle t31;
BounceTriangle t32;
BounceTriangle t33;
BounceTriangle t34;
BounceTriangle t35;
BounceTriangle t36;
BounceTriangle t37;
BounceTriangle t38;
BounceTriangle t39;
BounceTriangle t40;
BounceTriangle t41;
BounceTriangle t42;
SlowRect t43;
BounceTriangle t44;
BounceTriangle t45;
SlowRect t46;
SlowRect t47;
SlowRect t48;
SlowRect t49;
SlowRect t50;
SlowRect t51;
DeathRect t52;
DeathRect t53;
DeathRect t54;
DeathRect t55;
DeathRect t56;
DeathRect t57;
DeathRect t58;
SlowRect t59;
SlowRect t60;
SlowRect t61;
SlowRect t162; // leading one to represent a different type.
SlowRect t63;
SlowRect t64;

void setup() {
  size(800, 500);
  afr = 45;
  frameRate(afr);
  colorMode(HSB, 360, 100, 100, 100);
  
  triangleSetup();

  bmain = new Ball(50, 375, 0, 0, 0);
  backHome = new BackButton(0, 0);
  pause = new BackButton(0, 0);
  BSP = new BallSelectorPanel(0);
  ballactive = false;
  paused = false;
  level = 0; // level
  levelsave = 4;
  waitWin = 180;
  // bgpic = loadImage("https://st.depositphotos.com/2302065/3225/i/950/depositphotos_32256439-stock-photo-black-wood-texture-background.jpg");
  // bgpic = loadImage("https://st.depositphotos.com/2302065/3225/i/950/depositphotos_32256439-stock-photo-black-wood-texture-background.jpg");
  bgpic = loadImage(bgploc);

  sI = 2; // speedIndex
  timer = 0;
}

void draw() {
  drawAll();
}

void mouseClicked() {
  mouseClickedAll();
}
