class Asteroid extends Object {
  float size;
  float r = .1;
  float rot;
  int id;

  Asteroid(float xPos, float yPos, float s, float ro, int ID) {
    super(xPos, yPos, s * .1 - 44);
    this.size = s;
    this.rot = ro;
    this.id = ID;
  }

  void drawAst() {
    if (id == 0) {
      pushMatrix();
      translate(x, y);
      rotate(rot);
      scale(r * size);
      stroke(0);
      fill(#9D7D7D);
      beginShape();
      vertex(50, 0);
      vertex(40, 10);
      vertex(20, 40);
      vertex(-10, 50);
      vertex(-30, 20);
      vertex(-40, 5);
      vertex(-60, 0);
      vertex(-50, -10);
      vertex(-20, -40);
      vertex(0, -50);
      vertex(10, -40);
      vertex(30, -20);
      vertex(50, 0);
      endShape();
      noStroke();
      fill(#6C5F5F, 150);
      ellipse(5, 10, 25, 30);
      ellipse(-25, -10, 15, 10);
      popMatrix();
    }

    if (id == 1) {
      pushMatrix();
      translate(x, y);
      rotate(rot);
      scale(r * size);
      stroke(0);
      fill(#9D7D7D);
      beginShape();
      vertex(30, 0);
      vertex(40, 10);
      vertex(60, 40);
      vertex(-20, 50);
      vertex(-34, 20);
      vertex(-50, 5);
      vertex(-55, 0);
      vertex(-40, -10);
      vertex(-30, -40);
      vertex(0, -50);
      vertex(10, -40);
      vertex(30, -20);
      vertex(50, 0);
      vertex(30, 0);
      endShape();
      noStroke();
      fill(#6C5F5F, 150);
      ellipse(5, 20, 40, 20);
      ellipse(-15, -20, 15, 10);
      popMatrix();
    }

    if (id == 2) {
      pushMatrix();
      translate(x, y);
      rotate(rot);
      scale(r * size);
      stroke(0);
      fill(#9D7D7D);
      beginShape();
      vertex(50, 0);
      vertex(60, 10);
      vertex(40, 40);
      vertex(-10, 50);
      vertex(-24, 20);
      vertex(-40, 5);
      vertex(-65, 0);
      vertex(-50, -10);
      vertex(-20, -40);
      vertex(0, -50);
      vertex(30, -40);
      vertex(60, -20);
      vertex(30, 0);
      vertex(50, 0);
      endShape();
      noStroke();
      fill(#6C5F5F, 150);
      ellipse(5, 20, 15, 20);
      ellipse(25, -20, 35, 20);
      popMatrix();
    }
  }
}