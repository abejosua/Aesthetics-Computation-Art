//  In the checkPositions() function, thanks to Keith Peters for Law Of Cosines Approach to bones: http://flylib.com/books/en/4.261.1.96/1/

int numberOfBones = 3; 
int numberOfFeathers = 5;
color boneColor = color(150);
color jointColor = color(75);
float stdBoneLength = 75;
Bone allBones[] = new Bone[numberOfBones];
PVector anchorPoint;
float reach = 0;
float jointDiam = 15;
float xOrigin = 450;
float yOrigin = 100;
float boneLengths[] = {75, 150, 25};

void setup () {
  size(800, 500);
  anchorPoint = new PVector (xOrigin, yOrigin);
  ellipseMode(CENTER);
  initBones();
}

void draw () {
  background(125, 200, 225);
  stroke(jointColor);
  strokeWeight(1);
  ellipse(anchorPoint.x, anchorPoint.y, 5, 5);
  checkPositions();
  for (int i = 0; i < numberOfBones; i ++) {
    allBones[i].display();
  }
  mirrorImage();
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

  int upArm = int(allBones[0].boneLength);
  int lowArm = int(allBones[1].boneLength);
int hand = int(allBones[2].boneLength);

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
//float bigAngle2 = ;
  allBones[0].far.x = int((cos(bigAngle) * lowArm)) + allBones[0].near.x;
  allBones[0].far.y = int((sin(bigAngle) * lowArm)) + allBones[0].near.y;
  allBones[1].near = allBones[0].far;
  allBones[1].far.x = int((cos(newAngle+ha) * upArm)) + allBones[0].far.x;
  allBones[1].far.y = int((sin(newAngle+ha) * upArm)) + allBones[0].far.y;
//allBones[2].near = ;
//allBones[2].far.x = ;
//allBones[2].far.y = ;
}


