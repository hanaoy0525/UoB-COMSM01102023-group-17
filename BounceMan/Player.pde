import processing.sound.*;
SoundFile bounce;

class Player {
  float xCoordinate; // x - coordinate
  float yCoordinate; // y - coordinate
  float velocity; // velocity
  
  PImage man;
  
  Player (float x, float y){
    this.xCoordinate = x;
    this.yCoordinate = y;
    this.velocity = -15;
    man = loadImage("setting_background_char.png");
  }
  
  void display(){
    imageMode(CORNER);
    man.resize(60,50);
    image(man, xCoordinate - 25, yCoordinate - 25);
  }
  
  void move(){
    if(keyPressed && (keyCode == RIGHT)){
      xCoordinate += 10;
    }
    if(keyPressed && (keyCode == LEFT)){
      xCoordinate -= 10;
    }
    if(xCoordinate > 500){
      xCoordinate = 0;
    }
    if(xCoordinate < 0){
      xCoordinate = 500;
    }
  }
  
  void bounce(){
    bounce = new SoundFile(BounceMan.this, "bounce.wav");
    bounce.play();
     velocity = -15;
  } 
  
  void update() {
    yCoordinate += velocity;
    velocity += 0.5;
  }
  
  boolean isContact(Platform platform) {
    if (xCoordinate < platform.xCoordinate + 80 && xCoordinate + 50 > platform.xCoordinate && yCoordinate < platform.yCoordinate + 20 && 55 + yCoordinate > platform.yCoordinate) {
      if(platform.platformType==PlatformType.FRAGILE_TYPE){
        FragilePlatform fragilePlatform=(FragilePlatform)platform;
        if(fragilePlatform.hasVanished==true){
          return false;
        }
      }
      if (velocity > 0) {
        bounce();
        return true;
      }
    }
    return false;
  }
  
}
