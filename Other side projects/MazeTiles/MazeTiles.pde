float tileSize = 10;
int tileCountX;// = 70;
int tileCountY;// = 70;
float tileW = 25;
float tileH = 25;
float numberOfTiles;
color tileBGColor = color(45, 125, 200, 75);
color tileMarkColor = color(100, 250, 250, 50);
Tile allTiles[][]; // = new Tile[int(tileCountY)][int(tileCountX)];
int strokeFluct = 1;
int strokeDir = -1;
int s = 1;

void setup() {
  size(1200, 750);
  tileCountX = int(width / tileW);
  tileCountY = int(height / tileH);  
  allTiles = new Tile[int(tileCountX)][int(tileCountY)];
  numberOfTiles = tileCountY * tileCountX;
  initTiles();
}

void draw() {
/*  strokeWeight(strokeFluct);
  if (frameCount % 50 == 0) {
  strokeFluct = strokeFluct + strokeDir;
  if (strokeFluct == 0) {strokeDir = 1;}
  if (strokeFluct == 5) {strokeDir = -1;}
}
*/
  
  background(125);
  for (int i = 0; i < tileCountX; i ++) {
    for (int j = 0; j < tileCountY; j ++) {
      allTiles[i][j].display();
    }
  }
  //  allTiles[5][10].BGC = color(0, 0, 125);
  //  allTiles[5][10].display();
  //  for (int i = 0; i < tileCountX; i ++) {allTiles[0][i].type = 6; allTiles[0][i].display();}
}

void keyPressed() {
  if (keyCode == UP) {
  s = s + 1;
  if (s > 75) {s = 75;}
  }
  if (keyCode == DOWN) {
  s = s - 1;
  if (s < 1) {s = 1;}
  }
}

void initTiles() {
  int total = 0;
  int newValue = 0;
  for (int i = 0; i < tileCountX; i ++) {
    for (int j = 0; j < tileCountY; j ++) {
      newValue = int(random(16));
      //print("checking tile at "+i+" "+j+"...");
      while (checkAdjacentOK (i, j, newValue) == false) {
        newValue = int(random(16));
      }
      //      println("yes");
      allTiles[i][j] = new Tile(newValue, i * tileW, j * tileH, tileW, tileH, tileBGColor, tileMarkColor);
      total++;
      //     print("Produced tile #" + (total) + ".  Value is ");
      //     println(allTiles[j][i].type);
    }
  }
}

boolean checkAdjacentOK(int xPosit, int yPosit, int value) {
  boolean goodMatch = false;
  boolean part1 = false;
  boolean part2 = false;
  int[] okIfTopIsClear = { // these have clear bottom
    0, 1, 4, 5, 8, 9, 12, 13
  };
  int[] okIfTopIsLine = { // these have line bottom
    2, 3, 6, 7, 10, 11, 14, 15
  };
  int[] okIfLeftIsClear = { // these have clear right
    0, 1, 2, 3, 8, 9, 10, 11
  };
  int[] okIfLeftIsLine = { // these have line right
    4, 5, 6, 7, 12, 13, 14, 15
  };
  if ((yPosit != 0) && (xPosit == 0)) { // left column - not top left corner - only need to check top
    switch (value) { 
    case 0:  // check tile has clear top
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7: 
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit][yPosit - 1].type == okIfTopIsClear[i]) {
          goodMatch = true;
        }
      }
      break;
    case 8:  // check tile has line on top
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit][yPosit - 1].type == okIfTopIsLine[i]) {
          goodMatch = true;
        }
      }
      break;
    }
  } else if ((yPosit == 0) && (xPosit != 0)) { // top row - not top left corner - only need to check left
    switch (value) {
    case 0: // clear left
    case 2:
    case 4:
    case 6:
    case 8:
    case 10:
    case 12:
    case 14: 
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit - 1][yPosit].type == okIfLeftIsClear[i]) {
          goodMatch = true;
        }
      }
      break;
    case 1:  // line left
    case 3:
    case 5:
    case 7:
    case 9:
    case 11:
    case 13:
    case 15:
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit - 1][yPosit].type == okIfLeftIsLine[i]) {
          goodMatch = true;
        }
      }
      break;
    }
  } else if ((yPosit != 0) && (xPosit != 0)) { // any tile except top left corner, top row, or left column - check above and left
    // check above and left
    switch (value) {
    case 0:  // clear top and clear left
    case 2:
    case 4:
    case 6:
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit][yPosit - 1].type == okIfTopIsClear[i]) {
          part1 = true;
        }
      }
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit - 1][yPosit].type == okIfLeftIsClear[i]) {
          part2 = true;
        }
      }
      goodMatch = (part1 && part2);
      break;
    case 1: // clear top line left
    case 3:
    case 5: 
    case 7:
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit][yPosit - 1].type == okIfTopIsClear[i]) {
          part1 = true;
        }
      }
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit - 1][yPosit].type == okIfLeftIsLine[i]) {
          part2 = true;
        }
      }
      goodMatch = (part1 && part2);
      break;
    case 8: // line top clear left
    case 10:
    case 12:
    case 14:
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit][yPosit - 1].type == okIfTopIsLine[i]) {
          part1 = true;
        }
      }
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit - 1][yPosit].type == okIfLeftIsClear[i]) {
          part2 = true;
        }
      }
      goodMatch = (part1 && part2);
      break;
    case 9: // line top and line left
    case 11:
    case 13:
    case 15:
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit][yPosit - 1].type == okIfTopIsLine[i]) {
          part1 = true;
        }
      }
      for (int i = 0; i < 8; i ++) {
        if (allTiles[xPosit - 1][yPosit].type == okIfLeftIsLine[i]) {
          part2 = true;
        }
      }
      goodMatch = (part1 && part2);
      break;
    }
  } else if ((yPosit == 0) && (xPosit == 0)) {  // top left corner - any tile is OK
    goodMatch = true;
  }
  if (goodMatch) {
    //    println("returning " + goodMatch);
  }
  return goodMatch;
}

