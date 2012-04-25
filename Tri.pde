class Tri extends MovingSprite{
  float sz;
  color co;
  float x1, y1;
  float x2, y2;
  float x3, y3;
  Tri(float x, float y){
    super(x,y);
    //change the next line of code to change the color of the dots
    //color(r,g,b,a);
    //r is red, g is green, b is blue and a is alpha (opacity)
    co=color(random(0,255),random(0,255),random(0,255), random(50,200));
    x1=random(-10,10);
    y1=random(5,10);
    x2=random(-20,-10);
    y2=random(-10,-5);
    x3=random(10,20);
    y3=random(-10,-5);
  }
  void draw(){
    super.update();
    noStroke();
    fill(co);
    pushMatrix();
    translate(position.x,position.y);
    rotate(rotation);
    triangle(x1,y1,x2,y2,x3,y3);
    popMatrix();
  }
}
