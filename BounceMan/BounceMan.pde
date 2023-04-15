int gameScreen = 0;
StarrySky stars;
ArrayList<Platform> platforms;
Player player;
int p;
int platformTotal;

PImage bg0;
PImage bg1;
PImage bg2;

import processing.sound.*;
SoundFile background;

GuideScreen gs;
void setup(){
  background = new SoundFile(this, "music1.mp3");
  background.loop();
  size(500, 800);
  stars = new StarrySky(100);
  bg0 = loadImage("bg0.jpg");
  
  player = new Player (width/2, height * 0.80);
  
  platforms = new ArrayList<Platform>();
  for (int i = 1; i < 15; i++) {
    platforms.add(new Platform(random(40, width - 40), i * 50));
  }
  
  platformTotal = platforms.size() - 1;
  p = platformTotal;
  
  //guidescreen
  gs = new GuideScreen();
}

void draw(){
  
  if (gameScreen == 0) {
    initScreen();
  }
   
  if (gameScreen == 1) {
    gameScreen();
  }
  
  if (gameScreen == 2) {
    gameOverScreen();
  }
  
  if(gameScreen == 3){
    guideScreen();
  }
  
  
}

void initScreen() {

  stars.update(); 
  stars.display(); 
  //background(bg0);

  textSize(50);
  text("Bounce MAN", 10, 400);
  textSize(30);
  text("click to start", 10, 600);
  //if(mousePressed){
  //  gameScreen = 1;
  //}
  //guide
  text("guide", 10, 700);
  //if(mousePressed){
  //  gameScreen = 3;
  //}
  
}

void gameScreen() {
  
  stars.update(); // 更新星空
  stars.display(); // 显示星空
  
  player.display();
  player.move();
  player.update();
 
  while (player.y < height/2) {
      for (Platform platform : platforms) {
        platform.setV(player.v);
      }
    player.y = height/2;
  }
  
  for (Platform platform : platforms) {
    platform.display();
    platform.update();
    player.isContact(platform);
  }
  
  if (platforms.get(p).y > height) {
    platforms.set(p,(new Platform(random(40, width-40), 50)));
    p--;
    if (p < 0) {
      this.p = platformTotal;  
    }
  }
  
  if (player.y > height) {
    gameScreen = 2;
  }
  
}

void gameOverScreen() {
  
  background(0);
  textSize(100);
  text("GAME OVER", 10, 400);
  textSize(30);
  text("space: return to start screen", 10, 600);
  if(keyPressed){
    setup();
    gameScreen = 0;
 }
}
 
 void guideScreen() {
    gs.display();
 }
 
 void mouseMoved() {
  //check mouse on the back arrow
  if (mouseX > gs.backBtnX && mouseX < gs.backBtnX + gs.backWidth &&
      mouseY > gs.backBtnY && mouseY < gs.backBtnY + gs.backWidth) {
    println("mouse is on the back arrow");
    gs.backWidth = 60;
  }else{
    gs.backWidth = 50;
  }
 }
void mousePressed() {
  //star page
  if(gameScreen == 0){
    if(mouseY >570 && mouseY < 600){
      gameScreen = 1;
     // setup();
     gameScreen();
    }
    if(mouseY >670 && mouseY < 700){
      gameScreen = 3;
      //setup();
      guideScreen();
    }
  }
  //guide page
  // check press on the back arrow
  if(gameScreen == 3){
     if (mouseX > gs.backBtnX && mouseX < gs.backBtnX + gs.backWidth &&
        mouseY > gs.backBtnY && mouseY < gs.backBtnY + gs.backWidth){
      gameScreen = 0;
     // setup();  
     initScreen();
    }
  }
    
  }
