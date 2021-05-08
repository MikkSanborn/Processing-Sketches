//A Java program for a Server 
import java.net.*;
import java.io.*;

public class Server_Multistream {
  //initialize socket and input stream 
  private volatile ArrayList<Socket>   sockets = null;
  private ArrayList<Thread>   socket_threads = null;
  private ServerSocket server = null;
  private volatile ArrayList<DataInputStream> in_streams  = null;

  private volatile boolean up = true;

  private volatile int iter = 0;

  // constructor with port 
  public Server_Multistream(int port) {
    try {
      server = new ServerSocket(port);
      System.out.println("[S]: Server started");
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    // starts server and waits for a connection 

    sockets = new ArrayList<Socket>();
    socket_threads = new ArrayList<Thread>();
    in_streams = new ArrayList<DataInputStream>();

    /*
    Make the first socket acceptor thread. This will check for a connection repeatedly until one is established.
     Once a connection has been established, inform the thread handler (Server_Multistream), then
     make a new socket acceptor thread, sent the new iter. ID. This will do the same as noted above.
     
     If one of the client connections is killed, set the values to null, but DO NOT REMOVE THE INSTANCE;
     this will slide all the sockets over by one place, anc the value sent cannot be changed.
     */

    while (up) {
      if (!open) this.close_streams();
      while (Thread.activeCount() >= 8); // hold off at 8 threads... just a safety precaution for now
      final int ID = iter;
      sockets.add(null);
      in_streams.add(null);
      socket_threads.add(create_socket_thread(ID));
      socket_threads.get(iter).start();// this method will NOT hold until a connection is established, or an error is thrown.
      iter++;
    }
    
    this.close_streams();
  }

  public void close_streams() {
    System.out.println("[S]: Closing connection");

    // for each thread, close the connection
    for (int i = 0; i < sockets.size(); i++) {
      try {
        sockets.get(i).close();
      } 
      catch (IOException ioe) {
      } 
      catch (NullPointerException npe) {
      }
      try {
        in_streams.get(i).close();
      } 
      catch (IOException ioe) {
      } 
      catch (NullPointerException npe) {
      }
    }
  }

  private Thread create_socket_thread(final int ID) {
    return new Thread(new Closeable_Runnable() {
      @Override
        public void run() {
        String s = "";

        // while (!s.equals("!shutdown")) {
        try {

          System.out.println("[S: " + ID + "]: Waiting for a client ...");

          // sockets.get(ID).setSoTimeout(0);
          sockets.set(ID, server.accept());
          System.out.println("[S: " + ID + "]: Client " + ID + " accepted");

          // takes input from the client socket 
          in_streams.set(ID, new DataInputStream(new BufferedInputStream(sockets.get(ID).getInputStream())));

          s = in_streams.get(ID).readUTF();

          while (!s.equals("!out") && !s.equals("!shutdown")) { // if it equals "!out", close connection with this client
            // System.out.println(ID + "  " + s);
            sendString(s, ID);
            s = in_streams.get(ID).readUTF();
          }
        } 
        catch (SocketTimeoutException ste) {
          // decayIter(); //
        } 
        catch(IOException ioe) {
          System.out.println("[S: " + ID + "]: " + ioe);
        }
      }

      @Override
        public void close_elements() {
        try {
          in_streams.get(ID).close();
          sockets.get(ID).close();
          // socket_threads.get(ID);
          // close other thingies too
        } 
        catch (IOException e) {
          e.printStackTrace();
        }
        // socket_threads.get(ID).interrupt();
      }
    }
    );
  }
}

/*
    String s = "";
 
 // while (!s.equals("!shutdown")) {
 try {
 
 System.out.println("[S]: Waiting for a client ...");
 
 socket = server.accept();
 System.out.println("[S]: Client accepted");
 
 // takes input from the client socket 
 in = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
 
 s = in.readUTF();
 
 while (!s.equals("!out") && !s.equals("!shutdown")) { // if it equals "!out", close connection with this client
 // System.out.println(s);
 sendString(s, 0);
 s = in.readUTF();
 }
 } 
 catch(IOException i) {
 System.out.println("[S]: " + i);
 }
 // }
 */

public static interface Closeable_Runnable extends Runnable {
  public void run();
  public void close_elements();
}
