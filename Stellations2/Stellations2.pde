
float scale = 50; // scale multiplier
float trans_x = 0; // translate x
float trans_y = 0; // translate y

int num_per_row = 4;

void setup() {
  size(500, 500); // 500 seems deece

  strokeWeight(1/scale); // in anticipation of scaling larger later
  textSize(12); // default, might as well put it here
  fill(122); // for text
}

int n = 9; // number of sides

float rot = (n%2)*(-90); // rotate (degrees), 0 for even n, -90 for odd n. fixed later by the code

final float d_init = 2; // int values are best
float d = d_init; // use?

int count = n/2;

void draw() {
  background(255);
  
  d = d_init;
  
  // rot++;
  
  for (int r = 1; r < count && (int) d<=count; r++) { // 4 things per column, so only increase row if >4 cols
    // println(r);
    for (int c = 1; c < num_per_row+1 && (int) d<=count; c++, d++) { // 4 things in each col
    // println("\t" + c);
      //println("\t" + c + "\t" + d);
      //println("\t\td<=n/2  " + d + "<=" + n/2 + "\t" + (d<=n/2));
      Pair o = new Pair(2.5*c, 2.5*(r)); // make the origin (center)

      text((n + "/" + d), (2.5*c-.25)*scale+trans_x, (2.5*r+1.25)*scale+trans_y); // display text (placement may be off)

      pushMatrix(); // save current transform
      translate(trans_x, trans_y); // translate from (0,0) towards center
      scale(scale); // increase scale/size

      for (int i = 1; i < n+1; i++) { // for each vertex,
        float dir_x = radians((i)*360.0/n-rot); // find theta x
        Pair x = new Pair(o.x+cos(dir_x), o.y+sin(dir_x)); // mark the point corresponding to theta x
        
        float dir_y = radians((i+d)*360.0/n-rot); // find theta y
        Pair y = new Pair(o.x+cos(dir_y), o.y+sin(dir_y)); // mark the point corresponding to theta y
        
        float dir_z = radians((i+1)*360.0/n-rot); // find theta z
        Pair z = new Pair(o.x+cos(dir_z), o.y+sin(dir_z)); // mark the point corresponding to theta z

        stroke(255, 0, 0); // stroke red
        line(x.x, x.y, y.x, y.y); // line from x to y
        // println(x.x + "  " + x.y + "  " + y.x + "  " + y.y);

        stroke(0); // stroke black
        line(x.x, x.y, z.x, z.y); // line from x to z
      }
      popMatrix(); // reset matrix to prior version
      // println();
    }
  }
  // println("done"); // idk let the user know that it's done
  // stop(); // don't loop :)
}
 
class Pair { // to replace the pair object
  public float x, y; // just make it public bc methods take effort :/

  public Pair(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
