SoundFile background;
import java.util.Random;

Screen currentScreen = Screen.Init;
StarrySky stars;
ArrayList<Platform> platforms;
Player player;

PImage background0;
PImage background1;
PImage background2;
PImage gameOver;
PImage gameTitle;
PImage start;
PImage guide;
PImage difficulty;
PImage arrow;
PImage easy;
PImage medium;
PImage hard;

PFont font;

int changeCur;
int changeScale;
int score;
boolean isStart = false;

GuideScreen guideScreen;

Lava lava;

RankTable rankTable;
String userName;

//by default the game difficulty is medium
Difficulty gameDiff=Difficulty.MEDIUM;

void setup(){
  frameRate(60);
  font = createFont("Frogie.ttf", 32);
  textFont(font);
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
  guideScreen = new GuideScreen();
  
  //score displayed on the right-top of the screen
  score=0;
  
  //lava that would chase the player
  lava=new Lava();
  if(gameDiff!=Difficulty.HARD){
    lava.noExist();
  }
  
  rankTable = new RankTable();
  userName = "";
  
}

void draw(){
  background(255);
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
  if(currentScreen == Screen.Difficulty){
    difficultyScreen();
  }
  if (currentScreen == Screen.Rank) {
    rankScreen();  
  }
}

void rankScreen() {
  stars.update();
  stars.display();
  
  rankTable.display();
  if (keyPressed && key == ' '){
    currentScreen = Screen.Init;
  }
}

void initScreen() {
  stars.update(); 
  stars.display(); 
  gameTitle = loadImage("gameTitle.png");
  gameTitle.resize(gameTitle.width, gameTitle.height);
  start = loadImage("start.png");
  start.resize(start.width/2, start.height/2);
  guide = loadImage("guide.png");
  guide.resize(guide.width/2, guide.height/2);
  difficulty = loadImage("difficulty.png");
  difficulty.resize(difficulty.width/2, difficulty.height/2);

  imageMode(CENTER);
  image(gameTitle, 250,200);
  image(start, 250, 400);
  image(guide, 250, 500);
  image(difficulty, 250, 600);
  text("rank", 200, 700);

  text("Enter your name: ", width / 4 - 100, height / 3 + 80);
  text(userName, width / 4 + 175, height / 3 + 80);
  
      
}

void gameScreen() {

  // update and display background
  stars.update(); 
  stars.display(); 

  
  textSize(40);
  text("SCORE: " + score, 300, 50);

  player.display();
  player.move();
  player.update();
 
  while (player.yCoordinate < height / 2) {
    for (Platform platform : platforms) {
      platform.setV(player.velocity);
    }
    if(lava.isExist==true){
      lava.descend();
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
    if(lava.isExist==true){
      lava.display();
      lava.ascend();
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
  
  if (player.yCoordinate > height || (lava.isExist && player.yCoordinate > height - lava.lavaHeight)) {
    rankTable.addEntity(userName, score);
    userName = "";
    //lavaHeight = 0;
    currentScreen = Screen.Over;
  }
}

void gameOverScreen() {
  
  background(0);
  textSize(95);
  //text("GAME OVER", 10, 200);
  gameOver = loadImage("GameOver.png");
  gameOver.resize(gameOver.width/2, gameOver.height/2);
  imageMode(CENTER);
  image(gameOver, 250,200);
  textSize(70);
  text("SCORE: "+score, 120, 430);
  
  textSize(50);
  text("RETRY: R", 120, 550);
  text("MENU: SPACE", 120, 650);
  
    if((keyPressed && (key == 'r' || key=='R')) || (mousePressed && (mouseX >= 123 && mouseX <= 302) && (mouseY >= 513 && mouseY <= 556))){
      setup();
      currentScreen=Screen.Play;
      gameScreen();
    }
    if((keyPressed && key == ' ') || (mousePressed && (mouseX >= 123 && mouseX <= 394) && (mouseY >= 617 && mouseY <= 653))){
      setup();
      currentScreen = Screen.Init;
      initScreen(); 
    }
 
}
 
void guideScreen() { 
    guideScreen.display();
}

void difficultyScreen() {
  stars.update(); 
  stars.display(); 
  arrow = loadImage("back_arrow.png");
  arrow.resize(50,50);
  image(arrow, 30, 700);
  easy = loadImage("easy.png");
  easy.resize(easy.width/2, easy.height/2);
  medium = loadImage("medium.png");
  medium.resize(medium.width/2, medium.height/2);
  hard = loadImage("hard.png");
  hard.resize(hard.width/2, hard.height/2);
  
  imageMode(CENTER);
  image(easy, 250, 200);
  image(medium, 250, 400);
  image(hard, 250, 600);
  

}
void mouseClicked() {
  if(currentScreen == Screen.Init){
    if(mouseX > 100 && mouseX < 413 &&
      mouseY > 380 && mouseY < 450){
      setup();
      currentScreen = Screen.Play;
      return;
    }
    
    if(mouseX >= 200 && mouseX <= 300 && mouseY >= 480 && mouseY <= 515){
      currentScreen = Screen.Guide;
      return;
    }
    
    if(mouseX >= 150 && mouseX <= 375 && mouseY >= 550 && mouseY <= 655){
      currentScreen = Screen.Difficulty;
      return;
    }
    
    if (mouseX >= 200 && mouseX <= 270 && mouseY >= 678 && mouseY <= 700) {
      currentScreen = Screen.Rank; 
    }
    
  } else if(currentScreen == Screen.Guide){
     if (mouseX >guideScreen.backButtonX && mouseX < guideScreen.backButtonX + guideScreen.buttonWidth &&
        mouseY > guideScreen.backButtonY && mouseY < guideScreen.backButtonY + guideScreen.buttonWidth){
      currentScreen = Screen.Init;
      return;
      } 
    }
    else if(currentScreen == Screen.Difficulty) {
      if(mouseX >= 0 && mouseX <= 80 && mouseY >= 680 && mouseY <= 750){
        currentScreen = Screen.Init;
        return;
      }
      else if(mouseX >= 196 && mouseX <= 304 && mouseY >= 173 && mouseY <= 228){
        gameDiff=Difficulty.EASY;
        currentScreen = Screen.Init;
        return;
      }
      else if(mouseX >= 196 && mouseX <= 304 && mouseY >= 373 && mouseY <= 428){
        gameDiff=Difficulty.MEDIUM;
        currentScreen = Screen.Init;
        return;
      }
      else if(mouseX >= 196 && mouseX <= 304 && mouseY >= 573 && mouseY <= 628){
        gameDiff=Difficulty.HARD;
        currentScreen = Screen.Init;
        return;
      }
  }
}

void keyPressed() {
   if (currentScreen == Screen.Init){
     if (key == BACKSPACE){
       userName = userName.substring(0, userName.length() - 1); 
     } else {
       userName += key;
     }
     
   }
}

Platform generatePlatform(int heightIndex, int offset){
    Random rand = new Random();
    int randomNum = rand.nextInt(100);
    
    if (randomNum < 35){
      return new Platform(random(40, width - 40), heightIndex * 75 + offset);
    }
    else if (randomNum < 55){
      return new FragilePlatform(random(40, width - 40), heightIndex * 75 + offset);
    }
    else if (randomNum < 75){
      return new FloatPlatform(random(50, width - 50), heightIndex * 75 + offset);
    }
    else{
      // if the game level is medium or hard, there are enemies generated.
      if(gameDiff==Difficulty.EASY){
        return new Platform(random(40, width - 40), heightIndex * 75 + offset);
      }
      else{
        return new EnemyPlatform(random(50, width - 50), heightIndex * 75 + offset);
      }
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
