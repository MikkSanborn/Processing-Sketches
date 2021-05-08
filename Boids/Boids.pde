ArrayList<Bird> flock = new ArrayList<Bird>();
float birdSpeed = 3;
float visionRange = 50;
float spaceRange = 15;
float flockRange = 100;
float numberOfBirds = 100;

void setup(){
  //size(1600,800);
  fullScreen();
  
  frameRate(100);
  colorMode(HSB);
  
  ellipseMode(RADIUS);
  noStroke();
  fill(255);
  
  for(int i = 0; i < numberOfBirds; i++){
    Bird bird = new Bird(random(100, width-100), random(100, height-100), birdSpeed, random(-3, 3));
    flock.add(bird); 
    bird.assignFlock(flock);
  }
}

void draw(){
  background(0);
  
  for(Bird b: flock){
    b.update(); 
    b.display(); 
  }
}

class Bird {
  PVector pos, vel;
  float speed;
  float range1, range2, range3;
  ArrayList<Bird> flock;
  color col;
  
  Bird(float x, float y){
    pos = new PVector(x, y);
    
    range1 = spaceRange;
    range2 = visionRange;
    range3 = flockRange;
    speed = birdSpeed;
    col = color(random(255),random(255),random(255));
  }
  
  Bird(float x, float y, float mag, float ang){
    pos = new PVector(x, y);
    vel = PVector.fromAngle(ang);
    vel.mult(mag);
    range1 = spaceRange;
    range2 = visionRange;
    range3 = flockRange;
    speed = birdSpeed;
    col = color(random(255),100+random(155), 100+random(155));
  }
  
  void assignFlock(ArrayList<Bird> birds){
    this.flock = birds; 
  }
  
  void update(){
    //followMouse();
    cohere();
    align();
    separate();
    avoidWall();
    
    vel.normalize();
    vel.mult(speed);
    
    move();
  }
  
  void display(){
    //fill(255,5);
    //ellipse(pos.x, pos.y, range3, range3);
    
    fill(col);
    
    translate(pos.x, pos.y);
    rotate(vel.heading());
    
    ellipse(0,0, 6, 3);
    
    rotate(-vel.heading());
    translate(-pos.x, -pos.y);
  }
  
  void move(){
    pos.x += vel.x;
    pos.y += vel.y;  
  }
  
  void avoidWall(){
    if(pos.x < range2 && vel.x < 0){
      vel.x = -vel.x; 
    } else if(pos.x > width - range2 && vel.x > 0){
      vel.x = -vel.x; 
    }
    
    if(pos.y < range2 && vel.y < 0){
      vel.y = -vel.y; 
    } else if(pos.y > height - range2 && vel.y > 0){
      vel.y = -vel.y; 
    }
  }
  
  void align(){
     PVector acc = new PVector(0,0);
     for(Bird b: flock){
       if(this.pos.dist(b.pos) < range2 && b != this){
         acc.add(b.vel);
       }
     }
     
     acc.normalize();
     acc.mult(speed/10);
     vel.add(acc);
  }
  
  void separate(){
    PVector acc = new PVector(0,0);
    for(Bird b: flock){
       if(this.pos.dist(b.pos) < range1 && b != this){
         PVector diff = PVector.sub(this.pos, b.pos);
         acc.add(diff);
       }
    }
    
    acc.normalize();
    acc.mult(speed/5);
    vel.add(acc);
  }
  
  void cohere(){
    PVector acc = new PVector(0,0);
    for(Bird b: flock){
       if(this.pos.dist(b.pos) < range3 && b != this){
         PVector diff = PVector.sub(b.pos, this.pos);
         acc.add(diff);
       }
    }
    
    acc.normalize();
    acc.mult(speed/40);
    vel.add(acc);
  }
  
  void followMouse(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector acc = PVector.sub(mouse, this.pos);
    acc.normalize();
    acc.mult(speed/20);
    vel.add(acc);
  }
}
