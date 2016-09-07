int gridSpacing = 75;
int zDepth = 2500;
int rollSpacing = 50;
int horizonLineCount = int (zDepth / rollSpacing);
int gridPointCount;
float[][] gridPoints;
float refX = 0.0;
float refY = 0.0;

void setup () {
  background(125);
  size(1000, 1000, P3D);
  gridPointCount = int ((4 * width) / gridSpacing);
  gridPoints = new float[horizonLineCount][gridPointCount];
  noiseDetail(8, 0.5);
  initGridPoints();
  frameRate(10);
}

void draw () {
  background(0, 100, 100, 125);
//  displayWorldBox();
//  line(0, height/2, 0, width, height/2, 0);
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
  for (int i = horizonLineCount - 1; i > 0; i --) {
    for (int j = 0; j < gridPointCount; j ++) {
      gridPoints[i][j] = gridPoints[i - 1][j];
    }
  }

  if ((refY * 100) % horizonLineCount == 0) {
    refY = 0;
  } else {
    refY = refY + 0.1;
  }
  for (int j = 0; j < gridPointCount; j ++) {
    noiseVal = noise(refX, refY);
    gridPoints[0][j] = map(noiseVal, 0, 1, (height / 1.5), height); //(height / 2) + (height / 7));
//    gridPoints[0][j] = gridPoints[0][j] + 
    refX = refX + 0.1;
  }
}

void displayTerrain() {
  for (int i = 0; i < horizonLineCount - 1; i ++) {
  stroke(0, 0, 255, i * (50 / horizonLineCount) + 50);
    for (int j = 0; j < gridPointCount - 1; j ++) {// draw horizontals
      line(j * gridSpacing - (width*1.5), gridPoints[i][j], (-1 * zDepth) - (i * gridSpacing * -1), (j + 1) * gridSpacing - (width*1.5), gridPoints[i][j + 1], (-1 * zDepth) - (i * gridSpacing * -1));
    }
    for (int j = 0; j < gridPointCount; j ++) {// connect horizons backwards
      line(j * gridSpacing - (width*1.5), gridPoints[i][j], (-1 * zDepth) - (i * gridSpacing * -1), j * gridSpacing - (width*1.5), gridPoints[i+1][j], (-1 * zDepth) - ((i + 1) * gridSpacing * -1));
    }
  }
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

