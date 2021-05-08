class Line {
  // public float x1, y1, x2, y2;
  public final short uid1, uid2;
  
  public byte magnitude = 0;
  
  Line(short uid1, short uid2, byte init_magnitude) {
    this.uid1 = uid1;
    this.uid2 = uid2;
    
    this.magnitude = init_magnitude;
  }
  
  float lerp(float v0, float v1, float t) {
    return v0 + t * (v1 - v0);
  }
  
  void display() {
    stroke(0, 8*magnitude);
    Student s1 = students.get(uid1);
    Student s2 = students.get(uid1);
    line(s1.x, s1.y, s2.x, s2.y);
  }
  
  void increment() {
    this.magnitude++;
  }
  
}

/*


*/
