class HUD {
  float healthBarMax;
  float experienceBarMax;
  HUD(){
    
  }
  void update(){
    healthBarMax = scenePlay.player.maxHealth * (scenePlay.player.currentHealth/scenePlay.player.maxHealth);
    experienceBarMax = 1230 * (scenePlay.player.currentXP/scenePlay.player.neededXP);
  }
  void draw(){
    textAlign(CENTER,CENTER);   
    //HEALTHBAR
    fill(100);
    rect(25,75,20 + scenePlay.player.maxHealth,70);   
    fill(255,0,0);
    rect(35,85,healthBarMax,50);
    noFill();
    rect(35,85,scenePlay.player.maxHealth,50);
    fill(0);
    text(scenePlay.player.currentHealth + "/" + scenePlay.player.maxHealth,85,110);
    //EXPERIENCE BAR
    noFill();
    rect(25,25,1230, 30);
    fill(0,255,0);
    rect(25,25,experienceBarMax, 30);
    //PLAYER INFO
     
  }
}
