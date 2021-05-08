/*  Trying to evolve a PongPaddle to play Pong well.
 The PongPaddle will play the game on the left wall
 and the right wall will simply be a solid that the
 ball bounces off of. The PongPaddle has a count 
 variable that is incremented each frame and will be
 used to measure the fitness of the paddle.
 */
import java.util.*;

PongBall ball;
PongPaddle[] paddles;
int numbPaddles = 1000;
boolean showAll = true;
int start;

boolean displayAny = true;

void setup() {
  size(800, 600);
  paddles = new PongPaddle[ numbPaddles ];
  for (int i = 0; i < paddles.length; i++) {
    paddles[i] = new PongPaddle();
  }
  resetBall();
  frameRate(2500);
  start = millis();
}

void draw() {
  
  if (frameCount % 4000 == 0) println("\t\tfr: " + frameRate);

  boolean anyAlive = false;
  int aliveCount = 0;
  for (PongPaddle paddle : paddles) {
    if (paddle.alive) {
      anyAlive = true;
      aliveCount++;
    }
  }
  
  if (displayAny) {
    background(0);
    textSize(50);
    int offset = 300;
    text("Alive: "+aliveCount, width - offset, 50);
    text("FPS: " + (int)(frameRate), width - offset, 100);
    text("Time: " + (int)((millis() - start)/1000), width - offset, 150);
  }

  //if any paddle is still alive
  if (anyAlive) {
    
    for ( PongPaddle paddle : paddles) {
      paddle.update();
    }
    
    if(showAll) {
      for ( PongPaddle paddle : paddles) {
        paddle.display();
      } 
    }
    else {
      paddles[0].display();
    }
    
    ball.update();
    ball.display();
    checkPaddleForCollisionWithBall();
  } else {
    nextGeneration();
    resetBall();
  }
}

void keyPressed() {
  if(key == ' ') {
    showAll = !showAll; 
  }
  if (key == 'd') {
    displayAny = !displayAny;
    background(80);
  }
}

void checkPaddleForCollisionWithBall() {
  boolean anyCollisions = false;
  for ( PongPaddle paddle : paddles ) {
    if ( ball.x <= paddle.x  && ball.y + ball.size >= paddle.y && ball.y <= paddle.y + paddle.h &&
      ball.dir.x < 0 && ball.x - ball.dir.x >= paddle.x)
    {
      anyCollisions = true;
      //DO NOT MODIFY THE BALL UNTIL WE HAVE CHECKED IT AGAINST ALL PADDLES
      //ball.dir.x = - ball.dir.x;
    } else if ( ball.x <= paddle.x ) {
      paddle.alive = false;
      paddle.count += Math.abs(height - Math.abs(paddle.y + paddle.w/2 - ball.y - ball.size/2));
    }
  }
  
  //NOW MODIFY THE BALL IF THERE WERE ANY COLLISIONS
  if(anyCollisions) {
    ball.dir.x = - ball.dir.x;
  }
}

void nextGeneration() {
  Arrays.sort(paddles);
  println("Best: " + paddles[numbPaddles - 1].count);
  PongPaddle[] next = new PongPaddle[numbPaddles];
  //make a perfect copy of the best one
  next[0] = paddles[numbPaddles - 1].makePerfectCopy();  
  
  //and then imperfect copies of the best ones
  for (int i = 1; i < next.length; i++) {
    if (i < 600) {
      next[i] = paddles[numbPaddles - 1].makeImperfectCopy();
    }
    else if(i < 700) {
      next[i] = paddles[numbPaddles - 2].makeImperfectCopy();
    }
    else if(i < 775) {
      next[i] = paddles[numbPaddles - 3].makeImperfectCopy();
    }
    else if(i < 825) {
      next[i] = paddles[numbPaddles - 4].makeImperfectCopy(); 
    }
    else {
      next[i] = new PongPaddle(); 
    }
  }
  

  paddles = next;
  
}


void resetBall() {
  ball = new PongBall( width/2, height/2, new PVector(-0.723, 0.2485) );
}





/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class PongBall {
  
  float x, y;
  PVector dir;
  float speed = 5;
  float size = 10;
  
  PongBall(float x, float y, PVector dir) {
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.dir.normalize();
    this.dir.mult( speed );
  }
  
  
  void update() {
    x += dir.x;
    y += dir.y;
    if(x + size >= width) {
      x = width - size; 
      dir.x = -dir.x;
    }
    if(y <= 0) {
      y = 0;
      dir.y = -dir.y;
    }
    else if(y + size >= height) {
      y = height - size;
      dir.y = -dir.y;
    }
  }
  
  void display() {
    if (displayAny) {
      fill(255);
      stroke(0);
      rect(x, y, size, size);
    }
  }
}



///////////////////////////////////////////////////////////////////////////////////////

class PongPaddle implements Comparable{

  float x, y;
  float[] yList;
  float w = 10, h = 100;
  int pos;
  int numbPositions = 10000;
  boolean alive = true;
  float alpha = 255;
  int count = 0;

  PongPaddle() {
    x = 0;
    y = height/2;
    yList = new float[numbPositions];

    for (int i = 0; i < yList.length; i++) {
      yList[i] = random( 0, height - h );
    }
    pos = 0;
  }

  void update() {
    if (alive) {
      y = yList[pos];
      pos++;
      pos %= yList.length;
      //10 per frame, but get a bonus for how close you are when done
      count += 10;                  
    } else {
      alpha = 1;
    }
  }

  void display() {
    if (displayAny) {
      fill(255, alpha);
      noStroke();
      rect(x, y, w, h);
    }
  }


  PongPaddle makeImperfectCopy( ) {
    PongPaddle copy = new PongPaddle();
    for (int i = 0; i < yList.length; i++) {
     copy.yList[i] = yList[i];
     if(Math.random() < .1) {
       copy.yList[i] = random( 0, height - h ); 
     }
    }
    return copy;
  }
  
  PongPaddle makePerfectCopy( ) {
    PongPaddle copy = new PongPaddle();
    for (int i = 0; i < yList.length; i++) {
     copy.yList[i] = yList[i];
    }
    return copy;
  }
  
  
  int compareTo(Object o) {
    PongPaddle other = (PongPaddle)o;
    return this.count - other.count;
  }
}
