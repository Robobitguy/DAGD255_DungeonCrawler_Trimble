class Enemy extends AABB {
  float enemySize;
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    setSize (enemySize,enemySize);
  }
  void update() {
    super.update();
  }
  void draw() {
    fill (255, 0, 0);
    rect(x - halfW, y - halfH, w, h);
  }
}
