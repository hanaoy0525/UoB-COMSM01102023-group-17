// 星空类
class StarrySky {
  int numStars; // 星星数量
  float[] starX; // 星星的 x 坐标
  float[] starY; // 星星的 y 坐标
  color[] starColors; // 星星的颜色

  // 构造函数
  StarrySky(int numStars) {
    this.numStars = numStars;
    starX = new float[numStars];
    starY = new float[numStars];
    starColors = new color[numStars];
    for (int i = 0; i < numStars; i++) {
      starX[i] = random(width);
      starY[i] = random(height);
      starColors[i] = color(random(255), random(255), random(255));
    }
  }

  // 显示星空
  void display() {
    background(0);
    for (int i = 0; i < numStars; i++) {
      fill(starColors[i]);
      noStroke();
      ellipse(starX[i], starY[i], 2, 2);
    }
  }

  // 更新星空
  void update() {
    for (int i = 0; i < numStars; i++) {
      starX[i] += 1; // 星星向右移动
      if (starX[i] > width) {
        starX[i] = 0;
        starY[i] = random(height);
        starColors[i] = color(random(255), random(255), random(255));
      }
    }
  }
}
