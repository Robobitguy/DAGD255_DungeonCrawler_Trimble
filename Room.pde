class Room {
  float x, y; //room dimensions
  final float w = 1500, h = 4000; //room dimensions
  float wallThickness = 50;
  boolean topDoor, bottomDoor;
  float platformWidth = w - w/2;
  float platformHeight = h - h/2;
  Door d1, d2;
  Room(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    //LEFT WALLS
    Platform p1 = new Platform(x, y, wallThickness, platformHeight);
    platforms.add(p1);
    //RIGHT WALLS
    Platform p2 = new Platform(p1.x + w, p1.y, wallThickness, platformHeight);
    platforms.add(p2);
    //TOP DOOR
    Door d1 = new Door(x, y - h/4, wa, 50);
    doors.add(d1);
    //BOTTOM DOOR
    Door d2 = new Door(x, y + h/4, w, 50);
    doors.add(d2);
  }
  void update() {
    
  }
}
