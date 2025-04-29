class Platform extends AABB {
 
  Platform() {
    x = random(-1000, 1000);
    y = random(-1000, 1000);
    w = random(50, 350);
    h = random(50, 350);
    setSize(w, h);
  }
  
  Platform(float x, float y, float w, float h) {
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
    fill(77,44,0);
    rect(x-halfW, y-halfH, w, h);
  }
  
}
