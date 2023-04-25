// Background
class StarrySky {
  int numStars; 
  float[] starX; 
  float[] starY; 
  color[] starColors; 

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
  
  void display() {
    background(0);
    for (int i = 0; i < numStars; i++) {
      fill(starColors[i]);
      noStroke();
      ellipse(starX[i], starY[i], 2, 2);
    }
  }

  // star will move to right one pixel per frame
  void update() {
    for (int i = 0; i < numStars; i++) {
      starX[i] += 1; 
      if (starX[i] > width) {
        starX[i] = 0;
        starY[i] = random(height);
        starColors[i] = color(random(255), random(255), random(255));
      }
    }
  }
}
