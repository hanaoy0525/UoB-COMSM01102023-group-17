class GuideMan {
  PImage img; 
  float x, y; //img position
  float xSpeed, ySpeed;
  float gravity;
  float groundHeight; 
  int imgWidth, imgHeight;

  GuideMan (String imagePath, float x, float y, float groundHeight) {
    img = loadImage(imagePath); 
    imgWidth = 60;
    imgHeight = 50; 
    img.resize(imgWidth, imgHeight); 
    this.x = x;
    this.y = y;
    ySpeed = 0;
    gravity = 0.5;
    this.groundHeight = groundHeight;
  }

  void display() {
    imageMode(CORNER);
    image(img, x, y); 
  }

  void update() {
    
    y += ySpeed;

    if (y > height - groundHeight) {
      y = height - groundHeight;
      ySpeed *= -1; // change y direction
    }

    ySpeed += gravity;
    
    display(); 
  }
}
