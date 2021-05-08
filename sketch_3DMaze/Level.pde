// per floor; playerZ

public class Level {
  public Object[] objects;
  public color bgC;
  public final int minZ, maxZ;

  public Level(Object[] objects, color bgCol) {
    this.objects = objects;
    int minZ = 0;
    int maxZ = 0;
    for (int i = 0; i < objects.length; i++) {
      if (objects[i].z1 < minZ)
        minZ = objects[i].z1;
      if (objects[i].z2 < minZ)
        minZ = objects[i].z2;
      if (objects[i].z1 > maxZ)
        maxZ = objects[i].z1;
      if (objects[i].z2 > maxZ)
        maxZ = objects[i].z2;
    }
    this.minZ = minZ;
    this.maxZ = maxZ;
    this.bgC = bgCol;
  }

  public Level(Object[] objects) {
    this.objects = objects;
    int minZ = 0;
    int maxZ = 0;
    for (int i = 0; i < objects.length; i++) {
      if (objects[i].z1 < minZ)
        minZ = objects[i].z1;
      if (objects[i].z2 < minZ)
        minZ = objects[i].z2;
      if (objects[i].z1 > maxZ)
        maxZ = objects[i].z1;
      if (objects[i].z2 > maxZ)
        maxZ = objects[i].z2;
    }
    this.minZ = minZ;
    this.maxZ = maxZ;
    this.bgC = Environment.standardBGCol;
  }

  public void displayLevel(Player playerIn) {
    for (int i = 0; i < objects.length; i++) {
      if ((objects[i].z1 > playerIn.z && objects[i].z2 < playerIn.z) || (objects[i].z1 < playerIn.z && objects[i].z2 > playerIn.z)) {
        objects[i].display();
      }
    }
  }

  public void displaySidebar(Player playerIn) { // level "z" is centered/highlighted
  }
}
