abstract class Object {
  float x;
  float y;
  float rad;

  Object(float xPos, float yPos, float rad) {
    this.x = xPos;
    this.y = yPos;
    this.rad = rad;
  }

  boolean doesCollide(Object o) {
    if (o.rad + rad > sqrt(pow(o.x - x, 2) + pow(o.y - y, 2))) {
      return true;
    } else {
      return false;
    }
  }
}