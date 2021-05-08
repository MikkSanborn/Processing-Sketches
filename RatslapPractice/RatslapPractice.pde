// 225x315
import java.util.Stack;
import java.util.Collections;

HashMap<String, Card> cards = new HashMap<String, Card>();

ArrayList<Card> deck = new ArrayList<Card>();
Stack<Card> hand1 = new Stack<Card>();
Stack<Card> hand2 = new Stack<Card>();
Stack<Card> board = new Stack<Card>();

void setup() {
  size(800, 800);

  PImage img_in = loadImage("cards.jpg");

  for (int x = 0; x < 13; x++) {
    for (int y = 0; y < 4; y++) {
      Card c = new Card(img_in.get(x*225, y*315, 225, 315), Suit.values()[y], x+1);
      cards.put(("" + (x+1) + Suit.values()[y].toString()), c);
      deck.add(c);
    }
  }
  
  dealNewHands(true);
}

int avg_wait_time = 30;
int time = 10;
int player = 0;

void draw() {
  background(0);
  
  if (time == 0) {
    time = avg_wait_time;
    Card top;
    if (player == 0) {
      top = hand1.pop();
      board.push(top);
    } else if (player == 1) {
      top = hand2.pop();
      board.push(top);
    } else {
      top = null;
    }
    player++;
    if (player >= 2) {
      player = 0;
    }
  }
  
  for (int i = 0; i < board.size(); i++) {
    image(board.get(i).img, 100+i*30, 100);
  }
  
  if (keyPressed && key == ' ') {
    time++;
    // logic, if correct then add to time list then start going again
    
  }
  
  // add logic for who goes when a face is played
  
  time--;
}

void keyPressed() {
  if (key == 'r') {
    dealNewHands(true);
    board = new Stack<Card>();
  }
}

void shuffleDeck() {
  java.util.Collections.shuffle(deck);
}

void dealNewHands(boolean shuffleFirst) {
  if (shuffleFirst) shuffleDeck();
  hand1 = new Stack<Card>();
  hand2 = new Stack<Card>();
  
  for (int i = 0; i < deck.size(); i++) {
    if (i%2==0) {
      hand1.push(deck.get(i));
    } else {
      hand2.push(deck.get(i));
    }
  }
}

class Card {
  String name;
  PImage img;
  Suit suit;
  int value;

  Card(PImage img, Suit suit, int value) {
    this.img = img;
    this.suit = suit;
    this.value = value;
    this.name = "" + suit.toString() + value;
  }
}

enum Suit {
  Heart, Spade, Diamond, Club
}
