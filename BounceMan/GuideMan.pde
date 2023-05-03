class GuideMan{
  PImage image;
  float yCoordinate;
  float ySpeed;

  GuideMan (String imagePath, float yCoordinate) {
    image = loadImage (imagePath);
    image.resize(60, 50);
    this.yCoordinate = yCoordinate;
    this.ySpeed = 0;
  }
  
  void display() {
    imageMode (CORNER);
    image(image, 380, yCoordinate);
  }
  
  void update(){
  yCoordinate += ySpeed;
  
    if (yCoordinate > height-100){
      yCoordinate = height-100;
      ySpeed = -15; 
    } else {
      ySpeed += 0.5; 
    }
  }
}
