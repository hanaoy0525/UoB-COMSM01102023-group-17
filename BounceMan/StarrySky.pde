class Star {
  float x, y;
  color c;
  float speed;

  Star(float x, float y) {
    this.x = x;
    this.y = y;
    this.c = color(random(255), random(255), random(255));
    this.speed = 1;
  }

  void update() {
    x -= speed;
    if (x < 0) {
      x = width;
      y = random(height);
      c = color(random(255), random(255), random(255));
      speed = 1;
    }
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, random(1, 4), random(1, 4));
  }
}

class StarrySky {
  ArrayList<Star> stars;

  StarrySky(int numStars) {
    stars = new ArrayList<Star>();
    for (int i = 0; i < numStars; i++) {
      stars.add(new Star(random(width), random(height)));
    }
  }

  void update() {
    for (Star s : stars) {
      s.update();
    }
  }

  void display() {
    background(0);
    for (Star s : stars) {
      s.display();
    }
  }
}
