// package other;
import java.util.Scanner;
DeckOfCards c;

String myText = "";

void setup() {
  size(500, 500);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  
  c = new DeckOfCards();
}

// public class BlackJack extends DeckOfCards {
public /* static */ int player1hand[] = new int[12]; // arbitrary number. ArrayList would work better, but im not using those. // person
public /* static */ int cardsInHand1 = 0;
public /* static */ int player2hand[] = new int[12]; // arbitrary number. ArrayList would work better, but im not using those. // computer
public /* static */ int cardsInHand2 = 0;
// 2 max, (array of players?)
// removed original deck declaration
public /* static */ boolean playing = true; // false if user says no more
public /* static */ boolean myTurn;
public /* static */ int cardLoc = 0; // location next card in deck
private /* static */ Scanner kybd = new Scanner(System.in);

// public /* static */ void main(String[] args) {
void draw() {
  c.shuffle();

  while (playing) {
    resetGame();

    printGame();

    myTurn = true;

    while (myTurn) {
      if (hitQuery()) {
        hitPlayer1();
        printGame();
        if (checkLossPlayer1()) {
          myTurn = false;
          playing = true;
          displayLose("Player 1 (you)");
          break;
        }
      } else {
        myTurn = false;
      }
    } // computer's turn

    if (!checkLossPlayer1()) { // if player 1 has not lost
      while ((handSum(player2hand, cardsInHand2) < 16)) { // if <16, computer will hit
        hitPlayer2(); // auto-hit
        printGame(); // update player 1 on what computer got
        if (checkLossPlayer2()) {
          // myTurn = false; // obsolete
          playing = true;
          displayLose("Computer");
          break;
        }
        // printGame();
      } // computer's turn
    }
    // if nobody lost yet
    printGame();

    System.out.println("\n");

    if (handSum(player1hand, cardsInHand1) > handSum(player2hand, cardsInHand2)) { // player 1 wins
      System.out.println("\n\nYou won the game with a total of: " + handSum(player1hand, cardsInHand1) + " and the computer had: " + handSum(player2hand, cardsInHand2) + ".");
    } else if (handSum(player1hand, cardsInHand1) < handSum(player2hand, cardsInHand2)) { // computer wins
      System.out.println("\n\nThe Computer won the game with a total of: " + handSum(player2hand, cardsInHand2) + " and you had: " + handSum(player1hand, cardsInHand1) + ".");
    } else { // draw
      System.out.print("You drawed at a total of: " + handSum(player2hand, cardsInHand2));
      if (cardsInHand1 < cardsInHand2) {
        System.out.println(", but you won because you had " + (cardsInHand2-cardsInHand1) + " fewer cards than the computer.");
      } else if (cardsInHand1 > cardsInHand2) {
        System.out.println(", but you lost because you had " + (cardsInHand1-cardsInHand2) + " more cards than the computer.");
      } else {
        System.out.println(".");
      }
    }


    pauseGame(2);
    System.out.println("Play again?");
    String response = kybd.nextLine();
  }

  System.out.println("Thanks for playing?");
  // }
}

public /* static */ void printGame() { // prints computer's top cards, and your entire hand
  System.out.println("\n\n\n\n\n\n\n\n");
  System.out.print("Opponent's cards: face-down");
  for (int i = 0; i < cardsInHand2-1; i++) {
    System.out.print(", the " + c.cardId(player2hand[i+1])); // skip the first... it's upside - down
  }
  System.out.print(". Total: ?\nYour cards: ");
  for (int i = 0; i < cardsInHand1; i++) {
    System.out.print((i == 0 ? "":", ") + c.cardId(player1hand[i])); // don't add a comma before the first value
  }
  System.out.println(". Total: " + handSum(player1hand, cardsInHand1));
}

public /* static */ void printGameOmniscent() { // prints computer's top cards, and your entire hand
  System.out.println("\n\n\n\n\n\n\n\n");
  System.out.print("Opponent's cards: ");
  for (int i = 0; i < cardsInHand2; i++) {
    System.out.print(", the " + c.cardId(player2hand[i])); // skip the first... it's upside - down... but this is all knowing
  }
  System.out.print(". Total: " + handSum(player2hand, cardsInHand2) + "\nYour cards: ");
  for (int i = 0; i < cardsInHand1; i++) {
    System.out.print((i == 0 ? "":", ") + c.cardId(player1hand[i])); // don't add a comma before the first value
  }
  System.out.println(". Total: " + handSum(player1hand, cardsInHand1));
}

public /* static */ void hitPlayer1() {
  player1hand[cardsInHand1] = c.getRawNum(cardLoc);
  cardLoc++;
  cardsInHand1++;
}

public /* static */ void hitPlayer2() {
  player2hand[cardsInHand2] = c.getRawNum(cardLoc);
  cardLoc++;
  cardsInHand2++;
}

public /* static */ void resetGame() {
  for (int i = 0; i < player1hand.length; i++) {
    player1hand[i] = 0;
    player2hand[i] = 0;
  }
  c.shuffle();
  cardsInHand1 = 0;
  cardsInHand2 = 0;
  cardLoc = 0;

  // the first cards dealt
  hitPlayer1();
  hitPlayer2();
  hitPlayer1();
  hitPlayer2();
}

public /* static */ boolean hitQuery() {
  System.out.println("Hit or stay?");
  String response = kybd.nextLine();
  boolean out;

  if (response.equalsIgnoreCase("Hit") || response.equalsIgnoreCase("Yes") || response.equalsIgnoreCase("True")) {
    out = true;
  } else {
    out = false;
  }

  return out;
}

public /* static */ boolean checkLossPlayer1() {
  return (handSum(player1hand, cardsInHand1) > 21); // true means you bust
}

public /* static */ boolean checkLossPlayer2() {
  return (handSum(player2hand, cardsInHand2) > 21); // true means you bust
}

public /* static */ void displayLose(String name) {
  System.out.println(name + " has lost the game. Reason: Bust.");
  pauseGame(1);
  System.out.println("Would you like to play again?");
  String response = kybd.nextLine();
  playing = (response.equalsIgnoreCase("Hit") || response.equalsIgnoreCase("Contiue") || response.equalsIgnoreCase("True"));
}

public /* static */ void pauseGame(double secondS) { // capital S to not affect any possible global variables.
  try
  {
    Thread.sleep((long) (1000*secondS));
  }
  catch(InterruptedException ex)
  {
    Thread.currentThread().interrupt();
  }
}

public /* static */ int handSum(int[] hand, int cardsInHand) {
  int total = 0;

  for (int i = 0; i < cardsInHand; i++) {
    total+= (hand[i]%13 <= 8 ? hand[i]%13+1:10); // 10, jack, queen, king == 10
  }

  return total;
}
// }
 
void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (myText.length() > 0) {
      myText = myText.substring(0, myText.length()-1);
    }
  } else if (keyCode == DELETE) {
    myText = "";
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    myText = myText + key;
  }
}
