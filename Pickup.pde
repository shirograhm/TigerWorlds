class Pickup extends Object {
  int id;

  Pickup(float x, float y, int id) {
    super(x, y, 20 - 50);
    this.id = id;
  }

  void drawPickup() {
    noStroke();
    if (id == 1) {
      fill(120, 255, 150);//HEALTH
      rect(x - 10, y - 10, 20, 20, 4);
      fill(200, 255, 220);
      rect(x - 3, y - 8, 6, 16);
      rect(x - 8, y - 3, 16, 6);
    } else if (id == 2) {
      fill(150, 0, 150);//ANTIHEALTH
      rect(x - 10, y - 10, 20, 20, 4);
      fill(200, 50, 200);
      pushMatrix();
      translate(x, y);
      rotate(PI / 4);
      translate(-x, -y);
      rect(x - 3, y - 8, 6, 16);
      rect(x - 8, y - 3, 16, 6);
      popMatrix();
    } else {
      fill(210, 100, 50);//NUKES
      rect(x - 10, y - 10, 20, 20, 4);
      fill(235, 150, 100);
      ellipse(x, y, 18, 18);
      fill(245, 200, 150);
      ellipse(x, y, 12, 12);
      fill(255, 250, 200);
      ellipse(x, y, 6, 6);
    }
  }
  
  int getID() {
    return id;
  }
}