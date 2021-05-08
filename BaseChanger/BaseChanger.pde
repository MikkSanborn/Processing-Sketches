String val_in = "222";
char base_in = '3';
// char base_out = 'd';

char[] vals = val_in.toCharArray();

int base_enumerated;

try {
  base_enumerated = Integer.parseInt("" + base_in); // if is a number <= 10
} 
catch (Exception e) {
  int num = ((int) ("" + base_in).toUpperCase().toCharArray()[0])-55; // -55 = +10-65, 65 is (int) 'A'
  if (num > 36 || num < 2)
    throw new IllegalArgumentException("All values in \"val_in\" must be a number between 2-9, or an ASCII letter between A-Z. The base may only be one character of the acceptable format.");
  base_enumerated = num;
}

long valOut = 0; // in base 10, for now

for (int i = 0; i < vals.length; i++) { // for each number, starting at the back (i starts at 0)
  try { // try to
    int num = Integer.parseInt("" + vals[vals.length-1-i]); // parse the number value
    if (num >= base_enumerated)
      throw new IllegalArgumentException(vals[vals.length-1-i] + " (" + num + ") is not less than " + base_enumerated + ". All values in \"val_in\" must be numbers between 0-9, or an ASCII letter between A-Z, such that the value is less than the \"base_in\" value. NOTE: 0 < 9 < a < z.");
    valOut+=num*(int) Math.pow(base_enumerated, i);
  } catch (NumberFormatException e) { // if that fails, then
    int num = ((int) ("" + vals[vals.length-1-i]).toUpperCase().toCharArray()[0])-55; // -55 = +10-65, 65 is (int) 'A'
    if (num > 36 || num < 0)
      throw new IllegalArgumentException("All values in \"val_in\" must be a number between 0-9, or an ASCII letter between A-Z. There may be multiple of these acceptable characters.");
    if (num >= base_enumerated)
      throw new IllegalArgumentException("All values in \"val_in\" must be numbers between 0-9, or an ASCII letter between A-Z, such that the value is less than the \"base_in\" value. NOTE: 0 < 9 < a < z.");
    valOut+=num*(int) Math.pow(base_enumerated, i);
  }
}

println(valOut);

exit();
