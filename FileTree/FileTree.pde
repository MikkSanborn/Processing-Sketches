size(500, 500);
background(0);
float dx = 10;

abstract class Content {
  abstract void display();
}

class Folder extends Content {
  float y;
  int depth;
  Folder parent;
  String name;
  Content[] contents;
  
  public Folder(String name, Content[] contents, Folder parent, float y, int depth) {
    this.contents = contents;
    this.name = name;
    this.parent = parent;
    this.depth = depth;
  }
  
  public void display() {
    for (int i = 0; i < contents.length; i++) {
      contents[i].display();
    }
    // draw at (dx*depth+10, y)
    // icon, name
  }
}

class File extends Content {
  public void display() {
    //icon, name
  }
}
