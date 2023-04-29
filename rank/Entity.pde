class Entity implements Comparable <Entity>{
  String name;
  int score;
  
  public Entity (String name, int score) {
     this.name = name;
     this.score = score;
  }
  
  @Override
  public int compareTo(Entity other) {
    return Integer.compare(this.score, other.score);
  }
  
  @Override
  public String toString() {
    return name + " " + score;
  }
}
