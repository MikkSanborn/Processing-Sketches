class Plug { // v1.0.1
  final Position position;
  // id's will follow the format : "a" and "A", etc.
  final String id;
  boolean isFilled = false;
  
  Plug(Position position, String id) {
    this. position = position;
    this.id = id;
  }
  
  public void display() {
    stroke(140);
    strokeWeight(6);
    fill(20);
    //textSize(12);
    //text(id, position.x, position.y+position.r+12);
    ellipse(position.x, position.y, position.r, position.r);
  }

  
  public Position getPosition() {
    return position;
  }
  
  public String getID() {
    return id;
  }
  
  public String getName() {
    return getID();
  }
  
}
