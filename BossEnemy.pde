class BossEnemy extends AABB {
  float angleToPlayer;
  float distanceToPlayer;
  float bossHealth = 10;
  int stage = 1;
  boolean angleCalculated = false;
  float chargeWarmup;
  float stun = 2;
  float enemyShotCD = 1;
  BossEnemy() {
    bossHealth += (scenePlay.Level * 2);

    setSize(75, 75);
  }
  void update() {
    enemyShotCD -= dt;
    x += velocity.x * cos(angleToPlayer) * dt;
    y += velocity.y * sin(angleToPlayer) * dt;
    switch(stage) {
    case 1: //CHASE
      velocity.x = 250;
      velocity.y = 250;
      calcAngleToPlayer();
      calcDistanceToPlayer();
      if (distanceToPlayer <= 400) stage = 2;
      break;
    case 2: //SHOOT
      velocity.x = 250;
      velocity.y = 250;
      calcAngleToPlayer();
      calcDistanceToPlayer();
      angleCalculated = false;
      if (enemyShotCD <= 0) {
        EnemyBullet eb = new EnemyBullet(x, y, angleToPlayer);
        scenePlay.enemyBullets.add(eb);
        enemyShotCD = 1;
      }
      if (distanceToPlayer <= 200) stage = 3;
      break;
    case 3: //CHARGE
      if (angleCalculated == false) {
        calcAngleToPlayer();
        angleCalculated = true;
        chargeWarmup = 1;
      }
      chargeWarmup -= dt;
      if (chargeWarmup > 0) {
        velocity.x = 0;
        velocity.y = 0;
      } else {
        velocity.x = 1000;
        velocity.y = 1000;
      }
      for (int i = 0; i < scenePlay.platforms.size(); i++) {
        if (checkCollision(scenePlay.platforms.get(i)) || calcOffScreen() == true) {
          stun = 2;
          stage = 4;
        }
      }
      break;
    case 4: //STUN
      velocity.x = 0;
      velocity.y = 0;      
      for (int i = 0; i < scenePlay.platforms.size(); i++) {
        if (checkCollision(scenePlay.platforms.get(i))) {
          Platform p = scenePlay.platforms.get(i);
          applyFix(findOverlapFix(p));
        }
      }
      stun -= dt;
      if (stun <= 0) stage = 1;
      break;
    }
    if (bossHealth <= 0) isDead = true;
    super.update();
  }
  void draw() {
    switch(stage) {
    case 1:
      fill(255, 0, 255);
      break;
    case 2:
      fill(255, 0, 255);
      break;
    case 3:
      fill(255, 0, 200);
      break;
    case 4:
      fill(60, 0, 255);
      break;
    }
    rect(x - halfW, y - halfH, w, h);
  }
  void calcAngleToPlayer() {
    float dx = playerPositionX -x;
    float dy = playerPositionY - y;
    angleToPlayer = atan2(dy, dx);
  }
  void calcDistanceToPlayer() {
    float px = playerPositionX -x;
    float py = playerPositionY - y;
    distanceToPlayer = sqrt(px * px + py * py);
  }
  boolean calcOffScreen() {
    if (x > playerPositionX + 700 || x < playerPositionX - 700 || y > playerPositionY + 500 || y < playerPositionY - 500) return true;
    else return false;
  }
  void randomizePosition() {
    float randomSide = random(0, 2);
    int spawnSide = ceil(randomSide);
    switch(spawnSide) {
    case 1: //LEFT
      x = scenePlay.player.x - 700;
      break;
    case 2: //RIGHT
      x = scenePlay.player.x + 700;
      break;
    }
    y = random(scenePlay.player.y - 500, scenePlay.player.y + 500);
  }
}
