import processing.pdf.*;
boolean snapShot = false;
int printCount = 1;

int tileCountX;// = 70;
int tileCountY;// = 70;
float tileW = 150;
float tileH = 100;
float numberOfTiles;
color tileBGColor = color(125);
color tileMarkColor = color(50);

PImage p;
//-------------------------------------------------------------------------------------------
//Tile allTiles[][]; // = new Tile[int(tileCountY)][int(tileCountX)];
//Wide_Tile allTiles[][];
//Five_Line_Tile allTiles[][];
//Curve_Tile allTiles[][];
Shading_Tile allTiles[][];

int strokeFluct = 1;
int strokeDir = -1;
int s = 1;

int composeX = 0;
int composeY = 0;
int composeWhich = 0;
boolean composeMode = false;

int[] leftColumn = {
  0, 0, 2, 2, 4, 4, 6, 6, 8, 8, 10, 10, 12, 12, 14, 14
};
int[] topRow = {
  0, 1, 2, 3, 4, 5, 6, 7, 0, 1, 2, 3, 4, 5, 6, 7
};
int[] rightColumn = {
  0, 1, 2, 3, 0, 1, 2, 3, 8, 9, 10, 11, 8, 9, 10, 11
};
int[] bottomRow = {
  0, 1, 0, 1, 4, 5, 4, 5, 8, 9, 8, 9, 12, 13, 12, 13
};
/*
int[] upperLeft = {0 ,0, 2, 2, 4, 4, 6, 6, 0, 0, 2, 2, 4, 4, 6, 6};
 int[] upperRight = {0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3};
 int[] LowerRight = {0, 1, 0, 1, 0, 1, 0, 1, 8, 9, 8, 9, 8, 9, 8, 9};
 int[] LowerLeft = {0, 0, 0, 0, 4, 4, 4, 4, 8, 8, 8, 8, 12, 12, 12, 12};
 */

void setup() {
  size(1100, 800);
  
p = loadImage("My Eye.jpg");
image(p, 0 , 0);
p.loadPixels();


  tileCountX = int(width / tileW);
  tileCountY = int(height / tileH);  

//----------------------------------------------------------------------------------------
//  allTiles = new Tile[int(tileCountX)][int(tileCountY)];
//  allTiles = new Wide_Tile[int(tileCountX)][int(tileCountY)];
// allTiles = new Five_Line_Tile[int(tileCountX)][int(tileCountY)];
//allTiles = new Curve_Tile[int(tileCountX)][int(tileCountY)];
allTiles = new Shading_Tile[int(tileCountX)][int(tileCountY)];

  numberOfTiles = tileCountY * tileCountX;
  initTiles();
   // noLoop();
}

void draw() {

  if (snapShot) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "print-"+printCount+".pdf");
    printCount = printCount + 1;
  }

  background(125);
  p.updatePixels();
//  image(p, 0 ,0);
  for (int i = 0; i < tileCountX; i ++) {
    for (int j = 0; j < tileCountY; j ++) {
      allTiles[i][j].display();
    }
  }

  //  allTiles[5][10].BGC = color(0, 0, 125);
  //  allTiles[5][10].display();
  //  for (int i = 0; i < tileCountX; i ++) {allTiles[0][i].type = 6; allTiles[0][i].display();}
  if (composeMode == true) {
    fill(125, 0, 0, 150);
    text("Compose Mode ON: toggle with c :: arrows select :: q/a change tile :: b blank", 25, 25);
    allTiles[composeX][composeY].type = composeWhich;
    stroke(125, 0, 0);
    noFill();
    rect(allTiles[composeX][composeY].x, allTiles[composeX][composeY].y, tileH, tileW);
  }

  if (snapShot) {
    endRecord();
    snapShot = false;
  }
}

void keyPressed() {
  if ((key == 'c') || (key == 'C')) {
    composeMode = !(composeMode);
    composeWhich = allTiles[composeX][composeY].type;
  }
  if (composeMode == true) {
    if (keyCode == UP) {
      if (composeY > 0) {
        composeY = composeY - 1;
        composeWhich = allTiles[composeX][composeY].type;
      }
    }
    if (keyCode == DOWN) {
      if (composeY < tileCountY-1) {
        composeY = composeY + 1;
        composeWhich = allTiles[composeX][composeY].type;
      }
    }
    if (keyCode == LEFT) {
      if (composeX > 0) {
        composeX = composeX - 1;
        composeWhich = allTiles[composeX][composeY].type;
      }
    }
    if (keyCode == RIGHT) {
      if (composeX < tileCountX-1) {
        composeX = composeX + 1;
        composeWhich = allTiles[composeX][composeY].type;
      }
    }
    if ((key == 'q') || (key == 'Q')) {
      composeWhich = composeWhich + 1;
      if (composeWhich > 15) {
        composeWhich = 0;
      }
    }
    if ((key == 'a') || (key == 'A')) {
      composeWhich = composeWhich - 1;
      if (composeWhich < 0) {
        composeWhich = 15;
      }
    }
    if ((key == 'b') || (key == 'B')) {
      for (int i = 0; i < tileCountX; i ++) {
        for (int j = 0; j < tileCountY; j ++) {
          allTiles[i][j].type = 0;
        }
      }
      composeWhich = 0;
    }
  } else {
    if ((key == 'i') || (key == 'I')) {
      initTiles();
    }
    if ((key == 's') || (key == 'S')) {
      snapShot = true;
    }
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
      
//------------------------------------------------------------------------------------------------------------------
//            allTiles[i][j] = new Tile(newValue, i * tileW, j * tileH, tileW, tileH, tileBGColor, tileMarkColor);
//    allTiles[i][j] = new Wide_Tile(newValue, i * tileW, j * tileH, tileW, tileH, tileBGColor, tileMarkColor);
//    allTiles[i][j] = new Five_Line_Tile(newValue, i * tileW, j * tileH, tileW, tileH, tileBGColor, tileMarkColor);
//allTiles[i][j] = new Curve_Tile(newValue, i * tileW, j * tileH, tileW, tileH, tileBGColor, tileMarkColor);
allTiles[i][j] = new Shading_Tile(newValue, i * tileW, j * tileH, tileW, tileH, tileBGColor, tileMarkColor);

      total++;
      //     print("Produced tile #" + (total) + ".  Value is ");
      //     println(allTiles[j][i].type);
    }
  }
  fixEdges();
  
/*
for (int i = 0; i < 16; i ++) {
    allTiles[i][1].type = i;
  }
*/  
  
}

void fixEdges() {
  for (int i = 0; i < tileCountX; i ++) {// top and bottom rows
    allTiles[i][0].type = topRow[allTiles[i][0].type];
    allTiles[i][tileCountY - 1].type = bottomRow[allTiles[i][tileCountY - 1].type];
  }  
  for (int i = 0; i < tileCountY; i ++) {// left and right columns
    allTiles[0][i].type = leftColumn[allTiles[0][i].type];
    allTiles[tileCountX - 1][i].type = rightColumn[allTiles[tileCountX - 1][i].type];
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

