import java.math.BigInteger;

long finalVal;

BigInteger val = new BigInteger(BigInteger.ZERO);

int val1 = 0;
int val2 = 0;

boolean isPow = false; // if isPow, shows powers, not multiplicatives

short writing = 0; // 0 = none, 1 = 1, 2 = 2

void setup() {
  size(500, 500);

  textSize(16);
}

void draw() {
  background(0);

  fill(255);
  rect(0, 0, 75, 50);
  rect(100, 100, 100, 100);
  rect(300, 100, 100, 100);

  rect(100, 300, 300, 100);

  fill(0);
  text(val1, 140, 160);
  text(val2, 340, 160);

  if (!isPow) {
    text("Mult.", 20, 30);
    finalVal = val1*val2;
    text(val1*val2, 220, 360);
  } else {
    text("Pow", 25, 30);
    finalVal = 1;
    for (int i = 0; i < val2; i++) {
      finalVal*=val1;
    }
    text(finalVal, 220, 360);
  }

  println(writing);
}

void mouseClicked() {
  if (mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 200) {
    writing = 1;
  } else if (mouseX > 300 && mouseX < 400 && mouseY > 100 && mouseY < 200) {
    writing = 2;
  } else if (mouseX > 0 && mouseX < 75 && mouseY > 0 && mouseY < 50) {
    isPow = !isPow;
  } else {
    writing = 0;
  }
}

void keyReleased() {
  try {
    if (writing == 1) {
      val1 = val1*10+Integer.parseInt("" + key);
    } else if (writing == 2) {
      val2 = val2*10+Integer.parseInt("" + key);
    }
  } 
  catch (Exception e) {
    if (keyCode == BACKSPACE) {
      if (writing == 1) {
        val1/=10;
      } else if (writing == 2) {
        val2/=10;
      }
    } else if (keyCode == DELETE) {
      if (writing == 1) {
        val1 = 0;
      } else if (writing == 2) {
        val2 = 0;
      }
    }
  }
}
