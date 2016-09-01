/////////////////////////////////////////
//                                     //
//      David Gail Smith (C) 2017      //
//                                     //
/////////////////////////////////////////

int numberOfSegments = 8;
int numberOfParabolas = numberOfSegments / 2;
Segment[] allSegments = new Segment[numberOfSegments];
Parabola[] allParabolas = new Parabola[numberOfParabolas];  // one for every 2 segments

void setup() {
  size(1280, 800, P3D);
  background(0);
  initSegments();
  initParabolas();
  stroke(map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255), map(mouseX * mouseY, 0, height, 0, 255));
}

void draw() {
  background(0);
  stroke(map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255), map(mouseX * mouseY, 0, height, 0, 255));
  for (int i = 0; i < numberOfParabolas; i ++) {
    allParabolas[i].display();
  }
  for (int i = 0; i < numberOfSegments; i ++) {
    allSegments[i].display();
    allSegments[i].moveEnds();
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

