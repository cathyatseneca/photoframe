class Tri extends MovingSprite{
  float sz;
  color co;
  float x1, y1;
  float x2, y2;
  float x3, y3;
  Tri(float x, float y){
    super(x,y,0);
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
    
    float velx=((random(0,1)>0.5)?1:-1) *random(10,20);
    float vely=((random(0,1)>0.5)?1:-1) *random(10,20);

    super.setVelocity(velx,vely);
    super.setAngularSpeed(random(-1,1));
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
