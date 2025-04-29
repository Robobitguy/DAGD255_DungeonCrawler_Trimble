class Particle { 
  PVector position;
  PVector velocity;
  PVector acceleration;  
  color particleColor;  
  float angle;
  float rotateAngle;
  float rotateSpeed;
  float lifeTime;
  float size;  
  float r, g, b;
  float alpha;
  float friction = 1;  
  boolean isDead = false;  
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-150, 150), -300);    
    angle = radians(random(220, 320));
    rotateAngle = radians(random(359));
    lifeTime = random(0.5, 1.5);
    alpha = random(128, 255);
    r = random(100, 250);
    g = random(100);
    b = 0;
    rotateSpeed = radians(random(-90, 90));
    size = random(8, 16);
  }  
  void update() {    
    lifeTime -= dt;
    if(lifeTime <= 0) isDead = true;    
    alpha -= 128 * dt;    
    rotateAngle += rotateSpeed * dt;    
    velocity.x *= friction;
    velocity.y *= friction;    
    position.x += velocity.x * cos(angle) * dt;
    position.y += velocity.y * sin(angle) * dt;    
    if(alpha <= 0) isDead = true;
  }  
  void draw() {
    noStroke();
    fill(r, g, b, alpha);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotateAngle);
    ellipse(-size/2, -size/2, size, size);
    popMatrix();
    stroke(0);
  }
 
}
