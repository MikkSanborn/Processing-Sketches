float theta = 0;

void setup() {
  size(500, 500);

  noStroke();
}

void draw() {
  theta+=0.0;

  pushMatrix();
  translate(0, 0);
  rotate(theta);
  
  background(255);
  
  noStroke();

  fill(252, 213, 187);
  // face
  ellipse(250, 250, 200, 280);

  fill(0);
  // eyes
  ellipse(250-45, 250-40, 10, 10);
  ellipse(250+45, 250-40, 10, 10);

  //mouth
  fill(220, 80, 20);
  ellipse(250, 250+60, 100, 40);
  noStroke();
  fill(252, 216, 28);
  rect(240, 310, 5, 5);
  rect(270, 320, 5, 8);
  rect(230, 323, 5, 6);

  fill(252, 213, 187);
  rect(250-50, 250+40, 100, 20);

  // nose
  fill(0, 0, 250);
  triangle(250, 250-10, 250-5, 250+15, 250+5, 250+15);

  fill(0);
  arc(250, 160, 160, 100, PI-.1, TWO_PI); // hair center
  
  strokeWeight(5);
  stroke(0);
  arc(200, 190, 60, 60, -.05, PI-.05); // eye patch
  line(159, 192, 337, 183); // strap
  
  //fez
  fill(245, 40, 40);
  stroke(252, 216, 28);
  ellipse(250, 110, 135, 35); // golden bottom piece
  noStroke();
  quad(250-60, 100-30, 250+60, 100-30, 250+70, 100+15, 250-70, 100+15); // body of fez
  strokeWeight(2);
  stroke(180, 20, 20);
  ellipse(250, 70, 120, 35); // top round bit
  noStroke();
  fill(252, 216, 28);
  ellipse(250, 70, 20, 5);
  
  
  
  popMatrix();
  
  // println(mouseX + "  " + mouseY);
}
