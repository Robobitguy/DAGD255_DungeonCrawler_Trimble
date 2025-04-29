class SceneGameOver {
  SceneGameOver() {
    gameOver.rate(1.1);
    gameOver.amp(0.5);
    gameOver.play();    
  }
  void update() {
    if (Keyboard.onDown(Keyboard.SPACE)) {
      scene = 1;
    }
  }
  void draw() {
    background(255, 0, 0);
    background(255, 0, 0);
    textSize(20);
    fill(0);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2 - 50);
    textAlign(CENTER, CENTER);
    text("press the space bar to try again", width/2, height/2 + 50);
  }
}
