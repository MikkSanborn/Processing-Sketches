long num = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  // println(num);
}

void keyReleased() {
  try {
    num = num*10+Integer.parseInt("" + key);
    println(num);
  } 
  catch (Exception e) {
    ;
  }
  
  if (keyCode == BACKSPACE) {
    num/=10;
  }
}
