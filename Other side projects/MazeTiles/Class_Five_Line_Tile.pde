class Five_Line_Tile {
  int type;
  float w = 10;
  float h = 10;
  float x;
  float y;
  color BGC = color(125, 0, 0, 75);
  color markColor = color(0, 250, 0, 50);

  Five_Line_Tile() {
    this.type = 15;
    this.w = 10;
    this.h = 10;
    this.x = 5;
    this.y = 5;
  }

  Five_Line_Tile(int type, float x, float y, float w, float h, color BGC, color markColor) {
    this.type = type;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this. BGC = BGC;
    this.markColor = markColor;
  }

  void display() {
    //    float vibe = random(-1, 1);
    //    println(vibe);
    //    this.x = this.x + vibe;
    //    this.y = this.y + vibe;
   

    noStroke();
    //    stroke(125,0,0);
    //    strokeWeight(1);
    fill(this.BGC);
    rect(this.x, this.y, this.w, this.h);
    //    stroke(this.markColor);
    stroke(200);
    strokeWeight(5);
    //    strokeWeight(int(random(s)) + 3);
    //    noFill();
    fill(200);
    switch (this.type) {
    case 0: 
      {
        break;
      }
    case  1: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w * 0.5, 2);
rect(this.x, this.y + (0.3 * this.h), this.w * 0.7, 2);
rect(this.x, this.y + (0.5 * this.h), this.w * 0.9, 2);
rect(this.x, this.y + (0.7 * this.h), this.w * 0.7, 2);
rect(this.x, this.y + (0.9 * this.h), this.w * 0.5, 2);
        break;
      }
    case  2: 
      {
// vertical
rect(this.x + (0.1 * this.w), this.y + (0.5 * this.h), 2, (0.5 * this.h));
rect(this.x + (0.3 * this.w), this.y + (0.3 * this.h), 2, (0.7 * this.h));
rect(this.x + (0.5 * this.w), this.y + (0.1 * this.h), 2, (0.9 * this.h));
rect(this.x + (0.7 * this.w), this.y + (0.3 * this.h), 2, (0.7 * this.h));
rect(this.x + (0.9 * this.w), this.y + (0.5 * this.h), 2, (0.5 * this.h));
        break;
      }
    case  3: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w * 0.1, 2);
rect(this.x, this.y + (0.3 * this.h), this.w * 0.3, 2);
rect(this.x, this.y + (0.5 * this.h), this.w * 0.5, 2);
rect(this.x, this.y + (0.7 * this.h), this.w * 0.7, 2);
rect(this.x, this.y + (0.9 * this.h), this.w * 0.9, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y + (0.1 * this.h), 2, (0.9 * this.h));
rect(this.x + (0.3 * this.w), this.y + (0.3 * this.h), 2, (0.7 * this.h));
rect(this.x + (0.5 * this.w), this.y + (0.5 * this.h), 2, (0.5 * this.h));
rect(this.x + (0.7 * this.w), this.y + (0.7 * this.h), 2, (0.3 * this.h));
rect(this.x + (0.9 * this.w), this.y + (0.9 * this.h), 2, (0.1 * this.h));
        break;
      }
    case  4: 
      {
// horizontal
rect(this.x + (this.w * 0.9), this.y + (0.1 * this.h), this.w * 0.1, 2);
rect(this.x + (this.w * 0.7), this.y + (0.3 * this.h), this.w * 0.3, 2);
rect(this.x + (this.w * 0.5), this.y + (0.5 * this.h), this.w * 0.5, 2);
rect(this.x + (this.w * 0.7), this.y + (0.7 * this.h), this.w * 0.3, 2);
rect(this.x + (this.w * 0.9), this.y + (0.9 * this.h), this.w * 0.1, 2);
        break;
      }
    case  5: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w, 2);
rect(this.x, this.y + (0.3 * this.h), this.w, 2);
rect(this.x, this.y + (0.5 * this.h), this.w, 2);
rect(this.x, this.y + (0.7 * this.h), this.w, 2);
rect(this.x, this.y + (0.9 * this.h), this.w, 2);
        break;
      }
    case  6: 
      {
// horizontal
rect(this.x + (0.1 * this.w), this.y + (0.9 * this.h), (this.w * 0.9), 2);
rect(this.x + (0.3 * this.w), this.y + (0.7 * this.h), (this.w * 0.7), 2);
rect(this.x + (0.5 * this.w), this.y + (0.5 * this.h), (this.w * 0.5), 2);
rect(this.x + (0.7 * this.w), this.y + (0.3 * this.h), (this.w * 0.3), 2);
rect(this.x + (0.9 * this.w), this.y + (0.1 * this.h), (this.w * 0.1), 2);
// vertical
rect(this.x + (0.1 * this.w), this.y + (0.9 * this.h), 2, (0.1 * this.h));
rect(this.x + (0.3 * this.w), this.y + (0.7 * this.h), 2, (0.3 * this.h));
rect(this.x + (0.5 * this.w), this.y + (0.5 * this.h), 2, (0.5 * this.h));
rect(this.x + (0.7 * this.w), this.y + (0.3 * this.h), 2, (0.7 * this.h));
rect(this.x + (0.9 * this.w), this.y + (0.1 * this.h), 2, (0.9 * this.h));
        break;
      }
    case  7: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w, 2);
rect(this.x, this.y + (0.3 * this.h), this.w, 2);
rect(this.x, this.y + (0.5 * this.h), this.w, 2);
rect(this.x, this.y + (0.7 * this.h), this.w, 2);
rect(this.x, this.y + (0.9 * this.h), this.w, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y + (0.1 * this.h), 2, (0.9 * this.h));
rect(this.x + (0.3 * this.w), this.y + (0.3 * this.h), 2, (0.7 * this.h));
rect(this.x + (0.5 * this.w), this.y + (0.5 * this.h), 2, (0.5 * this.h));
rect(this.x + (0.7 * this.w), this.y + (0.7 * this.h), 2, (0.3 * this.h));
rect(this.x + (0.9 * this.w), this.y + (0.9 * this.h), 2, (0.1 * this.h));
        break;
      }
    case  8: 
      {
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, (0.5 * this.h));
rect(this.x + (0.3 * this.w), this.y, 2, (0.7 * this.h));
rect(this.x + (0.5 * this.w), this.y, 2, (0.9 * this.h));
rect(this.x + (0.7 * this.w), this.y, 2, (0.7 * this.h));
rect(this.x + (0.9 * this.w), this.y, 2, (0.5 * this.h));
        break;
      }
    case  9: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), 0.9 * this.w, 2);
rect(this.x, this.y + (0.3 * this.h), 0.7 * this.w, 2);
rect(this.x, this.y + (0.5 * this.h), 0.5 * this.w, 2);
rect(this.x, this.y + (0.7 * this.h), 0.3 * this.w, 2);
rect(this.x, this.y + (0.9 * this.h), 0.1 * this.w, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, (0.9 * this.h));
rect(this.x + (0.3 * this.w), this.y, 2, (0.7 * this.h));
rect(this.x + (0.5 * this.w), this.y, 2, (0.5 * this.h));
rect(this.x + (0.7 * this.w), this.y, 2, (0.3 * this.h));
rect(this.x + (0.9 * this.w), this.y, 2, (0.1 * this.h));
        break;
      }
    case  10: 
      {
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, this.h);
rect(this.x + (0.3 * this.w), this.y, 2, this.h);
rect(this.x + (0.5 * this.w), this.y, 2, this.h);
rect(this.x + (0.7 * this.w), this.y, 2, this.h);
rect(this.x + (0.9 * this.w), this.y, 2, this.h);
        break;
      }
    case  11: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w * 0.1, 2);
rect(this.x, this.y + (0.3 * this.h), this.w * 0.3, 2);
rect(this.x, this.y + (0.5 * this.h), this.w * 0.5, 2);
rect(this.x, this.y + (0.7 * this.h), this.w * 0.7, 2);
rect(this.x, this.y + (0.9 * this.h), this.w * 0.9, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, this.h);
rect(this.x + (0.3 * this.w), this.y, 2, this.h);
rect(this.x + (0.5 * this.w), this.y, 2, this.h);
rect(this.x + (0.7 * this.w), this.y, 2, this.h);
rect(this.x + (0.9 * this.w), this.y, 2, this.h);
        break;
      }
    case  12: 
      {
// horizontal
rect(this.x + (this.w * 0.1), this.y + (0.1 * this.h), this.w * 0.9, 2);
rect(this.x + (this.w * 0.3), this.y + (0.3 * this.h), this.w * 0.7, 2);
rect(this.x + (this.w * 0.5), this.y + (0.5 * this.h), this.w * 0.5, 2);
rect(this.x + (this.w * 0.7), this.y + (0.7 * this.h), this.w * 0.3, 2);
rect(this.x + (this.w * 0.9), this.y + (0.9 * this.h), this.w * 0.1, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, (0.1 * this.h));
rect(this.x + (0.3 * this.w), this.y, 2, (0.3 * this.h));
rect(this.x + (0.5 * this.w), this.y, 2, (0.5 * this.h));
rect(this.x + (0.7 * this.w), this.y, 2, (0.7 * this.h));
rect(this.x + (0.9 * this.w), this.y, 2, (0.9 * this.h));
        break;
      }
    case  13: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w, 2);
rect(this.x, this.y + (0.3 * this.h), this.w, 2);
rect(this.x, this.y + (0.5 * this.h), this.w, 2);
rect(this.x, this.y + (0.7 * this.h), this.w, 2);
rect(this.x, this.y + (0.9 * this.h), this.w, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, (0.1 * this.h));
rect(this.x + (0.3 * this.w), this.y, 2, (0.3 * this.h));
rect(this.x + (0.5 * this.w), this.y, 2, (0.5 * this.h));
rect(this.x + (0.7 * this.w), this.y, 2, (0.7 * this.h));
rect(this.x + (0.9 * this.w), this.y, 2, (0.9 * this.h));
        break;
      }
    case  14: 
      {
// horizontal
rect(this.x + (this.w * 0.1), this.y + (0.1 * this.h), this.w * 0.9, 2);
rect(this.x + (this.w * 0.3), this.y + (0.3 * this.h), this.w * 0.7, 2);
rect(this.x + (this.w * 0.5), this.y + (0.5 * this.h), this.w * 0.5, 2);
rect(this.x + (this.w * 0.7), this.y + (0.7 * this.h), this.w * 0.3, 2);
rect(this.x + (this.w * 0.9), this.y + (0.9 * this.h), this.w * 0.1, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, this.h);
rect(this.x + (0.3 * this.w), this.y, 2, this.h);
rect(this.x + (0.5 * this.w), this.y, 2, this.h);
rect(this.x + (0.7 * this.w), this.y, 2, this.h);
rect(this.x + (0.9 * this.w), this.y, 2, this.h);
        break;
      }
    case  15: 
      {
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w, 2);
rect(this.x, this.y + (0.3 * this.h), this.w, 2);
rect(this.x, this.y + (0.5 * this.h), this.w, 2);
rect(this.x, this.y + (0.7 * this.h), this.w, 2);
rect(this.x, this.y + (0.9 * this.h), this.w, 2);
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, this.h);
rect(this.x + (0.3 * this.w), this.y, 2, this.h);
rect(this.x + (0.5 * this.w), this.y, 2, this.h);
rect(this.x + (0.7 * this.w), this.y, 2, this.h);
rect(this.x + (0.9 * this.w), this.y, 2, this.h);
        break;
      }
    }
    fill(125, 0, 0);
    text (type, this.x + this.w*0.4, this.y + this.h*0.4);

  }
}

