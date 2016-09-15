class Tile {
  int type;
  float w = 10;
  float h = 10;
  float x;
  float y;
  color BGC = color(45, 125, 200, 75);
  color markColor = color(100, 250, 250, 50);

  Tile() {
    this.type = 15;
    this.w = 10;
    this.h = 10;
    this.x = 5;
    this.y = 5;
  }

  Tile(int type, float x, float y, float w, float h, color BGC, color markColor) {
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
    stroke(this.markColor);
    strokeWeight(int(random(s)) + 3);
    noFill();
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
  }
}

