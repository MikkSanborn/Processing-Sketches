public class Tower {
//Variables:
  Plug p;
  private int damage;
  private int range;
  private int reloadRemaining;
  private int reload;
  private int cost;
  private int pSpeed; // projectile speed
  Position position;
  float imgWidth;
  PImage img;

  private Enemy target;
  int targetStyle; // 0: Closest | 1: First | 2: Strong
  public Tower(Plug p, int damage, int range, int reload, int cost, int projectileSpeed, int ts, float imgWidth, Position position, PImage img){
    this.p = p;
    this.damage = damage;
    this.range = range;
    this.reload = reload;
    this.cost = cost;
    this.pSpeed = projectileSpeed;
    target = null;
    targetStyle = ts;
    this.imgWidth = imgWidth;
    this.img = img;
    this.position = position;
    reloadRemaining = 0;  
}
  
  public void setTarget(){
    ArrayList<Enemy> inRange = getInRange();
    Enemy t = null;
    if(inRange.size() == 0){ //
    } else {
      switch(targetStyle){
        case 0: // closest
          Enemy closest = null;
          float min_dist = range;
          for (Enemy enemy : inRange) {
            // find the closest
            if (p.getPosition().distance(enemy.getPosition()) < min_dist) {
              closest = enemy;
              min_dist = p.getPosition().distance(enemy.getPosition());
            }
          }
          t = closest;
          break;
        case 1: // first
          Enemy first = inRange.get(0);
          for(int i = 1; i<inRange.size(); i++){
            if(first.progressToEnd() < inRange.get(i).progressToEnd()){
              first = inRange.get(i);
            }
          }
          t = first;
          break;
        case 2: // strongest
          Enemy strong = inRange.get(0);
          for(int i = 1; i<inRange.size(); i++){
            if(strong.health < inRange.get(i).health){
              strong = inRange.get(i);
            }
          }
          t = strong;
          break;
      }
    }
    target = t;
  }

  public void display() {
    // default display method.
    if(p!=null){
      position = p.position.clone();
      p.isFilled = true;
    }
    imageMode(CENTER);
    image(img, position.x, position.y, imgWidth, imgWidth);
    imageMode(CORNER);
  }

  public ArrayList<Enemy> getInRange(){
    ArrayList<Enemy> ret = new ArrayList<Enemy>();
    for(int i = 0; i < e.size(); i++){
      if(p.getPosition().distance(e.get(i).getPosition())<=range){
        ret.add(e.get(i));
      }
    }
    return ret;
  }
  
  public void shoot() {
    println(reloadRemaining);
    if(reloadRemaining <= 0 && target != null){
      proj.add(new Projectile(target, position.clone(), pSpeed*3, damage));
      reloadRemaining = reload;
    }
    reloadRemaining--;
  }
  /*static void updateEnemies(ArrayList<Enemy> e) {
    this.e = e;
  }*/
}



// 

class ExplodeTower extends Tower{
  ExplodeTower(Plug p, int ts, float imgWidth, Position position){
//                            \/  reload
    super(p, 5, 100, 6, 300, 3, ts, imgWidth, position, loadImage("bomb.png"));
  }
   public void shoot(){
    if(super.reloadRemaining <= 0 && super.target != null){
      proj.add(new Projectile(super.target, super.position.clone(), super.pSpeed*3, super.damage, true));
      super.reloadRemaining = super.reload;
    }
     super.reloadRemaining--;
    
  }

}

class SniperTower extends Tower{
  SniperTower(Plug p, int ts, float imgWidth, Position position){
//                                \/  reload
    super(p, 50, 800, 12, 500, 30, ts, imgWidth, position, loadImage("Sniper.png"));
  }
    public void shoot(){
    if(super.reloadRemaining <= 0 && super.target != null){
      proj.add(new Projectile(super.target, super.position.clone(), super.pSpeed*3, super.damage, false));
      super.reloadRemaining = super.reload;
    }
    super.reloadRemaining--;
    
  }

}
class StandardTower extends Tower{
  StandardTower(Plug p, int ts, float imgWidth, Position position){
//                              \/  reload
    super(p, 10, 120, 4, 200, 4, ts, imgWidth, position, loadImage("standard.png"));
  }
  public void shoot(){
    if(super.reloadRemaining <= 0 && super.target != null){
      proj.add(new Projectile(super.target, super.position.clone(), super.pSpeed*3, super.damage, false));
      super.reloadRemaining = super.reload;
    }
     super.reloadRemaining--;
    
  }
  
}
