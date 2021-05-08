// Server testing
import processing.net.*;

Client myClient;
String dataIn;

void setup () {
  size(600,400);
  myClient = new Client(this, "170.170.25.246",1111);
}

void draw () {
  if (myClient.available() > 0){
    dataIn = myClient.read();
  }
  print(dataIn);
}
//
