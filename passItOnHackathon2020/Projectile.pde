class Projectile {
  float damage, speed;
  Position p;
  boolean explosive;
  Enemy target;
  boolean hit;

  public Projectile(Enemy t, Position p, float speed, float damage) {
    target = t;
    this.p = p;
    this.speed = speed;
    this.damage = damage;
    explosive = false;
    hit = false;
    this.p.r = 5;
  }
  public Projectile(Enemy t, Position p, float speed, float damage, boolean ex) {
    target = t;
    this.p = p;
    this.speed = speed;
    this.damage = damage;
    explosive = ex;
    hit = false;
    this.p.r = 5;
  }


  boolean move() { //If this returns true, the projectile has hit and done damage, and should be removed.
    Position e = target.getPosition();
    float dx = abs(speed*(cos(atan((e.y - p.y)/(e.x - p.x)))));
    float dy = abs(speed*(sin(atan((e.y - p.y)/(e.x - p.x)))));
    if (e.x > p.x) {
      p.x+=dx;
    } else {
      p.x-=dx;
    }
    if (e.y > p.y) {
      p.y+=dy;
    } else {
      p.y-=dy;
    }
    if(p.isContacting(target.pos) || p.distance(target.pos)<=speed){
      impact();
    }
    return hit;
  }

  void impact() {
    if(!hit){
    if (!explosive) {
      target.decrementHealth(damage);
    } else {
      ArrayList<Enemy> l = getInRange();
      for(Enemy d : l){
        d.decrementHealth(damage);
      }
    }
    }
      
    
    hit = true;
  }

  void display() {
    if (!hit) {
      fill(0, 100, 100);
     noStroke();
      ellipse(p.x, p.y, 2*p.r, 2*p.r);
    }
  }
  
  public ArrayList<Enemy> getInRange(){
    float range = 50;
    ArrayList<Enemy> ret = new ArrayList<Enemy>();
    for(int i = 0; i < e.size(); i++){
      if(p.distance(e.get(i).getPosition())<=range){
        ret.add(e.get(i));
      }
    }
    return ret;
  }
}
