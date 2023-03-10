enum direction{
   up,
   down;
}

class Cell{
   boolean isSolid;
   int r;
   int g;
   int b;
   
   public Cell(){
      isSolid = false;
      this.r = 255;
      this.g = 255;
      this.b = 255;
   }
      
   public Cell(int r, int g, int b){
      isSolid = true;
      this.r = r;
      this.g = g;
      this.b = b;
   }
 }

class grid{
   Cell[][] board;
   int doddleY;
   int doddleX;
   int pivt;
   int curstep;
   int maxstep;
   direction dir;
   public grid(int y, int x){
      board = new Cell[y][x];
      
      for (int j = 0; j < y; j++){
         for (int i = 0; i < x; i++){
            if (random(100) > 97){

               int len =(int) random(2)+4;
               for(int k = 0;k < len && i+k < 40;k++){
                 board[j][i + k] = new Cell((int) random(255), (int) random(255), (int) random(255));
               }
               i=i+len - 1;
               
               while (i < x){
                 board[j][i++] = new Cell();
               }
               
            }else {
               board[j][i] = new Cell();
            }
         }
      }
      doddleX = x / 2;
      doddleY = y - 10;
      pivt = y - 40;
      curstep = 0;
      maxstep = 8;
      dir = direction.up;
   }
}

grid testGrid = new grid(160, 40);

void setup(){
   size(400, 400);

   frameRate(60);

   noStroke();

}

void draw(){
   background(255);
   doddleDraw();
}

void doddleDraw(){
   printBoard();
   
   if (testGrid.dir == direction.up){

      testGrid.doddleY--;
      testGrid.curstep++;
      if (testGrid.curstep == testGrid.maxstep){
         testGrid.dir = direction.down;
      }
   }else if (testGrid.dir == direction.down){
      if (testGrid.doddleY - testGrid.pivt >= 39 || testGrid.doddleY >= 159){
         exit();
      }
      
      //println(testGrid.doddleY);
      
      if (testGrid.doddleY + 1 < 160 && testGrid.board[testGrid.doddleY + 1][testGrid.doddleX].isSolid){
        testGrid.dir = direction.up;
        if (testGrid.curstep > 0){
           testGrid.pivt -= testGrid.curstep;
        }
        
        testGrid.curstep = 0; 
        
        return;
      }
      testGrid.doddleY++;
      testGrid.curstep--;
      
   }
   delay(60);
}


void printBoard(){
   for (int j = testGrid.pivt; j < testGrid.pivt + 40; j++){
     int mark = testGrid.pivt;
     for (int i = 0; i < 40; i++){
        int optic = 150;
        if (j == testGrid.doddleY && i == testGrid.doddleX){
           fill(0, 0, 0);  
        }else{
           println(j + " " + i);
           if (!testGrid.board[j][i].isSolid){
              noStroke();
           }else{
              stroke(0);
           }
           
           fill(testGrid.board[j][i].r, testGrid.board[j][i].g, testGrid.board[j][i].b, optic);
           
        }
        rect(i * 10, (j - mark) * 10, 10, 10);
     }  
   }
   
}


void keyPressed(){
   if (keyCode == LEFT){

      testGrid.doddleX--;
      if (testGrid.doddleX == 0){
         testGrid.doddleX = 39;
      }

   }else if (keyCode == RIGHT){
      testGrid.doddleX++;
      if (testGrid.doddleX == 40){
         testGrid.doddleX = 0;
      }

   }
}
