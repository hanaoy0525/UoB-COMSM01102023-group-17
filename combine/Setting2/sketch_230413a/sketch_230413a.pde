PImage img; // 图片对象
float xPos, yPos; // 图片的当前位置
float xSpeed, ySpeed; // 图片的速度
float gravity; // 重力

void setup() {
  size(400, 400);
  img = loadImage("setting_background_char.png"); // 加载图片
  xPos = width / 2; // 图片的初始 x 坐标为画布宽度的一半
  yPos = height / 2; // 图片的初始 y 坐标为画布高度的一半
  xSpeed = 2; // 图片的初始 x 方向速度
  ySpeed = 0; // 图片的初始 y 方向速度
  gravity = 0.1; // 重力加速度
}

void draw() {
  background(255);
  
  // 更新图片位置
  xPos += xSpeed;
  yPos += ySpeed;
  
  // 检测碰撞边界
  if (xPos < 0 || xPos + img.width > width) {
    xSpeed *= -1; // 水平方向碰撞，反转速度
  }
  if (yPos + img.height > height) {
    ySpeed *= -0.9; // 垂直方向碰撞，反转速度并减少一定比例的速度
    xPos += xSpeed; // 解决碰撞后图片可能卡在边界的问题
    yPos = height - img.height; // 将图片位置调整到边界之外
  }
  
  ySpeed += gravity; // 更新垂直方向速度（考虑重力）
  
  // 显示图片
  image(img, xPos, yPos);
}
