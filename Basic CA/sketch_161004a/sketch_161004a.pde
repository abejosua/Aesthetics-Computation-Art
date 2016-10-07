int gridX = 100;
int gridY = 100;
int region[][] = new int[gridY][gridX];
int newRegion[][] = new int[gridY][gridX];
int unitSize = 5;
int initProb = 500;
int rule = 5;
int[] ruleGrid = convertRule(rule);

void setup() {
  size(gridX * unitSize, gridY * unitSize);
  initGrid();
  noLoop();
}

void draw() {
  background(125);
  displayGrid();
  updateGrid();
  fill(255, 0, 0);
  textSize(20);
  text(rule, 25, 25);
}

void initGrid() {
  for (int y = 0; y < gridY; y ++) {
    for (int x = 0; x < gridX; x ++) {
      region[y][x] = 0;
      if (int(random(initProb)) == 7) {region[y][x] = 1;}
    }
  }
}

void displayGrid() {
  for (int y = 0; y < gridY; y ++) {
    for (int x = 0; x < gridX; x ++) {
      if (region[y][x] == 1) {fill(255);}
      else {fill(125);}
      rect(x * unitSize, y * unitSize, unitSize, unitSize);
      if (random(initProb) == 7) {region[y][x] = 1;}
    }
  }
}

void updateGrid() {
  for (int x = 1; x < gridX - 1; x ++) {
    for (int y = 1; y < gridY - 1; y ++) {
      if (region[y][x] == 1) {
/*
newRegion[y-1][x-1] = ruleGrid[0];
        newRegion[y-1][x] = ruleGrid[1];
        newRegion[y-1][x+1] = ruleGrid[2];
        newRegion[y][x-1] = ruleGrid[3];
        newRegion[y][x+1] = ruleGrid[4];
        newRegion[y+1][x-1] = ruleGrid[5];
        newRegion[y+1][x] = ruleGrid[6];
        newRegion[y+1][x+1] = ruleGrid[7];
*/        
        region[y-1][x-1] = ruleGrid[0];
        region[y-1][x] = ruleGrid[1];
        region[y-1][x+1] = ruleGrid[2];
        region[y][x-1] = ruleGrid[3];
        region[y][x+1] = ruleGrid[4];
        region[y+1][x-1] = ruleGrid[5];
        region[y+1][x] = ruleGrid[6];
        region[y+1][x+1] = ruleGrid[7];        
     }
    }
  }
//  arrayCopy(region, newRegion);
}
// 138 202
int[] convertRule(int decimal) {
  int binary[] = {0, 0, 0, 0, 0, 0 ,0 ,0};
  int counter = binary.length - 1;
  while (counter >= 0) {
  binary [counter] = decimal / int(pow(2, counter));
  print(binary[counter]);
  if (binary[counter] == 1) {decimal = decimal - int(pow(2, counter));}
  counter --;
  }
  println();
  return binary;
}

void keyPressed() {
  if (keyCode == RIGHT) {
    redraw();
  }
  if (keyCode == UP) {
    rule = rule + 1;
    initGrid();
    ruleGrid = convertRule(rule);
    redraw();
  }
  if (keyCode == DOWN) {
    rule = rule - 1;
    initGrid();
    ruleGrid = convertRule(rule);
    redraw();
  }
}
  

