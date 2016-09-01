class Segment {

  PVector oneEnd, otherEnd;
  float xTendency, yTendency;
  float slowFactorX = random(5) + 1; //must be > 0
  float slowFactorY = random(5) + 1; //must be > 0

  Segment (float x1, float y1, float x2, float y2) {
    oneEnd = new PVector (x1, y1);
    otherEnd = new PVector (x2, y2);
    xTendency = (random(20) - 10) / slowFactorX;
    yTendency = (random(20) - 10) / slowFactorY;
  }

  void display() {
    //    stroke(255, 0, 0);
    line(this.oneEnd.x, this.oneEnd.y, this.otherEnd.x, this.otherEnd.y);
  } 

  void moveEnds () {
    // check for edge and switch direction if needed
    if ((this.oneEnd.x <= 0) || (this.oneEnd.x >= width)) {
      this.xTendency = this.xTendency * -1;
    }
    if ((this.oneEnd.y <= 0) || (this.oneEnd.y >= height)) {
      this.yTendency = this.yTendency * -1;
    }
    if ((this.otherEnd.x <= 0) || (this.otherEnd.x >= width)) {
      this.xTendency = this.xTendency * -1;
    }
    if ((this.otherEnd.y <= 0) || (this.otherEnd.y >= height)) {
      this.yTendency = this.yTendency * -1;
    }
    // move points
    this.oneEnd.x = this.oneEnd.x + this.xTendency;
    this.otherEnd.y = this.otherEnd.y + this.yTendency;
  }
}

