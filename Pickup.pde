class Pickup extends Object {
  int id;

  Pickup(float x, float y, int id) {
    super(x, y, 20 - 50);
    this.id = id;
  }

  void drawPickup() {
    if (id == 1) {
      fill(120, 255, 150);//HEALTH
    } else {
      fill(130, 0, 130);//ANTIHEALTH
    }
    rect(x - 10, y - 10, 20, 20, 4);
  }
}