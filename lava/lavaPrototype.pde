enum LavaDirection{
 UP,
 DOWN
}

float rectHeight = height;
int prevSecond = second();
LavaDirection lavaDirection = LavaDirection.UP;


void setup() {
  size(500, 800); 
}

void draw(){
 background(255); 

 rectMode(CORNER);
 color red = color(127, 0, 0);
 fill(red);
 rect(0, height - rectHeight, width, rectHeight);

 if (lavaDirection == LavaDirection.UP) {
   rectHeight += 0.5;
 } else if (lavaDirection == LavaDirection.DOWN){
   if (rectHeight >= 0) {
     rectHeight -= 10; 
   } else {
     lavaDirection = LavaDirection.UP;
   }
 }
}

void keyPressed() {
  if (keyCode == DOWN) {
       println("down");
      lavaDirection = LavaDirection.DOWN; 
   }
}
