//SoundFile background;
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

GuideScreen gs;

void setup(){
  //background = new SoundFile(this, "music1.mp3");
  //background.loop();
  
  //width = 500, height = 800;
  size(500, 800); 
  stars = new StarrySky(100);
  
  player = new Player (width / 2, height * 0.80);
  
  platforms = new ArrayList<Platform>();

  //generating platform initially
  for (int i = 0; i < 12; i++) {
    platforms.add(generatePlatform(i));
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

  textSize(50);
  text("Bounce MAN", 10, 400);
  textSize(30);
  text("click to start", 10, 600);
  text("guide", 10, 700);
}

void gameScreen() {

  // update and display background
  stars.update(); 
  stars.display(); 
  
  text("score: " + score, 380, 20);
  player.display();
  player.move();
  player.update();
 
  while (player.yCoordinate < height / 2) {
      for (Platform platform : platforms) {
        platform.setV(player.velocity);
      }
    player.yCoordinate = height / 2;
  }
  
  int deletedPlatformIndex = -1;
  for (int i = 0; i < platforms.size(); i++) {
    Platform platform = platforms.get(i);
    platform.display();
    platform.update();
    
    boolean hasContacted = player.isContact(platform);
    if (hasContacted == true) {
      if(platform.hasContactedBefore() == false){
        platform.setContacted();
        score++;
      }
      if (platform.platformType == PlatformType.FRAGILE_TYPE) {
        deletedPlatformIndex = i;
      }
    }
  }
  
  if (deletedPlatformIndex != -1) {
    platforms.remove(deletedPlatformIndex);
    platforms.add(0, generatePlatform(0));
  }
  
  //generate new platform at the top of the screen
  for(int i = 0; i < platforms.size(); i++){
    if (platforms.get(i).yCoordinate > height) {
      platforms.set(i,generatePlatform(0));
    }
  }
  floatPlatformMove();
  
  if (player.yCoordinate > height) {
    setup();
    currentScreen = Screen.Over;
  }
}

void gameOverScreen() {
  
  background(0);
  textSize(100);
  text("GAME OVER", 10, 400);
  textSize(30);
  text("Press any key to return", 10, 600);
  if(keyPressed){
    currentScreen = Screen.Init;
    initScreen();
    
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

Platform generatePlatform(int heightIndex){
    Random rand = new Random();
    int randomNum = rand.nextInt(100);
    
    if (randomNum < 80){
      return new Platform(random(40, width - 40), heightIndex * 60);
    }
    else if (randomNum < 90){
      return new FragilePlatform(random(40, width - 40), heightIndex * 60);
    }
    else{
      return new FloatPlatform(random(50, width - 50), heightIndex * 60);
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
