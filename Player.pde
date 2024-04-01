class Player extends AABB{
  int level = 1;
  float playerAngle = 0;
  Player(float xPos, float yPos){
    x = xPos;
    y = yPos;
    setSize(100,75);
  }
  void update(){
    calcAngleToMouse();
    if(Keyboard.isDown(Keyboard.LEFT)){
      playerAngle -= 2 * dt;
    }
    if(Keyboard.isDown(Keyboard.RIGHT)){
      playerAngle += 2 * dt;
    }
    if(Keyboard.isDown(Keyboard.UP)){
      velocity.x = 300;     
      velocity.y = 300;
    }
    if(Keyboard.isDown(Keyboard.DOWN)){
      velocity.x = -300;
      velocity.y = -300;
    }
    x += velocity.x * cos(playerAngle) * dt;
    y += velocity.y * sin(playerAngle) * dt;
    velocity.x *= 0.95;
    velocity.y *= 0.95;
    super.update();
  }
  void draw(){
    fill(#FF2483);
    pushMatrix();
    translate(x,y);
    rotate(playerAngle);
    rect(-halfW,-halfH,w,h);
    popMatrix();
    pushMatrix();
    translate(x,y);
    rotate(angle);
    rect(-halfW/2,-halfH/1.5,w/2,h/1.5);
    popMatrix();
  }
}
