int numberOfBodies = 5;
float gravity = 9.8;
Celestial_Body mama;
Celestial_Body[] allBodies = new Celestial_Body[numberOfBodies];

void setup() {
  size(1000, 800);
  background(125);
  initBodies();
}

void draw() {
  background(125);
  mama.display();
  for (int i = 0; i < numberOfBodies; i ++) {
    allBodies[i].display();    
  }
}

void initBodies() {
  mama = new Celestial_Body(2000, 100, color(180, 250, 250, 175));
  for (int i = 0; i < numberOfBodies; i++) { 
    allBodies[i] = new Celestial_Body();
    float angle = random(TWO_PI);
    float mass = random(100) + 1;
    float radius = random(5) + 5;
    allBodies[i].x = mama.x + (cos(angle) * mama.radius);
    allBodies[i].y = mama.y + (sin(angle) * mama.radius);
    allBodies[i].mass = mass;
    allBodies[i].radius = radius;
    allBodies[i].density = mass / radius;
    allBodies[i].launchThrust = random(1) * 10000;
    allBodies[i].launchAngle = random(90) + 45;
    allBodies[i].bodyColor = color(random(200) + 25, random(200) + 25, random(200) + 25, random(200) + 75);
  }
}
