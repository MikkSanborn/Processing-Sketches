public volatile boolean open = true;

Thread server_thread = new Thread(new Runnable() {
  @Override
  public void run() {
    Server server = new Server(5000);
  }
});

Thread server_multistream_thread = new Thread(new Runnable() {
  @Override
  public void run() {
    Server_Multistream s_m = new Server_Multistream(5001);
  }
});

void setup() {
  size(500, 500);
  
  // server_thread.start();
  server_multistream_thread.start();
}

void draw() {
  background(0);
  // not much to display (yet)
  
  fill(255);
  
}

public void sendString(String s, int client_num) {
  println("[S" + client_num + "] received \"" + s + "\" from C" + client_num + ".");
  // info[client_num] = s;
}

void close_window() {
  exit();
}

void inform_server_closure() {
  
}

void keyReleased() {
  if (key == 'c' || key == 'C') open = false;
}
