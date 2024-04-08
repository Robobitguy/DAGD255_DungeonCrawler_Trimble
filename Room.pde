class Room {
  
  float x, y; // These variables are room dimensions
  final float w = 1000, h = 600; // These variables are room dimensions
  float gapSize = 200;
  float wallThickness = 15;
  
  boolean topWall, leftWall, rightWall, bottomWall;
  Door d1, d2, d3, d4;
  
  float platformWidth = w - w/2 - gapSize/2;
  float platformHeight = h - h/2 - gapSize/2;
  
  
  Room(float xPos, float yPos) {
    
    x = xPos;
    y = yPos;
    
    // TOP WALLS 
    Platform p1 = new Platform(x + platformWidth/2, y + wallThickness/2, platformWidth, wallThickness);
    platforms.add(p1);
    Platform p2 = new Platform(p1.x + gapSize/2 + p1.w, y + wallThickness/2, platformWidth, wallThickness);
    platforms.add(p2);
    d1 = new Door(x + w/2 - gapSize/4, y + wallThickness/2, wallThickness);
    doors.add(d1);
    
    // RIGHT WALLS
    Platform p3 = new Platform(p1.x + w/2 + p1.w/2, y + platformHeight/2, wallThickness, platformHeight);
    platforms.add(p3);
    Platform p4 = new Platform(p1.x + w/2 + p1.w/2, p3.y + p3.h + gapSize/2, wallThickness, platformHeight);
    platforms.add(p4);
    d2 = new Door(p1.x + w/2 + p1.w/2, y + h/2 - gapSize/4, wallThickness);
    doors.add(d2);
    
    //// BOTTOM WALLS
    //Platform p5 = new Platform(x, y, w - w/2 - gapSize/2, wallThickness);
    //platforms.add(p5);
    //Platform p6 = new Platform(x + gapSize/2 + p1.w, y, w - w/2 - gapSize/2,wallThickness);
    //platforms.add(p6);
    
    //// LEFT WALLS
    //Platform p7 = new Platform(x, y, w - w/2 - gapSize/2, wallThickness);
    //platforms.add(p7);
    //Platform p8 = new Platform(x + gapSize/2 + p1.w, y, w - w/2 - gapSize/2,wallThickness);
    //platforms.add(p8);
  }
  
  void update() {
    
    // COLLISION WITH TOP DOOR
    if(player.checkCollision(d1)) {
      if(!topWall) {
        topWall = true;
        Room r = new Room(x, y - h + platformHeight/2);
        rooms.add(r);
        r.bottomWall = true;
      }
    }
    
    // COLLISION WITH RIGHT DOOR
    if(player.checkCollision(d2)) {
      if(!rightWall) {
        rightWall = true;
        Room r = new Room(x + w - platformWidth/2, y);
        rooms.add(r);
        r.leftWall = true;
      }
    }
    
  }  
}
