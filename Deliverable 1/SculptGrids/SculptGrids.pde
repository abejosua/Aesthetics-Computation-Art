/////////////////////////////////////////
//                                     //
//      David Gail Smith (C) 2017      //
//                                     //
/////////////////////////////////////////

int numberOfSegments = 6;
int numberOfParabolas = numberOfSegments / 2;
Segment[] allSegments = new Segment[numberOfSegments];
Parabola[] allParabolas = new Parabola[(numberOfParabolas)];  // one for every 2 segments
PVector mPosit;
int whichSeg = 0;
int whichEnd = 0;
boolean onPoint = false;

void setup() {
  size(1280, 800, P3D);
  background(0);
  initSegments();
  initParabolas();
  stroke(100, 255, 215);
}

void draw() {
  background(0);
  stroke(100, 255, 215);
  for (int i = 0; i < numberOfParabolas; i ++) {
    allParabolas[i].display();
  }
  for (int i = 0; i < numberOfSegments; i ++) {
    allSegments[i].display();
//    allSegments[i].moveEnds();

  }
}

void initSegments() {
  for (int i = 0; i < numberOfSegments; i ++) {
    allSegments[i] = new Segment (random(width), random(height), random(width), random(height));
  }
}

void initParabolas() {
  for (int i = 0; i < (numberOfSegments / 2); i ++ ) {
    allParabolas[i] = new Parabola(allSegments[(i * 2)], allSegments[(i * 2) + 1]);
  }
}

void mouseDragged () {
//  mPosit = new PVector(mouseX, mouseY);
  onPoint = false;
  for (int i = 0; i < numberOfSegments; i ++) {
      if (mouseIsNear(allSegments[i].oneEnd) && (onPoint == false)) {
        onPoint = true;
        whichSeg = i;
        whichEnd = 0;
      }
      else {
        if (mouseIsNear(allSegments[i].otherEnd) && (onPoint == false)) {
          onPoint = true;
          whichSeg = i;
          whichEnd = 1;
        }
      }
      if (onPoint) {
        if (whichEnd == 0) {
          allSegments[whichSeg].oneEnd = new PVector (mouseX, mouseY);
        }
        if (whichEnd == 1) {
          allSegments[whichSeg].otherEnd = new PVector (mouseX, mouseY);
        }
      }
  }
}
  
  boolean mouseIsNear (PVector point) {
    int tolerance = 15;
    if (point.dist(new PVector(mouseX, mouseY)) <= tolerance) {
      return true;
    }
    else {
      return false;
    }
  }

