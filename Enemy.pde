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
    float dx = scenePlay.player.x -x;
    float dy = scenePlay.player.y - y;
    angleToPlayer = atan2(dy, dx);
  }
  void randomizePosition() {
    float randomSide = random(0,2);
    int spawnSide = ceil(randomSide);
    switch(spawnSide){
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
