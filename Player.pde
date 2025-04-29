class Player extends AABB {
  float playerDamage = 3;
  float playerAngle = 0;
  float maxHealth = 100;
  int pierce =1;
  float currentHealth = maxHealth;
  float currentXP = 0;
  float neededXP = 5;
  float textTimer = 0;
  int buffType;
  PVector midPoint = new PVector();
  Player(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    setSize(100, 75);
  }
  void update() {
    textTimer -= dt;
    calcAngleToMouse();
    if (Keyboard.isDown(Keyboard.LEFT)) {
      playerAngle -= 2 * dt;
    }
    if (leftPressed && scenePlay.shotCD <= 0) {
      Bullet b = new Bullet(x, y, angle);
      scenePlay.bullets.add(b);
      scenePlay.shotCD = 1;
    }
    if (Keyboard.isDown(Keyboard.RIGHT)) {
      playerAngle += 2 * dt;
    }
    if (Keyboard.isDown(Keyboard.UP)) {
      velocity.x = 300;
      velocity.y = 300;
    }
    if (Keyboard.isDown(Keyboard.DOWN)) {
      velocity.x = -300;
      velocity.y = -300;
    }
    x += velocity.x * cos(playerAngle) * dt;
    y += velocity.y * sin(playerAngle) * dt;
    velocity.x *= 0.95;
    velocity.y *= 0.95;
    if (currentXP >= neededXP) {
      levelUp();
    }
    if (currentHealth <= 0) {
      isDead = true;
    }
    super.update();
  }
  void draw() {
    fill(0, 255, 0);
    pushMatrix();
    translate(x, y);
    rotate(playerAngle);
    rect(-halfW, -halfH, w, h);
    popMatrix();
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(-halfW/2, -halfH/1.5, w/2, h/1.5);
    popMatrix();
    fill(255);
    textAlign(CENTER, CENTER);
    if (textTimer > 0) {
      switch(buffType) {
      case 1:
        text("HEALTH UP!", x, y - 75);
        break;
      case 2:
        text("DAMAGE UP!", x, y - 75);
        break;
      case 3:
        text("PIERCE UP!", x, y - 75);
        break;
      }
    }
  }
  void takeDamage() {
    currentHealth -= floor(scenePlay.Level * 1.5);
    hurt.play();
    scenePlay.IFrames = 0.5;
  }
  void levelUp() {
    scenePlay.Level++;
    yippee.rate(1.1);
    yippee.amp(0.5);
    yippee.play();
    float randomBuff = random(0, 3);
    buffType = ceil(randomBuff);
    textTimer = 5;
    switch(buffType) {
    case 1: //HEALTH UP
      maxHealth += 10;
      break;
    case 2: //DAMAGE UP
      playerDamage += 1;
      break;
    case 3: //PIERCE UP
      pierce++;
      break;
    }
    currentHealth = maxHealth;
    currentXP = 0;
    neededXP += 5;
  }
}
