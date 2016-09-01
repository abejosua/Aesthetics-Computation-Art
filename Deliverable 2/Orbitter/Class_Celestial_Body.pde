class Celestial_Body {

int state; // 0 launch  1 orbit  2 re-enter  3 impact
float mass;
float radius;
float density;
float launchThrust;
float launchAngle;
color bodyColor;
float x;
float y;
float lifeCount;
float orbitW;
float orbitH;
  
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
  this.orbitW = random(((width) - (2 * mama.radius)) / 2) + (mama.radius * 2);
  this.orbitH = random(((height) - (2 * mama.radius)) / 2) + (mama.radius * 2);

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
  this.lifeCount = random (1000);
  this.orbitW = 0;
  this.orbitH = 0;
}

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

void move() {
  switch(this.state) {
    case '0':
      this.launch();
      break;
    case '1': 
      this.orbit();
      break;
    case '2': 
      this.reEnter();
      break;
    case '3': 
      this.impact();
      break;
    default: 
      println("error with celestial body class routing.");
      break;
  }
}

void launch() {
  state = 0;
//  this.x = this.x + ;
//  this.y = this.y + ;
}

void orbit() {
  state = 1;
}

void reEnter() {
  state = 2;
}

void impact() {
  state = 3;
}

void display() {
  stroke(this.bodyColor);
  fill(this.bodyColor);
  ellipse(x, y, this.radius * 2, this.radius * 2);
  noFill();
  ellipse(width / 2, height / 2, this.orbitW, this.orbitH);
}

}
