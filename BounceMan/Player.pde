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
    //imageMode(CORNER);
    //man.resize(60,50);
    //image(man, xCoordinate - 25, yCoordinate - 25);
    imageMode(CENTER);
    man.resize(50,50);
    image(man, this.xCoordinate, this.yCoordinate);
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
    if (xCoordinate < platform.xCoordinate + 65 && xCoordinate + 65 > platform.xCoordinate && yCoordinate < platform.yCoordinate + 10 && 35 + yCoordinate > platform.yCoordinate) {
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
  boolean hasContactEnemy(Platform platform){
    if(platform.platformType==PlatformType.ENEMY_TYPE){
      EnemyPlatform enemyPlatform=(EnemyPlatform) platform;
      if(xCoordinate < enemyPlatform.enemyCoordinate_X + 40 && xCoordinate + 40 > enemyPlatform.enemyCoordinate_X
           && yCoordinate < enemyPlatform.enemyCoordinate_Y + 25 && 25 + yCoordinate > enemyPlatform.enemyCoordinate_Y){
        if(velocity > 0){
           return true;
        }
        return false;
      }
      else{
        return false;
      }
    }
    else{
      return false;
    }
  }
}
