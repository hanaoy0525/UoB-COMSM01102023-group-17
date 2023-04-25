class GuideScreen{
  StarrySky stars;
  GuideMan guideMan;
  PImage platFormImg;
  //PImage manImg;
  PImage backArrowImg;//back arrow
  //back arrow size
  int buttonWidth;
  int backButtonX, backButtonY;
  
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
    
    textSize(25);
    text("Bounce on the platforms\nto climb higher!", 10, 200);
    
    textSize(25);
    text("Use the arrow keys to move!", 10, 400);
    
    //back arrow
    image(backArrowImg, backButtonX, backButtonY, buttonWidth,buttonWidth);
    fill(255);
    textFont(createFont("Comic Sans MS", 30, true)); 
    text("Got it!", backButtonX + 70 , backButtonY + 35);
    
    if (keyPressed) {
      initScreen(); 
    }
  }


}
