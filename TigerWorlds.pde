//Xavier Graham, Ryan Cook, Jake Territo, Evin Killian, Jeremy Roberts
//Tiger Worlds

import processing.sound.*;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int anim = 0;
float counter = 0;
float rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT = 0;
float tx, ty;
float AD = 1;
float ADL = 1;
float ADL2 = 1;
float ADH = 1;
float ADT = 1;
PImage face;
PImage buzz;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
float p;
float pv;
boolean power;
PImage golf;

float ADC = 1;
float bx, by;
float rC;
float bx2, by2;
boolean space;
float twy;
float bx3, by3;
float ttx, tty, tS;
float bS;
int spacestop=0;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
float rx, ry, rvx, rvy;
float counter3;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int count4 = 0;

ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Pickup> pickups = new ArrayList<Pickup>();

boolean isGameOver = false;
boolean isGameComplete = false;
boolean isGameStart = false;
int shield = -10;
int distMoon = 0;
int tDead = 0;
int tAlive;
int rate = 1;

SoundFile kombat;
SoundFile pew;
SoundFile ouch;
SoundFile laser;
SoundFile boom;

PImage imgStatic;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 5~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
float tx5, ty5, t, t2, exUp;
color explosionColor, explosionColor2, explosionColor3, explosionColor4;
float TX1, TY1;
float ca, mtw;
float SM;
float cntr;
float tbx;
float dxm;
float dir;
float rRAB;
float inc;
SoundFile horn;
SoundFile pokeBattle;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
float healthB = 120;
float healthT = 120;
int fstage = 0;
PImage back;
PImage cena;
PImage buzzL;
int bCounter = 0;
float healthTo, healthBo;
int miss;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 7~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Page 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PImage earth;
float brkx, brky, brkvx, brkvy, brkx2, brky2, brks;
int counter8;



void setup() {
  size(600, 600);
  if (anim == 0) {
    setup0();
  } else if (anim == 1) {
    setup1();
  } else if (anim == 2) {
    //setup2();
    anim++;
    setup();
  } else if (anim == 3) {
    setup3();
  } else if (anim == 4) {
    setup4();
  } else if (anim == 5) {
    setup5();
  } else if (anim == 6) {
    setup6();
  } else if (anim == 7) {
    anim++;
    setup();
  } else if (anim == 8) {
    setup8();
  }
}

void draw() {
  if (anim == 0) {
    draw0();
  } else if (anim == 1) {
    draw1();
  } else if (anim == 2) {
    anim++;
  } else if (anim == 3) {
    draw3();
  } else if (anim == 4) {
    draw4();
  } else if (anim == 5) {
    draw5();
  } else if (anim == 6) {
    draw6();
  } else if (anim == 7) {
  } else if (anim == 8) {
    draw8();
  }
  if (anim > 8) {
    anim = 0;
    setup();
  }
}

void mousePressed() {
  //anim++;
  //setup();
  //if (anim > 6) {
  //anim = 0;
  //setup();
  //}
  if (anim == 4) {
    distMoon = 230000;
  }
  if (anim == 6) {
    mouse6();
  }
}

void keyPressed() {
  if (anim == 0) {
    keyp0();
  } else if (anim == 1) {
    keyp1();
  } else if (anim == 4) {
    keyp4();
  }
}

void keyReleased() {
  if (anim == 1) {
    keyr1();
  } else if (anim == 4) {
    keyr4();
  }
}

// Page 0
void setup0() {
  noStroke();
  ty = 580;
  face = loadImage("face.png");
  buzz = loadImage("buzz.png");
}
void draw0() {
  startscreen();
}
void keyp0() {
  anim++;
  setup();
}
void startscreen() {
  background(150);
  fill(#0DB4FF);
  rect(0, 0, 1000, 600);
  fill(#40FF03);
  rect(0, 600, 1000, 400);
  tiger(200, ty, 1, rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT);
  buzz(400, ty, 1, rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT);
  counter++;

  rLA = rLA + AD;
  rRA = rRA - AD;
  rLA2 = rLA2 + ADL2 * 3;
  rRA2 = rRA2 - ADL2 * 3;
  rLL = rLL + ADL * 2;
  rRL = rRL - ADL * 2;
  rH = rH + ADH * .6;
  rLL2 = rLL2 - ADL * 2;
  rRL2 = rRL2 + ADL * 2;
  rT = rT + ADT * .4;
  ty = ty + ADL;
  if (rLA == 0) {
    AD = 1;
    //counter++;
  } else if (rLA == 70) {

    AD = -1;
    // counter = counter - 1;
  }

  if (rLL == 0) {
    ADL = 1;
  } else if (rLL == 70) {
    ADL = -1;
  } else if ( rLA2 < -80) {
    ADL2 = 1;
  } else if (rLA2 > 50) {
    ADL2 = -1;
  } else if (rH > 20) {
    ADH = -1;
  } else if (rH < -20) {
    ADH = 1;
  } else if (rT > 11) {
    ADT = -1;
  } else if (rT < -11) {
    ADT = 1;
  }
  fill(random(0, 255), random(0, 255), random(0, 255));
  textSize(80);
  text("TIGER WORLDS", 10, 200);
  textSize(30);
  text("hit any button to start", 150, 250);
}


void tiger(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(.75);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(165, 104, 57);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-60, -360);
  translate(60, 140);
  rotate(radians(rH));
  translate(-60, -140);


  image(face, 0, 0);
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(232, 36, 50);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(165, 104, 57);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(232, 36, 50);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(165, 104, 57);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}


void buzz(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(.75);

  //hip
  fill(185);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(195);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(180);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-205, -715);
  translate(200, 500);
  rotate(radians(rH));
  scale(.35);
  translate(-200, -500);
  image(buzz, 0, 0);
  fill(#B8F0EE);
  stroke(180);
  strokeWeight(20);
  ellipse(200, 250, 600, 600);
  noStroke();
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(190);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(#F2CD9F);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(190);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(#F2CD9F);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(185);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}
// Page 1
void setup1() {
  pv=10;
  golf = loadImage("golf.jpg");
  golf.loadPixels();

  noStroke();
  ty = 580;
  face = loadImage("face.png");
  rC = 40;
  space = false;
  rLA = -12;
  rLA2 = -10;
  rRA = 27;
  rRA2 = 10;
  rLL = 0;
  rLL2 = 0;
  rRL = 0;
  rRL2 = 0;
  bx = 160;
  by = 570;
  rH = 0;
  bx2 = 0;
  by2 = 500;
  twy = 450;
  rT = 0;
  ttx = 202;
  tty = 344;
  tS = 0;
  bx3 = 0;
  by3 = 450;
  bS = 40;
  p = 0;
}
void draw1() {
  spacestop++;
  background(255);
  for (int y=3; y<golf.height-3; y+=6) {
    for (int x=3; x<golf.width-3; x+=6) {
      int loc = x + golf.width*y;
      noStroke();
      fill(golf.pixels[loc]);
      rect(x, y, 6, 6);
    }
  }
  //tear(202, 344, 1);
  if (bx==160) {
    powerbar();
  }
  tiger1(150, twy, .64, rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT);
  fill(250);
  ellipse(bx, by, 20, 20);
  if (space == true) {
    if (tty < 1000) {
      if (bx < 6000) {
        twy = 450;
        rLA = rLA - AD * .16;
        rLA2 = rLA2 + AD * 4;
        rRA = rRA + AD * .8;
        rC = rC + AD * .8;
        if (rLA2 > 40) {
          delay(200);
          AD = -1;
        } 
        if (rLA2 < -11) {
          //  rRA = rRA + AD;
          // rLA = rLA + AD; 
          //  rRA2 = rRA2  - AD;
          //  rLA2 = -12;
          AD = -.8;
          rC = rC - ADC * 4;
          if ( rC < -10) { 
            AD = 0;
            ADC = 0;
          }
        }

        if ( rLA2 < -13) {
          bx = bx + 15;
          by-= 13;
          if (rH > -32) {
            rH += -.4;
          } else if (rH <= -32) {
            rH = -32;
          }
        }
      }
      if (bx > 1800 && bx < 6000) {
        part2();
      }

      if (bx > 6000) {
        if (rRL > -10) {
          rRL = rRL + -.2;
          rLL = rLL + -.2;
          rRL2 = rRL2 + 2;
          rLL2 = rLL2 + 2;
          twy = twy + 1;
        } /*else if (rRL == -10) {
         rRL = -10;
         rLL = -10;
         rRL2 = 100;
         rLL2 = 100;
         rH = rH + .5;
         } */

        if (rRL < -10 && rRL > -30) {
          rT = rT + .5;
          if (rT >= 10) {
            rT = 10;
            rH = rH + .5;
            if (rH >= 20) {
              rH = 20;

              tear(ttx, tty, tS);
              tS = tS + .02;

              if ( tS >= 1.5) {
                tS = 1.5;
                tty = tty + 5;
              }
            }
          }
        }
      }
    } else {
      background(0);
      moon3(650, 200, 5); 
      bx3 = bx3 + 6;
      by3 = by3 - 3;
      fill(255);
      if (bS > 0) {

        bS = bS - .5;
      } else {
        bS = 0;
      }
      if (bx3 > 1000) {
        anim++;
        setup();
      }
      ellipse(bx3, by3, bS, bS);
    }
  }
  if (space==false) {
    textSize(20);
    fill(0);
    text("Press and hold SPACE to charge your swing", 50, 100);
  }
}


void powerbar() {
  stroke(50);
  strokeWeight(3);
  fill(255);
  rect(400, 50, 150, 20);
  fill(255, 0, 0);
  rect(400, 50, p, 20);
  if (power) {
    p+=pv;
    if (p >=150 || p<=0) {
      pv = -1*pv;
    }
  }
}
void tiger1(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {
  noStroke();
  pushMatrix();

  translate(tx, ty);
  scale(S);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);
  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  pushMatrix();

  //rotate(0);
  //torso

  rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(165, 104, 57);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-60, -360);
  translate(60, 140);
  rotate(radians(rH));
  translate(-60, -140);


  image(face, 0, 0);
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(232, 36, 50);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(165, 104, 57);
  rect(-85, -100, 30, 100);

  club();
  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(232, 36, 50);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(165, 104, 57);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();


  popMatrix();
}


void club() {

  pushMatrix();

  translate(-80, -20);
  translate(0, -20);
  rotate(radians(rC));
  translate(0, -20);
  fill(0);
  noStroke();
  rect(0, 0, 16, 70);

  fill(150);
  rect(2, 70, 12, 200);

  ellipse(-10, 262, 50, 37);

  stroke(100);
  strokeWeight(3);
  line(-22, 250, -21, 270);

  strokeWeight(2);
  line(-22, 251, 0, 254);
  line(-22, 256, 0, 257);
  line(-22, 260, 0, 260);
  line(-22, 264, 0, 263);
  line(-22, 269, 0, 267);

  noStroke();
  popMatrix();
}

void part2() {

  background(#81E7FF);

  bx2 = bx2 + 2;
  by2 = by2 - 1;

  ellipse(bx2, by2, 30, 30);

  drawCloud(200, 100, 2);
  drawCloud(350, 200, 1);
  drawCloud(500, 170, 1);
  drawCloud(550, 150, 2);
  drawCloud(400, 80, 1);
  drawCloud(100, 120, 3);
}


void tear(float tx, float ty, float S) {

  pushMatrix();

  translate(tx, ty);
  scale(S);
  fill(#0300FF);
  triangle(0, 0, 3, 10, -3, 10);
  ellipse(0, 14, 8, 12);

  popMatrix();
}


void moon3(float cx, float cy, float s) {
  pushMatrix();
  translate(cx, cy);
  scale(s);
  fill(180);
  stroke(100);
  ellipse(0, 0, 100, 100);
  fill(140);
  ellipse(5, 30, 20, 20);
  ellipse(-20, -25, 5, 5);
  ellipse(25, -27, 5, 5);
  ellipse(-20, 10, 30, 30);
  ellipse(20, -5, 25, 25);
  noStroke();
  arc(20, 20, 20, 20, 1.25*PI, 2.25*PI);
  fill(175);
  arc(20, 21, 15, 15, 1.25*PI, 2.25*PI);
  fill(140);
  arc(-5, -20, 20, 20, .8*PI, 2*PI);
  fill(175);
  arc(-6, -19, 15, 15, .8*PI, 2*PI);
  popMatrix();
}

void keyp1() {
  if (keyCode == 32) {
    power=true;
  }
}

void keyr1() {
  if (keyCode == 32) {
    power=false;   
    //p=500;

    if (key == ' '&& spacestop>30) {
      space = true;
    } else {
      space = false;
    }
  }
}

void drawCloud(float tx, float ty, float scaleF) {
  pushMatrix();

  noStroke();

  translate(tx, ty);
  scale(scaleF);

  fill(255);

  ellipse(0, 0, 100, 65);
  ellipse(-20, -13, 40, 55);
  ellipse(20, -13, 40, 55);
  ellipse(-20, 13, 40, 55);
  ellipse(20, 13, 40, 55);
  ellipse(30, 0, 60, 40);
  ellipse(-30, 0, 60, 40);

  popMatrix();
}
// Page 2


// Page 3
void setup3() {
  rx = 300;
  ry = 400;
  rvx = 0;
  rvy = 0;
  counter3 = 0;
}

void draw3() {
  background(150);
  fill(#0DB4FF);
  rect(0, 0, 600, 360);
  fill(#40FF03);
  rect(0, 360, 600, 240);

  pushMatrix();
  if (counter3 > 100 && counter3 < 160) {
    translate(random(-10, 10), random(-10, 10));
  }
  if (counter3 > 160) {
    rvy -= counter3 / 3;
  }
  Rocket rShake = new Rocket(rx, ry, 1);
  rShake.drawRocket();
  popMatrix();

  rx += rvx;
  ry += rvy;
  counter3++;
  if (counter3 > 240) {
    isGameStart = true;
    anim++;
    setup();
  }
}

// Page 4
void setup4() {
  rx = 300;
  ry = 500;
  rvx = rvy = 0;
  tAlive = -40;
  isGameOver = false;
  isGameStart = false;
  shield = 100;
  distMoon = 0;
  asteroids.clear();
  pickups.clear();
  stars.clear();
  bullets.clear();


  kombat = new SoundFile(this, "kombat.mp3");
  pew = new SoundFile(this, "pew.mp3");
  ouch = new SoundFile(this, "ouch.mp3");
  laser = new SoundFile(this, "laser.mp3");
  boom = new SoundFile(this, "boom.mp3");


  for (int i = 0; i < 120; i++) {
    stars.add(new Star((int)random(0, width), (int)random(0, height)));
  }
}

void draw4() {
  tAlive++;
  Rocket roc = new Rocket((int)rx, (int)ry, 0.6);

  if (!isGameOver) {
    if (isGameStart) {
      if (distMoon < 240000) {
        if (distMoon < 1) {
          kombat.play();
        }
        distMoon += 57;
        tDead = 0;
        background(12, 34, 56);

        for (Star s : stars) {
          s.drawStar();
          s.y = s.y + rate;
        }

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

        //Draw Pickups
        for (int q = 0; q < pickups.size(); q++) {
          Pickup p = pickups.get(q);

          p.drawPickup();
          p.y = p.y + rate;
          if (p.y < 0) {
            pickups.remove(p);
          }
        }

        //Draw Bullets
        for (int q = 0; q < bullets.size(); q++) {
          Bullet b = bullets.get(q);

          b.drawBullet();
          b.y = b.y - 10;
          if (b.y < 0) {
            bullets.remove(b);
          }
        }

        roc.drawRocket();
        rx += rvx;
        ry += rvy;
        if (tAlive > 0) {
          if (random(0, 100) < 40) {
            stars.add(new Star((int)random(0, width), 0));
          }

          if (random(0, 100) < 10 + tAlive / 200) {
            asteroids.add(new Asteroid((int)random(60, width - 60), 0, random(1, 3), random(0, 2 * PI), (int)random(3)));
          }
          if (asteroids != null) {
            for (int i = 0; i < asteroids.size(); i++) {
              Asteroid a = asteroids.get(i);

              a.drawAst();

              if (a.y < height + 25) {
                a.y += 5 / a.size;
              } else {
                asteroids.remove(a);
              }

              if (a.doesCollide(roc)) {
                ouch.play();
                if (shield > 2) {
                  shield -= a.size;
                  roc.shieldOp = 80;
                  asteroids.remove(a);
                } else {
                  isGameOver = true;
                }
              }

              for (Bullet b : bullets) {
                if (abs(b.x - a.x) < b.rad + 5 && abs(b.y - a.y) < b.rad + 5) {
                  asteroids.remove(a);

                  //drop pickup health
                  if (random(1, 101) <= 3) {    //3% Chance
                    pickups.add(new Pickup(a.x, a.y, 1));
                  }
                  //drop pickup antihealth
                  if (random(1, 101) <= 3) {    //3% Chance
                    pickups.add(new Pickup(a.x, a.y, 2));
                  }

                  boolean nukes = false;
                  for (Pickup p : pickups) {
                    if (p.getID() == 3) {
                      nukes = true;
                    }
                  }
                  //drop nukes
                  if (nukes == false && shield < 50 && random(1, 101) <= 7) {  //7% Chance
                    pickups.add(new Pickup(a.x, a.y, 3));
                  }

                  if (b.id == 0) {
                    bullets.remove(b);
                    break;
                  }
                }
              }
            }
            for (int w = 0; w < pickups.size(); w++) {
              Pickup p = pickups.get(w);

              if (p.doesCollide(roc)) {
                //IF HEALTH
                if (p.id == 1) {
                  if (shield < 120) {
                    shield += 30;
                  }

                  pickups.remove(p);
                } 

                //IF ANTIHEALTH
                if (p.id == 2) {
                  ouch.play();
                  if (shield > 30) {
                    shield -= 30;
                  } else {
                    isGameOver = true;
                  }

                  pickups.remove(p);
                }

                //IF NUKE
                if (p.id == 3) {
                  boom.play();
                  if (asteroids.size() > 0) {
                    asteroids.clear();
                  }
                  pickups.clear();
                }
              }
            }
          }
        }
      } else {
        isGameComplete = true;
      }
    } else {
      //PLACEHOLDER INSTRUCTIONS
      background(12, 34, 56);
      fill(255);
      stroke(0);
      rect(150, 150, 300, 300);
      fill(0);
      textSize(16);
      text("Tiger has to get to the moon", 155, 200);
      text("so he can get his ball!", 155, 220);
      text("Travel a distance of 240,000 miles", 155, 240);
      text("while dodging asteroids.", 155, 260);
      text("Use the arrow keys to move.", 155, 300);
      text("Collect pickups for health", 155, 320);
      text("and avoid the antimatter!", 155, 340);
      Pickup p1 = new Pickup(400, 310, 1);
      Pickup p2 = new Pickup(400, 340, 2);
      p1.drawPickup();
      p2.drawPickup();
      fill(0);
      text("Press spacebar to start.", 155, 360);
    }
  } else { //IF YOU LOSE THE GAME
    kombat.stop();
    shield = -10;
    distMoon = 0;
    tAlive = -40;
    if (tDead < 20) {
      staticScreen();
    }
    if (tDead < 30 && tDead > 20) {
      background(255);
    }
    if (tDead < 40 && tDead > 30) {
      staticScreen();
    }
    if (tDead > 40) {
      fill(255);
      background(255);
    }

    fill(0);
    textSize(18);
    for (int i = 0; i < 20; i++) {
      if (tDead - i > 0) {
        text("Error.", 10, 18 * i);
        if (tDead > 20) {
          text("GAME OVER.\nPress R to restart.", 10, 18 * (21));
        }
      }
    }
    tDead++;
  }

  //IF YOU WIN THE GAME
  if (isGameComplete) {
    kombat.stop();
    tAlive = -40;
    asteroids.clear();
    background(random(255), random(255), random(255));
    roc.drawRocket();
    fill(0);
    textSize(20);
    text("YOU WIN", random(100, 300), random(100, 300));
    count4++;
    if (count4 > 20) {
      anim++;
      setup();
    }
  }
}

void keyp4() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      rvx=-5;
    }
    if (keyCode == RIGHT) {
      rvx=5;
    }
    if (keyCode == UP) {
      rvy=-2;
    }
    if (keyCode == DOWN) {
      rvy=5;
    }
  }
  if (keyCode == 32) {
    if (!isGameStart) {
      isGameStart = true;
    }
    if (!isGameOver && isGameStart) {
      if (shield <= 100) {
        pew.play();
        bullets.add(new Bullet((int)rx + 45, 10, 0));
        bullets.add(new Bullet((int)rx - 45, 10, 0));
      } else {
        laser.play();
        bullets.add(new Bullet((int)rx + 45, 10, 1));
        bullets.add(new Bullet((int)rx - 45, 10, 1));
      }
    }
  }
  if (key == 'r' && tDead > 60) {
    anim--;
    isGameOver = false;
    setup();
  }
}
void keyr4() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (rvx==-5) {
        rvx=0;
      }
    }
    if (keyCode == RIGHT) {
      if (rvx==5) {
        rvx=0;
      }
    }
    if (keyCode == UP) {
      if (rvy==-2) {
        rvy=2;
      }
    }
    if (keyCode == DOWN) {
      if (rvy==5) {
        rvy=2;
      }
    }
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~STATIC~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
void staticScreen() {
  imgStatic = createImage(width, height, RGB);
  for (int y = 0; y < imgStatic.height; y++) {
    for (int x = 0; x < imgStatic.width; x++) {
      int loc = x + imgStatic.width * y;

      imgStatic.pixels[loc] = color(random(0, 255));
    }
  }
  image(imgStatic, 0, 0);
}

// Page 5
void setup5() {
  background(12, 34, 56);
  explosionColor = color(210, 0, 0);
  explosionColor2 = color(240, 125, 0);
  explosionColor3 = color(240, 240, 35);
  explosionColor4 = color(230, 70, 5);
  t=0;
  t2=0;
  tx5=0;
  ty5=0;
  exUp=0;
  counter = 0;
  TX1 = 300;
  TY1 = 400;
  SM = 3;
  face = loadImage("face.png");
  back = loadImage("back.png");
  horn = new SoundFile(this, "horn.mp3");
  pokeBattle = new SoundFile(this, "pokeBattle.mp3");
  mtw = 0;
  buzz = loadImage("buzz.png");
  dxm = 0;
  rRAB = 90;
  dir = 1;
  inc = 0;
}
void draw5() {
  background(12, 34, 56);
  fill(128);
  moon(450, 150, 1+(tx5/40));
  if (t2 <= 1250) {
    spaceship5(150+5*sin(tx5), 450+5*sin(ty5));
  } else if (t2 >= 1275 && t2 <= 1300) {
    spaceship5(150, 450);
  } else if (t2 >= 1325 && t2 <= 1350) {
    spaceship5(150, 450);
  } else if (t2 >= 1375 && t2 <= 1400) {
    spaceship5(150, 450);
  }
  if (t <= 950) {
    t+=2;
  }
  if (tx5 <= t && ty5 <= t) {
    tx5+=2;
    ty5+=2;
  }
  if (t == 950) {
    t2 = 951;
  }
  if (t2 > 950 && t2 <= 1250) {
    t2++;
    explosion(150, 450);
    explosion(150, 450);
  } else if (t2 > 1250) {
    t2++;

    background(0);
    counter++;

    if (counter >= 150 && counter < 300) {
      background(180);
      if (counter == 150) {
        horn.play();
      }
      //tigerlegs(TX1 + 30, TY1 + 30, .25);
      spaceship_broken(TX1, TY1, PI/4, 2);
      TX1= TX1 - .5;
      TY1 = TY1 - .3;
    } else if (counter >= 300 && counter < 450) {
      background(0);
      TX1 = 300;
      TY1 = 250;
    } else if (counter >=450 && counter < 600) {
      if (counter == 450) {
        horn.play();
      }
      background(180);
      tigerlegs(TX1 + -200, TY1 + 100, .5, 51);
      spaceship_broken(TX1, TY1, -PI/4, 2);

      TX1 = TX1 + .25;
      TY1 = TY1 + .25;
    } else if (counter >=600 && counter < 750) {
      background(0);
    } else if (counter >= 750 && counter < 1000) {
      if (counter == 750) {
        horn.play();
      }
      moon(300, 300, SM);
      SM+= -.003;
    } else if (counter >= 1000 && counter < 1200) {
      background(0);
    } else if (counter >= 1200) {
      background(180);
      cntr = cntr + 1;
      int rotationH = 0;
      if (cntr > 600) {
        rotationH = -36;
      }
      tiger5(252 + mtw, 222 - mtw / 2, .35, 124 - ca, 62 + ca * 2, -144 + ca, -52 - ca * 2, 0, 0, 0, 0, rotationH, 0, -298);
      strokeWeight(1);
      spaceship_broken(TX1 - 96, TY1, -2, 1.8);
      if (cntr < 60) {
        //delay(1000);
        ca = ca +.5 ;
        mtw = mtw + .2;
      } else if (cntr < 120 ) {
        mtw = mtw + 0;
        ca = ca - .5;
      } else if ( cntr < 180) {
        mtw = mtw + .2;
        ca = ca + .5;
      } else if ( cntr < 240) {
        mtw = mtw + 0;
        ca = ca - .5;
      } else if ( cntr < 300) {
        mtw = mtw + .2;
        ca = ca + .5;
      } else if ( cntr < 360) {
        mtw = mtw + 0;
        ca = ca - .5;
      } else if ( cntr < 420) {
        mtw = mtw + .2;
        ca = ca + .5;
      } else if ( cntr >= 420) {
        mtw = mtw + 0;
        ca = ca - 0;

        buzz5(654 - tbx, 206, .35, -2, rRAB, -30, 34, 0, 0, 0, 0, 2, 0, dxm);

        if ( tbx < 170) {
          tbx = tbx + 1;
        } else {
          tbx = 170;
        }
        dxm = - abs(sin((cntr- 420)/20) )* 150;
        if (dxm > -30) {
          rRAB = 78;
        } else {
          rRAB = 90;
        }

        if (cntr >= 600 && cntr < 700) {
          fill( 0, 0, 0);
          ellipse( 386, 72, 10, 36);
          ellipse( 386, 104, 10, 10);
        }


        if (cntr >= 750 && cntr < 900) {
          textSize(14);
          fill(0);
          text("Hello, Tiger Woods...", 280, 50);
        }
        if (cntr >= 900 && cntr < 1150) {
          textSize(14);
          fill(0);
          text("Did you know I was", 280, 50);
          text("the second man on", 280, 70);
          text("the moon?...", 280, 90);
        }
        if (cntr >= 1150) {
          textSize(18);
          fill(0);
          text("NEIL BEFORE", 320, 50);
          text("ME!!!", 320, 80);
          if(cntr > 1190 && cntr < 1192) {
            pokeBattle.play();
          }
        }

        if (cntr >= 1300) {
          inc = inc + 4;
          for (int i=0; i < 20; i++) {
            rect(0, i*30, inc, 15);
          }
          for (int i=0; i<20; i++) {
            rect(600, 15+i*30, -inc, 15);
          }
          if (cntr > 1500) {
            anim++;
            setup();
          }
        }
      }
    }
  }
}

void spaceship_broken(float x, float y, float r, float S) {
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(S);
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
  vertex(-35, 0);
  for (int i=0; i<7; i++) {
    fill(200, 50, 0);
    vertex(firex[i], firey[i]);
  }
  vertex(35, 0);
  endShape();
  beginShape();
  vertex(-30, 0);
  for (int i=0; i<7; i++) {
    fill(200, 150, 0);
    vertex(firex[i], fire2[i]);
  }
  vertex(30, 0);
  endShape();
  stroke(0);
  //wings
  fill(250, 100, 0);
  arc(-35, 0, 80, 120, 3*PI/4, TWO_PI);
  line(-35, 0, -35-40*sqrt(2)/2, 60*sqrt(2)/2);
  arc(35, 0, 80, 120, PI, 9*PI/4);
  line(35, 0, 35+40*sqrt(2)/2, 60*sqrt(2)/2);
  //body
  pushMatrix();

  rotate(PI/3);
  fill(250, 250, 200);
  rect(-30, -110, 140, 40); //part of blasters
  arc(0, 0, 110, 280, PI, TWO_PI);
  line(-55, 0, 55, 0);

  popMatrix();
  //window
  fill(220, 210, 220, 100);
  ellipse(0, -60, 50, 50);
  //blasters 
  noFill();
  stroke(0, 50, 0);
  strokeWeight(4);
  ellipse(-85, -75, 15, 50);
  ellipse(85, -75, 15, 50);
  //clubs 
  stroke(100);
  fill(120);
  line(-55, -30, -75, -120);
  line(-55, -30, -55, -120);
  line(55, -30, 80, -120);
  line(70, -30, 55, -120);
  line(65, -30, 70, -120);
  stroke(0);
  strokeWeight(1);

  pushMatrix();
  translate(-50, -170);
  rotate(-PI/2);
  ellipse(0, -10, 20, 10);
  popMatrix();

  ellipse(-20, -122, 16, 11);

  pushMatrix();
  translate(47, -150);
  rotate(-PI/8.5 + 2);
  ellipse(0, 2, 17, 6);
  popMatrix();

  pushMatrix();
  translate(85, -120);
  rotate(PI/2);
  ellipse(0, 0, 15, 10);
  popMatrix();

  pushMatrix();
  translate(70, -120);
  rotate(-PI/8);
  ellipse(0, 0, 10, 10);
  popMatrix();

  stroke(0);
  strokeWeight(1);
  fill(100, 150, 100);
  rect(-80, -110, 30, 90);
  rect(50, -110, 30, 90);
  popMatrix();
}

void moon(float cx, float cy, float s) {
  pushMatrix();
  translate(cx, cy);
  scale(s);
  fill(180);
  stroke(100);
  ellipse(0, 0, 100, 100);
  fill(140);
  ellipse(5, 30, 20, 20);
  ellipse(-20, -25, 5, 5);
  ellipse(25, -27, 5, 5);
  ellipse(-20, 10, 30, 30);
  ellipse(20, -5, 25, 25);
  noStroke();
  arc(20, 20, 20, 20, 1.25*PI, 2.25*PI);
  fill(175);
  arc(20, 21, 15, 15, 1.25*PI, 2.25*PI);
  fill(140);
  arc(-5, -20, 20, 20, .8*PI, 2*PI);
  fill(175);
  arc(-6, -19, 15, 15, .8*PI, 2*PI);
  popMatrix();
}

void drawExplosion(float x, float y, float xMin, float xMax, float yMin, float yMax) {
  fill(210, 0, 0);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 100), random(0, 50));
  fill(240, 125, 0);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 50), random(0, 100));
  fill(240, 240, 35);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 100), random(0, 50));
  fill(230, 70, 5);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 50), random(0, 100));
}

void explosion(float x, float y) {
  pushMatrix();
  noStroke();
  translate(x, y);
  scale(exUp);
  translate(-x, -y);
  drawExplosion(150, 450, -50, 50, -50, 50);
  drawExplosion(150, 450, -100, 100, -100, 100);
  drawExplosion(150, 450, -50, 50, -100, 100);
  drawExplosion(150, 450, -100, 100, -50, 50);
  drawExplosion(150, 450, -50, 100, -50, 100);
  drawExplosion(150, 450, -100, 50, -100, 50);
  popMatrix();
  if (exUp <= 2) {
    exUp += 0.1;
  }
}
void spaceship5(float x, float y) {
  pushMatrix();
  translate(x, y);
  rotate(PI/4.0);
  Rocket roc5 = new Rocket(0, 0, 1);
  roc5.drawRocket();
  popMatrix();
}

void tigerlegs(float tx, float ty, float S, float R) {
  noStroke();
  pushMatrix();

  translate(tx, ty);
  rotate(radians(R));
  scale(S);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);
  pushMatrix();

  //leg-left
  translate(-56, 0);
  //rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  //rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  //rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  //rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();

  pushMatrix();

  //rotate(0);
  //torso

  //rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);
  popMatrix();
  popMatrix();
}

void tiger5(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT, float rTW) {

  pushMatrix();

  translate(tx, ty);
  rotate(radians(rTW));
  scale(S);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);
  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(165, 104, 57);
  rect(-20, -250, 40, 60);

  pushMatrix();
  if (cntr > 600) {
    translate(-60, -360);
    translate(60, 140);
    rotate(radians(rH));
    translate(-60, -140);
    image(face, 0, 0);
  } else {
    translate(-110, -433);
    translate(60, 140);
    rotate(radians(rH));
    scale(.50);
    translate(-60, -140);
    image(back, 0, 0);
  }
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(232, 36, 50);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(165, 104, 57);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(232, 36, 50);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(165, 104, 57);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();


  popMatrix();
}

void buzz5(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT, float dxm) {
  noStroke();
  pushMatrix();

  translate(tx, ty);
  scale(S);

  //hip
  fill(185);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(195);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(180);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-205, -715);
  translate(200, 500);
  rotate(radians(rH));
  scale(.35);
  translate(-200, -500);
  fill(100);
  stroke(180);
  strokeWeight(20);
  ellipse(200, 250, 600, 600);
  image(buzz, 0, 0);
  noStroke();
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(190);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(#F2CD9F);
  rect(-85, -100, 30, 100);

  fill(255);
  pushMatrix();
  translate(dxm, 0);
  ellipse(-72, -10, 30, 30);

  popMatrix();

  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(190);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(#F2CD9F);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(185);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}

// Page 6
void setup6() {
  buzz = loadImage("buzz.png");
  cena = loadImage("cena.png");
  buzzL = loadImage("buzzL.png");
}
void draw6() {
  battle();
}
void mouse6() {
  if (400<mouseX && 500>mouseX && 150<mouseY && 300> mouseY) {
    healthB=0;
  }
  if (fstage==0) {
    if (310< mouseX && 440>mouseX && 480<mouseY && 535> mouseY) {
      fstage=1;
      miss = int(random(0, 3));
      bCounter = 0;
      healthBo=healthB;
      healthTo=healthT;
    }
    if (310< mouseX && 440>mouseX && 540<mouseY && 595> mouseY) {
      fstage=2;
      bCounter = 0;
      healthBo=healthB;
      healthTo=healthT;
    }
    if ( 445 < mouseX && 575>mouseX && 480<mouseY &&535 >mouseY) {
      fstage=3;
      bCounter = 0;
      healthBo=healthB;
      healthTo=healthT;
    }
    if (  445 < mouseX && 575>mouseX && 540<mouseY &&595 >mouseY) {
      fstage=4;
      miss = int(random(0, 8));
      bCounter = 0;
      healthBo=healthB;
      healthTo=healthT;
    }
  }
  if (healthT<=0) {
    healthT=120;
    healthB=120;
    fstage=0;
    bCounter=0;
  }
  if (healthB<=0) {
    anim++;
    setup();
  }
}
void battle() {
  if (healthB<=0) {
    pokeBattle.stop();
    fill(255);
    rect(0, 0, width, height);
    textSize(70);
    fill(0);
    text("YOU WIN", width/4, height/2);
    textSize(30);
    text("click to continue", width/4+30, height/2+100);
  } else {
    if (healthT <= 0) {
      pokeBattle.stop();
      fill(255);
      rect(0, 0, width, height);
      textSize(50);
      fill(0);
      text("GAME OVER", width/4, height/2);
      textSize(30);
      text("click to retry", width/4+50, height/2+100);
    } else {
      stroke(0);
      strokeWeight(1);
      background(12, 34, 56);

      //Moon ground
      fill(128);
      ellipse(300, 520, 1200, 750);

      //Tiger Worlds circle
      fill(170);
      ellipse(150, 420, 300, 100);

      //Buzz circle
      fill(170);
      ellipse(450, 270, 200, 70);

      //buzzstatus
      fill(255);
      rect(0, 50, 300, 80);
      fill(0);
      textSize(30);
      text("Buzz Aldrin", 10, 85);
      textSize(20);
      text("Lv 85", 200, 85);
      noStroke();
      fill(100);
      rect(100, 95, 150, 20);
      fill(0, 255, 0);
      rect(128, 97, healthB, 16);
      fill(#F7D62D);
      textSize(20);
      text("HP", 100, 115);

      //tigerstatus
      fill(255);
      rect(300, 350, 300, 80);
      fill(0);
      textSize(30);
      text("Tiger Woods", 310, 385);
      textSize(20);
      text("Lv 39", 500, 385);
      noStroke();
      fill(100);
      rect(400, 395, 150, 20);
      fill(0, 255, 0);
      rect(428, 397, healthT, 16);
      fill(#F7D62D);
      textSize(20);
      text("HP", 400, 415);
      fill(0);
      textSize(10);
      text((int)healthT + "/120", 500, 425);
      fill(232, 227, 227);
      rect(0, 470, width, 130);
      //Interaction Bar
      if (fstage == 0) {
        //Left text box
        fill(255, 221, 23);
        rect(10, 480, 280, 110, PI);
        fill(95, 93, 80);
        rect(15, 485, 270, 100, PI);
        fill(255);
        rect(20, 490, 260, 90, PI);
        fill(0);
        textSize(30);
        text("What will", 25, 530);
        text("Mr.Woods do?", 25, 560);
        //Right buttons
        if (310< mouseX && 440>mouseX && 480<mouseY && 535> mouseY) {
          fill(255, 0, 0);
        } else {
          fill(150, 60, 26);
        }
        rect(310, 480, 130, 55, PI);
        fill(255);
        textSize(18);
        text("BODY-SLAM", 320, 510);


        if ( 310< mouseX && 440>mouseX && 540<mouseY && 595> mouseY) {
          fill(0, 255, 0);
        } else {
          fill(63, 142, 56);
        }
        rect(310, 540, 130, 55, PI);
        fill(255);
        textSize(18);
        text("HEAL", 355, 570);

        if ( 445 < mouseX && 575>mouseX && 480<mouseY &&535 >mouseY) {
          fill(243, 243, 32);
        } else {
          fill(232, 164, 26);
        }
        rect(445, 480, 130, 55, PI);
        fill(255);
        textSize(18);
        text("RUN", 475, 510);

        if ( 445 < mouseX && 575>mouseX && 540<mouseY &&595 >mouseY) {
          fill(0, 0, 255);
        } else {
          fill(62, 100, 193);
        }
        rect(445, 540, 130, 55, PI);
        fill(255);
        textSize(18);
        text("FIST OF FURY", 450, 570);
      }
      if (fstage==0 || fstage==2 || fstage==10 || fstage==8) {
        buzz6(450, 200, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
      }
      if (fstage==0|| fstage==10 || fstage==5 || fstage==8) {
        tiger6(137, 373, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
      }
      if (fstage == 1) {
        bCounter++;
        if (bCounter <120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Tiger used BODY-SLAM!", 30, 550);
          tiger6(137, 373, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          if (miss!= 1) {
            if (bCounter > 80) {
              if (healthBo-40<1) {
                healthB-= healthBo/30;
              } else {
                healthB-=1;
              }
            }
          }
          if (bCounter<=80) {
            buzz6(450, 200, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          } else {
            buzz6(450-bCounter%5, 200, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          }
          image(cena, 200, -400+bCounter*4);
        } else {
          if (miss==1) {
            fstage=8;
          } else {
            fstage = 10;
          }
          bCounter=0;
        }
      }
      if (fstage == 2) {
        bCounter++;
        if (bCounter <120) {
          tiger6(137, 373, .5, 1+bCounter, 1+bCounter*.5, 1-bCounter, 1-bCounter*.5, 1, 1, 1, 1, 1, 1);
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Tiger used HEAL!", 30, 550);
          fill(0, 255, 0, 150);
          for (int j = 0; j <20; j++) {
            ellipse(random(50, 250), random(400-bCounter*2, 450), 10, 20);
          }
          if (healthT<120) {
            healthT+=.5;
          }
        } else {
          fstage = 10;
          bCounter=0;
        }
      }
      if (fstage == 3) {
        bCounter++;
        if (bCounter <120) {
          tiger6(137, 373, .5, 1+bCounter*.35, 1+bCounter*.9, 1-bCounter*.35, 1-bCounter*.9, 1, 1, 1, 1, 1, 1);
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("YOU CAN'T RUN AWAY!", 30, 550);
          buzz6(450, 200, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
        } else {
          fstage = 10;
          bCounter=0;
        }
      }
      if (fstage == 4) {
        bCounter++;
        if (bCounter <120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Tiger used FIST OF FURY!", 30, 550);
          if (bCounter>100) {
            buzz6(450-bCounter%5, 200, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
            pushMatrix();
            translate(450, 100);
            stroke(0);
            strokeWeight(1);
            fill(255, 0, 0);
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
            popMatrix();
            fill(232, 227, 89);
            textSize(30);
            text("POW", 410, 110);
          } else {
            buzz6(450, 200, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          }
          tiger6(137+bCounter*2, 373-bCounter*1.25, .5, 1, 1, 1-bCounter/2, 1-bCounter, 1, 1, 1, 1, 1, 1);
          if (miss!=1 && bCounter>100) {
            if (healthBo-30<1) {
              healthB-= healthBo/10;
            } else {
              healthB-=1.333;
            }
          }
        } else {
          if (miss==1) {
            fstage=8;
          } else {
            fstage = 10;
          }
          bCounter=0;
        }
      }
      if (fstage==10) {
        bCounter++;
        if (bCounter < 120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Buzz is thinking...", 30, 550);
        } else {
          if (healthB<60) {
            fstage=int(random(5, 8));
            healthTo=healthT;
            healthBo=healthB;
            bCounter=0;
          } else {
            healthTo=healthT;
            healthBo=healthB;
            fstage=int(random(6, 8));
            bCounter=0;
          }
        }
      }
      if (fstage==5) {
        bCounter++;
        if (bCounter < 120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Buzz used Heal!", 30, 550);
          healthB+=.25;
          buzz6(450, 200, .5, 1+bCounter, 1+bCounter*.5, 1-bCounter, 1-bCounter*.5, 1, 1, 1, 1, 1, 1);
          fill(255, 0, 255, 150);
          for (int j = 0; j <20; j++) {
            ellipse(random(375, 525), random(250-bCounter*2, 300), 10, 20);
          }
        } else {
          fstage=0;
        }
      }
      if (fstage==6) {
        bCounter++;
        if (bCounter < 120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Buzz used HYPERBEAM!", 30, 550);
          if (bCounter<25) {
            buzz6(450, 200, .5, 1+bCounter*1.5, 1+bCounter*1, 1, 1, 1, 1, 1, 1, 1, 1);
          } else {
            if (healthTo-30<1) {
              healthT-= healthTo/85;
            } else {
              healthT-=.316;
            }
            //beam
            pushMatrix();
            translate(150, 255);
            rotate(-.5);
            noStroke();
            if (bCounter%3==0) {
              fill(0, 0, 255, 150);
            }
            if (bCounter%3==1) {
              fill(0, 0, 150, 150);
            }
            if (bCounter%3==2) {
              fill(0, 0, 50, 150);
            }
            rect(0, 0, 175, 9);
            popMatrix();
            buzz6(450, 200, .5, 1+25*1.5, 1+25, 1, 1, 1, 1, 1, 1, 1, 1);
            //lasergun
            pushMatrix();
            translate(350, 150);
            rotate(-.5);
            scale(.3);
            noStroke();
            fill(150);
            rect(-200, -5, 100, 10);
            stroke(0);
            noFill();
            arc(-160, 0, 10, 30, .1*PI, 1.9*PI);
            arc(-180, 0, 10, 30, .1*PI, 1.9*PI);
            noStroke();
            pushMatrix();
            rotate(-.17*PI);
            translate(0, 40);
            fill(#CEBA04);
            ellipse(0, 0, 40, 100);
            popMatrix();
            fill(#F0D90A);
            ellipse(-50, 0, 200, 40);
            for (int i=0; i<360; i++) {
              float tx = (5-.7)*cos(radians(i))+7*cos((5/.7-1)*radians(i))-80;
              float ty = (5-.7)*sin(radians(i))-7*sin((5/.7-1)*radians(i));
              fill(0, 0, 255);
              ellipse(tx, ty, 1, 1);
            }
            popMatrix();
          }
          if (bCounter>25) {
            tiger6(137-bCounter%5, 373, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          } else {
            tiger6(137, 373, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          }
        } else {
          fstage=0;
        }
      }
      if (fstage==7) {
        bCounter++;
        if (bCounter < 120) {
          buzz6(450, 200, .5, 1+bCounter*.75, 1+bCounter*.5, 1, 1, 1, 1, 1, 1, 1, 1);
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          pushMatrix();
          translate(700-bCounter*10, 300);
          scale(.4);
          rotate(-.5);
          image(buzzL, 0, 0);
          popMatrix();
          text("Buzz used TAG TEAM!", 30, 550);
          if (bCounter>70) {
            tiger6(137-bCounter%3, 373, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          } else {
            tiger6(137, 373, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
          }
          if (healthTo-48<1) {
            healthT-= healthTo/110;
          } else {
            healthT-=.4;
          }
        } else {
          fstage=0;
        }
      }
      if (fstage==8) {
        bCounter++;
        if (bCounter < 120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("It missed!", 30, 550);
        } else {
          fstage=10;
        }
      }
    }
  }
}

void buzz6(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(S);

  //hip
  fill(185);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(195);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(180);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-205, -715);
  translate(200, 500);
  rotate(radians(rH));
  scale(.35);
  translate(-200, -500);
  fill(100);
  stroke(180);
  strokeWeight(20);
  ellipse(200, 250, 600, 600);
  image(buzz, 0, 0);
  noStroke();
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(190);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(#F2CD9F);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(190);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(#F2CD9F);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(185);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}


void tiger6(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(S);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(165, 104, 57);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-110, -433);
  translate(60, 140);
  rotate(radians(rH));
  scale(.65);
  translate(-60, -140);


  image(back, 0, 0);
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(232, 36, 50);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(73, 50, 42);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(232, 36, 50);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(73, 50, 42);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();
  popMatrix();
  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}
// Page 7
// Page 8
void setup8() {
  earth = loadImage("Earth.png");
  brkx = 300;
  brky = 380;
  brks = 2;
}
void draw8() {
  stroke(0);
  background(12, 34, 56);
  if (counter8 <= 240) {
    pushMatrix();
    translate(0, 200);
    //Moon ground
    fill(128);
    ellipse(300, 520, 1200, 750);

    //Tiger Worlds circle
    fill(170);
    ellipse(150, 420, 300, 100);

    //Buzz circle
    fill(170);
    ellipse(450, 270, 200, 70);
    popMatrix();
    pushMatrix();
    if (counter8 > 100 && counter8 < 160) {
      translate(random(-10, 10), random(-10, 10));
    }
    if (counter8 > 160) {
      brkvy -= counter8 / 3;
    }
    spaceshipbuzz(brkx, brky);
    popMatrix();
    brkx += brkvx;
    brky += brkvy;
  } else if (counter8 == 240) {
    brkx2 = brky2 = -20;
  } else {
    brkvx = brkvy = 5;
    image(earth, 100, 100);
    if (brks > 0) {

      pushMatrix();
      translate(brkx2, brky2);
      rotate(3*PI/4);
      scale(brks);
      spaceshipbuzz(0, 0);
      popMatrix();
      brkvx -= .1;
      brkvy -= .1;
      brkx2 += brkvx;
      brky2 += brkvy;
      brks -= .025;
    } else if (counter8 > 320 && counter8 < 340) {

      starthing(400, 400);
    } else if (counter8 > 340 && counter8 < 595) {
      fill(0, counter8 - 340);
      rect(0, 0, width, height);
    }
  }
  if (counter8 >= 595) {
    fill(0);
    rect(0, 0, width, height);
    anim++;
    setup();
  }
  counter8++;
}

void starthing(float cx, float cy) {
  fill(255);
  noStroke();
  pushMatrix();
  translate(cx, cy);
  rotate(radians(10*counter8));
  beginShape();
  for (int i=0; i<360; i+=60) {
    float x, y;
    if (i%120 == 0) {
      x = 20*cos(radians(i));
      y = 20*sin(radians(i));
    } else {
      x = 4*cos(radians(i));
      y = 4*sin(radians(i));
    }
    vertex(x, y);
  }
  endShape();
  popMatrix();

  pushMatrix();
  translate(cx, cy);
  rotate(radians(-10*counter8));
  beginShape();
  for (int i=0; i<360; i+=60) {
    float x, y;
    if (i%120 == 0) {
      x = 4*cos(radians(i));
      y = 4*sin(radians(i));
    } else {
      x = 20*cos(radians(i));
      y = 20*sin(radians(i));
    }
    vertex(x, y);
  }
  endShape();
  popMatrix();
}


void spaceshipbuzz(float x, float y) {
  pushMatrix();
  translate(x, y);
  //fire
  if (counter8 > 100) {
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
    vertex(-35, 0);
    for (int i=0; i<7; i++) {
      fill(200, 50, 0);
      vertex(firex[i], firey[i]);
    }
    vertex(35, 0);
    endShape();
    beginShape();
    vertex(-30, 0);
    for (int i=0; i<7; i++) {
      fill(200, 150, 0);
      vertex(firex[i], fire2[i]);
    }
    vertex(30, 0);
    endShape();
    stroke(0);
  }
  //ship
  strokeWeight(2);
  line(-70, -45, -100, 45);
  line(70, -45, 100, 45);
  line(-70, -45, -50, -50);
  line(70, -45, 50, -50);
  line(-70, -45, -50, 0);
  line(70, -45, 50, 0);
  line(-85, 0, 85, 0);
  line(-105, 45, -95, 45);
  line(105, 45, 95, 45);

  line(0, -125, 0, -145);
  strokeWeight(1);

  pushMatrix();
  translate(8, -150);
  rotate(PI/4);
  fill(100);
  line(-10, 0, 10, 0);
  arc(0, 0, 20, 20, 0, PI);
  popMatrix();

  fill(70);
  ellipse(0, -80, 90, 90);

  fill(220, 210, 220, 100);
  ellipse(0, -75, 40, 40);


  fill(70, 70, 0);
  beginShape();
  vertex(-50, 0);
  vertex(-50, -50);
  vertex(50, -50);
  vertex(50, 0);
  vertex(-50, 0);
  endShape();

  popMatrix();
}