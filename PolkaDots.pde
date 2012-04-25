class PolkaDot extends MovingSprite{
  float sz;
  color co;
  
  PolkaDot(float x, float y){
    super(x,y);
    sz=random(20,30);
    //change the next line of code to change the color of the dots
    //color(r,g,b,a);
    //r is red, g is green, b is blue and a is alpha (opacity)
    co=color(random(0,255),random(0,255),random(0,255), random(50,200));
  }
  void draw(){
    super.update();
    noStroke();
    fill(co);
    ellipse(position.x,position.y,sz,sz);
  }
}
