class Star {
  int x;
  int y;
  
  Star(int xPos, int yPos) {
    this.x = xPos;
    this.y = yPos;
  }
  
  void drawStar() {
    fill(255);
    ellipse(x, y, 2, 2);
  }
}