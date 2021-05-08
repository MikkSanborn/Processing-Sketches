float theta = 0, thetaInc = .005;
float scale = 5;

void setup() {
  size(1920, 1080);

  noStroke();
}

void draw() {
  theta+=thetaInc;

  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  scale(scale);
  
  background(255);
  
  noStroke();

  fill(252, 213, 187);
  // face
  ellipse(250-250, 250-250, 200, 280);

  fill(0);
  // eyes
  ellipse(250-250-45, 250-250-40, 10, 10);
  ellipse(250-250+45, 250-250-40, 10, 10);

  //mouth
  fill(220, 80, 20);
  ellipse(250-250, 250-250+60, 100, 40);
  noStroke();
  fill(252, 216, 28);
  rect(240-250, 310-250, 5, 5);
  rect(270-250, 320-250, 5, 8);
  rect(230-250, 323-250, 5, 6);

  fill(252, 213, 187);
  rect(250-250-50, 250-250+40, 100, 20);

  // nose
  fill(0, 0, 250);
  triangle(250-250, 250-250-10, 250-250-5, 250-250+15, 250-250+5, 250-250+15);

  fill(0);
  arc(250-250, 160-250, 160, 100, PI-.1, TWO_PI); // hair center
  
  strokeWeight(5);
  stroke(0);
  arc(200-250, 190-250, 60, 60, -.05, PI-.05); // eye patch
  line(159-250, 192-250, 337-250, 183-250); // strap
  
  //fez
  fill(245, 40, 40);
  stroke(252, 216, 28);
  ellipse(250-250, 110-250, 135, 35); // golden bottom piece
  noStroke();
  quad(250-250-60, 100-250-30, 250-250+60, 100-250-30, 250-250+70, 100-250+15, 250-250-70, 100-250+15); // body of fez
  strokeWeight(2);
  stroke(180, 20, 20);
  ellipse(250-250, 70-250, 120, 35); // top round bit
  noStroke();
  fill(252, 216, 28);
  ellipse(250-250, 70-250, 20, 5);
  
  stroke(255);
  point(0, 0);
  
  popMatrix();
  
  // println(mouseX + "  " + mouseY);
}

void mouseClicked() {
  thetaInc = (float) mouseX/(4*width);
  scale = (float) mouseY/(width/4);
}
