int numberOfBones = 2; 
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
float boneLengths[] = {
  175, 100
};

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
  for (int i = 0; i < numberOfBones; i ++) {
    allBones[i].display();
    allBones[i].computeParameters();
  }
  //  showPositions();
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

void mouseDragged() {
  PVector newPosit;
  float newAngle = 0;
  float newAngle2 = 0;

  //  for (int i = numberOfBones - 1; i > 0; i --) { 
  //    newPosit = new PVector(mouseX - allBones[i - 1].near.x, mouseY - allBones[i - 1].near.y);    


  newPosit = new PVector(mouseX - allBones[1].near.x, mouseY - allBones[1].near.y);    
  newAngle = atan2(newPosit.y, newPosit.x);
//  print(newAngle + "    ", 100, 100);
  allBones[1].far = new PVector((allBones[1].boneLength*(cos(newAngle)))+(allBones[1].near.x), 
  (allBones[1].boneLength*(sin(newAngle)))+(allBones[1].near.y));

  allBones[1].near = allBones[0].far;

  newPosit = new PVector(mouseX - allBones[0].near.x, mouseY - allBones[0].near.y);    
  newAngle2 =  atan2(newPosit.y, newPosit.x);
//  println(newAngle2, 100, 150);
  allBones[0].far = new PVector((allBones[0].boneLength*(cos(newAngle2)))+(allBones[0].near.x), 
  (allBones[0].boneLength*(sin(newAngle2)))+(allBones[0].near.y));

  allBones[1].near = allBones[0].far;
 
  //////////-------------------
    newPosit = new PVector(mouseX - allBones[1].near.x, mouseY - allBones[1].near.y);    
  newAngle = atan2(newPosit.y, newPosit.x);
//  print(newAngle + "    ", 100, 100);
  allBones[1].far = new PVector((allBones[1].boneLength*(cos(newAngle)))+(allBones[1].near.x), 
  (allBones[1].boneLength*(sin(newAngle)))+(allBones[1].near.y));

  allBones[1].near = allBones[0].far;

  newPosit = new PVector(mouseX - allBones[0].near.x, mouseY - allBones[0].near.y);    
  newAngle2 =  atan2(newPosit.y, newPosit.x);
//  println(newAngle2, 100, 150);
  allBones[0].far = new PVector((allBones[0].boneLength*(cos(newAngle2)))+(allBones[0].near.x), 
  (allBones[0].boneLength*(sin(newAngle2)))+(allBones[0].near.y));

  allBones[1].near = allBones[0].far;

}

void showPositions() {
  fill(125, 0, 0);

  text("Position end joint with mouse.", (allBones[numberOfBones - 1].far.x + 20), (allBones[numberOfBones - 1].far.y + 15));
  for (int i = 0; i < numberOfBones; i ++ ) {
    fill(i * 50, i * 75, 150);
    if (i == 0) {
      text("Anchor point", (allBones[i].near.x + 30), (allBones[i].near.y + 30));
    }
    text("Bone "+(i+1)+" near - (" + allBones[i].near.x + ", " + allBones[i].near.y + ")", (allBones[i].near.x + 20), (allBones[i].near.y + 15));
    text("Bone "+(i+1)+" far  - (" + allBones[i].far.x + ", " + allBones[i].far.y + ")", (allBones[i].far.x + 20), (allBones[i].far.y - 10));
  }
}

