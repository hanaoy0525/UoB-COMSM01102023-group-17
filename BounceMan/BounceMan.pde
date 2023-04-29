SoundFile background;
import java.util.Random;

Screen currentScreen = Screen.Init;
StarrySky stars;
ArrayList<Platform> platforms;
Player player;

PImage bg0;
PImage bg1;
PImage bg2;

int changeCur;
int changeScale;
int score;
boolean isStart = false;

GuideScreen gs;

void setup(){
  if(!isStart){
      background = new SoundFile(this, "music1.mp3");
      background.loop();
      isStart = true;
  }
  
  //width = 500, height = 800;
  size(500, 800); 
  
  stars = new StarrySky(100);
  
  player = new Player (width / 2, height * 0.80);
  
  platforms = new ArrayList<Platform>();

  //generating platform initially
  for (int i = 0; i < 10; i++) {
    platforms.add(generatePlatform(i, 0));
  }
  
  changeCur=0;
  changeScale=50;
  
  //guidescreen
  gs = new GuideScreen();
  
  score=0;
}

void draw(){
  if (currentScreen == Screen.Init) {
    initScreen();
  }
   
  if (currentScreen == Screen.Play) {
    gameScreen();
  }
  
  if (currentScreen == Screen.Over) {
    gameOverScreen();
  }
  
  if(currentScreen == Screen.Guide){
    guideScreen();
  } 
}

void initScreen() {
  stars.update(); 
  stars.display(); 

  textSize(90);
  text("Bounce MAN", 10, 400);
  textSize(30);
  text("click to start", 10, 600);
  text("guide", 10, 700);
}

void gameScreen() {

  // update and display background
  stars.update(); 
  stars.display(); 
  
  text("score: " + score, 360, 25);
  player.display();
  player.move();
  player.update();
 
  while (player.yCoordinate < height / 2) {
      for (Platform platform : platforms) {
        platform.setV(player.velocity);
      }
    player.yCoordinate = height / 2;
  }
  
  for (Platform platform: platforms) {
    platform.display();
    platform.update();
    
    if(player.hasContactEnemy(platform)){
      currentScreen = Screen.Over;
      break;
    }
    boolean hasContacted = player.isContact(platform);
    if (hasContacted == true) {
      if(platform.hasContactedBefore() == false){
        platform.setContacted();
        score++;
      }
      if (platform.platformType == PlatformType.FRAGILE_TYPE) {
        FragilePlatform fragilePlatform=(FragilePlatform)platform;
        fragilePlatform.vanish();
      }
    }
  }
  
  //generate new platform at the top of the screen
  for(int i=platforms.size()-1; 0<=i ; i--){
    if (platforms.get(i).yCoordinate > height) {
      int offset=(int)platforms.get(i).yCoordinate-height;
      platforms.set(i,generatePlatform(0, offset));
    }
  }
  floatPlatformMove();
  
  if (player.yCoordinate > height) {
    currentScreen = Screen.Over;
  }
}

void gameOverScreen() {
  
  background(0);
  textSize(95);
  text("GAME OVER", 10, 200);
  textSize(60);
  text("SCORE: "+score, 120, 350);
  
  textSize(50);
  text("RETRY: R", 10, 550);
  text("MENU: SPACE", 10, 650);
  if(keyPressed){
    if(key == 'r' || key=='R'){
      setup();
      currentScreen=Screen.Play;
      gameScreen();
    }
    if(key == ' '){
      setup();
      currentScreen = Screen.Init;
      initScreen(); 
    }
 }
}
 
void guideScreen() { 
    gs.display();
}
 
void mouseClicked() {
  if(currentScreen == Screen.Init){
    if(mouseY > 570 && mouseY < 600 && mouseX >= 0 && mouseX <= 180){
      currentScreen = Screen.Play;
      return;
    }
    if(mouseY > 670 && mouseY < 700 && mouseX >= 0 && mouseX <= 100){
      currentScreen = Screen.Guide;
      return;
    }
  } else if(currentScreen == Screen.Guide){
     if (mouseX > gs.backButtonX && mouseX < gs.backButtonX + gs.buttonWidth &&
        mouseY > gs.backButtonY && mouseY < gs.backButtonY + gs.buttonWidth){
      currentScreen = Screen.Init;
      return;
    }
  }
}

Platform generatePlatform(int heightIndex, int offset){
    Random rand = new Random();
    int randomNum = rand.nextInt(100);
    
    if (randomNum < 60){
      return new Platform(random(40, width - 40), heightIndex * 75 + offset);
    }
    else if (randomNum < 70){
      return new FragilePlatform(random(40, width - 40), heightIndex * 75 + offset);
    }
    else if (randomNum < 80){
      return new FloatPlatform(random(50, width - 50), heightIndex * 75 + offset);
    }
    else{
      return new EnemyPlatform(random(50, width - 50), heightIndex * 75 + offset);
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
