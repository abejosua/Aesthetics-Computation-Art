class Feather {
  
  color c1;
  color c2;
  color c3;
  PVector frontPoint;
  PVector backPoint;
  float l;
  float w;
  int boneIndex;
  
  Feather (PVector frontPoint, PVector backPoint, float l, float w, int boneIndex) {
    this.frontPoint = frontPoint;
    this.backPoint = backPoint;
    this.l = l;
    this.w = w;
    this.c1 = color(225, 200, 125, 50);
    this.c2 = color(175, 50, 75, 50);
    this.c3 = color(100, 75, 25, 50);
  }
 
 void display () {
   strokeWeight(w);
   fill(c1);
   line(frontPoint.x, frontPoint.y, backPoint.x, backPoint.y); 
 } 
}
