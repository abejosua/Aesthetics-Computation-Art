// 2-Dimensional Cellular Automata matrix transposed across 3-d - David G. Smith

//peasy cam stuff
import peasy.*;
PeasyCam cam;
final float radius = 50;

// regular stuff
int rules[][] = {
  {0, 0, 0}, 
  {0, 0, 1}, 
  {0, 1, 0}, 
  {0, 1, 1}, 
  {1, 0, 0}, 
  {1, 0, 1}, 
  {1, 1, 0}, 
  {1, 1, 1}};

int ruleSetDec = 126;

int ruleSetKey[] = new int[8];
int gridX = 15;
int gridY = 15;
int gridZ = 15;
int size = 10;
Cube matrix[][][] = new Cube[gridX][gridY][gridZ];

// temp stuff for testing
int frm = 20;
//normal stuff

void setup() {
  size(1200, 700, P3D);
  
  frameRate(frm);
  
  initMatrix();
  ruleSetKey = convertToBinArray(ruleSetDec);
  print("rule "+ruleSetDec+":   ");
  for (int i = 0; i < ruleSetKey.length; i ++ ) {
    print(ruleSetKey[ruleSetKey.length - 1 - i]);
  }
  println();
  // peasy cam stuff
  cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(250);
  cam.setMaximumDistance(500);
  // regular stuff
}

void draw() {
  background(125);
  fill(250, 0, 0, 50);
  noStroke();
//  translate(-width/5, -height/5, 0);
  displayMatrix();
  updateMatrix();
  frameRate(frm);
}

void initMatrix() {  // set all to zero
  for (int i = 0; i < gridX; i ++) {
    for (int j = 0; j < gridY; j ++) {
      for (int k = 0; k < gridZ; k ++) {
        matrix[i][j][k] = new Cube(i, j, k, 0);
      }
    }
  }
  // set some to one for seeds
  matrix[gridX / 2][0][0].state = 1;
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
  int temp[] = new int[gridX];
  for (int k = 1; k < gridX - 2; k ++) {
    for (int x = 0; x < 8; x ++) { // step through rule key
      if (ruleSetKey[x] == 1) { // yes we are using this rule so check it against neighborhood
        if ((matrix[k - 1][0][0].state == rules[x][0]) && (matrix[k][0][0].state == rules[x][1]) && (matrix[k + 1][0][0].state == rules[x][2])) {  // rule is met - set state to 1
          temp[k] = 1;
        }
      }
    }
  }
  for (int k = 0; k < gridZ; k++) {
  for (int j = gridY - 1; j > 0; j--) {
    for (int i = 0; i < gridX; i++) {
      matrix[i][j][k].state = matrix[i][j-1][k].state;
    }
  }
  for (int i = 0; i < gridX; i ++) {
    matrix[i][0][k].state = temp[i];
  }
}
}

int[] convertToBinArray(int decimal) {
  int binary[] = {
    0, 0, 0, 0, 0, 0, 0, 0
  };
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

void keyPressed() {
  if (keyCode == RIGHT) {
    redraw();
  }
  if (keyCode == UP) {
    ruleSetDec = ruleSetDec + 1;
    if (ruleSetDec > 255) {
      ruleSetDec = 0;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec);
    print("rule "+ruleSetDec+":   ");
    for (int i = 0; i < ruleSetKey.length; i ++ ) {
      print(ruleSetKey[ruleSetKey.length - 1 - i]);
    }
    println();
  }
  if (keyCode == DOWN) {
    ruleSetDec = ruleSetDec - 1;
    if (ruleSetDec < 0) {
      ruleSetDec = 255;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec);
    print("rule "+ruleSetDec+":   ");
    for (int i = 0; i < ruleSetKey.length; i ++ ) {
      print(ruleSetKey[ruleSetKey.length - 1 - i]);
    }
    println();
  }
  if (key == 'z') {
    frm = frm - 1;
    if (frm < 1) {frm = 1;}
    println("Target frame rate: " + frm);
  }
  if (key == 'a') {
    frm = frm + 1;
    if (frm > 100) {frm = 100;}
    println("Target frame rate: " + frm);
  }
  
}

