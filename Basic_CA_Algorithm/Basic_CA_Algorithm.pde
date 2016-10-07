int gridX = 100;
int gridY = 100;
int region[][] = new int[gridY][gridX];
int newRegion[][] = new int[gridY][gridX];
int unitSize = 5;
int initProb = 500;
int rule = 255;
int[] ruleGrid = convertRule(rule);

void setup() {
  size(gridX * unitSize, gridY * unitSize);
  initGrids();
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

void initGrids() {
  for (int y = 0; y < gridY; y ++) {
    for (int x = 0; x < gridX; x ++) {
      newRegion[y][x] = 0;
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

        newRegion[y-1][x-1] = 0;//ruleGrid[7];
        newRegion[y-1][x] = 0;//ruleGrid[6];
        newRegion[y-1][x+1] = 1;//ruleGrid[5];
        newRegion[y][x-1] = 0;//ruleGrid[4];
        newRegion[y][x] = 1;
        newRegion[y][x+1] = 0;//ruleGrid[3];
        newRegion[y+1][x-1] = 0;//ruleGrid[2];
        newRegion[y+1][x] = 0;//ruleGrid[1];
        newRegion[y+1][x+1] = 0;//ruleGrid[0];        
     }
     else {newRegion[y][x] = 0;}
    }
  }
  arrayCopy(newRegion, region);
}

// 138 202
int[] convertRule(int decimal) {
  int binary[] = {0, 0, 0, 0, 0, 0 ,0 ,0};
  int counter = binary.length - 1;
  while (counter >= 0) {
  binary [(binary.length - 1) - counter] = decimal / int(pow(2, counter));
//  print(binary[counter]);
  if (binary[(binary.length - 1) - counter] == 1) {decimal = decimal - int(pow(2, counter));}
  counter --;
  }
//  println();
  return binary;
}

void keyPressed() {
  if (keyCode == RIGHT) {
    redraw();
  }
  if (keyCode == UP) {
    rule = rule + 1;
    if (rule > 255) {rule = 0;}
    initGrids();
    ruleGrid = convertRule(rule);
    println(ruleGrid);
    redraw();
  }
  if (keyCode == DOWN) {
    rule = rule - 1;
    if (rule < 0) {rule = 255;}
    initGrids();
    ruleGrid = convertRule(rule);
    println(ruleGrid);
    redraw();
  }
}
  

