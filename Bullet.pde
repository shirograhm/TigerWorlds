class Bullet extends Object {
  int id;

  Bullet(float x, int r, int ID) {
    super(x, ry - 80, r);
    this.id = ID;
  }

  void drawBullet() {
    if (id == 1) {//LAZORS
      ellipse(x, y, rad / 2, rad * 8);
    } else {
      ellipse(x, y, rad, rad);
    }
  }
}