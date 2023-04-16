int gameScreen = 0;
StarrySky stars;
ArrayList<Platform> platforms;
Player player;

PImage bg0;
PImage bg1;
PImage bg2;

int changeCur;
int changeScale;

int score;

//import processing.sound.*;
//SoundFile background;
import java.util.Random;

GuideScreen gs;
void setup(){
  //background = new SoundFile(this, "music1.mp3");
  //background.loop();
  size(500, 800);
  stars = new StarrySky(100);
  
  player = new Player (width/2, height * 0.80);
  
  platforms = new ArrayList<Platform>();

  //generating platform initially
  for (int i = 1; i < 15; i++) {
    platforms.add(generatePlatform(i));
  }
  
  changeCur=0;
  changeScale=50;
  
  //guidescreen
  gs = new GuideScreen();
  
  score=0;
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
  if(mousePressed){
    gameScreen = 1;
  }
  //guide
  text("guide", 10, 700);
  if(mousePressed){
    gameScreen = 3;
  }
  
}

void gameScreen() {
  
  stars.update(); // 更新星空
  stars.display(); // 显示星空
  
  text("score: "+score, 380, 20);
  player.display();
  player.move();
  player.update();
 
  while (player.y < height/2) {
      for (Platform platform : platforms) {
        platform.setV(player.v);
      }
    player.y = height/2;
  }
  int deletedPlatformIndex=-1;
  for (int i=0;i < platforms.size();i++) {
    Platform platform=platforms.get(i);
    platform.display();
    platform.update();
    boolean hasContacted=player.isContact(platform);
    if(hasContacted==true){
      if(platform.hasContactedBefore()==false){
        platform.setContacted();
        score++;
      }
      if(platform.platformType==PlatformType.FRAGILE_TYPE){
        deletedPlatformIndex=i;
      }
    }
  }
  if(deletedPlatformIndex!=-1){
    platforms.remove(deletedPlatformIndex);
    deletedPlatformIndex=-1;
    platforms.add(generatePlatform(0));
  }
  
  //generate new platform at the top of the screen
  for(int i=0; i<platforms.size();i++){
    if (platforms.get(i).y > height) {
      platforms.set(i,generatePlatform(0));
    }
  }
  floatPlatformMove();
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
    initScreen();
    gameScreen = 0;
 }
}
 
 void guideScreen() {
   /*
     todo: there is some problem with switching back to init page from guidepage
   */
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
    
  //start page
  if(gameScreen == 0){
    if(mouseY >570 && mouseY < 600){
      gameScreen = 1;
      setup();
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
      //setup();  
     initScreen();
    }
  }
    
}
Platform generatePlatform(int heightIndex){
    Random rand = new Random();
    int randomNum = rand.nextInt(100);
    
    if(randomNum < 80){
      return new Platform(random(40, width - 40), heightIndex * 50);
    }
    else if(80 <= randomNum && randomNum < 90){
      return new FragilePlatform(random(40, width - 40), heightIndex * 50);
    }
    else{
      return new FloatPlatform(random(40, width - 40), heightIndex * 50);
    }
}

void floatPlatformMove() {
  for(Platform platform: platforms){
    if(platform.platformType==PlatformType.FLOAT_TYPE){
      FloatPlatform f=(FloatPlatform)platform;
      //platform.floatMove();
      f.floatMove();
    }
  }
    changeCur++;
    if (changeCur == changeScale){
        changeDirection();
        changeCur = 0;
    }
}

void changeDirection(){
  for(Platform platform: platforms){
    if(platform.platformType==PlatformType.FLOAT_TYPE){
      FloatPlatform f=(FloatPlatform)platform;
      //platform.changeDir();
      f.changeDir();
    }
  }

}
