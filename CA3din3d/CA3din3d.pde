// 3-Dimensional Cellular Automata matrix transposed across 3-D grid - David G. Smith
// Copyright (C) Oct 2017
// messages in console at runtime
// see comments for oter controls
//
// this will run auto mode on each even rule until exhausted
// odd rules all rapidly become solid cube so they are skipped
// navigate to odd rules if you like with keys as described in comments below 
//
//

//peasy cam stuff
import peasy.*;
PeasyCam cam;
final float radius = 150;
// regular stuff
int hoodSize = 5;  // number of cells in neighborhood
int seedProb = 1500;  // 1 in this # chance of a seed being made at init
int rules[][] = new int[int(pow(2, hoodSize))][hoodSize];  // make rule grid
int ruleSetDec = 11102;  // rule to show at startup
int nextRule = 30000; //adjust with w(+1) and s(-1), 1(+10) ,2(+100) ,3(+1000) ,4(+10000) then hit enter
int ruleSetKey[] = new int[int(pow(2, hoodSize))];  //make rule key
int gridX = 75; 
int gridY = 50;
int gridZ = 50;
int size = 10;  // size of cells in grid
Cube matrix[][][] = new Cube[gridX][gridY][gridZ];
Cube nextMatrix[][][] = new Cube[gridX][gridY][gridZ];
int frm = 25;  // adjust frame rate with a(+) and z(-)

void setup() {
  size(1200, 750, P3D);
  frameRate(frm);
  populateRules(); // build rule set 
  initMatrix(); // setup initial state with seeds
  ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize))); // convert rule# into a binary key
  displayRuleSetKey();  // show rule # and key in console
  // peasy cam stuff
cam = new PeasyCam(this, 150);
cam.setMinimumDistance(500);
cam.setMaximumDistance(1000);
  // regular stuff
}

void draw() {
  background(125);
  translate(-width/5 -height/5, -50);  // position for better viewing
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
//   one cell out of "seedProb" will = 1
  for (int i = 0; i < gridX; i ++) {
    for (int j = 0; j < gridY; j ++) {
      for (int k = 0; k < gridZ; k ++) {
        if (int(random(seedProb)) == 1)  {
          matrix[i][j][k].state = 1;
        }
      }
    }
  }
  
  // near origin corner
  //matrix[1][1][1].state = 1;
  // center
//  matrix[gridX / 2][gridY / 2][gridZ / 2].state = 1;
// near each corner
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

void displayMatrix() {  // show each cell
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
          if (ruleSetKey[x] == 1) {  // check neighborhood  - customize neighborhood below
            if ((matrix[i-1][j-1][k-1].state == rules[x][0]) &&
              (matrix[i-1][j+1][k-1].state == rules[x][1]) &&
              (matrix[i-1][j][k-1].state == rules[x][2]) &&
              (matrix[i-1][j-1][k+1].state == rules[x][3]) &&
              (matrix[i-1][j+1][k].state == rules[x][4])) {
              nextMatrix[i][j][k].state = 1;
            } 
          }
        }
      }
    }
  }
  // copy array and determine change rate
  for (int i = 1; i < gridX-1; i++) {
    for (int j = 1; j < gridY-1; j++) {
      for (int k = 1; k < gridZ-1; k++) {
        if (matrix[i][j][k].state != nextMatrix[i][j][k].state) { // determine if rule is exhausted (# of changes)  
          changeRate ++;
        }
        matrix[i][j][k].state = nextMatrix[i][j][k].state;
      }
    }
  }
//  println(changeRate);
  if (changeRate == 0) { // if rule is exhausted change to next even one
        ruleSetDec = ruleSetDec + 2;
    if (ruleSetDec > int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      ruleSetDec = 1;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
}

void displayRefLines() {  // shows a grid reference line for troubleshooting
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

int[] convertToBinArray(int decimal, int size) { // key and rule converter
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

void populateRules() {  // generates all rules
  int temp[] = new int [hoodSize];
  for (int i = 0; i < int (pow (2, hoodSize)); i++) {
    temp = convertToBinArray(i, hoodSize);
    for (int j = 0; j < hoodSize; j++) {
      rules[i][j] = temp[hoodSize - 1 - j];
    }
  }
}

void displayRuleSetKey() { // show rule set and rule set key in binary
  print("rule "+ruleSetDec+":   ");
  for (int i = 0; i < ruleSetKey.length; i ++ ) {
    print(ruleSetKey[ruleSetKey.length - 1 - i]);
  }
  println();
}

void displayRule(int rule) {  // diplays a rule  - for troubleshooting
  print("rule "+rule+":   ");
  for (int i = 0; i < rules[rule].length; i ++ ) {
    print(rules[rule][i]);
  }
  println();
}

void keyPressed() {
  if (keyCode == RIGHT) {  // for advancing during noLoop for trouleshooting
    redraw();
  }
  if (keyCode == UP) { // advance one rule
    ruleSetDec = ruleSetDec + 1;
    if (ruleSetDec > int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      ruleSetDec = 1;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
  if (keyCode == DOWN) { // go back to last rule
    ruleSetDec = ruleSetDec - 1;
    if (ruleSetDec < 0) {
      ruleSetDec = int(pow(int(pow(2, hoodSize)), hoodSize))-1;
    }
    initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
  if (key == 'w') { // add one to "on deck" rule
    nextRule = nextRule+1;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == 's') { // subtract one from "on deck" rule
    nextRule = nextRule - 1;
    if (nextRule < 1) {
      nextRule = int(pow(int(pow(2, hoodSize)), hoodSize))-1;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '1') { // add ten to "on deck" rule
    nextRule = nextRule+10;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '2') { // add one hundred to "on deck" rule
    nextRule = nextRule+100;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '3') { // add one thousand to "on deck" rule
    nextRule = nextRule+1000;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  if (key == '4') { // add ten thousand to "on deck" rule
    nextRule = nextRule+10000;
    if (nextRule>int(pow(int(pow(2, hoodSize)), hoodSize))-1) {
      nextRule = 0;
    }
    println("Hit enter for rule#: " + nextRule);
  }
  
  if (keyCode == ENTER) {  // execute "on deck" rule number
  ruleSetDec = nextRule;
      initMatrix();
    ruleSetKey = convertToBinArray(ruleSetDec, int(pow(2, hoodSize)));
    displayRuleSetKey();
  }
  if (key == 'z') { // slow frame rate by 1
    frm = frm - 1;
    if (frm < 1) {
      frm = 1;
    }
    println("Target frame rate: " + frm);
  }
  if (key == 'a') {  // increase frame rate by 1
    frm = frm + 1;
    if (frm > 100) {
      frm = 100;
    }
    println("Target frame rate: " + frm);
  }
}

