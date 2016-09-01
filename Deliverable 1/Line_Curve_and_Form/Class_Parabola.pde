class Parabola {

  Segment seg1, seg2;
  int numberOfStations = 35; // number of divisions n each line
  PVector [] seg1Stations = new PVector [numberOfStations];
  PVector [] seg2Stations = new PVector [numberOfStations];

  Parabola (Segment firstSegment, Segment secondSegment) {
    this.seg1 = firstSegment;
    this.seg2 = secondSegment;
  }

  void display() {
    calculateStations(this.seg1, this.seg2);
    for (int i = 0; i < numberOfStations; i ++) {
      line(seg1Stations[i].x, seg1Stations[i].y, seg2Stations[numberOfStations - 1 - i].x, seg2Stations[numberOfStations - 1 - i].y);
    }
  }

  void calculateStations(Segment calcSeg1, Segment calcSeg2) {
    // determine intervals based on number of stations
    float xInterval1 = (calcSeg1.oneEnd.x - calcSeg1.otherEnd.x) / (numberOfStations - 1);
    float yInterval1 = (calcSeg1.oneEnd.y - calcSeg1.otherEnd.y) / (numberOfStations - 1);
    float xInterval2 = (calcSeg2.oneEnd.x - calcSeg2.otherEnd.x) / (numberOfStations - 1);
    float yInterval2 = (calcSeg2.oneEnd.y - calcSeg2.otherEnd.y) / (numberOfStations - 1);
    PVector [] holder1 = new PVector [numberOfStations];
    PVector [] holder2 = new PVector [numberOfStations];
    holder1[0] = calcSeg1.oneEnd;
    for (int i = 1; i < (numberOfStations - 1); i ++) {
      holder1[i] = new PVector(holder1[i - 1].x - xInterval1, holder1[i-1].y - yInterval1);
    }
    holder1[numberOfStations - 1] = calcSeg1.otherEnd;
    holder2[0] = calcSeg2.oneEnd;
    for (int i = 1; i < (numberOfStations - 1); i ++) {
      holder2[i] = new PVector(holder2[i - 1].x - xInterval2, holder2[i-1].y - yInterval2);
    }
    holder2[numberOfStations - 1] = calcSeg2.otherEnd;

    seg1Stations = holder1;
    seg2Stations = holder2;
  }
}

