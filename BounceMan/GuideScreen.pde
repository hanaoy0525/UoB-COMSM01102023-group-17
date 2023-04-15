class GuideScreen{
  StarrySky stars;
  JumpMan jm;
  PImage platFormImg;
  //PImage manImg;
  PImage backArrowImg;//back arrow
  //back arrow size
  int backWidth;
  int backBtnX, backBtnY;
  
  GuideScreen(){
    size(500, 800);
    platFormImg = loadImage("setting_background_platform.png");
    stars = new StarrySky(100);
    //back arrow
    backArrowImg = loadImage("back_arrow.png");
    backWidth = 50; backBtnX = 30; backBtnY =  600;
    backArrowImg.resize(backWidth, backWidth);
    jm = new JumpMan("setting_background_char.png", 200, 500, 100);
  }
  void display(){
   //starry
    stars.update(); // 更新星空
    stars.display(); // 显示星空
    platFormImg.resize(500, 0);
    image(platFormImg, 0, height - platFormImg.height);
    
    //jump man
    jm.display();
    jm.update();
   //Guide word
    fill(255);
    textFont(createFont("Comic Sans MS", 40, true)); 
    text("Guide", width/2 - 50, 50);
    
    textSize(25);
    text("Bounce on the platforms to climb higher!", 10, 200);
    
    textSize(25);
    text("Use the arrow keys to move!", 10, 400);
    
   //back arrow
   image(backArrowImg, backBtnX, backBtnY, backWidth,backWidth);
   fill(255);
   textFont(createFont("Comic Sans MS", 30, true)); 
   text("Got it!", backBtnX+70 , backBtnY+35);
  }


}
