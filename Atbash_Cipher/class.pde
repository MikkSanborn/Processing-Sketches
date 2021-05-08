import java.util.*;

class Atbash {
  public String encode(String plaintext) {
    String ciphertext = "";
    plaintext = removeUnwantedChars(plaintext.toLowerCase());
    for (char c : plaintext.toCharArray())
    {
      if (Character.isLetter(c)) {
        ciphertext += (char) ('a' + ('z' - c));
      } else {
        ciphertext += c;
      }
    }
    return getSubStrings(ciphertext).trim();
  }

  public String decode(String ciphertext) {
    String plaintext = "";
    ciphertext = removeUnwantedChars(ciphertext.toLowerCase());
    for (char c : ciphertext.toCharArray()) {
      if (Character.isLetter(c)) {
        plaintext += (char) ('z' + ('a' - c));
      } else {
        plaintext += c;
      }
    }
    return plaintext;
  }

  private String getSubStrings(String input) {
    String out = "";
    for (int i = 0; i < input.length(); i += 5) {
      if (i + 5 <= input.length()) {
        out += (input.substring(i, i + 5) + " ");
      } else {
        out += (input.substring(i) + " ");
      }
    }
    return out;
  }

  private String removeUnwantedChars(String input) {
    String out = "";
    for (char c : input.toCharArray())
    {
      if (Character.isLetterOrDigit(c))
      {
        out += c;
      }
    }
    return out;
  }
}
