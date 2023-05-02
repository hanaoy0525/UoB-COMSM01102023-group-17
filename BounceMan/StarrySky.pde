class Star {
  float x, y;
  color c;
  float speed;
  int size;

  Star(float x, float y) {
    this.x = x;
    this.y = y;
    this.c = color(random(255), random(255), random(255));
    this.speed = 1;
    this.size = (int) random(1, 4);
  }

  void update() {
    x++;
    y++;
    if (y >= height) {
       y = 0;
    }
    if (x >= width) {
      x = 0;
    }
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, size, size);
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
