enum PlatformType{
  NORMAL_TYPE,
  FRAGILE_TYPE,
  FLOAT_TYPE,
  ENEMY_TYPE
}

enum Direction{
  LEFT,
  RIGHT
}

class Platform {
  public float xCoordinate;
  public float yCoordinate;
  public float velocity;
  public PImage platformImage;
  public PlatformType platformType;
  
  Direction dir;
  boolean hasContacted;
  
  Platform (float x, float y){
    this.xCoordinate = x;
    this.yCoordinate = y;

    platformImage = loadImage("single_platform1.png");
    
    platformImage.resize(80,20);
    
    hasContacted = false;
    
    platformType=PlatformType.NORMAL_TYPE;
  }
  
  void display(){
    imageMode(CENTER);
    image(platformImage, xCoordinate, yCoordinate);
  }
  
  void setV(float playerV) {
   velocity = playerV; 
  }
  
  void update() {
    yCoordinate -= velocity;
  }
  
  public void setContacted(){
    this.hasContacted=true;
  }
  
  public boolean hasContactedBefore(){
    return this.hasContacted;
  }
 
  public void changeDir(){
    if (dir == Direction.LEFT){
        dir = Direction.RIGHT;
    }else{
        dir = Direction.LEFT;
    }
  }

  public void floatMove(){
    if (dir == Direction.LEFT){
        xCoordinate -= 2;
    }else{
        xCoordinate += 2;
    }
  }
}

class FragilePlatform extends Platform{
  public boolean hasVanished;
  public FragilePlatform(float x, float y){
    super(x, y);
    platformImage = loadImage("single_platform2.png");
    platformImage.resize(80,20);
    platformType = PlatformType.FRAGILE_TYPE;
    
    this.hasVanished=false;
  }
  
  public void vanish(){
    this.hasVanished=true;
  }
  public void display(){
    if(this.hasVanished==false){
      super.display();
    }
    else{
      return;
    }
  }
}

class FloatPlatform extends Platform{
  Direction dir;
  public FloatPlatform(float x, float y){
    super(x, y);
    platformImage = loadImage("single_platform3.png");
    platformImage.resize(80,20);
    platformType = PlatformType.FLOAT_TYPE;
    if (Math.random() < 0.5){
        dir = Direction.LEFT;
    }else{
        dir = Direction.RIGHT;
    }
  }
  
  public void changeDir(){
    if (dir == Direction.LEFT){
        dir = Direction.RIGHT;
    }else{
        dir = Direction.LEFT;
    }
  }

  public void floatMove(){
    if (dir == Direction.LEFT){
        xCoordinate -= 2;
    }else{
        xCoordinate += 2;
    }
  }
}

class EnemyPlatform extends Platform{
  Direction enemyLocatedSide;
  float enemyCoordinate_X;
  float enemyCoordinate_Y;
  PImage enemyImage;
  public EnemyPlatform(float x, float y){
    super(x, y);
    platformImage = loadImage("single_platform1.png");
    platformImage.resize(80,20);
    platformType = PlatformType.ENEMY_TYPE;
    if (Math.random() < 0.5){
      this.enemyLocatedSide = Direction.LEFT;
    }else{
      this.enemyLocatedSide = Direction.RIGHT;
    }
    locateEnemy();
    
    double enemeyImageOdd=Math.random();
    if(enemeyImageOdd<0.33){
      this.enemyImage = loadImage("enemy1.gif");
    }
    else if(enemeyImageOdd<0.67){
      this.enemyImage = loadImage("enemy2.png");
    }
    else{
      this.enemyImage = loadImage("enemy3.png");
    }
    this.enemyImage.resize(50,50);
  }
  void display(){
    imageMode(CENTER);
    image(super.platformImage, super.xCoordinate, super.yCoordinate);
    locateEnemy();
    image(this.enemyImage, this.enemyCoordinate_X, this.enemyCoordinate_Y);
  }
  
  void locateEnemy(){
    if(this.enemyLocatedSide==Direction.LEFT){
      this.enemyCoordinate_X=super.xCoordinate - 20;
      this.enemyCoordinate_Y=super.yCoordinate - 30;
    }
    else{
      this.enemyCoordinate_X=super.xCoordinate + 20;
      this.enemyCoordinate_Y=super.yCoordinate - 30;
    }
  }
}
