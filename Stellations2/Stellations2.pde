
//\begin{document}

//\begin{center}


//\begin{asy}
//  import graph; 

float scale = 50;
float trans_x = 000;
float trans_y = 300;

//  size(500); 
void setup() {
  size(500, 500);

  strokeWeight(1/scale);
  textSize(12);
  fill(122);
}

//  int n=10; //number of vertices
int n = 10;

//  real r=0; //rotation angle (if n odd, -90 degrees, else 0 -- orients a horizontal base)
float real = 0; // maybe not float?

//    int d=2; // ?
int d = 2; // use?

void draw() {
  background(255);
  //    for (int row=1; row<n/4; ++row) {
  for (int r = 1; r < n/4; r++) {

    //        for (int col=1; col<4 && d<=n/2; ++col, ++d) {
    for (int c = 1; c < 4 && d<=n/2; c++, d++) {

      //        pair o=(2.5*(col),2.5*(-row));
      Pair o = new Pair(2.5*c, 2.5*(-r));

      //      label("$\{\frac{"+string(n)+"}{"+string(d)+"}\}$",(2.5*(col),2.5*(-row)-1.25));
      
      text((n + "/" + d), (2.5*c-.25)*scale+trans_x, (r)*scale+trans_y);
      
      pushMatrix();
      translate(trans_x, trans_y);
      scale(scale);

      //          for (int i=1; i<n+1; ++i) {
      for (int i = 1; i < n+1; i++) {
        //                  pair x=o+dir(((i)*360)/n-r);
        float dir_x = radians(i*360.0/n-real);
        Pair x = new Pair(o.x+cos(dir_x), o.y+sin(dir_x));
        //                  pair y=o+dir(((i+d)*360)/n-r);
        float dir_y = radians((i+d)*360.0/n-real);
        Pair y = new Pair(o.x+cos(dir_y), o.y+sin(dir_y));

        //                  pair z=o+dir(((i+1)*360)/n-r);
        float dir_z = radians((i+1)*360.0/n-real);
        Pair z = new Pair(o.x+cos(dir_z), o.y+sin(dir_z));

        //                  draw(x--y,red);
        stroke(255, 0, 0);
        line(x.x, x.y, y.x, y.y);
        println(x.x + "  " + x.y + "  " + y.x + "  " + y.y);

        //                  draw(x--z);
        stroke(0);
        line(x.x, x.y, z.x, z.y);

        //                  }
      }
      popMatrix();
      println();

      //        }
    }

    //    }
  }
  println("done");
  stop();
  //\end{asy}
}

class Pair {
  public float x, y;

  public Pair(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

//\end{center}

//\end{document}
