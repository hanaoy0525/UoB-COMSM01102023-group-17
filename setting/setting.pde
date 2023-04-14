StarrySky stars;
BouncingImage bouncingImage;
float sliderWidth, sliderHeight;
float sliderXbgm, sliderYbgm;
float sliderXaction, sliderYaction; 
float sliderXspeed, sliderYspeed; 
float sliderValueBgm, volumeBgm;
float sliderValueAction, volumeAction;
float sliderValueSpeed, valueSpeed;
PImage backGroundImg;
PImage CharImg;
PImage settingsImg; 
PImage backImg;

float cancelBtnX, cancelBtnY;
float confirmBtnX, confirmBtnY;
float backBtnX, backBtnY;
int backWidth;
float btnWidth = 70;
float btnHeight = 40;
color cancelBtnColor, confirmBtnColor; // 按钮颜色
color btnTextColor = color(0); // 按钮文字颜色
color btnHoverColor = color(200); // 鼠标悬停时按钮颜色

// 定义难度级别
String[] difficultyLevels = {"Easy", "Middle", "Hard"};;
// 定义当前选中的难度级别索引
int currentDifficulty;
// 定义难度级别对应的颜色
color difficultyColors;
// 定义标签和圆点的位置和大小
int labelX;
int labelY;
int labelSize;
int lineY; // 横线的y坐标
int lineX1; // 横线的起始x坐标
int lineX2; // 横线的结束x坐标
int dotSize;
float levelTextX;


void setup() {
  size(400, 400);
  //背景大小
  background(255);
  backGroundImg = loadImage("setting_background_platform.png");
  backGroundImg.resize(400, 400);
  //导入星空class
  stars  = new StarrySky(100); // 星空对象
  bouncingImage = new BouncingImage("setting_background_char.png", 150, 150, 100); // 创建 BouncingImage 类的对象; // 创建 BouncingImage 类的对象
  //创建文字SETTING
  textAlign(CENTER, TOP);
   //图标
  settingsImg = loadImage("settings.png");
  //滑块大小
  sliderWidth = 150;
  sliderHeight = 20;
  // 初始化BGM音量值和滑块参数
  //setupValue(volumeBgm,sliderValueBgm,width/2,height/3,sliderXbgm,sliderYbgm);
  volumeBgm = 0.5;
  sliderXbgm = width/2;
  sliderYbgm = height/3;
  sliderValueBgm = map(volumeBgm, 0, 1, 0, sliderWidth);
  
   // 初始化Action音量值和滑块参数
  volumeAction = 0.5;
  sliderXaction = width/2;
  sliderYaction = height/3+40;
  sliderValueAction = map(volumeAction, 0, 1, 0, sliderWidth);

  // 定义当前选中的难度级别索引
 currentDifficulty = 0;
  // 定义难度级别对应的颜色
 difficultyColors = color(255, 0, 0);
  // 定义标签和圆点的位置和大小
 labelX = 100;
 labelY = 200;
 labelSize = 20;
 lineY = height/3+90;; // 横线的y坐标
 lineX1 = width/2+5; // 横线的起始x坐标
 lineX2 = lineX1 + 140; // 横线的结束x坐标
 dotSize = 15;//圆点的大小
  
  // 设置 Cancel 和 Confirm 按钮的初始位置和颜色
  cancelBtnColor = color(255);
  confirmBtnColor = color(255);
  cancelBtnX = width/4 - btnWidth/2;
  cancelBtnY = height - 70;
  confirmBtnX = width*3/4 - btnWidth/2;
  confirmBtnY = height - 70;
  
  //设置back按钮的位置
  backWidth = 40;
  backImg = loadImage("back_arrow.png");
  backImg.resize(backWidth, backWidth);
  backBtnX = 10;
  backBtnY = 10;
}


void draw() {
  background(255);
  
  //显示星空
   stars.update(); // 更新星空
  stars.display(); // 显示星空
  image(backGroundImg, 0, 0);
  bouncingImage.update(); // 更新和显示 BouncingImage 对象
  //绘制setting字体
  fill(255);
  textFont(createFont("Comic Sans MS", 30, true));
  text("SETTING", width/2, 50);
  //setting图标
  image(settingsImg, 70 ,20 , 50, 50);
  // 绘制BGM滑块
  noStroke();
  fill(200);
  rect(sliderXbgm, sliderYbgm, sliderWidth, sliderHeight);
  fill(255, 0, 0);
  rect(sliderXbgm, sliderYbgm, sliderValueBgm, sliderHeight);
  
  // 绘制BGM音量文本
  textSize(20);
  textAlign(CENTER);
  textFont(createFont("Comic Sans MS", 20, true));
  fill(255);
  text("BGM Volume: " + round(volumeBgm*100) + "%", width/4, sliderYbgm+15);
  
    // 绘制Action滑块
  noStroke();
  fill(200);
  rect(sliderXaction, sliderYaction, sliderWidth, sliderHeight);
  fill(255, 0, 0);
  rect(sliderXaction, sliderYaction, sliderValueAction, sliderHeight);
  
  // 绘制BGM音量文本
  textSize(20);
  textAlign(CENTER);
  textFont(createFont("Comic Sans MS", 20, true));
  fill(255);
  text("Action Volume: " + round(volumeAction*100) + "%", width/4, sliderYaction + 15 );
  
    // 绘制难度调节标签
  fill(255); // 设置字体颜色为白色
  textSize(labelSize); // 设置字体大小
  textAlign(CENTER); // 设置字体对齐方式为居中
  text("Level Selection:", width/4, labelY+30); // 绘制标签
  
  // 绘制难度级别横线
  stroke(255); // 设置画笔颜色为白色
  strokeWeight(6); // 设置画笔粗细为2
  line(lineX1, lineY, lineX2, lineY); // 绘制横线
  
  // 绘制难度调节圆点
  fill(difficultyColors); // 设置圆点颜色为当前难度级别对应的颜色
  noStroke(); // 不绘制边框
  ellipse(map(currentDifficulty, 0, difficultyLevels.length - 1, lineX1, lineX2), lineY, dotSize, dotSize); // 根据难度级别的索引位置在横线上绘制圆点
  
  // 绘制难度级别文本
  fill(255); // 设置字体颜色为白色
  textSize(labelSize / 1.5); // 设置字体大小为标签的一半
  textAlign(CENTER); // 设置字体对齐方式为居中和顶部对齐
  for (int i = 0; i < difficultyLevels.length; i++) {
    levelTextX = map(i, 0, difficultyLevels.length - 1, lineX1, lineX2); // 根据难度级别的索引位置计算文本的x坐标
    text(difficultyLevels[i], levelTextX, lineY + dotSize+1 / 2 + labelSize / 2); // 绘制难度级别文本
  }
  
  // 绘制 Cancel 按钮
  fill(cancelBtnColor);
  stroke(btnTextColor);
  strokeWeight(3);
  rect(cancelBtnX, cancelBtnY, btnWidth, btnHeight, 10);
  fill(btnTextColor);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Cancel", cancelBtnX + btnWidth/2, cancelBtnY + btnHeight/2);
  
  // 绘制 Confirm 按钮
  fill(confirmBtnColor);
  rect(confirmBtnX, confirmBtnY, btnWidth, btnHeight, 10);
  fill(btnTextColor);
  textAlign(CENTER, CENTER);
  textSize(16);
  stroke(btnTextColor);
  text("Confirm", confirmBtnX + btnWidth/2, confirmBtnY + btnHeight/2);
  
  //绘制back按钮
  image(backImg, backBtnX, backBtnY, backWidth,backWidth);
  

}

void mousePressed() {
  // 判断鼠标是否在BGM音量滑块上按下
  if (mouseX > sliderXbgm && mouseX < sliderXbgm + sliderWidth &&
      mouseY > sliderYbgm && mouseY < sliderYbgm + sliderHeight) {
    // 更新音量值
    sliderValueBgm = mouseX - sliderXbgm;
    volumeBgm = map(sliderValueBgm, 0, sliderWidth, 0, 1);
  }
    // 判断鼠标是否在Action音量滑块上按下
  if (mouseX > sliderXaction && mouseX < sliderXaction + sliderWidth &&
      mouseY > sliderYaction && mouseY < sliderYaction + sliderHeight) {
    // 更新音量值
    sliderValueAction = mouseX - sliderXaction;
    volumeAction = map(sliderValueAction, 0, sliderWidth, 0, 1);
  }
  
  // 判断鼠标是否点击了 Cancel 按钮
  if (mouseX > cancelBtnX && mouseX < cancelBtnX + btnWidth &&
      mouseY > cancelBtnY && mouseY < cancelBtnY + btnHeight) {
    // 在这里执行点击 Cancel 按钮后的逻辑
    println("Cancel button clicked");
  }
  
  // 判断鼠标是否点击了 Confirm 按钮
  if (mouseX > confirmBtnX && mouseX < confirmBtnX + btnWidth &&
      mouseY > confirmBtnY && mouseY < confirmBtnY + btnHeight) {
    // 在这里执行点击 Confirm 按钮后的逻辑
    println("Confirm button clicked");
  }
  
  // 检测鼠标点击level
  if (mouseY >= lineY - dotSize / 2 && mouseY <= lineY + dotSize / 2 && mouseX >= lineX1 && mouseX <= lineX2) {
    // 判断鼠标点击位置是否在难度级别横线上
    float interval = (lineX2 - lineX1) / (difficultyLevels.length - 1); // 计算每个难度级别之间的间隔
    currentDifficulty = round((mouseX - lineX1) / interval); // 根据鼠标点击位置计算当前选中的难度级别索引
  }
  
}

void mouseDragged() {
  // 判断鼠标是否在滑块上拖动
  if (mouseX > sliderXbgm && mouseX < sliderXbgm+sliderWidth &&
      mouseY > sliderYbgm && mouseY < sliderYbgm+sliderHeight) {
    // 更新音量值
    sliderValueBgm = mouseX - sliderXbgm;
    volumeBgm = map(sliderValueBgm, 0, sliderWidth, 0, 1);
  }
    if (mouseX > sliderXaction && mouseX < sliderXaction + sliderWidth &&
      mouseY > sliderYaction && mouseY < sliderYaction + sliderHeight) {
    // 更新音量值
    sliderValueAction = mouseX - sliderXbgm;
    volumeAction = map(sliderValueAction, 0, sliderWidth, 0, 1);
  }
  
}

void mouseMoved() {
  // 判断鼠标是否悬停在 Cancel 按钮上
  cancelBtnColor = buttonHover(cancelBtnX, cancelBtnY, btnWidth, btnHeight, btnHoverColor, color(255));
  
  // 判断鼠标是否悬停在 Confirm 按钮上
  confirmBtnColor = buttonHover(confirmBtnX, confirmBtnY, btnWidth, btnHeight, btnHoverColor, color(255));
  //判断鼠标是否悬停在back箭头上
  if (mouseX > backBtnX && mouseX < backBtnX + backWidth &&
      mouseY > backBtnY && mouseY < backBtnY + backWidth) {
    println("mouse is on the back button");
    backWidth = 50;
    //image(backImg, backBtnX-5, backBtnY-5, backWidth + 20, backWidth + 20);
  }else{
    backWidth = 40;
  }
  
}

  
color buttonHover(float btnX, float btnY, float btnWidth, float btnHeight, color hoverColor, color defaultColor) {
  // 判断鼠标是否悬停在按钮上
  if (mouseX > btnX && mouseX < btnX + btnWidth &&
      mouseY > btnY && mouseY < btnY + btnHeight) {
    println("mouse is on the button");
    return hoverColor;
  } else {
    return defaultColor;
  }
} //<>//
