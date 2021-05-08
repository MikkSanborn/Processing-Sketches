float cookies = 0;
float cPS = 0; // cookies per second
float cPC = 1; // cookies per click, affected by purchased upgrades (not machines i.e. cursors)
int upgrade1 = 0; // "cursor" += 1cps
int upgrade2 = 0; // "grandma" += 2cps
int upgrade3 = 0; // "farm" += 5cps

BigCookie Cookie;
Store sideStore;

void setup() {
  size(800, 600);

  Cookie = new BigCookie(width/2, height/2, 50, 1);
  sideStore = new Store(width-100, 0, 100, height);
}

void draw() {
  background(0);

  Cookie.display();
  sideStore.display();

  addCookies();

  println("\r\nCookies & Upgrades: " + (int) cookies + "   " + upgrade1 + "    " + upgrade2 + "    " + upgrade3);
  println("Upgrade Prices: " + (100.0+((upgrade1)*10.0)) + "    " + (250.0+((upgrade2)*10.0)) + "    " + (500.0+((upgrade3)*10.0)));

  if (keyPressed && key == '\\') {
    cookies += 100;
  }
}

void mouseClicked() {
  Cookie.click();
}

void addCookies() {
  cPS = upgrade1*1 + upgrade2*2 + upgrade3*5;

  cookies+=cPS;

  if (cPS != 0 && frameCount%30 == 10) {
  }
}
