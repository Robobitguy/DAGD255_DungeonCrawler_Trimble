class ScenePlay {
  ArrayList<Platform> platforms = new ArrayList();
  ArrayList<Bullet> bullets = new ArrayList();
  ArrayList<Room> rooms = new ArrayList();
  ArrayList<Door> doors = new ArrayList();
  Player player;
  Camera camera;
  ScenePlay() {
    player = new Player(width/2, height/2);
    camera = new Camera(player);
    if (scenePlay != null) {
      Room r = new Room(-camera.x, -camera.y);
      rooms.add(r);
    }
  }
  void update() {
    background(128);
    scale(zoomAmount);
    //PUSHMATRIX -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    pushMatrix();

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
    popMatrix();
  }
  void draw() {
    pushMatrix();
    translate(-camera.x, -camera.y);
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
  }
}
