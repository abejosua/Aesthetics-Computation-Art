int numberOfBodies = 550;
float colorChanger = 1;
Celestial_Body mama;
Celestial_Body[] allBodies = new Celestial_Body[numberOfBodies];
float orbitDisplacement = -17;

void setup() {
  size(1280, 375);
  background(75);
  initBodies();
  ellipseMode(CENTER);
  mama.display();
}

void draw() {
  //  background(125);
  for (int i = 0; i < numberOfBodies; i ++) {
    allBodies[i].display(); 
    //print("Body " + i + " "); 
    allBodies[i].move();
  }
  if ((frameCount % 200) == 0) {
    colorChanger = colorChanger * -1;
  }
}

void initBodies() {
  mama = new Celestial_Body(2000, 100, color(180, 250, 250, 105));
  for (int i = 0; i < numberOfBodies; i++) { 
    allBodies[i] = new Celestial_Body();
    float angle = (i * HALF_PI) + (HALF_PI / 2); // random(TWO_PI);
    float mass = random(100) + 1;
    float radius = 0;
    allBodies[i].startAngle = angle;
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

