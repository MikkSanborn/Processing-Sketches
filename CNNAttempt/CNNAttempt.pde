// https://mlnotebook.github.io/post/CNN1/

float sc = 100;

int size = 8; // count

byte modificationType = 0; // 0 is set to output, 1 is add output, -1 is subract output

byte drawType = 2; // one is default, 2 reverses some init drawing

int[][] img; // { {255, 0, 255, 0, 255}, {0, 51, 102, 153, 204, 255}, {0, 255, 0, 255, 0}, {255, 204, 153, 102, 51, 0}, {0, 122, 255, 122, 0} };

float[][] viewWeight = new float[3][3]; // 3 is view size

boolean keepsInRange = true;

void setup() {
  size(1000, 1000);

  setImg();

  viewWeight[0][0] = random(-1, 1); // the scale doesn't matter, it gets factored out later.
  viewWeight[0][1] = random(-1, 1);
  viewWeight[0][2] = random(-1, 1);

  viewWeight[1][0] = random(-1, 1);
  viewWeight[1][1] = random(-1, 1);
  viewWeight[1][2] = random(-1, 1);

  viewWeight[2][0] = random(-1, 1);
  viewWeight[2][1] = random(-1, 1);
  viewWeight[2][2] = random(-1, 1);

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      println("viewWeight[" + i + "][" + j + "] = " + viewWeight[i][j] + ";");
    }
  }
}

// make a CNN that finds the weighted brightness of a region, stores that, then applies a dimmer to each section proportional to the "brightness"

void draw() {
  background(0);

  noStroke();

  for (int i = 0; i < img.length; i++) {
    for (int j = 0; j < img[i].length; j++) {
      fill(img[i][j], img[i][j], img[i][j]);
      rect(j*sc, i*sc, sc, sc);
    }
  }

  strokeWeight(1);
  stroke(255);
  line(0, sc*img.length, sc*img.length, sc*img.length);
  line(sc*img.length, 0, sc*img.length, sc*img.length);
}

void mouseWheel() {

  float[][] output = new float[size][size]; // the "compressed" (read & calculated) array

  float MAX_VAL = 0;

  for (int i = 0; i < size; i++) { // each row in output
    for (int j = 0; j < size; j++ ) { // each each item in output
      output[i][j] = 0; // set as default val
      for (int r = i-1; r <= i+1; r++) {
        for (int c = j-1; c <= j+1; c++) {
          output[i][j]+=img[1+r][1+c]*viewWeight[1+r-i][1+c-j];
        }
      }
      if (abs(output[i][j]) > MAX_VAL) {
        MAX_VAL = output[i][j];
      }
    }
  }

  // add shade. aply color/2 (scale so 255 is max_val)

  noStroke();

  float outputScale = MAX_VAL/255.0; // modify here!

  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) { // for each spot in the output
      for (int r = -1; r <= 1; r++) {
        for (int c = -1; c <= 1; c++) { // apple the output to img
          if (modificationType == 0) {
            img[1+i+r][1+j+c] = (int) (output[i][j]/outputScale);
          } else if (modificationType == 1) {
            img[1+i+r][1+j+c] += output[i][j]/outputScale;
          } else if (modificationType == -1) {
            img[1+i+r][1+j+c] -= output[i][j]/outputScale;
          } else {
            // that's a shame
          }
          if (keepsInRange) {
            if (img[1+i+r][1+j+c] > 255)
              img[1+i+r][1+j+c] = 255;
            if (img[1+i+r][1+j+c] < 0)
              img[1+i+r][1+j+c] = 0;
          }
        }
      }
    }
  }

  /*
  for (int i = 0; i < img.length; i++) {
   for (int j = 0; j < img[i].length; j++) {
   println(i + "  " + j + "  " + img[i][j]);
   }
   }
   */
}

void mouseClicked() {
  setImg();
}

void setImg() {
  int[][] tempArr = new int[size][size];

  for (int i = 0; i < tempArr.length; i++) {
    for (int j = 0; j < tempArr.length; j++) {
      if (i % 2 == 0) {
        tempArr[i][j] = ((j+i/2) % 2 == 0? 255:0);
      } else {
        tempArr[i][j] = abs((j % 3 == 0 && drawType == 2 ? -255:0) + j*(255/size));
      }
    }
  }


  img = new int[size+2][size+2]; // resets all to zero

  try {
    for (int i = 1; i < img.length-1; i++) {
      for (int j = 1; j < img[i].length-1; j++) {
        img[i][j] = tempArr[i-1][j-1];
      }
    }
  }
  catch (Exception e) {
    println("Check that tempArr is square and has length and width equal to size");
  }
}

void keyReleased() {
  if (key == 'n') {
    println("\r\n");

    viewWeight[0][0] = random(-1, 1); // the scale doesn't matter, it gets factored out later.
    viewWeight[0][1] = random(-1, 1);
    viewWeight[0][2] = random(-1, 1);

    viewWeight[1][0] = random(-1, 1);
    viewWeight[1][1] = random(-1, 1);
    viewWeight[1][2] = random(-1, 1);

    viewWeight[2][0] = random(-1, 1);
    viewWeight[2][1] = random(-1, 1);
    viewWeight[2][2] = random(-1, 1);

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        println("viewWeight[" + i + "][" + j + "] = " + viewWeight[i][j] + ";");
      }
    }

    mouseClicked();
  }
}


/*
  
 // ADDING
 
 viewWeight[0][0] = -0.67797506; // keepsInRange
viewWeight[0][1] = 0.42001307;
viewWeight[0][2] = -0.07249141;
viewWeight[1][0] = 0.19051194;
viewWeight[1][1] = -0.12037933;
viewWeight[1][2] = 0.15966499;
viewWeight[2][0] = 0.8301892;
viewWeight[2][1] = -0.6235814;
viewWeight[2][2] = -0.17874706;

 
 viewWeight[0][0] = -0.20321941; // waves-thingy
viewWeight[0][1] = -0.40629232;
viewWeight[0][2] = -0.8672881;
viewWeight[1][0] = 0.38546264;
viewWeight[1][1] = 0.49619174;
viewWeight[1][2] = 0.74672616;
viewWeight[2][0] = 0.8600632;
viewWeight[2][1] = -0.57152116;
viewWeight[2][2] = -0.36613548;

viewWeight[0][0] = 0.42535996; // sonar waves
viewWeight[0][1] = 0.20250022;
viewWeight[0][2] = 0.11490095;
viewWeight[1][0] = 0.28385222;
viewWeight[1][1] = 0.34728336;
viewWeight[1][2] = -0.27777314;
viewWeight[2][0] = -0.7082759;
viewWeight[2][1] = -0.2516253;
viewWeight[2][2] = -0.07910085;
 
 viewWeight[0][0] = 0.026697397
 viewWeight[0][1] = -0.65235186
 viewWeight[0][2] = 0.97181726
 viewWeight[1][0] = 0.17297041
 viewWeight[1][1] = -0.23655093
 viewWeight[1][2] = 0.38833606
 viewWeight[2][0] = 0.09809375
 viewWeight[2][1] = -0.73471236
 viewWeight[2][2] = -0.2528695
 
 
 viewWeight[0][0] = -0.41071582
 viewWeight[0][1] = -0.499879
 viewWeight[0][2] = 0.44623244
 viewWeight[1][0] = -0.6553316
 viewWeight[1][1] = -0.42016995
 viewWeight[1][2] = -0.57833135
 viewWeight[2][0] = 0.7898755
 viewWeight[2][1] = 0.41094255
 viewWeight[2][2] = 0.550033
 
 
 viewWeight[0][0] = 0.99097145
 viewWeight[0][1] = -0.97448397
 viewWeight[0][2] = 0.31359053
 viewWeight[1][0] = -0.6587751
 viewWeight[1][1] = 0.1882658
 viewWeight[1][2] = 0.60666275
 viewWeight[2][0] = 0.48639238
 viewWeight[2][1] = -0.26021242
 viewWeight[2][2] = -0.83261
 
 
 viewWeight[0][0] = -0.617802
 viewWeight[0][1] = 0.9693023
 viewWeight[0][2] = 0.877893
 viewWeight[1][0] = -0.34149826
 viewWeight[1][1] = 0.9840654
 viewWeight[1][2] = -0.46953964
 viewWeight[2][0] = -0.81567013
 viewWeight[2][1] = -0.15570581
 viewWeight[2][2] = -0.33172464
 
 
 // SUBTRACTING
 
 viewWeight[0][0] = -0.9047216; // waves 2?
viewWeight[0][1] = 0.49576485;
viewWeight[0][2] = -0.1404239;
viewWeight[1][0] = 0.04745698;
viewWeight[1][1] = -0.35109437;
viewWeight[1][2] = 0.7896137;
viewWeight[2][0] = 0.5433036;
viewWeight[2][1] = -0.45729887;
viewWeight[2][2] = 0.42561233;
 
 viewWeight[0][0] = 0.5169487; // glitchy-fire
viewWeight[0][1] = -0.8592125;
viewWeight[0][2] = 0.40813756;
viewWeight[1][0] = -0.576053;
viewWeight[1][1] = 0.76483;
viewWeight[1][2] = -0.14760017;
viewWeight[2][0] = -0.9611391;
viewWeight[2][1] = 0.47963762;
viewWeight[2][2] = 0.2542677;

viewWeight[0][0] = -0.89107835; // ripply-glitchy-firey-thingy
viewWeight[0][1] = 0.7136195;
viewWeight[0][2] = -0.2567588;
viewWeight[1][0] = 0.2551577;
viewWeight[1][1] = 0.42235458;
viewWeight[1][2] = 0.95773494;
viewWeight[2][0] = -0.64707696;
viewWeight[2][1] = -0.15941525;
viewWeight[2][2] = -0.47719967;
 
 viewWeight[0][0] = -0.51844263
 viewWeight[0][1] = 0.48941183
 viewWeight[0][2] = 0.5105698
 viewWeight[1][0] = -0.21299517
 viewWeight[1][1] = -0.520378
 viewWeight[1][2] = -0.290249
 viewWeight[2][0] = 0.7070619
 viewWeight[2][1] = 0.27922332
 viewWeight[2][2] = 0.91061354
 
 // SETTING
 
 viewWeight[0][0] = -0.98466194; // fade-thingy
 viewWeight[0][1] = -0.71093893;
 viewWeight[0][2] = 0.076001525;
 viewWeight[1][0] = -0.8717841;
 viewWeight[1][1] = 0.22493421;
 viewWeight[1][2] = -0.42717755;
 viewWeight[2][0] = -0.096716166;
 viewWeight[2][1] = -0.411471;
 viewWeight[2][2] = 0.33016896;
 
 
viewWeight[0][0] = 0.96831393; // fades up by one across a few frames
viewWeight[0][1] = 0.060171843;
viewWeight[0][2] = 0.95069575;
viewWeight[1][0] = 0.53514826;
viewWeight[1][1] = -0.25157428;
viewWeight[1][2] = -0.1128695;
viewWeight[2][0] = -0.85185695;
viewWeight[2][1] = -0.38333023;
viewWeight[2][2] = -0.2205627;
 
 viewWeight[0][0] = -0.26892686; // monotone color gradient thing
 viewWeight[0][1] = -0.47267473;
 viewWeight[0][2] = 0.3017236;
 viewWeight[1][0] = -0.98587203;
 viewWeight[1][1] = 0.04665172;
 viewWeight[1][2] = -0.667953;
 viewWeight[2][0] = -0.23192978;
 viewWeight[2][1] = 0.39832532;
 viewWeight[2][2] = 0.44986498;
 
 viewWeight[0][0] = -0.6950822; // flag-stripes
viewWeight[0][1] = -0.75432813;
viewWeight[0][2] = 0.9173522;
viewWeight[1][0] = 0.08608651;
viewWeight[1][1] = -0.35113144;
viewWeight[1][2] = 0.28513896;
viewWeight[2][0] = -0.41659486;
viewWeight[2][1] = -0.82317734;
viewWeight[2][2] = -0.36772704;
 
 viewWeight[0][0] = -0.6739695; // idk
viewWeight[0][1] = -0.98534775;
viewWeight[0][2] = 0.56955516;
viewWeight[1][0] = -0.08686316;
viewWeight[1][1] = 0.1513598;
viewWeight[1][2] = 0.75526536;
viewWeight[2][0] = -0.67400396;
viewWeight[2][1] = 0.18623817;
viewWeight[2][2] = -0.46561158;
 
 viewWeight[0][0] = -0.44399655 // fire-like?
 viewWeight[0][1] = 0.7300643
 viewWeight[0][2] = -0.31032205
 viewWeight[1][0] = -0.82816696
 viewWeight[1][1] = -0.5400151
 viewWeight[1][2] = -0.015557647
 viewWeight[2][0] = -0.39929008
 viewWeight[2][1] = -0.092800856
 viewWeight[2][2] = 0.33126855
 
 // Large size
 viewWeight[0][0] = -0.6916392
 viewWeight[0][1] = 0.6868354
 viewWeight[0][2] = -0.49238563
 viewWeight[1][0] = 0.22587538
 viewWeight[1][1] = -0.25203872
 viewWeight[1][2] = -0.80041206
 viewWeight[2][0] = 0.89078474
 viewWeight[2][1] = 0.7255273
 viewWeight[2][2] = -0.009313703
 
 viewWeight[0][0] = 0.43932438
 viewWeight[0][1] = 0.69447446
 viewWeight[0][2] = -0.54040635
 viewWeight[1][0] = 0.29429185
 viewWeight[1][1] = 0.660162
 viewWeight[1][2] = 0.10472953
 viewWeight[2][0] = -0.67833734
 viewWeight[2][1] = -0.47894835
 viewWeight[2][2] = 0.26552486
 
 */
