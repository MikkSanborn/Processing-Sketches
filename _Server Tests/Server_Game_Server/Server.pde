// package sockets;

//A Java program for a Server 
import java.net.*; 
import java.io.*; 

public class Server {
  //initialize socket and input stream 
  private Socket     socket = null;
  private ServerSocket server = null;
  private DataInputStream in  = null;

  // constructor with port 
  public Server(int port) {
    try {
        server = new ServerSocket(port);
        System.out.println("[S]: Server started");
    } catch (IOException e) {
      e.printStackTrace();
    }
    // starts server and waits for a connection 

    String s = "";

    while (!s.equals("!shutdown")) {
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
    }
    
    this.close_streams();
  }

  public void close_streams() {
    try {
      System.out.println("[S]: Closing connection");

      socket.close();
      in.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    
    // close_window(); // closes the processing window
  }
}
