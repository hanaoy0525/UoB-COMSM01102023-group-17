PImage backgroundImg; 
//PImage logoImg; // Logo 
PImage characterImg; 
PImage character2Img;
PImage settingsImg; 
PFont startFont;
int colorChange = 1;
int textColor = 0;

void setup() {
  size(400, 400);
  
  // load the pic
  backgroundImg = loadImage("BackgroundCloud.jpg");
 // logoImg = loadImage("/Users/haoyanwang/Documents/Processing/data/platform.png");
  characterImg = loadImage("kisspng-doodle-jump.png");
  character2Img = loadImage("black.png");
  settingsImg = loadImage("settings.png");
  startFont = createFont("DripOctober-vm0JA.ttf",128);
  textFont(startFont,32);
}

void draw() {
  background(255);
  
  // draw the background
  image(backgroundImg, 0, 0, width, height);
  
  
  // the character, we might need to change this
  //image(characterImg, width - characterImg.width/, height/20);
  image(characterImg, 20, 100, characterImg.width/10, characterImg.height/10);
  image(character2Img, 330, 170, characterImg.width/20, characterImg.height/20);
  
  // start button
  fill(255);
  rect(width/2 - 75, height/2 - 30, 150, 60, 10);
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(0);
  text("Start", width/2, height/2);
  //game name
  textSize(40);
  textColor += colorChange;
  if (textColor > 255 || textColor < 0) {
    colorChange = -colorChange;  
  }
  fill(textColor, textColor, 0); 
  //fill(random(255), random(255), random(255));
  text("Doodle", 200, 80);
  text("Jump", 200, 130);
  
  // seeting button
  image(settingsImg, width - 80, height - 80, 70, 70);
}

void mouseClicked() {
  // click start go into the game
  if (mouseX > width/2 - 75 && mouseX < width/2 + 75 && mouseY > height/2 - 30 && mouseY < height/2 + 30) {
    // the game content
  }
  
  // click settings go into setting
  if (mouseX > width - 150 && mouseX < width - 80 && mouseY > height - 150 && mouseY < height - 80) {
    // code for seetings
  }
}
