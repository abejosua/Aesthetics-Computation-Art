int gridSpacing = 50;
int zDepth = 1500;
int horizonLineCount = int (zDepth / gridSpacing);
int gridPointCount;
float[][] gridPoints;
float refX = 0.1;

void setup () {
  background(125);
  size(1000, 1000, P3D);
  gridPointCount = int (width / gridSpacing);
  gridPoints = new float[horizonLineCount][gridPointCount];
  noiseDetail(8, 0.5);
  initGridPoints();
  frameRate(15);
}

void draw () {
  background(125);
  displayWorldBox();
  line(0, height/2, 0, width, height/2, 0);
  computeNextHorizon();
  displayTerrain();
}

void initGridPoints() {
  for (int i = 0; i < horizonLineCount; i ++) {
    for (int j = 0; j < gridPointCount; j ++) {
      gridPoints[i][j] = 0;
    }
  }
}

void computeNextHorizon() {
  float noiseVal;
  for (int i = (horizonLineCount - 1); i > 0; i --) {
    for (int j = 0; j < gridPointCount; j ++) {
      gridPoints[i][j] = gridPoints[i - 1][j];
    }
  }
  for (int i = 0; i < gridPointCount; i ++) {
    noiseVal = noise(refX);
    gridPoints[0][i] = map(noiseVal, 0, 1, (height / 2), (height / 2) + (height / 8));
    refX = refX + 0.01;
  }
}

void displayTerrain() {
  stroke(0, 0, 255);
  //  strokeWeight(2);
  /*
  for (int i = 0; i < horizonLineCount; i ++) {
   for (int j = 0; j < (gridPointCount - 1); j ++) {
   line (j * gridSpacing, gridPoints[i][j], (horizonLineCount - 1 - i) * gridSpacing * -1, (j + 1) * gridSpacing, gridPoints[i][j + 1], (horizonLineCount - 1 - i) * gridSpacing * -1);
   //    point(j * gridSpacing, gridPoints[i][j], i * gridSpacing * -1);
   }
   }
   */
  for (int i = horizonLineCount - 2; i > -1; i --) {
    for (int j = 0; j < gridPointCount; j ++) {
      line(j * gridSpacing, gridPoints[i][j], (i * gridSpacing * -1), j * gridSpacing, gridPoints[i + 1][j], ((i + 1) * gridSpacing * -1));
    }
  }
  /*
    for (int i = 0; i < (horizonLineCount - 1) ; i ++) {
   for (int j = 0; j < gridPointCount; j ++) {
   line (j * gridSpacing, gridPoints[i][j], i * gridSpacing * -1, j * gridSpacing, gridPoints[i + 1][j], ((i) + 1) * gridSpacing * -1);
   //    point(j * gridSpacing, gridPoints[i][j], i * gridSpacing * -1);
   }
   }
   */
}

void displayWorldBox() { // draw worldBox();  
  stroke(25);
  noFill();
  line(0, 0, 0, width, 0, 0);
  line(width, 0, 0, width, 0, -500);
  line(width, 0, -500, 0, 0, -500);
  line(0, 0, -500, 0, 0, 0);
  line(0, height, 0, width, height, 0);
  line(width, height, 0, width, height, -500);
  line(width, height, -500, 0, height, -500);
  line(0, height, -500, 0, height, 0); 
  line(0, 0, 0, 0, height, 0);
  line(width, 0, 0, width, height, 0);
  line(0, 0, -500, 0, height, -500);
  line(width, 0, -500, width, height, -500);
}

