class Camera {
  float x, y;
  float tx, ty;
  float dx, dy;
  float distance;
  boolean isLockOn = true;
  Player target;
  Camera(Player p) {
    target = p;
    tx = target.x - width/2;
    ty = target.y - height/2;
    x = tx;
    y = ty;
  }
  void update() {
    if (!isLockOn) {
      tx = target.x - (width/2) / zoomAmount;
      ty = target.y - (height/2) / zoomAmount;
      dx = tx - x;
      dy = ty - y;
      distance = sqrt(dx*dx + dy*dy);
    }

    if (isLockOn) {
      tx = scenePlay.player.midPoint.x + target.x - (width/2) / zoomAmount;
      ty = scenePlay.player.midPoint.y + target.y - (height/2) / zoomAmount;
      dx = tx - x;
      dy = ty - y;
      distance = sqrt(dx*dx + dy*dy);
    }
    //MOVE CAMERA + EASING
    x += dx * 0.1;
    y += dy * 0.1;
  }
}
