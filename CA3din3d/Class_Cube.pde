class Cube {
  
  int x;
  int y;
  int z;
  int state;
  int[] neighborhood = new int[3];
  
  Cube(int x, int y, int z, int state) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.state = state;
    this.neighborhood[0] = 0;
    this.neighborhood[1] = 0;
    this.neighborhood[2] = 0;
  }
  
  void display() {
    if (this.state == 0) {}//{fill(125, 0 , 0, 50); translate(size * this.x, size * this.y, -size * this.z); box(2);translate(-size * this.x, -size * this.y, size * this.z);}
    else {
      fill(map(x, 0, gridX, 0, 255), map(y, 0, gridY, 0, 255) , map(z, 0, gridZ, 0 , 255), 75);
          translate(size * this.x, size * this.y, -size * this.z);
//            rect(this.x, this.y, size*.5, size*.5);
          box(size); 
          translate(-size * this.x, -size * this.y, size * this.z);
        }
  }
  
}

