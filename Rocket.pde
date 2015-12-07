class Rocket extends Object {
  float size;
  int radius = 125;
  int shieldOp = 100;

  Rocket(float xPos, float yPos, float s) {
    super(xPos, yPos, 125);
    this.size = s;
  }

  void drawRocket() {
    pushMatrix();
    translate(x, y);
    scale(size);

    if (counter3 > 100) {
      //fire
      float firex[] = new float[7];
      float firey[] = new float[7];
      float fire2[] = new float[7];
      for (int i=0; i<7; i++) {
        firex[i] = random(-35+10*i, -25+10*i);
        if (i%2 == 0) {
          firey[i] = random(30, 50);
          fire2[i] = random(20, firey[i]-10);
        } else {
          firey[i] = random(10, 20);
          fire2[i] = random(0, firey[i]-10);
        }
      }

      noStroke();
      beginShape();
      vertex(-35, 60);
      for (int i=0; i<7; i++) {
        fill(200, 50, 0);
        vertex(firex[i], firey[i] + 60);
      }
      vertex(35, 60);
      endShape();
      beginShape();
      vertex(-30, 60);
      for (int i=0; i<7; i++) {
        fill(200, 150, 0);
        vertex(firex[i], fire2[i] + 60);
      }
      vertex(30, 60);
      endShape();
    }

    stroke(0);
    //wings
    fill(250, 100, 0);
    arc(-35, 60, 80, 120, 3*PI/4, TWO_PI);
    line(-35, 60, -35-40*sqrt(2)/2, 60*sqrt(2)/2 + 60);
    arc(35, 60, 80, 120, PI, 9*PI/4);
    line(35, 60, 35+40*sqrt(2)/2, 60*sqrt(2)/2 + 60);

    //body
    fill(250, 250, 200);
    rect(-70, -30, 140, 40); //part of blasters
    arc(0, 60, 110, 280, PI, TWO_PI);
    line(-55, 60, 55, 60);

    //window
    fill(220, 210, 220, 100);
    ellipse(0, 0, 50, 50);

    //blasters 
    noFill();
    stroke(0, 50, 0);
    strokeWeight(4);
    ellipse(-85, -15, 15, 50);
    ellipse(85, -15, 15, 50);

    //clubs 
    stroke(100);
    fill(120);
    line(-55, 30, -75, -60);
    line(-55, 30, -55, -60);
    line(55, 30, 80, -60);
    line(70, 30, 55, -60);
    line(65, 30, 70, -60);
    stroke(0);
    strokeWeight(1);

    pushMatrix();
    translate(-83, -60);
    rotate(-PI/8);
    ellipse(0, 0, 20, 10);
    popMatrix();

    ellipse(-48, -62, 16, 11);

    pushMatrix();
    translate(51, -60);
    rotate(-PI/8.5);
    ellipse(0, 0, 17, 6);
    popMatrix();

    pushMatrix();
    translate(85, -60);
    rotate(PI/8);
    ellipse(0, 0, 15, 10);
    popMatrix();

    pushMatrix();
    translate(70, -60);
    rotate(-PI/8);
    ellipse(0, 0, 10, 10);
    popMatrix();

    pushMatrix();
    scale(0.27);
    image(face, -58, -90);
    popMatrix();

    //SHIELD
    fill(255, shieldOp);
    noStroke();
    if (shield > 0) {
      ellipse(0, 0, radius * 2, radius * 2);
    }
    if (shield > 100) {
      ellipse(0, 0, radius * 2 + ((shield - 100) * 3), radius * 2 + ((shield - 100) * 3));
    }

    stroke(0);
    strokeWeight(1);
    fill(100, 150, 100);
    rect(-80, -50, 30, 90);
    rect(50, -50, 30, 90);

    popMatrix();

    //BOUNDING FOR ROCKET
    if (x < 120) {
      rx = 120;
    }
    if (x > width - 120) {
      rx = width - 120;
    }
    if (y < 80) {
      ry = 80;
    }
    if (y > 500) {
      ry = 500;
    }
  }

  void drawInfo() {
    //Logic for Shield
    fill(0);
    rect(13, 278, 13, 304);
    noStroke();
    if (shield <= 20) {
      fill(255, 100, 0);
    } else if (shield < 50 && shield > 20) {
      fill(240, 240, 0);
    } else {
      fill(100, 255, 0);
    }
    rect(15, 280 - (shield - 100) * 3, 10, shield * 3);
    if (shield > 100) {
      int sh = shield - 100;
      fill(160);
      rect(15, 280 - sh * 3, 10, sh * 3);
    }
    textSize(14);
    text("Shield Strength: " + shield, 5, height - 5);

    //Distance Traveled
    fill(255);
    text("Distance Traveled: " + distMoon, 400, height - 5);
    stroke(1);
    fill(255);
  }
}