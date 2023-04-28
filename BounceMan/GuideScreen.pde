class GuideScreen{
  StarrySky stars;
  GuideMan guideMan;
  PImage platFormImg;
  //PImage manImg;
  PImage backArrowImg;//back arrow
  //back arrow size
  int buttonWidth;
  int backButtonX, backButtonY;
  //guide content
  PImage guideMoveImg;
  PImage guideBackImg;
  PImage guideArrowImg;
  PImage guideFrameImg;
  
  GuideScreen(){
    size(500, 800);
    platFormImg = loadImage("setting_background_platform.png");
    stars = new StarrySky(100);
    //back arrow
    backArrowImg = loadImage("back_arrow.png");
    buttonWidth = 50; 
    backButtonX = 30; 
    backButtonY =  600;
    backArrowImg.resize(buttonWidth, buttonWidth);
    guideMan = new GuideMan("setting_background_char.png", 200, 500, 100);
    //guide content
    guideMoveImg = loadImage("guide_move.PNG");
    guideBackImg = loadImage("guide_back.PNG");
    guideArrowImg = loadImage("guide_arrow.PNG");
    guideFrameImg = loadImage("guide_frame.PNG");
  }
  void display(){
    stars.update(); 
    stars.display(); 
    platFormImg.resize(500, 0);
   image(platFormImg, 0, height - platFormImg.height);
    
    //jump man
    guideMan.display();
    guideMan.update();
    
    //Prompt information
    fill(255);
    textFont(createFont("Comic Sans MS", 40, true)); 
    text("Guide", width/2 - 50, 50);
    
    //textSize(25);
    //text("Bounce on the platforms\nto climb higher!", 10, 200);
    
    //textSize(25);
    //text("Use the arrow keys to move!", 10, 400);
    
    //back arrow
    image(backArrowImg, backButtonX, backButtonY, buttonWidth,buttonWidth);
    fill(255);
    textFont(createFont("Comic Sans MS", 30, true)); 
    text("Got it!", backButtonX + 70 , backButtonY + 35);
    
    //guide content
    guideFrameImg.resize(500,650);
    image(guideFrameImg, 0, 60);
    guideMoveImg.resize(400,130);
    image(guideMoveImg, 50, 100);
    guideBackImg.resize(400,200);
    image(guideBackImg, 50, 250);
    guideArrowImg.resize(350,120);
    image(guideArrowImg, 30, 500);
    
    
    update();
  }
    
  void update() {
      //check mouse on the back arrow
      if (mouseX > gs.backButtonX && mouseX < gs.backButtonX + gs. buttonWidth &&
          mouseY > gs.backButtonY && mouseY < gs.backButtonY + gs.buttonWidth) {
            println("mouse is on the back arrow");
            gs.buttonWidth = 60;
      }else{
         gs.buttonWidth = 50;
      }
  }
}
