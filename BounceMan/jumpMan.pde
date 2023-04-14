class JumpMan {
  PImage img; // 图片对象
  float x, y; // 图片的坐标
  float xSpeed, ySpeed; // 图片在 x 和 y 方向上的速度
  float gravity; // 重力加速度
  float groundHeight; // 地面高度
  int imgWidth, imgHeight; // 图片的宽度和高度

  JumpMan (String imagePath, float x, float y, float groundHeight) {
    img = loadImage(imagePath); // 加载图片
    imgWidth = 60; // 图片宽度设定为90像素
    imgHeight = 60; // 图片高度设定为90像素
    img.resize(imgWidth, imgHeight); // 缩小图片尺寸
    this.x = x;
    this.y = y;
    xSpeed = 0;
    ySpeed = 0;
    gravity = 0.5;
    this.groundHeight = groundHeight;
  }

  void display() {
    image(img, x, y); // 显示图片
  }

  void update() {
    // 更新图片位置
    x += xSpeed;
    y += ySpeed;

    // 检测窗口边界
    if (x > width) {
      x = 0;
    } else if (x < 0) {
      x = width;
    }

    // 检测地面
    if (y > height - groundHeight) {
      y = height - groundHeight;
      ySpeed *= -1; // 反转 y 方向速度，实现弹跳效果
    }

    // 更新速度
    ySpeed += gravity;
    
    display(); // 显示图片
  }
}
