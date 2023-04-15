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
  public float x;
  public float y;
  public float v;
  public PImage platformImage;
  public PlatformType platformType;
  
  Direction dir;
  boolean hasContacted;
  
  Platform (float x, float y){
    this.x = x;
    this.y = y;

    platformImage = loadImage("single_platform1.png");
    
    platformImage.resize(80,20);
    
    hasContacted=false;
    
    platformType=PlatformType.NORMAL_TYPE;
  }
  
  void display(){
    imageMode(CENTER);
    image(platformImage, x, y);
    //fill(255);
    //rectMode(CENTER);
    //rect(x, y, 80, 20);
  }
  
  void setV(float playerV) {
   v = playerV; 
  }
  
  void update() {
    y -= v;
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
        x-=2;
    }else{
        x+=2;
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
}
