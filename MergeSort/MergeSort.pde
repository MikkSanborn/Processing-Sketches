int count = 1000;

int[] pillars = new int[count];
int[] drawable = new int[count];

int rN = 2;

int del = 1;

long startTime;
long endTime;

boolean sorting = false;
boolean drawing = true;

float  w, h;

int recCount = 0;

void setup() {
  size(1000, 500);
  colorMode(HSB, height, 100, 100);

  w = 1.0*width/pillars.length;
  h = 1.0*height/pillars.length;  

  // w = 5;
  h = -1;

  for (int i = 0; i < pillars.length; i++) {
    pillars[i] = (int) (1.0*height/pillars.length*i);
  }

  fill(255);
  noStroke();
}

void draw() {
  if (!sorting) {
    copyPillarsToDrawable();
  }
  background(0);

  for (int i = 0; i < drawable.length; i++) {
    // fill(255*(1.0*(1+pillars[i])/height), 1.0*(1+pillars[i])/height*255, (height-1.0*(1+pillars[i])/height)*255);
    fill(drawable[i], 100, 100);
    rect(w*i+(1.0*w/8), height, 3.0*w/4, -drawable[i]);
  }
}

void draw2(int[] array) {
  /*
  background(0);
   
   for (int i = 0; i < pillars.length; i++) {
   // fill(255*(1.0*(1+pillars[i])/height), 1.0*(1+pillars[i])/height*255, (height-1.0*(1+pillars[i])/height)*255);
   rect(w*i+(1.0*w/8), height, 3.0*w/4, -pillars[i]);
   }
   */
  copyArrayToDrawable(array);
}

void copyPillarsToDrawable() {
  for (int i = 0; i < pillars.length; i++) {
    drawable[i] = pillars[i];
  }
}

void copyArrayToDrawable(int[] array) {
  for (int i = 0; i < pillars.length; i++) {
    drawable[i] = array[i];
  }
}

void keyReleased() {
  if (key == 'r') {
    int cols = pillars.length;
    boolean[] used = new boolean[cols];

    for (int i = 0; i < cols; i++) {
      used[i] = false;
    }

    for (int i = 0; i < cols; i++) {
      int x = findRandomUnused(used);
      used[x] = true;

      pillars[i] = x*height/pillars.length;
    }
  }
  if (key == 'R') {
    for (int i = 0; i < count; i++) {
      pillars[i] = rN*(int) random(0, height/rN);
    }
  }
  if (key == 's' || key == 'S') {
    sorting = true;
    println("sorting...");
    startTime = millis();
    // MergeSort ob = new MergeSort(); 
    // /*ob.*/    sort(pillars, 0, pillars.length-1);
    thread("sortPillars");
    // sortPillars();
  }
}

public void sortPillars() {
  sort(pillars, 0, pillars.length-1);
  println("complete?");
  sorting = false;
}

int findRandomUnused(boolean[] isUsed) {
  int x;
  while (true) {
    x = (int) random(0, pillars.length);

    if (!isUsed[x]) {
      return x;
    }
  }
}

// Merges two subarrays of arr[]. 
// First subarray is arr[l..m] 
// Second subarray is arr[m+1..r] 
void merge(int arr[], int l, int m, int r) { 
  // Find sizes of two subarrays to be merged 
  delay(del);
  draw2(arr);
  int n1 = m - l + 1; 
  int n2 = r - m; 

  /* Create temp arrays */
  int L[] = new int [n1]; 
  int R[] = new int [n2]; 

  /*Copy data to temp arrays*/
  for (int i=0; i<n1; ++i) 
    L[i] = arr[l + i]; 
  for (int j=0; j<n2; ++j) 
    R[j] = arr[m + 1+ j]; 


  /* Merge the temp arrays */

  // Initial indexes of first and second subarrays 
  int i = 0, j = 0; 

  // Initial index of merged subarry array 
  int k = l; 
  while (i < n1 && j < n2) { 
    delay(del);
    draw2(arr);
    if (L[i] <= R[j]) 
    { 
      arr[k] = L[i]; 
      i++;
    } else { 
      arr[k] = R[j]; 
      j++;
    } 
    k++;
  } 

  /* Copy remaining elements of L[] if any */
  while (i < n1) { 
    delay(del);
    draw2(arr);
    arr[k] = L[i]; 
    i++; 
    k++;
  } 

  /* Copy remaining elements of R[] if any */
  while (j < n2) { 
    delay(del);
    draw2(arr);
    arr[k] = R[j]; 
    j++; 
    k++;
  }
} 

// Main function that sorts arr[l..r] using
// merge()
void sort(int arr[], int l, int r) {
  if (l < r) {
    // Find the middle point 
    int m = (l+r)/2; 

    draw2(arr);
    delay(del);
    // Sort first and second halves 
    sort(arr, l, m); 
    sort(arr, m+1, r);

    // Merge the sorted halves 
    merge(arr, l, m, r);
  }
}

/* A utility function to print array of size n */
static void printArray2(int arr[]) { 
  int n = arr.length; 
  for (int i=0; i<n; ++i) 
    System.out.print(arr[i] + " "); 
  System.out.println();
}
