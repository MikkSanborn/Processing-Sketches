int square_size = 5;
int x_size = 80*2, y_size = 80*2;
Square[][] list;

void setup() {
  size(800, 800, P3D);
  background(255);
  
  // noStroke();
  
  rotateX(radians(30));
  translate(0, -200, -400);
  lights();

  list = new Square[x_size][y_size];


  //Calculus
  for (int i=0; i<3; i++) { //Doing the loop 3 times for RGB
    int x_center = (int)random(x_size);  //The center coordinates of the biome
    int y_center = (int) random(y_size);
    int radius = (int) random(x_size); //The radius influence of the biome
    float xoff = 0, yoff = 0;  //Initialize noise values
    for (int x=0; x<x_size; x++) {
      for (int y=0; y<y_size; y++) {
        float dist = dist(x, y, x_center, y_center); 
        if (list[x][y]==null) list[x][y] = new Square(color(100)); //initialize a black square
        if (dist <= radius) {
          list[x][y].add_components(i, dist, radius, noise(xoff, yoff)*map(dist, 0, radius, 250, 0));
        }
        yoff += 0.1;
      }
      yoff = 0;
      xoff += 0.1;
    }
  }


  //display
  for (int x=0; x<x_size; x++) {
    for (int y=0; y<y_size; y++) {
      list[x][y].display(x, y);
    }
  }

  save(second()+minute()+hour()+".jpg");
  noLoop();
}



void draw() {
}


class Square {
  float red, green, blue;
  int size;

  Square(color cc) {
    red = red(cc);
    green = green(cc);
    blue = blue(cc);
    size = 0;
  }

  void display(int x, int y) {
    //println(red,green,blue);
    fill(red, green, blue);
    pushMatrix();
    translate(x*square_size, y*square_size);
    box(square_size, square_size, size);
    popMatrix();
  }

  void add_components(int i, float dist, int radius, float s) {
    if (i==0) red += map(dist, 0, radius, 255, 0);
    if (i==1) green += map(dist, 0, radius, 255, 0);
    if (i==2) blue += map(dist, 0, radius, 255, 0);
    size += s;
  }
}
