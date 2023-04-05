class Player {
  float x;
  float y;
  int h;
  int w;
  
  Player (float x, float y, int h, int w){
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
  }
  
  void display(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, h, w);
  }
  
  void move(){
    if(keyPressed && (keyCode == RIGHT)){
      pos.x += 10;
    }
    if(keyPressed && (keyCode == LEFT)){
      pos.x -= 10;
    }
    if(pos.x > 500){
      pos.x = 0;
    }
    if(pos.x < 0){
      pos.x = 500;
    }
  }
  
  void bounce(){
    vel.y = -20;
    acc.y = 1;
  } 
}
