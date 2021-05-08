/*
- 'S': Saves a picture
- '=' (or really +): increases the size of the circle
- '-': decreases the circle size
- 'Q': increases the speed that the balls move away from the center at
- 'W': decreases the speed that the balls move away from the center at (can go to negative, causing them to move inward.
*/

int ballCount = 10000;
float[] ballSize = new float[ballCount];
float[] xPos = new float[ballCount];
float[] yPos = new float[ballCount];
float[] xSpeed = new float[ballCount];
float[] ySpeed = new float [ballCount];
int[] Color = new int [ballCount];
float acceleration = 4;
float rad = 200;

String SavePic;
String[] Pic;
int picNumber;

///////////
// SETUP //
///////////


void setup() {
  size(1440, 805); //1440 x 805 for my laptop, 2560 x 1340 for desktop
  background(0, 0, 0);
  String[] Pic = loadStrings("Pic_Number.txt");              // THIS WiLL NEED TO BE CHANGED AFTER YOU USE IT ONCE
  picNumber=int(Pic[0]);
  for (int i=0; i<ballCount; i++) {
    ballSize[i] = 5;
    xPos[i] = random(0, width);
    yPos[i] = random(0, height);
    if(i%2==0){
      Color[i] = i+1;
    } else {
      Color[i] = ballCount-i;
    }
  }
  colorMode(HSB, ballCount, 100, 100, 100);
}
void draw() {
  fill(0,0,0,20);
  rect(0,0,width,height);
  for (int i=0; i<ballCount; i++) {
    noStroke();
    fill(Color[i], 100, 100, 50);
    ellipse(xPos[i], yPos[i], ballSize[i], ballSize[i]);
  }

  //////////////
  // MOVEMENT //
  //////////////

  for (int i=0; i<ballCount; i++ ) {
    xPos[i]+=xSpeed[i];
    yPos[i]+=ySpeed[i];
    if ((xPos[i]<0 && xSpeed[i]<0) || (xPos[i]>width && xSpeed[i]>0)) {
      xSpeed[i]*=-1;
    }
    if ((yPos[i]<0 && ySpeed[i]<0) || (yPos[i]>height && ySpeed[i]>0)) {
      ySpeed[i]*=-1;
    }
    if (mousePressed) {
      if (dist(xPos[i], yPos[i], mouseX, mouseY)<rad) {
        if (xPos[i]>mouseX && yPos[i]<mouseY) {
          xSpeed[i]+=acceleration*cos(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        } else if (xPos[i]>mouseX){
          xSpeed[i]+=acceleration*cos(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        } else  if (xPos[i]<mouseX && yPos[i]>=mouseY) {
          xSpeed[i]-=acceleration*cos(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        } else {
          xSpeed[i]-=acceleration*cos(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        }
        if (yPos[i]>mouseY && xPos[i]<=mouseX) {
          ySpeed[i]-=acceleration*sin(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        } else if (yPos[i]>mouseY ) {
          ySpeed[i]+=acceleration*sin(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        } else if (yPos[i]<mouseY && xPos[i]>mouseX){
          ySpeed[i]+=acceleration*sin(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        } else {
          ySpeed[i]-=acceleration*sin(atan((yPos[i]-mouseY)/(xPos[i]-mouseX)));
        }
      }
    }
  }
  for (int i = 0; i<ballCount; i++) {
    if (xSpeed[i]>=1) {
      xSpeed[i]-=1;
    } else if (xSpeed[i]<=-1) {
      xSpeed[i]+=1;
    } else {
      xSpeed[i]=0;
    }
    if (ySpeed[i]>=1) {
      ySpeed[i]-=1;
    } else if (ySpeed[i]<=-1) {
      ySpeed[i]+=1;
    } else {
      ySpeed[i]=0;
    }
  }



  if (keys['='] && rad<3000) {
    rad+=5;
  }
  if (keys['-'] && rad>50) {
    rad-=5;
  }
  if (keys[' ']) {
    background(0,0,0);
    for (int i=0; i<ballCount; i++) {
      
      xPos[i] = random(0, width);
      yPos[i] = random(0, height);
      xSpeed[i]=0;
      ySpeed[i]=0;
      
    }
  }
  if(keys['q']){
    acceleration+=.2;
  }
  if(keys['w']){
    acceleration-=.2;
  }
  if(keys['s']){
    save("pic"+picNumber+".jpg");
    picNumber=picNumber+1;
    SavePic=str(picNumber);
    Pic=split(SavePic,' ');
    saveStrings("Pic_Number.txt",Pic);
  }
}


boolean []keys=new boolean[1024];

void keyPressed() {
  if (!(key==CODED)) {
    keys[key]=true;
  }
}
void keyReleased() {
  if (!(key==CODED)) {
    keys[key]=false;
  }
}
