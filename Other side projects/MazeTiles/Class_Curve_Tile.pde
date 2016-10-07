class Curve_Tile {
  int type;
  float w = 10;
  float h = 10;
  float x;
  float y;
  color BGC = color(125, 0, 0, 75);
  color markColor = color(0, 250, 0, 50);
  PVector cp1, cp2, cp3, cp4, cp5, cp6, cp7, cp8;

  Curve_Tile() {
    this.type = 15;
    this.w = 10;
    this.h = 10;
    this.x = 5;
    this.y = 5;
  }

  Curve_Tile(int type, float x, float y, float w, float h, color BGC, color markColor) {
    this.type = type;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this. BGC = BGC;
    this.markColor = markColor;
/*
this.cp1 = new PVector (random(w), random(h));
    this.cp2 = new PVector (random(w), random(h));
    this.cp3 = new PVector (random(w), random(h));
    this.cp4 = new PVector (random(w), random(h));
    this.cp5 = new PVector (random(w), random(h));
    this.cp6 = new PVector (random(w), random(h));
    this.cp7 = new PVector (random(w), random(h));
    this.cp8 = new PVector (random(w), random(h));
    */
    
    this.cp1 = new PVector (random(0.2 * w) + (0.1 * w), random(0.2 * h) + (0.1 * h));
    this.cp2 = new PVector (random(0.2 * w) + (0.1 * w), random(0.2 * h) + (0.1 * h));
    this.cp3 = new PVector (random(0.2 * w) + (0.7 * w), random(0.2 * h) + (0.1 * h));
    this.cp4 = new PVector (random(0.2 * w) + (0.7 * w), random(0.2 * h) + (0.1 * h));
    this.cp5 = new PVector (random(0.2 * w) + (0.1 * w), random(0.2 * h) + (0.7 * h));
    this.cp6 = new PVector (random(0.2 * w) + (0.1 * w), random(0.2 * h) + (0.7 * h));
    this.cp7 = new PVector (random(0.2 * w) + (0.7 * w), random(0.2 * h) + (0.7 * h));
    this.cp8 = new PVector (random(0.2 * w) + (0.7 * w), random(0.2 * h) + (0.7 * h));
    
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
    strokeWeight(3);
    //    strokeWeight(int(random(s)) + 3);
    //    noFill();
    fill(200);
    noFill();
    switch (this.type) {
    case 0: 
      {
        break;
      }
    case  1: 
      {
        beginShape();
        vertex(this.x,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.cp4.x, this.y + this.cp4.y, this.x, this.y + (0.6 * this.h));
        endShape();
        /*
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w * 0.5, 2);
rect(this.x, this.y + (0.3 * this.h), this.w * 0.7, 2);
rect(this.x, this.y + (0.5 * this.h), this.w * 0.9, 2);
rect(this.x, this.y + (0.7 * this.h), this.w * 0.7, 2);
rect(this.x, this.y + (0.9 * this.h), this.w * 0.5, 2);
*/
        break;
      }
    case  2: 
      {
                beginShape();
        vertex(this.x + (0.4 * this.w),this.y+ this.h);
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp2.x, this.y + this.cp2.y, this.x + (0.6 * this.w), this.y + this.h);
        endShape();
/*
// vertical
rect(this.x + (0.1 * this.w), this.y + (0.5 * this.h), 2, (0.5 * this.h));
rect(this.x + (0.3 * this.w), this.y + (0.3 * this.h), 2, (0.7 * this.h));
rect(this.x + (0.5 * this.w), this.y + (0.1 * this.h), 2, (0.9 * this.h));
rect(this.x + (0.7 * this.w), this.y + (0.3 * this.h), 2, (0.7 * this.h));
rect(this.x + (0.9 * this.w), this.y + (0.5 * this.h), 2, (0.5 * this.h));
*/
        break;
      }
    case  3: 
      {
        beginShape();
        vertex(this.x ,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.cp4.x, this.y + this.cp4.y, this.x + (0.6 * this.w), this.y + this.h);
        endShape();
        beginShape();
        vertex(this.x ,this.y + (0.6 * this.h));
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp2.x, this.y + this.cp2.y, this.x + (0.4 * this.w), this.y + this.h);
        endShape();
/*
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
*/
        break;
      }
    case  4: 
      {
        beginShape();
        vertex(this.x + this.w,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp5.x, this.y + this.cp5.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x + this.w, this.y + (0.6 * this.h));
        endShape();
        /*
// horizontal
rect(this.x + (this.w * 0.9), this.y + (0.1 * this.h), this.w * 0.1, 2);
rect(this.x + (this.w * 0.7), this.y + (0.3 * this.h), this.w * 0.3, 2);
rect(this.x + (this.w * 0.5), this.y + (0.5 * this.h), this.w * 0.5, 2);
rect(this.x + (this.w * 0.7), this.y + (0.7 * this.h), this.w * 0.3, 2);
rect(this.x + (this.w * 0.9), this.y + (0.9 * this.h), this.w * 0.1, 2);
*/
        break;
      }
    case  5: 
      {
        beginShape();
        vertex(this.x ,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp5.x, this.y + this.cp5.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x + this.w, this.y + (0.4 * this.h));
        endShape();
        beginShape();
        vertex(this.x ,this.y + (0.6 * this.h));
        bezierVertex(this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.cp4.x, this.y + this.cp4.y, this.x + this.w, this.y + (0.6 * this.h));
        endShape();
/*
// horizontal
rect(this.x, this.y + (0.1 * this.h), this.w, 2);
rect(this.x, this.y + (0.3 * this.h), this.w, 2);
rect(this.x, this.y + (0.5 * this.h), this.w, 2);
rect(this.x, this.y + (0.7 * this.h), this.w, 2);
rect(this.x, this.y + (0.9 * this.h), this.w, 2);
*/
        break;
      }
    case  6: 
      {
        beginShape();
        vertex(this.x + this.w,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp2.x, this.y + this.cp2.y, this.x + (0.4 * this.w), this.y + this.h);
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y + this.h);
        bezierVertex(this.x + this.cp7.x, this.y + this.cp7.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + this.w, this.y + (0.6 * this.h));
        endShape();
/*
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
*/
        break;
      }
    case  7: 
      {
        beginShape();
        vertex(this.x ,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.w, this.y + (0.4 * this.h));
        endShape();
        beginShape();
        vertex(this.x + (0.4 * this.w),this.y + this.h);
        bezierVertex(this.x + this.cp5.x, this.y + this.cp5.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x, this.y + (0.6 * this.h));
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y + this.h);
        bezierVertex(this.x + this.cp7.x, this.y + this.cp7.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + this.w, this.y +  + (0.6 * this.h));
        endShape();
/*
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
*/
        break;
      }
    case  8: 
      {
                beginShape();
        vertex(this.x + (0.4 * this.w),this.y);
        bezierVertex(this.x + this.cp6.x, this.y + this.cp6.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + (0.6 * this.w), this.y);
        endShape();
/*
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, (0.5 * this.h));
rect(this.x + (0.3 * this.w), this.y, 2, (0.7 * this.h));
rect(this.x + (0.5 * this.w), this.y, 2, (0.9 * this.h));
rect(this.x + (0.7 * this.w), this.y, 2, (0.7 * this.h));
rect(this.x + (0.9 * this.w), this.y, 2, (0.5 * this.h));
*/
        break;
      }
    case  9: 
      {
        beginShape();
        vertex(this.x ,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp3.x, this.y + this.cp3.y, this.x + (0.4 * this.w), this.y);
        endShape();
        beginShape();
        vertex(this.x ,this.y + (0.6 * this.h));
        bezierVertex(this.x + this.cp7.x, this.y + this.cp7.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + (0.6 * this.w), this.y);
        endShape();
/*
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
*/
        break;
      }
    case  10: 
      {
        beginShape();
        vertex(this.x + (0.4 * this.w) ,this.y);
        bezierVertex(this.x + this.cp2.x, this.y + this.cp2.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x + (0.4 * this.w), this.y + this.h);
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w) ,this.y);
        bezierVertex(this.x + this.cp4.x, this.y + this.cp4.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + (0.6 * this.w), this.y + this.h);
        endShape();
/*
// vertical
rect(this.x + (0.1 * this.w), this.y, 2, this.h);
rect(this.x + (0.3 * this.w), this.y, 2, this.h);
rect(this.x + (0.5 * this.w), this.y, 2, this.h);
rect(this.x + (0.7 * this.w), this.y, 2, this.h);
rect(this.x + (0.9 * this.w), this.y, 2, this.h);
*/
        break;
      }
    case  11: 
      {
        beginShape();
        vertex(this.x + (0.6 * this.w) ,this.y);
        bezierVertex(this.x + this.cp4.x, this.y + this.cp4.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + (0.6 * this.w), this.y + this.h);
        endShape();
        beginShape();
        vertex(this.x ,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp3.x, this.y + this.cp3.y, this.x + (0.4 * this.w), this.y);
        endShape();
        beginShape();
        vertex(this.x ,this.y + (0.6 * this.h));
        bezierVertex(this.x + this.cp5.x, this.y + this.cp5.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x + (0.4 * this.w), this.y + this.h);
        endShape();
/*

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
*/
        break;
      }
    case  12: 
      {
        beginShape();
        vertex(this.x  + (0.4 * this.w), this.y);
        bezierVertex(this.x + this.cp5.x, this.y + this.cp5.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x + this.w, this.y + (0.6 * this.h));
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y);
        bezierVertex(this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.cp4.x, this.y + this.cp4.y, this.x + this.w, this.y + (0.4 * this.h));
        endShape();
/*
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
*/
        break;
      }
    case  13: 
      {
        beginShape();
        vertex(this.x ,this.y + (0.6 * this.h));
        bezierVertex(this.x + this.cp5.x, this.y + this.cp5.y, this.x + this.cp7.x, this.y + this.cp7.y, this.x + this.w, this.y + (0.6 * this.h));
        endShape();
        beginShape();
        vertex(this.x + (0.4 * this.w),this.y);
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp2.x, this.y + this.cp2.y, this.x, this.y + (0.4 * this.h));
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y);
        bezierVertex(this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.cp4.x, this.y + this.cp4.y, this.x + this.w, this.y + (0.4 * this.h));
        endShape();
/*
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
*/
        break;
      }
    case  14: 
      {
        beginShape();
        vertex(this.x + (0.4 * this.w) ,this.y);
        bezierVertex(this.x + this.cp2.x, this.y + this.cp2.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x + (0.4 * this.w), this.y + this.h);
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y);
        bezierVertex(this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.cp4.x, this.y + this.cp4.y, this.x + this.w, this.y + (0.4 * this.h));
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y + this.h);
        bezierVertex(this.x + this.cp7.x, this.y + this.cp7.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + this.w, this.y + (0.6 * this.h));
        endShape();
/*
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
*/
        break;
      }
    case  15: 
      {
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y);
        bezierVertex(this.x + this.cp3.x, this.y + this.cp3.y, this.x + this.cp4.x, this.y + this.cp4.y, this.x + this.w, this.y + (0.4 * this.h));
        endShape();
        beginShape();
        vertex(this.x + (0.6 * this.w),this.y + this.h);
        bezierVertex(this.x + this.cp7.x, this.y + this.cp7.y, this.x + this.cp8.x, this.y + this.cp8.y, this.x + this.w, this.y + (0.6 * this.h));
        endShape();
        beginShape();
        vertex(this.x ,this.y + (0.6 * this.h));
        bezierVertex(this.x + this.cp5.x, this.y + this.cp5.y, this.x + this.cp6.x, this.y + this.cp6.y, this.x + (0.4 * this.w), this.y + this.h);
        endShape();
        beginShape();
        vertex(this.x ,this.y + (0.4 * this.h));
        bezierVertex(this.x + this.cp1.x, this.y + this.cp1.y, this.x + this.cp3.x, this.y + this.cp3.y, this.x + (0.4 * this.w), this.y);
        endShape();
/*
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
*/
        break;
      }
    }
//    fill(125, 0, 0);
//    text (type, this.x + this.w*0.4, this.y + this.h*0.4);

  }
}

