boolean s_open = true;
Thread client_thread_s_0 = generate_client_thread("localhost", 5001);
Thread client_thread_s_1 = generate_client_thread("localhost", 5001);
Thread client_thread_s_2 = generate_client_thread("localhost", 5001);

void setup() {
  size(500, 500);

  client_thread_s_0.start();
  
  try {
    Thread.sleep(167);
  } catch (InterruptedException ie) {
  }
  
  client_thread_s_1.start();
  
  try {
    Thread.sleep(167);
  } catch (InterruptedException ie) {
  }
  
  client_thread_s_2.start();
}

void draw() {
  background(0);
  // nothing really to show (yet)
  
  
  
}

void keyReleased() {
  if (key == 'c' || key == 'C') s_open = false;
}

Thread generate_client_thread(final String address, final int port) {
  return new Thread(new Runnable() {
    @Override
      public void run() {
      Client client = new Client(address, port);

      while (s_open) {
        try {
          client.write("<c_s> : " + frameCount);
        } 
        catch (SocketException se) {
          // server closure, close client... doesn't need to run.
          s_open = false;
          break;
        } 
        catch (IOException ioe) {
          println("[c_s]: Error - " + ioe);
        } 
        catch (NullPointerException npe) {
          // connection not yet established
        }
        try {
          Thread.sleep(500);
        } 
        catch (Exception e) {
          e.printStackTrace();
        }
      }

      // escaped send sequence, now this client is done. Close.
      try {
        client.close();
      } 
      catch (IOException ioe) {
        println("[c_s]: Error - " + ioe);
      }
    }
  }
  );
}

/*

 x      = r*x  *(1-x  )
 (n+1)     (n)    (n)
 
 */
