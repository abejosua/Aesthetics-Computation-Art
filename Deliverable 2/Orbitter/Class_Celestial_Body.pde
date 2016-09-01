class Celestial_Body {

int state; // 0 launch  1 orbit  2 re-enter  3 impact
float mass;
float radius;
float density;
float launchThrust;
float launchAngle;
color bodyColor;
float startAngle;
float x;
float y;
float lifeCount;
float orbitW;
float orbitH;
float radiusChangeFactor;
  
Celestial_Body() {
  this.state = 0;
  this.x = 0;
  this.y = 0;
  this.mass = 1;
  this.radius = 1;
  this.density = 1;
  this.launchThrust = 0;
  this.launchAngle = 0;
  this.bodyColor = color(125, 125, 125, 125);
  this.lifeCount = random (1000);
  this.orbitW = random (width * 2); //random(((width) - (2 * mama.radius) - 50) / 2) + (mama.radius * 2);
  this.orbitH = random(height * 2); //random(((height) - (2 * mama.radius) - 50) / 2) + (mama.radius * 2);
  this.startAngle = 0;
  this.radiusChangeFactor = 0.05;
}  

Celestial_Body(float m, float r, color c) {
  this.state = 0;
  this.x = width / 2;
  this.y = height / 2;
  this.mass = m;
  this.radius = r;
  this.density = m / r;
  this.launchThrust = 0;
  this.launchAngle = 0;
  this.bodyColor = c;
  this.lifeCount = random (1000) + 1000;
  this.orbitW = 0;
  this.orbitH = 0;
  this.startAngle = 0;
  this.radiusChangeFactor = 0.05;
}
/*
Celestial_Body(float x, float y, float m, float r, float lT, float lA, color c) {
  this.state = 0;
  this.x = x;
  this.y = y;
  this.mass = m;
  this.radius = r;
  this.density = m / r;
  this.launchThrust = lT;
  this.launchAngle = lA;
  this.bodyColor = c;
}
*/
void move() {
  switch(this.state) {
    case 0:
      this.launch();
      break;
    case 1: 
      this.orbit();
      break;
    case 2: 
      this.reEnter();
      break;
    case 3: 
      this.impact();
      break;
    default: 
      println("error with celestial body class routing.");
      break;
  }
}

void launch() {
  this.state = 0;
//  this.x = this.x + (0.6 * cos(this.startAngle));
//  this.y = this.y + (0.6 * sin(this.startAngle));
//  this.startAngle = this.startAngle + (PI / 500);
//  this.lifeCount = this.lifeCount - 1;
//  if (dist(this.x, this.y, width/2, height/2) >= dist(((width / 2) + int(((this.orbitW /2) * cos(this.startAngle)))), ((height / 2) + int(((this.orbitH / 2) * sin(this.startAngle)))), width/2, height/2)) {
    this.state = 1;
 // }
}

void orbit() {
  this.state = 1;
  this.x = 1.2 * ((width/2) + (this.orbitW / 2) * cos(this.startAngle));
  this.y = 1.2 * ((height/2) + (this.orbitH / 2) * sin(this.startAngle));
  this.startAngle = this.startAngle + (TWO_PI / 360);
  this.lifeCount = this.lifeCount - 1;
    this.radius = this.radius + radiusChangeFactor;
  this.orbitH = this.orbitH + (radiusChangeFactor * orbitDisplacement);
  this.orbitW = this.orbitW + (radiusChangeFactor * orbitDisplacement);
if ((this.radius <= 0) || (this.radius >= 5)) {
  this.radiusChangeFactor = this.radiusChangeFactor * -1;
  this.bodyColor = color(red(this.bodyColor) + colorChanger * (random(7)), green(this.bodyColor) + colorChanger * (random(7)), blue(this.bodyColor) + colorChanger * random(7), random(75)); 

}
}

void reEnter() {
  this.state = 2;
//  this.x = this.x - (0.6 * cos(this.startAngle));
//  this.y = this.y - (0.6 * sin(this.startAngle));
//  this.startAngle = this.startAngle + (PI / 500);
//  this.lifeCount = this.lifeCount - 1;

}

void impact() {
  this.state = 3;
  this.bodyColor = color(0,0,0,0);
}

void display() {
  stroke(this.bodyColor);
  fill(this.bodyColor);
  ellipse(x, y, this.radius * 2, this.radius * 2);
 // noFill();
//  ellipse(width / 2, height / 2, this.orbitW, this.orbitH);
}

}
