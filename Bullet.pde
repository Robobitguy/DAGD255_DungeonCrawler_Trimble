class Bullet extends AABB {
  float lifeTime = 4;
  int hitNumber = 0;
  float bulletSize;
  float pr, pg, pb;
  Bullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    bulletSize +=(scenePlay.player.playerDamage * 2);
    velocity = new PVector(800, 800);
    setSize(10, 10);
  }

  void update() {
    lifeTime -= dt;
    x += velocity.x * cos(angle) * dt;
    y += velocity.y * sin(angle) * dt;
    //PARTICLES
    Particle p = new Particle(x,y);
    float gray = random (55,170);
    p.r = pr = gray;
    p.g = pg = gray;
    p.b = pb = gray;
    p.angle = PI + radians(random(-30, 30));
    if (scenePlay != null) scenePlay.particles.add(p);
    if (lifeTime <= 0) isDead = true;
    if (hitNumber >= scenePlay.player.pierce) isDead = true;
    super.update();
  }
  void draw() {
    fill(255, 255, 0);
    ellipse(x-halfW, y-halfH, w, h);
  }
}
