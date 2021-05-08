class Wire {
  
  Plug startingPlug;
  Plug endingPlug;
  int pos;
  boolean hidden;

  Wire(Plug startingPlug, Plug endingPlug, int pos, boolean hidden){
    this.startingPlug = startingPlug;
    this.endingPlug = endingPlug;
    this.pos = pos;
    this.hidden = hidden;
    startingPlug.isFilled = true;
    endingPlug.isFilled = true;
  }
  
  void display(){
    colorMode(RGB);
    fill(255, 0, 0);
    stroke(255, 0, 0);
    strokeWeight(7);
    if(!hidden){
      ellipse(startingPlug.getPosition().x, startingPlug.getPosition().y, startingPlug.getPosition().r/2, startingPlug.getPosition().r/2);
      ellipse(endingPlug.getPosition().x, endingPlug.getPosition().y, endingPlug.getPosition().r/2, endingPlug.getPosition().r/2);
      strokeWeight(15);
      line(startingPlug.getPosition().x, startingPlug.getPosition().y, endingPlug.getPosition().x, endingPlug.getPosition().y);
    }
    colorMode(HSB);
  }
  
  Plug getStartPlug(){
    return startingPlug;
  }
  
  Plug getEndPlug(){
    return endingPlug;
  }
  
}
