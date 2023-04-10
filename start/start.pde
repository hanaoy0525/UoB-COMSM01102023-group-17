PImage backgroundImg; 
//PImage logoImg; // Logo 
PImage characterImg; 
PImage character2Img;
PImage settingsImg; 
PImage triangleImg;
PFont startFont;
int colorChange = 1;
int textColor = 0;

void setup() {
  size(800, 800);
  
  // load the pic
  backgroundImg = loadImage("cloud.jpg");
 // logoImg = loadImage("/Users/haoyanwang/Documents/Processing/data/platform.png");
  characterImg = loadImage("kisspng-doodle-jump.png");
  character2Img = loadImage("black.png");
  triangleImg = loadImage("triangle.png");
  settingsImg = loadImage("settings.png");
  startFont = createFont("DripOctober-vm0JA.ttf",128);
  textFont(startFont,32);
}

void draw() {
  background(255);
  
  // draw the background
  image(backgroundImg, 0, 0, width, height);
  
  // the logo (not sure if we need it)
  //image(logoImg, width/2 - logoImg.width/2, height/6);
  
  // the character, we might need to change this
  //image(characterImg, width - characterImg.width/, height/20);
  image(characterImg, 0, 250, characterImg.width/2, characterImg.height/2);
  image(character2Img, 600, 250, characterImg.width/10, characterImg.height/10);
  image(triangleImg, 600, 600, characterImg.width/5, characterImg.height/5);
  
  // start button
  fill(255);
  rect(width/2 - 75, height/2 - 30, 150, 60, 10);
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(0);
  text("Start", width/2, height/2);
  //game name
  textSize(80);
  textColor += colorChange;
  if (textColor > 255 || textColor < 0) {
    colorChange = -colorChange;  
  }
  fill(textColor, textColor, 0); 
  //fill(random(255), random(255), random(255));
  text("Doodle", 400, 100);
  text("Jump", 400, 200);
  
  // seeting button
  image(settingsImg, width - 70, height - 70, 50, 50);
}

void mouseClicked() {
  // click start go into the game
  if (mouseX > width/2 - 75 && mouseX < width/2 + 75 && mouseY > height/2 - 30 && mouseY < height/2 + 30) {
    // the game content
  }
  
  // click settings go into setting
  if (mouseX > width - 70 && mouseX < width - 20 && mouseY > height - 70 && mouseY < height - 20) {
    // code for seetings
  }
}
