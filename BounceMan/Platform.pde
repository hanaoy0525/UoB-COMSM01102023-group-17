class Platform {
  float x;
  float y;
  float v;
  PImage platformImage;
  
  Platform (float x, float y){
    this.x = x;
    this.y = y;
    int random = (int)random(3);
    if(random == 0){
      platformImage = loadImage("single_platform1.png");
    }else if(random == 1){
      platformImage = loadImage("single_platform2.png");
    }else{
      platformImage = loadImage("single_platform3.png");
    }
    
    platformImage.resize(80,20);
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
  
}
