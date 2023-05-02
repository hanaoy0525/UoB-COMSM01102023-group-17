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
  PImage guide_frameImg;
  PImage guide_1moveImg;
  PImage guide_2rImg;
  PImage guide_3spaceImg;
  PImage guide_4enemyImg;
  PImage guide_5lavaImg;
  PImage guide_arrowImg;
  
  GuideScreen(){
    size(500, 800);
    platFormImg = loadImage("setting_background_platform.png");
    platFormImg.resize(500, 0);
    stars = new StarrySky(100);
    //back arrow
    backArrowImg = loadImage("back_arrow.png");
    buttonWidth = 50; 
    backButtonX = 30; 
    backButtonY =  600;
    backArrowImg.resize(buttonWidth, buttonWidth);
    
    guideMan = new GuideMan("setting_background_char.png", 350, 500, 100);
    
    
    //guide content  
    guide_frameImg = loadImage("guide_frame.PNG");
    guide_frameImg.resize(505,645);
    guide_1moveImg = loadImage("guide_1move.PNG");
    guide_1moveImg.resize(290,99);
    guide_2rImg = loadImage("guide_2r.PNG");
    guide_2rImg.resize(142,86);
    guide_3spaceImg = loadImage("guide_3space.PNG");
    guide_3spaceImg.resize(255,78);
    guide_4enemyImg = loadImage("guide_4enemy.PNG");
    guide_4enemyImg.resize(107,40);
    guide_5lavaImg = loadImage("guide_5lava.PNG");
    guide_5lavaImg.resize(234,44);
    guide_arrowImg = loadImage("guide_arrow.PNG");
     guide_arrowImg.resize(229,62);
  }
  
  void display(){
    stars.update(); 
    stars.display(); 
    
    imageMode(CORNER);
    image(platFormImg, 0, height - platFormImg.height);
    
    //Prompt information
    fill(255);
    //textFont(createFont("Comic Sans MS", 40, true)); 
    textSize(40);
    text("GUIDE", width/2 - 50, 50);
    
    
    //back arrow
    image(backArrowImg, backButtonX, backButtonY, buttonWidth,buttonWidth);
    fill(255);
    textSize(40);
    text("GOT IT!", backButtonX + 70 , backButtonY + 35);
    
    //guide content
    textSize(16);
    
    image(guide_frameImg, 0, 60);
    
    text("MOVE LEFT AND RIGHT!", 239, 148);
    image(guide_1moveImg, 30, 104);
    
    text("Retry!", 241, 243);
    image(guide_2rImg, 39, 187);
    
    text("RETURN to START SCREEN!", 302, 311);
    image(guide_3spaceImg, 42, 260);
    
    text("AVOID enemies on the platform!", 83, 415);
    image(guide_4enemyImg, 45, 346);
    
    text("THE Lava APPROACHES... so hurry up!", 86, 519);
    image(guide_5lavaImg, 46, 446);
    
    image(guide_arrowImg, 42, 552);
    
    
    guideMan.display();
    guideMan.update();
    
    update();
  }
    
  void update() {
      if (mouseX > this.backButtonX && mouseX < this.backButtonX + this. buttonWidth &&
          mouseY > this.backButtonY && mouseY < this.backButtonY + this.buttonWidth) {
            this.buttonWidth = 60;
      }else{
         this.buttonWidth = 50;
      }
  }
}
