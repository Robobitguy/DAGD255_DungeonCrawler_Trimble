float dt = 0;
float prevTime = 0;
float zoomAmount = 1;
float shotCD;
boolean leftPressed, pLeftPressed;
boolean rightPressed, pRightPressed;
ArrayList<Platform> platforms = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();
ArrayList<Room> rooms = new ArrayList();
ArrayList<Door> doors = new ArrayList();
Player player;
Camera camera;

void setup() {
  size(1280, 720);
  player = new Player(width/2, height/2);
  camera = new Camera(player);
  Room r = new Room(-camera.x,-camera.y);
  rooms.add(r);
  /*for (int i = 0; i < 10; i++){
   Enemy e = new Enemy(random(width),random(height));
   enemies.add(e);
   }*/
}
void draw() {
  calcDeltaTime();
  background(128);
  scale(zoomAmount);  
  //PUSHMATRIX -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  pushMatrix();
  translate(-camera.x, -camera.y);
  //UPDATE OBJECTS
  camera.update();
  /*for(int i = 0; i < enemies.size(); i++){
   Enemy e = enemies.get(i);
   e.update();
   }*/
  for (int i = 0; i < platforms.size(); i++) {
    Platform p = platforms.get(i);
    p.update();
    if (p.checkCollision(player)) {
      player.applyFix(player.findOverlapFix(p));
    }
  }
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.update();
    if (b.isDead) bullets.remove(b);
  }
  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    r.update();
  }
  for (int i = 0; i < doors.size(); i++) {
    Door d = doors.get(i);
    d.update();
  }
  player.update();
  //NEXT FRAME PREP
  Keyboard.update();
  pLeftPressed = leftPressed;
  pRightPressed = rightPressed;
  shotCD -= dt;
  //DRAW OBJECTS
  /*for(int i = 0; i < enemies.size(); i++){
   Enemy e = enemies.get(i);
   e.draw();
   }*/
  for (int i = 0; i < platforms.size(); i++) {
    Platform p = platforms.get(i);
    p.draw();
  }
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.draw();
  }
  for (int i = 0; i < doors.size(); i++) {
    Door d = doors.get(i);
    d.draw();
  }
  player.draw();
  //POPMATRIX--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  popMatrix();
  //DRAW HUD
  println(doors.size());
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}
void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}
void mousePressed() {
  if (mouseButton == LEFT) leftPressed = true;
  if (mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if (mouseButton == LEFT) leftPressed = false;
  if (mouseButton == RIGHT) rightPressed = false;
}
