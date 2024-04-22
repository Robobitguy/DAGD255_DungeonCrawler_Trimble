class Room {
  int roomType;
  float roomRandomize = 1;
  float x, y; //room dimensions
  final float w = 1500, h = 4000; //room dimensions
  float wallThickness = 50;
  boolean topDoor, bottomDoor;
  float platformWidth = w - w/2;
  float platformHeight = h - h/2;
  Door d1, d2, d11, d22;
  Room(float xPos, float yPos) {
    roomType = ceil(roomRandomize);
    x = xPos;
    y = yPos;
      //LEFT WALLS
      Platform p1 = new Platform(x, y, wallThickness, platformHeight);
      scenePlay.platforms.add(p1);
      //RIGHT WALLS
      Platform p2 = new Platform(p1.x + w, p1.y, wallThickness, platformHeight);
      scenePlay.platforms.add(p2);
      //TOP DOOR
      Door d1 = new Door(x + w/2, y - h/4 + 50, w, 50);
      d11 = d1;
      scenePlay.doors.add(d1);
      //BOTTOM DOOR
      Door d2 = new Door(x + w/2, y + h/4 - 50, w, 50);
      d22 = d2;
      scenePlay.doors.add(d2);
      //OBSTACLES
      switch(roomType){
        case 1:
        
        break;
        case 2:
        
        break;
        case 3:
        
        break;
      }
    
  }
  void update() {

    //if(d11 != null) println(d11);

    if (scenePlay.player != null) {
      if (d11 != null) {
        if (scenePlay.player.checkCollision(d11)) {
          if (!topDoor) {
            topDoor = true;
            roomRandomize = random(0, 3);
            Room r = new Room(x, y - h + platformHeight);
            scenePlay.rooms.add(r);
            r.bottomDoor = true;
          }
        }
      }
      if (d22 != null) {
        if (scenePlay.player.checkCollision(d22)) {
          if (!bottomDoor) {
            bottomDoor = true;
            roomRandomize = random(0, 3);
            Room r = new Room(x, y + h - platformHeight);
            scenePlay.rooms.add(r);
            r.topDoor = true;
          }
        }
      }
    }// player != null
  }
}
