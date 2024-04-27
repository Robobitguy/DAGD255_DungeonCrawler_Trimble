class Bullet extends AABB {
  float lifeTime = 4;
  int hitNumber = 0;
  float bulletSize;
  

  Bullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    bulletSize += scenePlay.player.playerDamage;
    velocity = new PVector(800, 800);
    setSize(10, 10);
  }

  void update() {
    lifeTime -= dt;
    x += velocity.x * cos(angle) * dt;
    y += velocity.y * sin(angle) * dt;
    if (lifeTime <= 0) isDead = true;
    if (hitNumber >= scenePlay.player.pierce) isDead = true;
    super.update();
  }
  void draw() {
    fill(255, 0, 0);
    ellipse(x-halfW, y-halfH, w, h);
  }
}
