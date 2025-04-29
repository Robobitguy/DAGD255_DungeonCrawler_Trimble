class Enemy extends AABB {
  float angleToPlayer;
  float enemyHealth = 10;
  Enemy() {
    enemyHealth += scenePlay.Level;
    randomizePosition();
    velocity.x = 200;
    velocity.y = 200;
    setSize (50, 50);
  }
  void update() {
    calcAngleToPlayer();
    x += velocity.x * cos(angleToPlayer) * dt;
    y += velocity.y * sin(angleToPlayer) * dt;
    if (enemyHealth <= 0) isDead = true;
    super.update();
  }
  void draw() {
    fill (255, 0, 0);
    rect(x - halfW, y - halfH, w, h);
  }
  void calcAngleToPlayer() {
    float dx = playerPositionX -x;
    float dy = playerPositionY - y;
    angleToPlayer = atan2(dy, dx);
  }
  void randomizePosition() {
    float randomSide = random(0,2);
    int spawnSide = ceil(randomSide);
    switch(spawnSide){
      case 1: //LEFT
      x = playerPositionX - 700;
      break;
      case 2: //RIGHT
      x = playerPositionX + 700;
      break;
    }
    y = random(playerPositionY - 500, playerPositionY + 500);
  }
}
