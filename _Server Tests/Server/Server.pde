int x, y;

Thread t_serv = new Thread(new Runnable() {

      @Override
      public void run() {
        Server_1 server = new Server_1(5000);
      }
      
});

String prev = "0,0";
String curr = "250,250";

void setup() {
  size(500, 500);
  
  x = width/2;
  y = height/2;
  
  strokeWeight(12);
  stroke(255);
  
  t_serv.start();
}

void draw() {
  background(0);
  
  if (!curr.equals(prev)) {
    x = Integer.parseInt(curr.substring(0, curr.indexOf(",")));
    y = Integer.parseInt(curr.substring(curr.indexOf(",")+1));
  }
  
  point(x, y);
}

void sendString(String s) {
  curr = s;
}

void close_window() {
  exit();
}
