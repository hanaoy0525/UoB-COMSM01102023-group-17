int gameScreen = 0;

ArrayList<Platform> platforms;
Player player;
int p;
int platformTotal;

PImage bg0;
PImage bg1;
PImage bg2;

void setup(){
  size(500, 800);
  
  bg0 = loadImage("bg0.jpg");
  
  player = new Player (width/2, height * 0.80);
  
  platforms = new ArrayList<Platform>();
  for (int i = 1; i < 15; i++) {
    platforms.add(new Platform(random(40, width - 40), i * 50));
  }
  
  platformTotal = platforms.size() - 1;
  p = platformTotal;
  
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
  
}

void initScreen() {
  
  background(bg0);

  textSize(50);
  text("Bounce MAN", 10, 400);
  textSize(30);
  text("click to start", 10, 600);
  if(mousePressed){
    gameScreen = 1;
  }
  
}

void gameScreen() {
  
  background(0);
  
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
    platforms.set(p,(new Platform(random(40, width-40), height/platformTotal)));
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
