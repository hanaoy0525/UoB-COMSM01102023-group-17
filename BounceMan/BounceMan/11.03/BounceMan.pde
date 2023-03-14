PVector pos = new PVector(250, 200);
PVector vel = new PVector(0, 1);
PVector acc = new PVector(0, 0.5);

void setup(){
  size(500, 800);
}

void draw(){
  pos.add(vel);
  vel.add(acc);
  background(0);
  Player player = new Player (pos.x, pos.y, 50, 50);
  player.display();
  if(keyPressed && (key == ' ')){
    player.bounce();
  }
  player.move();
}

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

class Platform {
  int x;
  int y;
  
  Platform (int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, 70, 20);
  }
}
