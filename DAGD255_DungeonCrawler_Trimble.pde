//UNTITLED TANK GAME
//copyright Aiden Trimble 2024
//MUSIC USED - Thousand March - Pizza Tower
//Sound effects belong to their respective owners
//TUTORIAL
//W - move forward
//S - move backwards
//A/D - turn left/right
//CURSOR - aim
//LEFT MOUSE - shoot
import processing.sound.*;
float dt = 0;
float prevTime = 0;
float zoomAmount = 1;
boolean leftPressed, pLeftPressed;
boolean rightPressed, pRightPressed;
int scene = 0;
float playerPositionX;
float playerPositionY;
SceneTitle sceneTitle;
ScenePlay scenePlay;
SceneGameOver sceneGameOver;
SoundFile gameOver;
SoundFile hitSound;
SoundFile yippee;
SoundFile BGM;
SoundFile hurt;

void setup() {
  size(1280, 720);
  gameOver = new SoundFile(this,"GameOverYeah.mp3");
  hitSound = new SoundFile(this,"Hitmarker.mp3");
  yippee = new SoundFile(this,"Yippee.mp3");
  BGM = new SoundFile(this,"ThousandMarch.mp3");
  hurt = new SoundFile(this,"Hurt.wav");
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
    playerPositionX = scenePlay.player.x;
    playerPositionY = scenePlay.player.y;
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
