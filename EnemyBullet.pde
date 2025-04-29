class EnemyBullet extends AABB {
  float lifeTime = 4;
  float bulletSize;
  EnemyBullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    velocity = new PVector(600, 600);
    setSize(10, 10);
  }

  void update() {
    lifeTime -= dt;
    x += velocity.x * cos(angle) * dt;
    y += velocity.y * sin(angle) * dt;
    super.update();
  }
  void draw() {
    fill(255, 0, 255);
    ellipse(x-halfW, y-halfH, w, h);
  }
}
