class Door extends AABB {
  Door(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    setSize(w, h);
  }
  void update() {
    super.update();
  }
  void draw() {
    //fill(255);
    //rect(x - halfW, y - halfH, w, h);
  }
}
