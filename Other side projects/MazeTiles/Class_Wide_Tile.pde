class Wide_Tile {
  int type;
  float w = 10;
  float h = 10;
  float x;
  float y;
  color BGC = color(45, 125, 200, 75);
  color markColor = color(100, 250, 250, 50);

  Wide_Tile() {
    this.type = 15;
    this.w = 10;
    this.h = 10;
    this.x = 5;
    this.y = 5;
  }

  Wide_Tile(int type, float x, float y, float w, float h, color BGC, color markColor) {
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
    noStroke();
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
        ellipse(this.x + (this.w * 0.6), this.y + (this.h * 0.5), this.w * 0.6, this.h * 0.6);
        rect(this.x, this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);
        break;
      }
    case  2: 
      {
        ellipse(this.x + (this.w * 0.5), this.y + (this.h * 0.4), this.w * 0.6, this.h * 0.6);
        rect(this.x + (this.w * 0.3), this.y + (this.h * 0.6), this.w * 0.4, this.h * 0.4);

        break;
      }
    case  3: 
      {
        rect(this.x, this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);
        rect(this.x + (this.w * 0.3), this.y + (this.h * 0.6), this.w * 0.4, this.h * 0.4);
        arc(this.x + (this.h * 0.4), this.y + (this.w * 0.6), this.w * 0.6, this.h * 0.6, PI + HALF_PI, TWO_PI);
        break;
      }
    case  4: 
      {
        ellipse(this.x + (this.w * 0.4), this.y + (this.h * 0.5), this.w * 0.6, this.h * 0.6);
        rect(this.x + (this.w * 0.6), this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);      
        break;
      }
    case  5: 
      {
        rect(this.x, this.y + (this.h * 0.3), this.w, this.h * 0.4);
        break;
      }
    case  6: 
      {
        rect(this.x + (this.w * 0.6), this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);
        rect(this.x + (this.w * 0.3), this.y + (this.h * 0.6), this.w * 0.4, this.h * 0.4);
        arc(this.x + (this.h * 0.6), this.y + (this.w * 0.6), this.w * 0.6, this.h * 0.6, PI, PI + HALF_PI);
        break;
      }
    case  7: 
      {
        rect(this.x, this.y + (this.h * 0.3), this.w, this.h * 0.4);
        rect(this.x + (this.w * 0.3), this.y + (this.h * 0.6), this.w * 0.4, this.h * 0.4);
        break;
      }
    case  8: 
      {
        ellipse(this.x + (this.w * 0.5), this.y + (this.h * 0.6), this.w * 0.6, this.h * 0.6);
        rect(this.x + (this.w * 0.3), this.y, this.w * 0.4, this.h * 0.4);
        break;
      }
    case  9: 
      {
        rect(this.x + (this.w * 0.3), this.y, this.w * 0.4, this.h * 0.4);
        rect(this.x, this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);
        arc(this.x + (this.h * 0.4), this.y + (this.w * 0.4), this.w * 0.6, this.h * 0.6, 0, HALF_PI);
        break;
      }
    case  10: 
      {
        rect(this.x+ (this.w * 0.3), this.y, this.w * 0.4, this.h);
        break;
      }
    case  11: 
      {
        rect(this.x + (this.w * 0.3), this.y, this.w * 0.4, this.h);
        rect(this.x, this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);
        break;
      }
    case  12: 
      {
        rect(this.x + (this.w * 0.3), this.y, this.w * 0.4, this.h * 0.4);
        rect(this.x + (this.w * 0.6), this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);
        arc(this.x + (this.h * 0.6), this.y + (this.w * 0.4), this.w * 0.6, this.h * 0.6, HALF_PI, PI);
        break;
      }
    case  13: 
      {
        rect(this.x, this.y + (this.h * 0.3), this.w, this.h * 0.4);
        rect(this.x + (this.h * 0.3), this.y, this.w * 0.4, this.h * 0.4);
        break;
      }
    case  14: 
      {
        rect(this.x + (this.w * 0.3), this.y, this.w * 0.4, this.h);
        rect(this.x + (this.w * 0.6), this.y + (this.h * 0.3), this.w * 0.4, this.h * 0.4);
        break;
      }
    case  15: 
      {
        rect(this.x, this.y + (this.h * 0.3), this.w, this.h * 0.4);
        rect(this.x + (this.w * 0.3), this.y, this.w * 0.4, this.h);
        break;
      }
    }
//    fill(125, 0, 0);
//    text (type, this.x + this.w*0.4, this.y + this.h*0.4);
  }
}

