final int numb_test_after = 10000;
double[] x = new double[numb_test_after];
double[] y = new double[numb_test_after];
boolean[] result = new boolean[numb_test_after];

void setup() {
  size(500, 500);

  // run 2IP
  System.out.println("Positive vs. Negative Classifier");
  TwoInputPerceptron tip = new TwoInputPerceptron();

  System.out.println("Before Training: " + tip);
  //before training, run tests...see how it performs
  int numbPreTests = 10000;
  int numbPreCorrect = 0;
  for (int i = 0; i < numbPreTests; i++) {
    //get random x and y between 0 and 2*X_VAL
    double in0 = Math.random()*2-1;
    double in1 = Math.random()*(in0 < 0 ? -1:1);

    //get real answer and get network's answer
    int actualAnswer = in0 < 0 ? (in1 < 0 ? 1:0):0; // find actual answer to train on
    double calculatedAnswer = tip.getOutput(in0, in1);

    //if basically the same number, then count as correct
    if (actualAnswer == calculatedAnswer)
      numbPreCorrect++;
  }
  System.out.println("Number of tests before: " + numbPreTests);
  System.out.println("Percent correct before: " + (double)numbPreCorrect/numbPreTests);

  //the size of X_VAL, the size of the learningRate, and the
  //number of iterations required to learn are related...
  //larger X_VAL means the starting weights are reallllly bad
  //and should be corrected more aggressively (larger learning rate)
  tip.learningRate = .2;

  //train it...a lot...
  int TIMES_TO_TRAIN = 1000000;
  for (int i = 0; i < TIMES_TO_TRAIN; i++) {
    double in0 = Math.random()*2-1;
    double in1 = Math.random()*(in0 < 0 ? -1:1);

    //get real answer and get network's answer
    int actualAnswer = in0 < 0 ? (in1 < 0 ? 1:0):0; // find actual answer to train on

    tip.train(in0, in1, actualAnswer);
  }

  System.out.println("After Training: " + tip);

  //now test
  int numbTests = 10000;
  int numbCorrect = 0;
  for (int i = 0; i < numbTests; i++) {
    double in0 = Math.random()*2-1;
    double in1 = Math.random()*(in0 < 0 ? -1:1);

    //get real answer and get network's answer
    int actualAnswer = in0 < 0 ? (in1 < 0 ? 1:0):0; // find actual answer to train on
    double calculatedAnswer = tip.getOutput(in0, in1);

    // System.out.println("tip.getOutput(" + in0 + ", " + in1 + ") = " + calculatedAnswer + ", expected " + actualAnswer + ". \t" + (actualAnswer == calculatedAnswer ? "Succeeded":"Failed"));

    //if basically the same number, then count as correct
    if (actualAnswer == calculatedAnswer)
      numbCorrect++;
  }

  for (int i = 0; i < numb_test_after; i++) {
    double in0 = Math.random()*2-1;
    double in1 = Math.random()*2-1;

    // System.out.println("tip.getOutput(" + in0 + ", " + in1 + ") = " + tip.getOutput(in0, in1));
    
    x[i] = in0;
    y[i] = in1;
    result[i] = tip.getOutput(in0, in1) > .5;
  }

  System.out.println();

  System.out.println("Number of tests before: " + numbPreTests);
  System.out.println("Percent correct before: " + (double)numbPreCorrect/numbPreTests);

  System.out.println();

  System.out.println("Number of tests after: " + numbTests);
  System.out.println("Percent correct after: " + (double)numbCorrect/numbTests);

  // TwoInputPerceptron.GRAPH_DIMENSION_RWU = 4*1;
  // tip.showGraph();
}

void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(1);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  strokeWeight(5);
  
  for (int i = 0; i < numb_test_after; i++) {
    stroke((result[i] ? 0:255), (result[i] ? 255:0), 0, 120);
    point((float) (x[i]*width/2)+width/2, (float) -(y[i]*height/2)+height/2); // multiply "y" by -1, because processing is a moron.
  }
}
