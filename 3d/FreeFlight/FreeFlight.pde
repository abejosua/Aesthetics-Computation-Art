float factor = 1;
int xGrid = 96;
int zGrid = 24;
float gridSize = 80;
float horizon = 200;
float[][] allAxis = new float[xGrid][zGrid]; // 25 by 25 pixel grid @ 1600X by 400Z
int noiseX = 0;
int noiseY = 0;
int octaves = 8;
float stepDown = .8;
int speed = 7;
int steer = 0; // -2 heavy left, -1 left, 0 center, 1 right, 2 heavy right
float altitude = 0;
float probSphere = 150;
float probBox = 300;

void setup() {
  size(1200, 700, P3D);
  background(125);
  stroke(200);
  fill(50, 50, 50, 200);
  initGrid();
  frameRate(speed);
  //  noLoop();
  blendMode(BLEND);
}

void draw() {
  background(225, 175, 75, 75);
  frameRate(speed);
  noiseDetail(octaves, stepDown);
  stroke(125, 0, 0);
  drawShip();
  displayGrid();
  updateGrid();
  fill(0);
  text("Control spacecraft with arrow keys", 25, 25);
}

void initGrid() {
  for (int i = 0; i < xGrid; i ++ ) {
    noiseX ++;
    for (int j = 0; j < zGrid; j ++ ) {
      noiseY ++;
      allAxis[i][j] = 2;//noise(noiseX, noiseY) * 50;
    }
  }
}

void updateGrid() {
// rerack matrix forward
  for (int i = 0; i < xGrid; i ++ ) {
    for (int j = zGrid - 1; j > 0; j --) {
      println(j);
      //    for (int j = zGrid - 1; j > 0; j --) {
      allAxis[i][j] = allAxis[i][j - 1];
    }
  }
// generate next horizon
  for (int i = 0; i < xGrid; i ++ ) {
    allAxis[i][0] = noise(noiseX, noiseY) * 50;
    if (int(random(probSphere)) == 7) {allAxis[i][0] = 0;} // mark for a sphere
    if (int(random(probBox)) == 13) {allAxis[i][0] = 1;} // mark for a box
    noiseX ++;
  }
//  noiseY ++;
// side steering below
if (steer > 0) {  // right bank
// rerack matrix
  for (int i = 1; i < xGrid; i ++ ) {
    for (int j = zGrid - 1; j > -1; j --) {
      println(j);
      allAxis[i - 1][j] = allAxis[i][j];
//      if (abs(steer) > 1) {allAxis[i - 1][j] = allAxis[i][j];}
    }
  }
  }
if (steer < 0) {  // left bank
// rerack matrix
//  for (int i = 0; i < xGrid - 1; i ++ ) {
  for (int i = xGrid - 2; i > 0; i -- ) {
    for (int j = zGrid - 1; j > -1; j --) {
      println(j);
      allAxis[i + 1][j] = allAxis[i][j];
//      if (abs(steer) > 1) {allAxis[i + 1][j] = allAxis[i][j];}
    }
  }
  }
}

void displayGrid() {
  float p1X, p1Y, p1Z, p2X, p2Y, p2Z, p3X, p3Y, p3Z, p4X, p4Y, p4Z;
  for (int i = 0; i < xGrid- 1; i ++ ) {
    for (int j = 0; j < zGrid -1; j ++ ) {
      p1X = -(width/2) + (i * gridSize);
      p1Y = horizon + (3 * altitude) - allAxis[i][j] + ((j) * ((height - (.35 * horizon))/zGrid));
      p1Z = -400 + (j *  gridSize);
      p2X = -(width/2) + ((i + 1) *  gridSize);
      p2Y = horizon + (3 * altitude)- allAxis[i + 1][j] + ((j) * ((height - (.35 * horizon))/zGrid));
      p2Z = -400 + (j *  gridSize);
      p3X = -(width/2) + ((i + 1)  *  gridSize);
      p3Y = horizon + (3 * altitude)- allAxis[i + 1][j + 1] + ((j + 1) * ((height - (.35 * horizon))/zGrid));
      p3Z = -400 + ((j + 1) *  gridSize);
      p4X = -(width/2) + (i *  gridSize);
      p4Y = horizon + (3 * altitude)- allAxis[i][j + 1] + ((j + 1) * ((height - (.35 * horizon))/zGrid));
      p4Z = -400 + ((j + 1) *  gridSize);
noStroke();
//      stroke(0, 0, 0, j * 16);
      fill(125, i * 2, j * 5, j * 16);
      beginShape();
      vertex(p1X-1, p1Y-1, p1Z-1);
      vertex(p2X+1, p2Y+1, p2Z-1);
      vertex(p3X+1, p3Y+1, p3Z+1);
      vertex(p4X-1, p4Y-1, p4Z+1);
      endShape(CLOSE);
      if (allAxis[i + 1][j + 1] == 0 ) {translate(p4X, p4Y - 250, p4Z);fill(0, 120, 255, 50);sphere(25);translate(-p4X, -(p4Y - 250), -p4Z);}
      if (allAxis[i + 1][j + 1] == 1 ) {translate(p1X, p1Y - 350, p1Z);rotateY(i * 13);fill(80, 90, 200, 50);box(20);rotateY(-i * 13);translate(-p1X, -(p1Y - 350), -p1Z);}
    }
  }
}

void drawShip() {
  noStroke();
  fill(75, 25, 175);
fill(0);
  float x = (width / 2) + (5 * steer);
  float y = 3 * (height / 5) - (5 * altitude);
  float back = -25;
  float front = -55;
  float rightWingTipX = x + cos(steer * .15) * 50;
  float rightWingTipY = y + 5 + sin(steer * .15) * 50;
  float leftWingTipX = x + cos(PI + steer * .15) * 50;
  float leftWingTipY = y + 5 + sin(PI +steer * .15) * 50;
  beginShape();
  vertex(x, y - altitude, back);
  vertex(rightWingTipX, rightWingTipY, back);
  vertex(leftWingTipX, leftWingTipY, back);
  endShape(CLOSE);
  beginShape();
  vertex(x, y, front);
  vertex(rightWingTipX, rightWingTipY, back);
  vertex(leftWingTipX, leftWingTipY, back);
  endShape(CLOSE);
  beginShape();
  vertex(x, y, back);
  vertex(rightWingTipX, rightWingTipY, back);
  vertex(x, y, front);
  endShape(CLOSE);
  beginShape();
  vertex(x, y, back);
  vertex(leftWingTipX, leftWingTipY, back);
  vertex(x, y, front);
  endShape(CLOSE);
}

void keyPressed() {
  if (keyCode == LEFT) {
    steer = steer - 1; 
    if (steer < -2) {
      steer = -2;
    }
  } else
  if (keyCode == RIGHT) {
    steer = steer + 1; 
    if (steer > 2) {
      steer = 2;
    }
  } else
  if (keyCode == UP) {
    altitude = altitude + 1; 
    if (altitude > 27) {
      altitude = 27;
    }
  } else
  if (keyCode == DOWN) {
    altitude = altitude - 1; 
    if (altitude < -6) {
      altitude = -6;
    }
  }   else
  if (key == 'q') {
    octaves = octaves + 1;
    if (octaves > 35) {octaves = 35;}
  } else
  if (key == 'a') {
    octaves = octaves - 1;
    if (octaves < 5) {octaves = 5;}
  }  else 
  if (key == 'w') {
    stepDown = stepDown + 0.05;
    if (stepDown > 1.0) {stepDown = 1.0;}
  } else
  if (key == 's') {
    stepDown = stepDown - 0.05;
    if (stepDown < 0.05) {stepDown = 0.05;}
  } else
  if (key == 'e') {
    speed = speed + 1;
  } else
  if (key == 'd') {
    speed = speed - 1;
  }
  
}

