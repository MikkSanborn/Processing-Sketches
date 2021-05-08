// Radix sort Java implementation 
import java.io.*; 
import java.util.*; 

static int del = 1000;

int[] arr = new int[1200];
int n = arr.length; 

int rN = 1; // must be >=1
float rounds = 1; // doesn't change value; just adds more layers to the sort. Use multiples of 10

float w, h;

void setup() {
  size(1600, 800);
  colorMode(HSB, height, 100, 100, 100);

  w = 1.0*width/arr.length;
  // h = 1.0*height/arr.length; 
  h = 1;

  randomize(false);

  //print(arr, n);
}

void draw() {
  background(0);

  for (int i = 0; i < arr.length; i++) {
    // fill(255*(1.0*(1+arr[i])/height), 1.0*(1+arr[i])/height*255, (height-1.0*(1+arr[i])/height)*255);
    fill(arr[i]/rounds, 100, 100);
    rect(w*i, height, w, -arr[i]/rounds);
  }
}

void keyReleased() {
  if (key == 'r') {
    randomize(false);
  } else if (key == 'R') {
    randomize(true);
  } else if (key == 's') {
    thread("arrSort");
  }
}

public void arrSort() {
  radixsort(arr, n);
  println("done");
}

// class Radix { 
// A utility function to get maximum value in arr[] 
static int getMax(int arr[], int n) 
{ 
  int mx = arr[0]; 
  for (int i = 1; i < n; i++) 
    if (arr[i] > mx) 
      mx = arr[i];
  return mx;
} 

// A function to do arr.lengthing sort of arr[] according to 
// the digit represented by exp. (eg. 300 is represented by 100)
static void countSort(int arr[], int n, int exp) 
{ 
  int output[] = new int[n]; // output array 
  int i; 
  int count[] = new int[10]; 
  Arrays.fill(count, 0); 

  // Store arr.length of occurrences in arr.length[] 
  for (i = 0; i < n; i++) 
    count[ (arr[i]/exp)%10 ]++; 

  // Change arr.length[i] so that arr.length[i] now contains 
  // actual position of this digit in output[] 
  for (i = 1; i < 10; i++) 
    count[i] += count[i - 1]; 

  // Build the output array 
  for (i = n - 1; i >= 0; i--) 
  { 
    output[count[ (arr[i]/exp)%10 ] - 1] = arr[i]; 
    count[ (arr[i]/exp)%10 ]--;
  } 

  // Copy the output array to arr[], so that arr[] now 
  // contains sorted numbers according to curent digit 
  for (i = 0; i < n; i++) 
    arr[i] = output[i];
} 

// The main function to that sorts arr[] of size n using 
// Radix Sort 
void radixsort(int arr[], int n) 
{ 
  // Find the maximum number to know number of digits 
  int m = getMax(arr, n); 

  // Do arr.lengthing sort for every digit. Note that instead 
  // of passing digit number, exp is passed. exp is 10^i 
  // where i is current digit number 
  for (int exp = 1; m/exp > 0; exp *= 10) {
    delay(del);
    countSort(arr, n, exp);
  }
} 

// A utility function to print an array 
static void print(int arr[], int n) 
{ 
  for (int i=0; i<n; i++) 
    System.out.print(arr[i]+" ");
} 

/*Driver function to check for above function*/
/*
    public static void main (String[] args) 
 { 
 
 } 
 */
// }

void randomize(boolean trueRandom) {
  if (!trueRandom) {
    int cols = arr.length;
    boolean[] used = new boolean[cols];

    for (int i = 0; i < cols; i++) {
      used[i] = false;
    }

    for (int i = 0; i < cols; i++) {
      int x = findRandomUnused(used);
      used[x] = true;

      arr[i] = (int) (1.0*rounds*x*height/arr.length);
    }
  } else {
    for (int i = 0; i < arr.length; i++) {
      arr[i] = rN*(int) random(0, rounds*height/rN);
    }
  }
}

int findRandomUnused(boolean[] isUsed) {
  int x;
  while (true) {
    x = (int) random(0, isUsed.length);

    if (!isUsed[x]) {
      return x;
    }
  }
}
