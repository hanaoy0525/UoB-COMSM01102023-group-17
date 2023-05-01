class Lava{
  PImage lavaImg;
  private float lavaHeight;
  private float velocity;
  
  public Lava(){
    lavaImg = loadImage("lavaImg.png"); 
    this.lavaHeight=0;
    this.velocity=0.1;
  }

  
  public void display(){
    //rectMode(CORNER); // start from left top
    //fill(color(127, 0, 0));
    imageMode(CORNER);
    image(lavaImg, 0, height - lavaHeight);
    //rect(0, height - lavaHeight, width, lavaHeight); // xCoordinate, yCoordinate, width, height
  }
  
  public void ascend(){
    this.lavaHeight+=velocity;
    if(this.lavaHeight<0){
      this.lavaHeight=0;
    }
    if(this.velocity<0.1){
      this.velocity+=0.1;
    }
  }
  
  public void descend(){
    this.velocity=-1;
  }
}
