class Camera {

  float x, y;
  float tx, ty;
  float dx, dy;
  float distance;
  Player target;
  Camera(Player p) {
    target = p;
    tx = target.x - width/2;
    ty = target.y - height/2;
    x = tx;
    y = ty;
  }
  void update() {
    //GET PLAYER POSITION + OFFSET
    tx = target.x - width/2;
    ty = target.y - height /2;
    //CALC DISTANCE BETWEEN PLAYER AND OFFSET
    dx = tx - x;
    dy = ty - y;
    //MOVE CAMERA + EASING
    x += dx * 0.1;
    y += dy * 0.1;
  }
}
