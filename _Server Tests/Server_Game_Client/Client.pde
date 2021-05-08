// package sockets;

// A Java program for a Client 
import java.net.*; 
import java.io.*; 

/*public*/class Client {
  // initialize socket and input output streams 
  private Socket socket      = null;
  private DataOutputStream out  = null;

  // constructor to put ip address and port 
  public Client(String address, int port) {
    // establish a connection 
    try {
      socket = new Socket(address, port);
      System.out.println("[C]: Connected");

      out = new DataOutputStream(socket.getOutputStream());
    } 
    catch(UnknownHostException u) {
      System.out.println("[C]: " + u);
    } 
    catch(IOException i) {
      System.out.println("[C]: " + i);
    }
  }

  public void write(String s) throws IOException, NullPointerException, SocketException {
    out.writeUTF(s);
  }

  public void close() throws IOException {
    out.writeUTF("!out");

    // close the connection
    out.close();
    socket.close();
  }
}
