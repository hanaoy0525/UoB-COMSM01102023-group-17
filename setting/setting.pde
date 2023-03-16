float sliderWidth, sliderHeight;
float sliderXbgm, sliderYbgm;
float sliderXaction, sliderYaction; 
float sliderXspeed, sliderYspeed; 
float sliderValueBgm, volumeBgm;
float sliderValueAction, volumeAction;
float sliderValueSpeed, valueSpeed;
PImage img;

void setup() {
  size(400, 800);
  background(255);
  img = loadImage("plaid.jpg");
  img.resize(img.width/3, img.height/3); // 缩小图片到原来的一半大小
  //创建文字
  textAlign(CENTER, TOP);

  
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
}


void draw() {
  background(255);
  image(img, 0, 0);
  //绘制字体
  fill(0);
  textFont(createFont("Comic Sans MS", 30, true));
  text("SETTING", width/2, 50);
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
  fill(0);
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
  fill(0);
  text("Action Volume: " + round(volumeAction*100) + "%", width/4, sliderYaction + 15 );
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
