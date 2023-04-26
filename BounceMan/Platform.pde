enum PlatformType{
  NORMAL_TYPE,
  FRAGILE_TYPE,
  FLOAT_TYPE
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
  public FragilePlatform(float x, float y){
    super(x, y);
    platformImage = loadImage("single_platform2.png");
    platformImage.resize(80,20);
    platformType = PlatformType.FRAGILE_TYPE;
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
