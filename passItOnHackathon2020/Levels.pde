final float norm_size = 10;
final float fat_size = 15;
final float boss_size = 50;

// a runner CONTROLLER, so it modifies the wires and the enemies array. 
class Level {
  public float time;

  int currWave = 1;

  Wave wave1 = new Wave(15, 10, 0, 0, 100, 0, 20, 30, 1);
  Wave wave2 = new Wave(15, 20, 1, 0, 10, 100, 30, 20, 1);
  Wave wave3 = new Wave(20, 35, 3, 0, 100, 0, 15, 7, 10);
  Wave wave4 = new Wave(15, 30, 10, 0, 80, 50, 23, 8, 20);
  Wave wave5 = new Wave(45, 5, 5, 0, 120, 0, 10, 40, 5);
  Wave wave6 = new Wave(100, 10, 20, 0, 100, 80, 5, 16, 1);
  
  Wave[] waves = {wave1, wave2, wave3, wave4, wave5, wave6};

  public Level() {
  }

  float tNorm = 0; // time since last normal deployed
  float tFat = 0; // time since last fat deployed
  float tBoss = 0; // time since last boss deployed

  public void runWave() {
    if (currWave >= 1 && currWave <= 6) {
      waves[currWave-1].run(this, time);
    } else if (currWave == 7) {
      println("done");
    }
    // println("runWave()");
    /*if (currWave == 1) {
      // println("cW 1");
      wave1.run(this, time);
    } else if (currWave == 2) {
      // println("cW 2");
      wave2.run(this, time);
    }*/
    time++;
    // when complete, change the level variable.
  }
}

class Wave {
  int num_norm, num_fat, num_boss;
  float start_norm, start_fat, start_boss;
  float dNorm, dFat, dBoss; // difference/distance in time between thingies

  public Wave(int num_norm, int num_fat, int num_boss, float start_norm, float start_fat, float start_boss, float dNorm, float dFat, float dBoss) {
    this.num_norm = num_norm;
    this.num_fat = num_fat;
    this.num_boss = num_boss;
    this.start_norm = start_norm;
    this.start_fat = start_fat;
    this.start_boss = start_boss;
    this.dNorm = dNorm;
    this.dFat = dFat;
    this.dBoss = dBoss;
  }

  public void run(Level l, float time) {
    // println("run   " + time + "  " + (time > start_norm) + "  " +  (time % dNorm < 1) + "   " + (time%dNorm) + "    " +  (num_norm != 0));
    if (time > start_norm && time % dNorm < 1 && num_norm != 0) {
      // println("spawned norm.    remaining " + num_norm);
      num_norm--;
      e.add(new Enemy(norm_size));
    }
    if (time > start_fat && time % dFat < 1 && num_fat != 0) {
      num_fat--;
      e.add(new Enemy(fat_size));
    }
    if (time > start_boss && time % dBoss < 1 && num_boss != 0) {
      num_boss--;
      e.add(new Enemy(boss_size));
    }
    if (num_norm == 0 && num_fat == 0 && num_boss == 0 && e.size() == 0) {
      l.currWave++;
      gameState = settingUp;
      gb.enigma++;
      p1.money += 1200;

    }
  }
}
