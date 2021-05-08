/*
  new Thread(new Runnable {
   void run() {
   for (int x = 0; x < pix_prev.length; x++) {
   for (int y = 0; y < pix_prev[x].length; y++) {
   pix_prev[x][y] = r.getPixelColor(x, y);
   println(x + "  " + y + "  gathered");
   }
   }
   }
   }
   );
   */

  /*
  new Thread(new Runnable() { 
   @Override
   public void run() { 
   for (int x = 0; x < pix_prev.length; x+=4) {
   for (int y = 0; y < pix_prev[x].length; y+=4) {
   pix_prev[x][y] = r.getPixelColor(x, y);
   println(x + "  " + y + "  gathered");
   }
   }
   }
   }
   ).start(); 
   */
  /*
  new Thread(new Runnable() {
   public void run() {
   for (int x = 0; x < pix_prev.length; x++) {
   while (Thread.activeCount() > 50); // wait until some space opens, don't kill the CPU (yet)
   final int x_passed = x;
   new Thread(new Runnable() {
   @Override
   public void run() {
   for (int y = 0; y < pix_prev[x_passed].length; y++) {
   pix_prev[x_passed][y] = r.getPixelColor(x_passed, y);
   }
   }
   }
   ).start();
   }
   }
   }
   ).start();
   */
