void initVariables() {
  ObjectType s = ObjectType.Surface;
  ObjectType g = ObjectType.Ghost;
  ObjectType k = ObjectType.Kill;

  objects = new Object[8];

  objects[0] = new Object(s, 200, 650, 250, 150); // lvl -10 floor
  objects[1] = new Object(s, 500, 500, 250, 25); // lvl -10 floor
  objects[2] = new Object(s, 450, 575, 25, 10); // lvl -10 floor
  objects[3] = new movingObject(s, 200, 600, 150, 15, 150, 500, 600, 600, 2, 0); // lvl -10 floor
  objects[4] = new Object(k, 650, 775, 200, 100); // lvl -10 floor
  objects[5] = new Object(g, 100, 300, 600, 700); // lvl -10 floor
  objects[6] = new Object(g, 300, 500, 50, 70); // lvl -10 floor
  objects[7] = new movingObject(s, 300, 800, 100, 10, 250, 700, 700, 900, 1, 3); // lvl -10 floor
}

void drawLevel(int level) {
  background(0);

  switch(level) { // draw levels, only draw one at a time
  case -10: // "home screen"
    background(0);

    player.setOnGround(false); // set default val
    // range is range of indexes of the objects used
    for (int i = 0; i < 8; i++) {
      objects[i].display();
      objects[i].special();
      player.collideWith(objects[i]);
    }

    player.display();
    player.move();

    break;
  default:
    Game.level = -10;
    break;
  }
}
