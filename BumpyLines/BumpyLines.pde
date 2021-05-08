int seed = (int) random(Integer.MIN_VALUE, Integer.MAX_VALUE);

float prev_x = width;
float x = 0;
float dx = 5;

int iter_per_frame = 10;

float noiseScale = .01; // .01 seems stable

float line_h = -100; // max height for line thingies. must be neg, bc. processing

float line_y = 0;
float line_y_max = 10;

float line_spacing = 50;
float y_shift = 150;
float prev_y = 0;

// float screen_y for potentially infinite scroll

void setup() {
  size(800, 800);

  noiseSeed(seed);
  println(seed);

  fill(0);

  background(0);
}

void draw() {
  for (int i = 0; i < iter_per_frame; i++) {
    float y = ((noise((x+width*line_y)*noiseScale)*line_h)+10)*(pow(sin(x/((float) width-100)*PI), 3)+.25)+line_y*line_spacing+y_shift;

    if (x > 50 && x < width-50) {
      stroke(255);
      line(x, y, prev_x, prev_y);
      noStroke();
      quad(x, y+1, prev_x, prev_y+1, prev_x, height, x, height); // cover up anything below line.
    }

    prev_y = y;
    prev_x = x;
    x+=dx;

    if (x < 0) {
      x = width;
      if (line_y > line_y_max) { // in case line_y_max is neg? idk
        line_y--;
      }
    } else if (x > width) {
      x = 0;
      if (line_y < line_y_max) {
        line_y++;
      } else {
        iter_per_frame = 0;
        stroke(255);
        point(0, 0);
      }
    }
  }
}
