// David G. Smith - Copyright (c) 2016
// Designed using Kinect model 1414

import java.lang.Runtime;
import java.lang.String;
import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;
PImage logo;
boolean shiftInProgress = false;

final int PIXEL_ARRAY_SIZE = 307200;  // For Kinect mdel 1414
final float PARTICLE_DIAMETER = 5;
final int PARTICLE_SEPERATION_FACTOR = 50;  //  4 or greater
final int DEPTH_THRESHOLD = 800;  // to "detect" at a certain range from Kinect 0-2048
final int A_FACTOR_DECAY_RATE = 5;  // speed that alpha fade changes particles
final int GRAVITY_LIMIT = 50;
final int SPEED_LIMIT = 15;
final int BURST_RATE = 5;  // # frames between burst of particles
ArrayList <Particle> allParticles = new ArrayList<Particle> ();
int[] depth = new int[PIXEL_ARRAY_SIZE];

void setup() {
  size(1180, 840);
  background(248, 134, 57, 125);
  timesByDayOfMonth = loadStrings(FILE_NAME);
  kinect = new Kinect(this);
  kinect.initDepth();
}

void draw() {

    if (frameCount % 25 == 0); 
    {
      background(248, 134, 57, 125);
    }
    depth = kinect.getRawDepth();
    if (frameCount % BURST_RATE == 0) {
      burst();
    }
    drawAndMoveParticles();
  } 


void burst() {
  int avgDepth;
  float whichGrey = (random(10) * 10) + 50;
  color whichColor = color(whichGrey, whichGrey, whichGrey, 255);
  for (int i = 0; i < depth.length; i = i + PARTICLE_SEPERATION_FACTOR) {
    avgDepth = (((depth[i] + depth[i + 1] + depth[i + 2] + depth[i + 3])) / 4);
    if (avgDepth < DEPTH_THRESHOLD) {
      allParticles.add(new Particle(new PVector(400 + (i % 640), i / 640), whichColor));
    }
  }
}

void drawAndMoveParticles() {
  for (int j = 0; j < allParticles.size(); j ++) {
    allParticles.get(j).display();
    allParticles.get(j).move();
    if (allParticles.get(j).aFactor <= 0) {
      allParticles.remove(j);
    }
  }
}

void keyPressed() {
}
