class ScenePlay {
  ArrayList<Platform> platforms = new ArrayList();
  ArrayList<Bullet> bullets = new ArrayList();
  ArrayList<Room> rooms = new ArrayList();
  ArrayList<Door> doors = new ArrayList();
  ArrayList<Enemy> enemies = new ArrayList();
  Player player;
  Camera camera;
  float enemyCD = 1;
  float shotCD = 1;
  float iFrames = 0;
  ScenePlay() {
    player = new Player(width/2, height/2);
    camera = new Camera(player);
    if (scenePlay != null) {
      Room r = new Room(-camera.x, -camera.y);
      rooms.add(r);
    }
  }
  void update() {
    background(128);
    scale(zoomAmount);
    //SPAWN OBJECTS
    enemyCD -= dt;
    shotCD -= dt;
    if (enemyCD <= 0) {
      Enemy e = new Enemy();
      enemies.add(e);
      enemyCD = 1;
    }
    //UPDATE OBJECTS
    camera.update();
    for (int i = 0; i < platforms.size(); i++) {
      Platform p = platforms.get(i);
      p.update();
      if (p.checkCollision(player)) {
        player.applyFix(player.findOverlapFix(p));
      }
    }
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.update();
      if(e.checkCollision(player)){
        player.takeDamage();
      }
      if (e.isDead) {
        enemies.remove(e);
        player.experience += 1;
      }
    }
    //BULLET UPDATE
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      for (int j = 0; j < enemies.size(); j++) {
        if (b.checkCollision(enemies.get(j))) {
          bullets.get(i).hitNumber++;
          enemies.get(j).enemyHealth -= player.playerDamage;
        }
      }
      if (b.isDead) bullets.remove(b);
    }
    for (int i = 0; i < rooms.size(); i++) {
      Room r = rooms.get(i);
      r.update();
    }
    for (int i = 0; i < doors.size(); i++) {
      Door d = doors.get(i);
      d.update();
    }
    player.update();
    //NEXT FRAME PREP
    Keyboard.update();
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
    shotCD -= dt;
    //GAME OVER
    if (player.currentHealth <= 0){
      scene = 2;
    }
  }
  void draw() {
    //PUSHMATRIX
    pushMatrix();
    translate(-camera.x, -camera.y);
    //DRAW OBJECTS
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.draw();
    }
    for (int i = 0; i < platforms.size(); i++) {
      Platform p = platforms.get(i);
      p.draw();
    }
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.draw();
    }
    for (int i = 0; i < doors.size(); i++) {
      Door d = doors.get(i);
      d.draw();
    }
    player.draw();
    //POPMATRIX--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    popMatrix();
    //DRAW HUD
  }
}
