class Enemy extends AABB {
  float angleToPlayer;
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    setSize (50,50);
  }
  void update() {
    super.update();
  }
  void draw() {
    fill (255, 0, 0);
    rect(x - halfW, y - halfH, w, h);
  }
  void calcAngleToPlayer(){
    float dx = scenePlay.player.x -x;
    float dy = scenePlay.player.y - y;
    angleToPlayer = atan2(dy, dx);
  }
}
