Player player;
GameInfo Game;

Object[] objects;

void setup() {
  size(1600, 1000);

  player = new Player();
  Game = new GameInfo(-10, true);

  initVariables();
}

void draw() {
  drawLevel(Game.level);

  if (keyPressed && key == 'p') {
    noLoop();
  }

  if (keyPressed && key == 'r') {
    player.x = 250;
    player.y = 250;
  }
}
