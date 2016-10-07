//  In the checkPositions() function, thanks to Keith Peters for Law Of Cosines Approach to bones: http://flylib.com/books/en/4.261.1.96/1/

int numberOfBones = 2; 
int numberOfFeathers = 5;
color boneColor = color(200);
color jointColor = color(255);
float stdBoneLength = 75;
Bone allBones[] = new Bone[numberOfBones];
PVector anchorPoint, h;
PVector m1[] = new PVector[3];
PVector m2[] = new PVector[3];
PVector m3[] = new PVector[3]; 
PVector wt1[] = new PVector[3];
PVector wt2[] = new PVector[3];
PVector b1[] = new PVector[3];
PVector b2[] = new PVector[3];
PVector b3[] = new PVector[3];
PVector b4[] = new PVector[3];
PVector ctr[] = new PVector[3];
PVector t1[] = new PVector[3];
PVector t2[] = new PVector[3];
float reach = 0;
float jointDiam = 10;
float boneLengths[] = {
  100, 175
};
float spreadAngle;
float gFactor = random(255);
float bFactor = random(255);
float gDir = 1;
float bDir = 1;

void setup () {
  size(1100, 700);
  anchorPoint = new PVector (width/2 + width/15, height/4);
  ellipseMode(CENTER);
  initBones();
  initPoints();
}

void draw () {
  background(50, bFactor, gFactor, 125);
  stroke(jointColor);
  strokeWeight(1);
  checkPositions();
//  for (int i = 0; i < numberOfBones; i ++) {
//    allBones[i].display();
//  }
  resetPoints();
//  drawKeyPoints();
  drawFeatherFields();
  mirrorImage();
  spreadAngle = degrees(atan2(int(100-allBones[1].far.y), int(600-allBones[1].far.x)))+180;
  if (spreadAngle > 180) {
    spreadAngle = 0;
  }
  if ((spreadAngle < 180) && (spreadAngle > 90)) {
    spreadAngle = 90;
  }
  spreadAngle = map(spreadAngle, 0, 90, 90, 0);
//  text(spreadAngle, 900, 650);
//  text(mouseX+"  "+mouseY, 900, 600);
fill(25, 25, 25, 225);
text("OPEN", 1000, 50);
text("CLOSE", 50, 650);
gFactor = gFactor + random(2) * gDir;
if ((gFactor > 255) || (gFactor < 0)) {gDir = gDir * -1;}
bFactor = bFactor + random(2) * bDir;
if ((bFactor > 255) || (bFactor < 0)) {bDir = bDir * -1;}

}

void mirrorImage() {  
  loadPixels();
  for (int i = 0; i < height; i ++) {
    for (int j = 0; j < width/2; j ++) {
      pixels[(i*width) + (width/2) - j] = pixels[j + (i*width) + (width/2)];
    }
  }
  updatePixels();
}

void drawFeatherFields() {
  noStroke();
  fill(15, gFactor, bFactor, 65);
  quad(m1[0].x, m1[0].y, m2[2].x, m2[2].y, allBones[0].near.x, allBones[0].near.y, allBones[0].near.x, allBones[0].near.y);
  fill(30, gFactor, bFactor, 65);
  quad(m1[0].x, m1[0].y, m2[2].x, m2[2].y, b2[2].x, b2[2].y, b1[2].x, b1[2].y);
  fill(45, gFactor, bFactor, 65);
  quad(m2[0].x, m2[0].y, m3[2].x, m3[2].y, b3[2].x, b3[2].y, m1[0].x, m1[0].y);
  fill(60, gFactor, bFactor, 65);
  quad(allBones[0].near.x, allBones[0].near.y, allBones[0].far.x, allBones[0].far.y, m3[2].x, m3[2].y, m1[2].x, m1[2].y);
  fill(75, gFactor, bFactor, 65);
  quad(allBones[1].near.x, allBones[1].near.y, allBones[1].far.x, allBones[1].far.y, b3[2].x, b3[2].y, m3[2].x, m3[2].y);
  fill(90, gFactor, bFactor, 65);
  quad(m3[2].x, m3[2].y, allBones[1].far.x, allBones[1].far.y, wt1[2].x, wt1[2].y, b3[2].x, b3[2].y);
  fill(105, gFactor, bFactor, 65);
  quad(allBones[1].near.x, allBones[1].near.y, wt1[2].x, wt1[2].y, m3[2].x, m3[2].y, allBones[1].near.x, allBones[1].near.y);
  fill(120, gFactor, bFactor, 65);
  quad(wt1[2].x, wt1[2].y, wt2[2].x, wt2[2].y, b4[2].x, b4[2].y, b3[2].x, b3[2].y);
  fill(135, gFactor, bFactor, 65);
  quad(ctr[2].x, ctr[2].y, t1[2].x, t1[2].y, t1[0].x, t1[0].y, ctr[2].x, ctr[2].y);
  fill(150, gFactor, bFactor, 65);
  quad(ctr[2].x, ctr[2].y, t2[2].x, t2[2].y, t1[2].x, t1[2].y, ctr[2].x, ctr[2].y);
  fill(165, gFactor, bFactor, 65);
  quad(ctr[2].x, ctr[2].y, t1[2].x, t1[2].y, 550, 650, ctr[2].x, ctr[2].y);
  fill(180, gFactor, bFactor, 65);
  quad(550, 50, 590, 100, ctr[2].x, ctr[2].y, 550, 50);
  fill(195, gFactor, bFactor, 65);
  quad(550, 100, allBones[0].near.x, allBones[0].near.y, 550, 150, 550, 100);
  fill(210, gFactor, bFactor, 65);
  quad(550, 150, allBones[0].near.x, allBones[0].near.y, wt2[0].x, wt2[0].y, 550, 100);
}

void drawKeyPoints() {
  fill(125);
  ellipse(m1[2].x, m1[2].y, 10, 10);
  ellipse(m2[2].x, m2[2].y, 10, 10);
  ellipse(m3[2].x, m3[2].y, 10, 10);
  ellipse(wt1[2].x, wt1[2].y, 10, 10);
  ellipse(wt2[2].x, wt2[2].y, 10, 10);
  ellipse(b1[2].x, b1[2].y, 10, 10);
  ellipse(b2[2].x, b2[2].y, 10, 10);
  ellipse(b3[2].x, b3[2].y, 10, 10);
  ellipse(b4[2].x, b4[2].y, 10, 10);
  ellipse(ctr[2].x, ctr[2].y, 10, 10);
  ellipse(t1[2].x, t1[2].y, 10, 10);
  ellipse(t2[2].x, t2[2].y, 10, 10);
  /*
  fill(125, 0, 0);
   ellipse(m1[1].x, m1[1].y, 3, 3);
   ellipse(m2[1].x, m2[1].y, 3, 3);
   ellipse(m3[1].x, m3[1].y, 3, 3);
   ellipse(wt1[1].x, wt1[1].y, 3, 3);
   ellipse(wt2[1].x, wt2[1].y, 3, 3);
   ellipse(b1[1].x, b1[1].y, 3, 3);
   ellipse(b2[1].x, b2[1].y, 3, 3);
   ellipse(b3[1].x, b3[1].y, 3, 3);
   ellipse(b4[1].x, b4[1].y, 3, 3);
   ellipse(ctr[1].x, ctr[1].y, 3, 3);
   ellipse(t1[1].x, t1[1].y, 3, 3);
   ellipse(t2[1].x, t2[1].y, 3, 3);
   */
  line(m1[0].x, m1[0].y, m1[1].x, m1[1].y);
  line(m2[0].x, m2[0].y, m2[1].x, m2[1].y);
  line(m3[0].x, m3[0].y, m3[1].x, m3[1].y);
  line(wt1[0].x, wt1[0].y, wt1[1].x, wt1[1].y);
  line(wt2[0].x, wt2[0].y, wt2[1].x, wt2[1].y);
  line(b1[0].x, b1[0].y, b1[1].x, b1[1].y);
  line(b2[0].x, b2[0].y, b2[1].x, b2[1].y);
  line(b3[0].x, b3[0].y, b3[1].x, b3[1].y);
  line(b4[0].x, b4[0].y, b4[1].x, b4[1].y);
  line(ctr[0].x, ctr[0].y, ctr[1].x, ctr[1].y);
  line(t1[0].x, t1[0].y, t1[1].x, t1[1].y);
  line(t2[0].x, t2[0].y, t2[1].x, t2[1].y);
}

void resetPoints() {
  m1[2] = new PVector(.0111*spreadAngle*(m1[1].x-m1[0].x)+m1[0].x, .0111*spreadAngle*(m1[1].y-m1[0].y)+m1[0].y);
  m2[2] = new PVector(.0111*spreadAngle*(m2[1].x-m2[0].x)+m2[0].x, .0111*spreadAngle*(m2[1].y-m2[0].y)+m2[0].y);
  m3[2] = new PVector(.0111*spreadAngle*(m3[1].x-m3[0].x)+m3[0].x, .0111*spreadAngle*(m3[1].y-m3[0].y)+m3[0].y);
  wt1[2] = new PVector(.0111*spreadAngle*(wt1[1].x-wt1[0].x)+wt1[0].x, .0111*spreadAngle*(wt1[1].y-wt1[0].y)+wt1[0].y);
  wt2[2] = new PVector(.0111*spreadAngle*(wt2[1].x-wt2[0].x)+wt2[0].x, .0111*spreadAngle*(wt2[1].y-wt2[0].y)+wt2[0].y);
  b1[2] = new PVector(.0111*spreadAngle*(b1[1].x-b1[0].x)+b1[0].x, .0111*spreadAngle*(b1[1].y-b1[0].y)+b1[0].y);
  b2[2] = new PVector(.0111*spreadAngle*(b2[1].x-b2[0].x)+b2[0].x, .0111*spreadAngle*(b2[1].y-b2[0].y)+b2[0].y);
  b3[2] = new PVector(.0111*spreadAngle*(b3[1].x-b3[0].x)+b3[0].x, .0111*spreadAngle*(b3[1].y-b3[0].y)+b3[0].y);
  b4[2] = new PVector(.0111*spreadAngle*(b4[1].x-b4[0].x)+b4[0].x, .0111*spreadAngle*(b4[1].y-b4[0].y)+b4[0].y);
  ctr[2] = new PVector(.0111*spreadAngle*(ctr[1].x-ctr[0].x)+ctr[0].x, .0111*spreadAngle*(ctr[1].y-ctr[0].y)+ctr[0].y);
  t1[2] = new PVector(.0111*spreadAngle*(t1[1].x-t1[0].x)+t1[0].x, .0111*spreadAngle*(t1[1].y-t1[0].y)+t1[0].y);
  t2[2] = new PVector(.0111*spreadAngle*(t2[1].x-t2[0].x)+t2[0].x, .0111*spreadAngle*(t2[1].y-t2[0].y)+t2[0].y);
}

void initPoints() {
  h = allBones[1].far;
  m1[0] = new PVector(590, 410);
  m1[1] = new PVector(625, 400);
  m1[2] = new PVector(625, 400);
  m2[0] = new PVector(595, 400);
  m2[1] = new PVector(650, 325);
  m2[2] = new PVector(650, 325);
  m3[0] = new PVector(590, 440); 
  m3[1] = new PVector(900, 250);
  m3[2] = new PVector(900, 250);
  wt1[0] = new PVector(590, 400);
  wt1[1] = new PVector(975, 110);
  wt1[2] = new PVector(975, 110);
  wt2[0] = new PVector(580, 500);
  wt2[1] = new PVector(1050, 100);
  wt2[2] = new PVector(1050, 100);
  b1[0] = new PVector(580, 450);
  b1[1] = new PVector(630, 450);
  b1[2] = new PVector(630, 450);
  b2[0] = new PVector(590, 450);
  b2[1] = new PVector(680, 375);
  b2[2] = new PVector(680, 375);
  b3[0] = new PVector(560, 505);
  b3[1] = new PVector(1000, 300);
  b3[2] = new PVector(1000, 300);
  b4[0] = new PVector(570, 505);
  b4[1] = new PVector(1025, 225);
  b4[2] = new PVector(1025, 225);
  ctr[0] = new PVector(550, 325);
  ctr[1] = new PVector(550, 325);
  ctr[2] = new PVector(550, 325);
  t1[0] = new PVector(560, 650);
  t1[1] = new PVector(575, 650);
  t1[2] = new PVector(575, 650);
  t2[0] = new PVector(610, 640);
  t2[1] = new PVector(675, 600);
  t2[2] = new PVector(675, 600);
}

void initBones() {
  PVector joint1, joint2;
  for (int i = 0; i < numberOfBones; i++) {
    if (i == 0) {
      joint1 = new PVector(anchorPoint.x, anchorPoint.y);
    } else {
      joint1 = new PVector(allBones[i-1].far.x, allBones[i-1].far.y);
    }
    if (i == 0) {
      joint2 = new PVector(anchorPoint.x + boneLengths[i], anchorPoint.y);
    } else {
      joint2 = new PVector(allBones[i-1].far.x + boneLengths[i], allBones[i-1].far.y);
    }
    allBones[i] = new Bone(boneLengths[i], joint1, joint2);
  }
}

void checkPositions() {
  PVector newPosit = new PVector(mouseX - allBones[0].near.x, mouseY - allBones[0].near.y);
  //PVector newPosit = new PVector(mouseX - allBones[0].near.x, mouseY - allBones[0].near.y);
  //PVector newPosit2 = new PVector(allBones[0].near.x - allBones[0].far.x, allBones[0].near.y - allBones[0].far);
  float totalDistance = sqrt(newPosit.x*newPosit.x+newPosit.y*newPosit.y);
  //float totalDistance2 = sqrt()
  float hypot = min(totalDistance, int(allBones[0].boneLength)+int(allBones[1].boneLength));
  //float hypot2 = min();
  float ha = acos((int(allBones[0].boneLength)*int(allBones[0].boneLength)-int(allBones[1].boneLength)*int(allBones[1].boneLength)-hypot*hypot)/
    (-2*int(allBones[1].boneLength)*hypot));
  //float ha2=acos();
  float ea = acos((hypot*hypot-int(allBones[0].boneLength)*int(allBones[0].boneLength)-int(allBones[1].boneLength)*int(allBones[1].boneLength))/
    (-2*int(allBones[1].boneLength)*int(allBones[0].boneLength)));
  //float ea2=acos();
  float newAngle = atan2(int(newPosit.y), int(newPosit.x));
  //float newAngle2 = atan2();
  float bigAngle = newAngle + ha + PI + ea;
  if (bigAngle < 5.9) {
    bigAngle = 5.9;
  }
  if (bigAngle > 8) {
    bigAngle = 8;
  }
  if ((newAngle) < -0.25) {
    newAngle = -0.25;
  }
  if ((newAngle) > 2) {
    newAngle = 2;
  }
  //float bigAngle2 = ;
  allBones[0].far.x = int((cos(bigAngle) * allBones[1].boneLength)) + allBones[0].near.x;
  allBones[0].far.y = int((sin(bigAngle) * allBones[1].boneLength)) + allBones[0].near.y;
  allBones[1].near = allBones[0].far;
  allBones[1].far.x = int((cos(newAngle+ha) * allBones[0].boneLength)) + allBones[0].far.x;
  allBones[1].far.y = int((sin(newAngle+ha) * allBones[0].boneLength)) + allBones[0].far.y;
  //allBones[2].near = ;
  //allBones[2].far.x = ;
  //allBones[2].far.y = ;
}

