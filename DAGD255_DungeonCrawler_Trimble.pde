float dt = 0;
float prevTime = 0;
ArrayList<Wall> walls = new ArrayList();
Player player;
Camera camera;

void setup(){
  size(1280,720);
  player = new Player(width/2,height/2);
  camera = new Camera(player);
  for (int i = 0; i < 10; i++){
    Wall w = new Wall(random(width),random(height));
    walls.add(w);
  }
  /*for (int i = 0; i < 10; i++){
    Enemy e = new Enemy(random(width),random(height));
    enemies.add(e);
  }*/
}
void draw(){
  calcDeltaTime();
  background(128);
  //PUSHMATRIX
  pushMatrix();
  translate(-camera.x,-camera.y);
  //SPAWN OBJECTS
  //UPDATE OBJECTS
  camera.update();
  /*for(int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    e.update();
  }*/
  for(int i = 0; i < walls.size(); i++){
    Wall w = walls.get(i);
    w.update();
    if(w.checkCollision(player)){
      player.applyFix(player.findOverlapFix(w));
    }
  }
  player.update();
  //NEXT FRAME PREP
  Keyboard.update();
  //DRAW OBJECTS
  /*for(int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    e.draw();
  }*/
  for(int i = 0; i < walls.size(); i++){
    Wall w = walls.get(i);
    w.draw();
  }
  player.draw();
  //POPMATRIX
  popMatrix();
  //DRAW HUD
}

void calcDeltaTime(){
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}

void keyPressed(){
  Keyboard.handleKeyDown(keyCode);
}
void keyReleased(){
  Keyboard.handleKeyUp(keyCode);
}
