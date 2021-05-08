class Enemy {
  public float size; //radius
  public float health; //arbitrarily assigned to size
  public float speed; //arbitrarily assigned to size
  public int wirePos;
  public Position pos;

  //Stuff for the wire move
  public float currentWireTheta;

  public Enemy() {
    size = 20;
    health = size;
    speed = 10; //unchanging
    wirePos = 0;
    pos = new Position(wires.get(wirePos).getStartPlug().getPosition().x, wires.get(wirePos).getStartPlug().getPosition().y, size);
    currentWireTheta = 0;
  }

  public Enemy(float size) {
    this.size =size;
    health = size*10;
    speed = 50/size;
    if(health<=50){
      speed = 5;
    }
    
    wirePos = 0;
    pos = new Position(wires.get(wirePos).getStartPlug().getPosition().x, wires.get(wirePos).getStartPlug().getPosition().y, size);
    currentWireTheta = 0;
  }

  public void decrementHealth(float dec) {
    health-=dec;
    size = health/10;
    speed = 50/size;
    if(health<=50){
      speed = 5;
    }
  }
  public Position getPosition() {
    return pos;
  }

  public void display() {
    ellipseMode(CENTER);
    colorMode(RGB);
    strokeWeight(1);
    fill(0, 255, 0); // no change in opacity
    ellipse(pos.x, pos.y, size, size);
  }

  public void update() {
    float endY = wires.get(wirePos).getEndPlug().getPosition().y;
    float endX = wires.get(wirePos).getEndPlug().getPosition().x;
    float startY = wires.get(wirePos).getStartPlug().getPosition().y;
    float startX = wires.get(wirePos).getStartPlug().getPosition().x;
    //set current wire theta
    currentWireTheta = (float) Math.atan((endY-startY)/(endX-startX));
   
    float dx = abs(speed*cos(currentWireTheta));
    float dy = abs(speed*sin(currentWireTheta));

    if(dist(endX, endY, pos.x, pos.y) <=speed) {

      if (wirePos == wires.size()-1) {
        //This is where it should kill itself
        p1.damage(health);
        health=-10;
        size = 0;
        speed = 0;
      } else {
        wirePos++;
        pos.y = wires.get(wirePos).getStartPlug().getPosition().y;
        pos.x = wires.get(wirePos).getStartPlug().getPosition().x;
      }
    } else {
if (startX < endX) {
  pos.x+=dx;
    } else {
pos.x-=dx;
    } 
if (startY<endY) {
     pos.y+=dy;
         } else {
 pos.y-=dy;
        }
}
  }

  public void updateAll() { //update everything
    for (Enemy j : e) {
      j.display();
      j.update();
    }
    for (int i = 0; i<e.size(); i++) {
      if (e.size() == 0) {
        break;
      }
      if (e.get(i).health <= 0) {
        e.remove(i);
        i--;
        // println("killed");
        /*if (e.size() == 0) {
          println("No more Enemies");
          break;
        }*/
      }
    }
  }

  public float progressToEnd() {
    return wirePos/(wires.size()-1);
    //Returns a decimal that is the percent to the end, 100% being all the way at the end, 0% being just starting
  }
}
