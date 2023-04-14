class Player {
  float x;
  float y;
  float v;
  
  Player (float x, float y){
    this.x = x;
    this.y = y;
    v = -15;
  }
  
  void display(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, 50, 50);
  }
  
  void move(){
    if(keyPressed && (keyCode == RIGHT)){
      x += 10;
    }
    if(keyPressed && (keyCode == LEFT)){
      x -= 10;
    }
    if(x > 500){
      x = 0;
    }
    if(x < 0){
      x = 500;
    }
  }
  
  void bounce(){
     v = -15;
  } 
  
  void update() {
    y += v;
    v += 0.5;
  }
  
  void isContact(Platform platform) {
    if (x < platform.x + 80 && x + 50 > platform.x && y < platform.y + 20 && 55 + y > platform.y) {
      if (v > 0) {
        bounce();
      }
    }
  }
  
}
