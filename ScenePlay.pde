class ScenePlay {
  ArrayList<Platform> platforms = new ArrayList();
  ArrayList<Bullet> bullets = new ArrayList();
  ArrayList<Room> rooms = new ArrayList();
  ArrayList<Door> doors = new ArrayList();
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<BossEnemy> bossEnemies = new ArrayList();
  ArrayList<Particle>particles = new ArrayList();
  ArrayList<EnemyBullet> enemyBullets = new ArrayList();
  Player player;
  Camera camera;
  HUD hud;
  float enemyCD = 1;
  float shotCD = 1;
  float IFrames = 0;
  float pierceCD = 0;
  float roomCD = 0.1;
  float bossCD = 20;
  int Level = 1;
  ScenePlay() {
    player = new Player(width/2, height/2);
    camera = new Camera(player);
    hud = new HUD();
    BGM.rate(1.1);
    BGM.amp(0.5);
    BGM.loop();
  }

  void update() {
    scale(zoomAmount);
    //SPAWN OBJECTS
    enemyCD -= dt;
    shotCD -= dt;
    IFrames -= dt;
    pierceCD -= dt;
    roomCD -= dt;
    bossCD -= dt;
    if (enemyCD <= 0) {
      Enemy e = new Enemy();
      enemies.add(e);
      enemyCD = 1;
    }
    if (bossCD <= 0) {
      BossEnemy be = new BossEnemy();
      bossEnemies.add(be);
      bossCD = 20;
    }
    if (rooms.size() <= 1 && roomCD <= 0) {
      Room r = new Room(-camera.x, -camera.y);
      rooms.add(r);
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
    //ENEMIES UPDATE
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.update();
      if (e.checkCollision(player) && IFrames <= 0) {
        player.takeDamage();
      }
      if (e.isDead) {
        enemies.remove(e);
        player.currentXP += 1;
      }
    }
    for (int i = 0; i < bossEnemies.size(); i++) {
      BossEnemy be = bossEnemies.get(i);
      be.update();
      if (be.checkCollision(player) && IFrames <= 0) {
        player.takeDamage();
      }
      if (be.isDead) {
        bossEnemies.remove(be);
        player.currentXP += 5;
      }
    }
    //BULLET UPDATE
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();
      for (int j = 0; j < enemies.size(); j++) {
        if (b.checkCollision(enemies.get(j)) && pierceCD <=0) {
          hitSound.amp(100);
          hitSound.play();
          bullets.get(i).hitNumber++;
          enemies.get(j).enemyHealth -= player.playerDamage;
          pierceCD = 0.05;
        }
      }
      for (int j = 0; j < bossEnemies.size(); j++) {
        if (b.checkCollision(bossEnemies.get(j)) && pierceCD <=0) {
          hitSound.amp(100);
          hitSound.play();
          bullets.get(i).hitNumber++;
          bossEnemies.get(j).bossHealth -= player.playerDamage;
          pierceCD = 0.05;
        }
      }
      if (b.isDead) bullets.remove(b);
    }
    for (int i = 0; i < enemyBullets.size(); i++) {
      EnemyBullet eb = enemyBullets.get(i);
      eb.update();
      if (eb.checkCollision(player) && IFrames <= 0) {
        player.takeDamage();
      }
      if (eb.isDead) enemyBullets.remove(eb);
    }
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead) particles.remove(p);
    }
    for (int i = 0; i < rooms.size(); i++) {
      Room r = rooms.get(i);
      r.update();
    }
    for (int i = 0; i < doors.size(); i++) {
      Door d = doors.get(i);
      d.update();
    }
    hud.update();
    player.update();
    //NEXT FRAME PREP
    Keyboard.update();
    pLeftPressed = leftPressed;
    pRightPressed = rightPressed;
    shotCD -= dt;
    //GAME OVER
    if (player.isDead == true) {
      BGM.stop();
      scene = 2;
    }
  }
  void draw() {
    background(#713A1A);
    //PUSHMATRIX
    pushMatrix();
    translate(-camera.x, -camera.y);
    //DRAW OBJECTS
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.draw();
    }
    for (int i = 0; i < bossEnemies.size(); i++) {
      BossEnemy be = bossEnemies.get(i);
      be.draw();
    }
    for (int i = 0; i < platforms.size(); i++) {
      Platform p = platforms.get(i);
      p.draw();
    }
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.draw();
    }
    for (int i = 0; i < enemyBullets.size(); i++) {
      EnemyBullet eb = enemyBullets.get(i);
      eb.draw();
    }
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.draw();
    }
    /*for (int i = 0; i < doors.size(); i++) {
     Door d = doors.get(i);
     d.draw();
     }*/
    player.draw();
    //POPMATRIX--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    popMatrix();
    //DRAW HUD
    hud.draw();
  }
}
