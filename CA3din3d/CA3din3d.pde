// 2-Dimensional Cellular Automata matrix transposed across 3-d - David G. Smith
//peasy cam stuff
import peasy.*;
PeasyCam cam;
final float radius = 150;
// regular stuff
int hoodSize = 5;
int seedProb = 1500;  // 1 in this # chance of a seed
int rules[][] = new int[int(pow(2, hoodSize))][hoodSize];

int ruleSetDec = 11102;
int nextRule = 30000;

int ruleSetKey[] = new int[int(pow(2, hoodSize))];
int gridX = 75;
int gridY = 50;
int gridZ = 50;
int size = 10;
Cube matrix[][][] = new Cube[gridX][gridY][gridZ];
Cube nextMatrix[][][] = new Cube[gridX][gridY][gridZ];

// temp stuff for testing
int frm = 25;
//normal stuff

void setup() {
  size(1200, 750, P3D);

  frameRate(frm);
  populateRules();
  initMatrix();
  ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
  displayRuleSetKey();
  // peasy cam stuff
cam = new PeasyCam(this, 150);
cam.setMinimumDistance(500);
cam.setMaximumDistance(1000);
  // regular stuff
  //  noLoop();
}

void draw() {
  background(125);
  translate(-width/5 -height/5, -50);
  stroke(255);
  //displayRefLines();
  fill(250, 0, 0, 50);
    noStroke();
  displayMatrix();
  updateMatrix();
  frameRate(frm);
//  stroke(0);
  
}

void initMatrix() {  // set all to zero
  for (int i = 0; i < gridX; i ++) {
    for (int j = 0; j < gridY; j ++) {
      for (int k = 0; k < gridZ; k ++) {
        matrix[i][j][k] = new Cube(i, j, k, 0);
        nextMatrix[i][j][k] = new Cube(i, j, k, 0);
      }
    }
  }
  //
  // set some to one for seeds
//   one in a thousand = 1
  for (int i = 0; i < gridX; i ++) {
    for (int j = 0; j < gridY; j ++) {
      for (int k = 0; k < gridZ; k ++) {
        if (int(random(seedProb)) == 1)  {
          matrix[i][j][k].state = 1;
        }
      }
    }
  }
  
  // origin corner
  //matrix[1][1][1].state = 1;
  // center
  matrix[gridX / 2][gridY / 2][gridZ / 2].state = 1;
  /*
  matrix[1][1][1].state = 1;
   matrix[gridX-2][1][1].state = 1;
   matrix[1][gridY-2][1].state = 1;
   matrix[1][1][gridZ-2].state = 1;
   matrix[1][gridY-2][gridZ-2].state = 1;
   matrix[gridX-2][1][gridZ-2].state = 1;
   matrix[gridX-2][gridY-2][1].state = 1;
   matrix[gridX-2][gridY-2][gridZ-2].state = 1;
   matrix[(gridX/2)-1][(gridY/2)][(gridZ/2)].state = 1;
   matrix[(gridX/2)][(gridY/2)][(gridZ/2)].state = 1;
   matrix[(gridX/2)][(gridY/2)-1][(gridZ/2)].state = 1;
   */
}

void displayMatrix() {
  for (int i = 0; i < gridX; i ++) {
    for (int j = 0; j < gridY; j ++) {
      for (int k = 0; k < gridZ; k ++) {
        matrix[i][j][k].display();
      }
    }
  }
}

void updateMatrix() {
  int changeRate = 0;
  for (int i = 1; i < gridX-1; i++) {
    for (int j = 1; j < gridY-1; j++) {
      for (int k = 1; k < gridZ-1; k++) {
        for (int x = 0; x < int (pow (2, hoodSize)); x++) {
          if (ruleSetKey[x] == 1) {
            if ((matrix[i-1][j-1][k-1].state == rules[x][0]) &&
              (matrix[i-1][j+1][k-1].state == rules[x][1]) &&
              (matrix[i-1][j][k-1].state == rules[x][2]) &&
              (matrix[i-1][j-1][k+1].state == rules[x][3]) &&
              (matrix[i-1][j+1][k].state == rules[x][4])) {
              nextMatrix[i][j][k].state = 1;
              //          println("found one!" + nextMatrix[i][j][k].state);
            } 
          }
        }
      }
    }
  }
  for (int i = 1; i < gridX-1; i++) {
    for (int j = 1; j < gridY-1; j++) {
      for (int k = 1; k < gridZ-1; k++) {
        if (matrix[i][j][k].state != nextMatrix[i][j][k].state) {changeRate ++;}
        matrix[i][j][k].state = nextMatrix[i][j][k].state;
      }
    }
  }
//  println(changeRate);
  if (changeRate == 0) {
        ruleSetDec = ruleSetDec + 2;
    if (ruleSetDec > int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      ruleSetDec = 1;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
  //  println("updated");
}

void displayRefLines() {
  stroke(25);
  fill(25);
  line(matrix[0][0][0].x, matrix[0][0][0].y, matrix[0][0][0].z, matrix[gridX - 1][0][0].x * size, matrix[gridX - 1][0][0].y * size, matrix[gridX - 1][0][0].z * size);
  text("X", matrix[gridX - 1][0][0].x * size/2, matrix[gridX - 1][0][0].y * size/2, matrix[gridX - 1][0][0].z * size/2);
  line(matrix[0][0][0].x, matrix[0][0][0].y, matrix[0][0][0].z, matrix[0][gridY - 1][0].x * size, matrix[0][gridY - 1][0].y * size, matrix[0][gridY - 1][0].z * size);
  text("Y", matrix[0][gridY - 1][0].x * size/2, matrix[0][gridY - 1][0].y * size/2, matrix[0][gridY - 1][0].z * size/2);
  line(matrix[0][0][0].x, matrix[0][0][0].y, matrix[0][0][0].z, matrix[0][0][gridZ - 1].x * size, matrix[0][0][gridZ - 1].y * size, -matrix[0][0][gridZ - 1].z * size);
  text("Z", matrix[0][0][gridZ - 1].x * size/2, matrix[0][0][gridZ - 1].y * size/2, -matrix[0][0][gridZ - 1].z * size/2);
  noStroke(); 
  noFill();
}

int[] convertToBinArray(int decimal, int size) {
  int binary[] = new int[size];
  int counter = binary.length - 1;
  while (counter >=0) {
    if ((decimal / pow(2, counter)) >= 1) {
      binary[counter]  = 1;
      decimal = decimal - ceil(pow(2, counter));
    }
    counter --;
  }
  return binary;
}

void populateRules() {
  int temp[] = new int [hoodSize];
  for (int i = 0; i < int (pow (2, hoodSize)); i++) {
    temp = convertToBinArray(i, hoodSize);
    for (int j = 0; j < hoodSize; j++) {
      rules[i][j] = temp[hoodSize - 1 - j];
    }
  }
}

void displayRuleSetKey() {
  print("rule "+ruleSetDec+":   ");
  for (int i = 0; i < ruleSetKey.length; i ++ ) {
    print(ruleSetKey[ruleSetKey.length - 1 - i]);
  }
  println();
}

void displayRule(int rule) {
  print("rule "+rule+":   ");
  for (int i = 0; i < rules[rule].length; i ++ ) {
    print(rules[rule][i]);
  }
  println();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    redraw();
  }
  if (keyCode == UP) {
    ruleSetDec = ruleSetDec + 1;
    if (ruleSetDec > int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      ruleSetDec = 1;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
  if (keyCode == DOWN) {
    ruleSetDec = ruleSetDec - 1;
    if (ruleSetDec < 0) {
      ruleSetDec = int(pow(int(pow(2, hoodSize)), hoodSize))-1;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
  if (key == 'w') {
    nextRule = nextRule+1;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == 's') {
    nextRule = nextRule - 1;
    if (nextRule < 1) {
      nextRule = int(pow(int(pow(2, hoodSize)), hoodSize))-1;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '1') {
    nextRule = nextRule+10;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '2') {
    nextRule = nextRule+100;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '3') {
    nextRule = nextRule+1000;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '4') {
    nextRule = nextRule+10000;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  
  if (keyCode == ENTER) {
  ruleSetDec = nextRule;
      initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
  if (key == 'z') {
    frm = frm - 1;
    if (frm < 1) {
      frm = 1;
    }
    println("Target frame rate: " + frm);
  }
  if (key == 'a') {
    frm = frm + 1;
    if (frm > 100) {
      frm = 100;
    }
    println("Target frame rate: " + frm);
  }
}

