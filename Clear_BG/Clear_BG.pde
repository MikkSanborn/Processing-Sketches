
import java.awt.AWTException;
import java.awt.Dimension;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;

Robot r;

int draw_x = 0;
int draw_y = 0;

Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
final int screen_w = (int) screenSize.getWidth();
final int screen_h = (int) screenSize.getHeight();

int[][] pix_prev = new int[screen_w][screen_h]; // pix_prev[x][y]

void setup() {
  for (int x = 0; x < pix_prev.length; x++) {
    for (int y = 0; y < pix_prev[x].length; y++) {
      pix_prev[x][y] = 0;
    }
  }

  println("all px black");

  try {
    r = new Robot();
  } 
  catch (AWTException e) {
    r = null;
  }

  new Thread(new Runnable() { 
    @Override
      public void run() { 
      while (true) {
        final BufferedImage bi = r.createScreenCapture(new Rectangle(0, 0, screen_w, screen_h));
        java.awt.Point p = java.awt.MouseInfo.getPointerInfo().getLocation();
        for (int x = 0; x < pix_prev.length; x++) {
          for (int y = 0; y < pix_prev[x].length; y++) {
            pix_prev[x][y] = bi.getRGB(abs((x+p.x-width/2)%bi.getWidth()), abs((y+p.y-height/2)%bi.getHeight()));
            // println(x + "  " + y + "  gathered");
          }
        }
      }
    }
  }
  ).start();

  size(400, 400);
  // fullScreen();
  
  strokeWeight(1);
  fill(0, 0, 0, 0);
}

void draw() {
  background(0);

  loadPixels();

  for (int x = draw_x; x < draw_x+width; x++) {
    for (int y = draw_y; y < draw_y+height; y++) {
      pixels[x+y*width] = pix_prev[x][y];
    }
  }

  updatePixels();
}
