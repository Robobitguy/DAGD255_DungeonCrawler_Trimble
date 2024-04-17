class SceneTitle {
  SceneTitle() {
  }
  void update() {
    if (Keyboard.onDown(Keyboard.SPACE)) {
      scene = 1;
    }
  }
  void draw() {
    background(0);
    fill(255);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("PLACEHOLDER NAME", width/2, height/2 - 30);
    textSize(20);
    text("press SPACE to play", width/2, height/2);
  }
}
