class Player {
  PImage woodTex;
  PImage standardTowerText;
  PImage sniperTowerText;
  PImage bombTowerText;
  PImage moneyImg;
  PImage selectionImg;
  Plug selectedPlug = null;
  int money, startingMoney = 1000;
  float textSize, shopWidth, shopHeight;
  Tower draggingTower;
  Tower shopTowers[] = new Tower[3];
  boolean mouseWasPressed;
  float health,startingHealth=1000.0;
  PFont font;
  float imgWidth = 100;
  Player() {
    woodTex = loadImage("data//wood.jpg");
    standardTowerText = loadImage("data//standardTowerText.png");
    sniperTowerText = loadImage("data//sniperTowerText.png");
    bombTowerText = loadImage("data//bombTowerText.png");
    moneyImg = loadImage("data//moneyBag.png");
    selectionImg = loadImage("data//selection.png");
    shopWidth = 200; shopHeight = 561;
    shopTowers[0] = new StandardTower(null,0,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2,imgWidth/2));
    shopTowers[1] = new SniperTower(null,0,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2+shopHeight/3,imgWidth/2));
    shopTowers[2] = new ExplodeTower(null,0,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2+2*shopHeight/3,imgWidth/2));
    money = startingMoney;
    textSize = height/15;
    health = startingHealth;
  }
  void shopLogic() {
    if(mousePressed) {
      if(mouseWasPressed && draggingTower != null) {
        draggingTower.position.x = mouseX;
        draggingTower.position.y = mouseY;
        int plugPos = -1;
        for(int i = 0; i<plugs.size(); i++) {
          if(plugs.get(i).position.isContacting(draggingTower.position) && !plugs.get(i).isFilled) {
            plugPos = i;
            break;
          }
        }
        if(plugPos>-1) {
          imageMode(CENTER);
          image(selectionImg,plugs.get(plugPos).position.x,plugs.get(plugPos).position.y,plugs.get(plugPos).position.r*2,plugs.get(plugPos).position.r*2);
          imageMode(CORNER);
        }
      } else {
        boolean pickedOneUp = false;
        for(int i = 0; i<shopTowers.length; i++) {
          if(shopTowers[i].position.isContacting(new Position(mouseX,mouseY,0))) {
            draggingTower = shopTowers[i];
            pickedOneUp = true;
            break;
          }
        }
        if(pickedOneUp) {
          if(draggingTower.p != null) draggingTower.p.isFilled = false;
          draggingTower.p = null;
        }
      }
    } else {
      if(mouseWasPressed && draggingTower != null) {
        int plugPos = -1;
        for(int i = 0; i<plugs.size(); i++) {
          if(plugs.get(i).position.isContacting(draggingTower.position) && !plugs.get(i).isFilled) {
            plugPos = i;
            break;
          }
        }
        if(plugPos == -1 || draggingTower.cost>money) {
          if(draggingTower == shopTowers[0])shopTowers[0] = new StandardTower(null,draggingTower.targetStyle,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2,imgWidth/2));
          if(draggingTower == shopTowers[1])shopTowers[1] = new SniperTower(null,draggingTower.targetStyle,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2+shopHeight/3,imgWidth/2));
          if(draggingTower == shopTowers[2])shopTowers[2] = new ExplodeTower(null,draggingTower.targetStyle,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2+2*shopHeight/3,imgWidth/2));
        } else {
          makeTower(plugPos);
        }
        draggingTower = null;
      }
    }
     mouseWasPressed = mousePressed;
  }
  void drawShop() {
    font = createFont("data//JMH Typewriter.ttf", 30);
    fill(255);
    textFont(font);
    textAlign(CENTER);
    //image(woodTex,width-width*shopWidth/1280,0,width*shopWidth/1280,shopHeight);
    text("Standard", width-(shopWidth/2),150);
    text("Sniper", width-(shopWidth/2),340);
    text("Bomber", width-(shopWidth/2),520);
    //image(moneyImg,width - (shopWidth/2+height/8)*width/1280, shopHeight-height/16, height/16*width/1280, height/16*width/1280);
    shopTowers[0].display();
    shopTowers[1].display();
    shopTowers[2].display();
    //text(money,width- 155*width/1280, shopHeight-shopHeight/100);
    if(selectedPlug!=null) {
      image(selectionImg,selectedPlug.position.x,selectedPlug.position.y,2*selectedPlug.position.r,2*selectedPlug.position.r);
    }
  }

  void makeTower(int plugPos) {
    if(draggingTower == shopTowers[0])shopTowers[0] = new StandardTower(null,draggingTower.targetStyle,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2,imgWidth/2));
    if(draggingTower == shopTowers[1])shopTowers[1] = new SniperTower(null,draggingTower.targetStyle,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2+shopHeight/3,imgWidth/2));
    if(draggingTower == shopTowers[2])shopTowers[2] = new ExplodeTower(null,draggingTower.targetStyle,imgWidth,new Position(width-shopWidth/2*width/1280,(height/3 - height/8)/2+2*shopHeight/3,imgWidth/2));
    towers.add(draggingTower);
    draggingTower.p = plugs.get(plugPos);
    money-=draggingTower.cost;
    draggingTower = null;
  }
  void damage(float damage) {
    health-=damage;
    if(health<0)switchToGameOver();
  }

}
