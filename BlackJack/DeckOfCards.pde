// package other;

class DeckOfCards {
  int[] cards = new int[52];

  DeckOfCards () {
    reorder();
  }

  public void shuffle() { // this is a one-time use method that shuffles 'cards'
    boolean[] numUsed = new boolean[52];

    for (int i = 0; i < numUsed.length; i++) {
      numUsed[i] = false;
    }

    for (int i = 0; i < cards.length; i++) {
      int temp = 0;
      temp = (int) (Math.random()*52)+1;

      while (numUsed[temp-1] == true) {
        temp = ((int) (Math.random()*52))+1;
      }

      cards[i] = temp;
      numUsed[temp-1] = true;
    }
  }

  public void reorder() {
    for (int i : cards) {
      cards[i] = i;
    }
  }

  public String cardId(int cardNum) {
    if (cardNum == 0) {
      return "";
    }
    String cardValue;
    String cardSuit;


    switch((int) (cardNum%13)+1) {
    case 1:
      cardValue = "Ace";
      break;
    case 2:
      cardValue = "2";
      break;
    case 3:
      cardValue = "3";
      break;
    case 4:
      cardValue = "4";
      break;
    case 5:
      cardValue = "5";
      break;
    case 6:
      cardValue = "6";
      break;
    case 7:
      cardValue = "7";
      break;
    case 8:
      cardValue = "8";
      break;
    case 9:
      cardValue = "9";
      break;
    case 10:
      cardValue = "10";
      break;
    case 11:
      cardValue = "Jack";
      break;
    case 12:
      cardValue = "Queen";
      break;
    case 13:
      cardValue = "King";
      break;
    default:
      cardValue = "" + (int) cardNum%13+1;
      break;
    }

    switch ((int) (cardNum/13)) {
    case 0:
      cardSuit = "Hearts";
      break;
    case 1:
      cardSuit = "Diamonds";
      break;
    case 2:
      cardSuit = "Spades";
      break;
    case 3:
      cardSuit = "Clubs";
      break;
    default:
      cardSuit = "" + (int) (cardNum/13);
      break;
    }

    return (cardValue + " of " + cardSuit);
  }

  public void printArray2() {
    String cardSuit = "";
    String cardValue = "";

    for (int i = 0; i < cards.length; i++) {
      switch((int) (cards[i]%13)+1) {
      case 1:
        cardValue = "Ace";
        break;
      case 2:
        cardValue = "2";
        break;
      case 3:
        cardValue = "3";
        break;
      case 4:
        cardValue = "4";
        break;
      case 5:
        cardValue = "5";
        break;
      case 6:
        cardValue = "6";
        break;
      case 7:
        cardValue = "7";
        break;
      case 8:
        cardValue = "8";
        break;
      case 9:
        cardValue = "9";
        break;
      case 10:
        cardValue = "10";
        break;
      case 11:
        cardValue = "Jack";
        break;
      case 12:
        cardValue = "Queen";
        break;
      case 13:
        cardValue = "King";
        break;
      default:
        cardValue = "" + (int) cards[i]%13+1;
        break;
      }

      switch ((int) (cards[i]/13)) {
      case 0:
        cardSuit = "Hearts";
        break;
      case 1:
        cardSuit = "Diamonds";
        break;
      case 2:
        cardSuit = "Spades";
        break;
      case 3:
        cardSuit = "Clubs";
        break;
      default:
        cardSuit = "" + (int) (cards[i]/13);
        break;
      }

      System.out.println("The " + cardValue + " of " + cardSuit + " is in position " + (i+1) + " in the deck.");
    }
  }

  public void printArrayRaw() {
    for (int i = 0; i < cards.length; i++) {
      System.out.println(cards[i]);
    }
  }

  public int getRawNum(int loc) { // loc = pos in deck
    return cards[loc];
  }
}

/*

 Create a program that will create+shuffle a deck of cards and print the names of each card first in order 
 (A, #s, J, Q, K; Club, Diamond, Heart, Spade), then from top to bottom of the shuffled deck. 
 
 */
