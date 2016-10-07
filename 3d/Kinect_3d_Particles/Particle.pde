class Particle {

  PVector location;
  float diameter;
  color pColor;
  float aFactor = 255;

  PVector speed;
  PVector gravity = new PVector(0, 0.25);
  PVector reverseY = new PVector (0.0, -1.0);
  float damping = 0.5;

  Particle(PVector location, color pColor) {
    this.location = location;
    this.speed = PVector.fromAngle(random(PI) + PI);
    this.diameter = PARTICLE_DIAMETER;
    this.pColor = pColor;
  }

  void display() {
    noStroke();
    fill(this.pColor);
    ellipse(location.x, location.y, diameter, diameter);
    aFactor = aFactor - A_FACTOR_DECAY_RATE;
  }

  void move() {
    gravity.limit(GRAVITY_LIMIT);
    speed.limit(SPEED_LIMIT);
    speed.add(gravity);
    location.add(speed);
    if (location.y > 640) {
      gravity.y = -gravity.y;
      speed.y = speed.y * damping;
    }
  }
}
