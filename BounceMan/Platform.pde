class Platform {
  float x;
  float y;
  float v;
  
  Platform (float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, 80, 20);
  }
  
  void setV(float playerV) {
   v = playerV; 
  }
  
  void update() {
    y -= v;
  }
  
}
