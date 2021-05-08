float t = 0;

void setup() {
  size(500, 500);
  
  background(0);
  stroke(255);
  strokeWeight(3);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(t);
  point(mouseX-width/2, mouseY-height/2);
  popMatrix();
  t-=0.1;
}

enum Types {
  One, Two, Three, Four
}

class NameList<E> {
  ArrayList<?> rawList; // idk how to reference the Enum and pair with ArrayList numbers (likely an TypesList[] with int indecies?
  private final Enum TypesList;
  private ArrayList<Enum> TypeIndecies;
  
  NameList(Enum typeList) {
    this.TypesList = typeList;
    TypeIndecies = new ArrayList<TypesList tl>();//TypesList[TypesList.length];
  }
  
  boolean add(E e, TypesList type) {
    
    return true;
  }
}
