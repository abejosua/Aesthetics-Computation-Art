class Shading_Tile {
  int type;
  float w = 10;
  float h = 10;
  float x;
  float y;
  color BGC = color(45, 125, 200, 75);
  color markColor = color(100, 250, 250, 50);
  float r[] = new float [256];

  Shading_Tile() {
    this.type = 15;
    this.w = 10;
    this.h = 10;
    this.x = 5;
    this.y = 5;
  }

  Shading_Tile(int type, float x, float y, float w, float h, color BGC, color markColor) {
    this.type = type;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this. BGC = BGC;
    this.markColor = markColor;
    for (int i = 0; i < 256; i ++ ) {
      r[i] = random(0.25);
    }
  }

  void display() {
//    float vibe = random(-1, 1);
//    println(vibe);
//    this.x = this.x + vibe;
//    this.y = this.y + vibe;
    
    noStroke();
//    stroke(125,0,0);
//    strokeWeight(1);

//    fill(this.BGC);
//    rect(this.x, this.y, this.w, this.h);
    stroke(this.markColor);

//    strokeWeight(int(random(s)) + 3);
  strokeWeight(1);
    noFill();
//fill(0);
//ellipseMode(CORNER);

float eW = ((0.3 * this.w)/1.5);
float eH = ((0.3 * this.h)/1.5);

int count = 0;
for (int h = 0; h < this.type / 2; h ++) {
for (float i = 0; i < 1; i = i = i + 0.25) {
  for (float j = 0; j < 1; j = j + 0.25) {
    rect(this.x + (i * this.w)+(r[count]*this.w), this.y + (j * this.h)+(r[count]*this.h), eW, eH, 5);
    count = count + 1;
  }
}
}
/*

    float eW = ((0.25 * this.w) / 16) * this.type;
float eH = ((0.25 * this.h) / 16) * this.type;
int count = 0;
for (float i = 0; i < 1; i = i = i + 0.25) {
  for (float j = 0; j < 1; j = j + 0.25) {
    rect(this.x + (i * this.w)+(r[count]*this.w), this.y + (j * this.h)+(r[count]*this.h), eW, eH, 7);
    count = count + 1;
  }
}
*/
/*
    switch (this.type) {
    case 0: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  1: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);

      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 

      break;
    }
  case  2: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  3: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  4: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  5: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  6: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  7: 
    {
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  8: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  9: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  10: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  11: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  12: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  13: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  14: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
//      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
  case  15: 
    {
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + this.w, this.y + (this.h / 2));
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x + (this.w / 2), this.y + this.h);
      line(this.x + (this.w / 2), this.y + (this.h / 2), this.x, this.y + (this.h / 2)); 
      break;
    }
    }
    */
//    fill(125, 0, 0);
//    text (type, this.x + this.w*0.4, this.y + this.h*0.4);


  }

}


