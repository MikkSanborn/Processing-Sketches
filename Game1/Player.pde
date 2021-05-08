class Player {
  private float x;
  private float y;
  private final int w;
  private final int h;
  private float xs; // for sliding (non-linear motion)
  private float ys; // for jumping
  // private int z;

  private int jumpCount;

  public boolean isOnGround;

  private int health;

  Player() {
    x = 300;
    y = 200;
    // z = 0;

    w = 50;
    h = -80;

    jumpCount = 0;

    isOnGround = false;

    health = 20;
  }

  void display() {
    fill(30, 60, 230);
    strokeWeight(1);
    stroke(120, 60, 200);
    rect(x, y, 50, -80);
  }

  void move() {
    if (Game.playerControl) {
      if (keyPressed && (key == 'a' || keyCode == LEFT)) {
        if (xs < 4.5) {
          xs-=0.1; // non-linear? (idk how yet)
        }
      }
      if (keyPressed && (key == 'd' || keyCode == RIGHT)) {
        if (xs > -4.5) {
          xs+=0.1; // non-linear? (idk how yet)
        }
      }
      if (keyPressed && (key == ' ' || key == 'w' || keyCode == UP) && isOnGround && jumpCount == 0) {
        // ys = -8;
        jumpCount = 4;
      }
      if (keyPressed && (key == 's' || keyCode == DOWN)) {
        ys+=0.2;
      }

      if (jumpCount > 0) {
        ys -= jumpCount;
        jumpCount--;
      }

      x+=xs;
      y+=ys;

      ys+=Game.g;

      if (isOnGround) {
        xs*=.97;
      } else {
        xs*=.985;
      }
      ys*=0.995; // "air resistance"... because i can
    }

    if (this.y > height) {
      this.kill();
    }
  }

  void damage(int damageTaken) {
    if (damageTaken < 1) {
      return;
    }
    health-=damageTaken;
  }

  void setOnGround(boolean b) {
    isOnGround = b;
  }

  void checkHealth() {
    if (health <= 0) {
      respawn();
      health = 20;
    }
  }

  void respawn() {
    x = 0; // previous checkpoint
    y = 0; // previous checkpoint
    xs = 0;
    ys = 0;
  }

  void kill() {
    health = 0;
    checkHealth();
  }

  void collideWith(Object that) {
    if (this.x < that.x+that.w && this.x+w > that.x && this.y > that.y && this.y+this.h < that.y+that.h && that.type == ObjectType.Kill) {
      player.kill();
    } else if (this.x < that.x+that.w && this.x+w > that.x && this.y > that.y && this.y < that.y+this.ys && that.type != ObjectType.Ghost) {
      if (that.getYS() < 0) {
        player.shiftY(that.getYS());
      }
      isOnGround = true;
      this.y -= ys; // keep off platform
      this.ys -= Game.g; // to prevent speed stacking

      if (keyPressed && (key == 's' || keyCode == DOWN)) {
        y+=5;
      }
    }
  }

  float getX() {
    return x;
  }

  void shiftY(float amount) {
    y+=amount;
  }

  float getY() {
    return y;
  }

  float getW() {
    return w;
  }

  float getH() {
    return h;
  }
}
