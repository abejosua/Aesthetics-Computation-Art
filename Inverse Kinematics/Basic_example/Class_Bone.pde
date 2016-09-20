class Bone {

  float boneLength;
  PVector near;
  PVector far;
  Feather allFeathers[] = new Feather[numberOfFeathers];

  Bone (float boneLength, PVector near, PVector far) {
    this.boneLength = boneLength;
    this.near = near;
    this.far = far;
  }

void display (){
   stroke(boneColor);
   strokeWeight(3);
   line(this.near.x, this.near.y, this.far.x, this.far.y);
   stroke(jointColor);
   strokeWeight(1);
   ellipse(near.x, near.y, jointDiam, jointDiam);
   ellipse(far.x, far.y, jointDiam, jointDiam);
}

void addFeathers(int numberOfFeathers) {
  PVector newPosit;
  PVector frontPoint;
  PVector backPoint;
  float newAngle;
//  Feather allFeathers[][] = new Feather[numberOfBones][numberOfFeathers];
  for (int i = 0; i < numberOfFeathers; i++) {
    newPosit = new PVector((allBones[i].far.x - allBones[1].near.x), (allBones[i].far.y - allBones[1].near.y));    
    newAngle = atan2(newPosit.y, newPosit.x);
    frontPoint = new PVector (((allBones[i].boneLength / numberOfFeathers) * cos(newAngle)), 
    (allBones[i].boneLength / numberOfFeathers) * sin(newAngle));
    backPoint = new PVector (((allBones[i].boneLength / numberOfFeathers) * cos(newAngle + HALF_PI)), 
    (allBones[i].boneLength / numberOfFeathers) * sin(newAngle + HALF_PI));
    float l = 100;
    float w = 15;
    allFeathers[i] = new Feather(frontPoint, backPoint, l, w, i);
  }
}

}
