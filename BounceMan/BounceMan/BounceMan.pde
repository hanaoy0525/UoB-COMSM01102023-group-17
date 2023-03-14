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
  player.move();
  if(keyPressed && (key == ' ')){
    player.bounce();
  }
}
