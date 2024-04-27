//this program plays a dungeon crawler game
//copyright Aiden Trimble 2024
float dt = 0;
float prevTime = 0;
float zoomAmount = 1;
boolean leftPressed, pLeftPressed;
boolean rightPressed, pRightPressed;
int scene = 0;
SceneTitle sceneTitle;
ScenePlay scenePlay;
SceneGameOver sceneGameOver;

void setup() {
  size(1280, 720);
}
void draw() {
  calcDeltaTime();
  switch(scene) {
  case 0: //TITLE
    if (sceneTitle == null) sceneTitle = new SceneTitle();
    scenePlay = null;
    sceneGameOver = null;
    sceneTitle.update();
    if (sceneTitle != null)sceneTitle.draw();
    break;
  case 1: //PLAY
    if (scenePlay == null) scenePlay = new ScenePlay();
    sceneTitle = null;
    sceneGameOver = null;
    scenePlay.update();
    if (scenePlay != null)scenePlay.draw();
    break;
  case 2: //GAME OVER
    if (sceneGameOver == null) sceneGameOver = new SceneGameOver();
    sceneTitle = null;
    scenePlay = null;
    sceneGameOver.update();
    if (sceneGameOver != null)sceneGameOver.draw();
    break;
  }
}
//DELTA TIME
void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}
//CONTROL INPUT
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
