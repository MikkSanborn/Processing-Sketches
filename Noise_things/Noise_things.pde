int seed_x = 213435;
int seed_y = 745351;
int s = 1; // size of each pixel
float sc = 255; // scale
float d = .025;
//float dx = d;
//float dy = d;

int[][] vals;

void setup() {
  size(500, 500);
  
  ArrayList<Integer> u_vals = new ArrayList<Integer>();
  
  vals = new int[width/s][height/s];
  
  for (int x = 0; x < width; x+=s) {
    for (int y = 0; y < height; y+=s) {
      int n = (int) (the_noise(x*d, y*d)*8);
      vals[x][y] = n;
      if (!u_vals.contains(n)) u_vals.add(n);
    }
  }
  
  for (Integer n : u_vals) println(n);
}

void draw() {
  background(0);
  strokeWeight(s);
  
  for (int x = 0; x < width; x+=s) {
    for (int y = 0; y < height; y+=s) {
      stroke(col_from_int(vals[x][y]));
      rect(x, y, s, s);
    }
  }
  
}

float the_noise(float x, float y) {
  float out = 0;
  out+=noise(x+seed_x, y+seed_y);
  // out+=noise(x*5.23, y*5.23)*.25;
  return out;
}

color col_from_int(int n) {
  return color((n*413)%255, n*32%255, (n>>n)%255);
}

//float sigmoid(float n) {
//  return 1.0/(1.0+pow(2.71828, -n));
//}
