class PolkaDot extends MovingSprite{
  float sz;
  color co;
  
  PolkaDot(float x, float y){
    super(x,y,0);
    sz=random(20,30);
    //change the next line of code to change the color of the dots
    //color(r,g,b,a);
    //r is red, g is green, b is blue and a is alpha (opacity)
    co=color(random(0,255),random(0,255),random(0,255), random(50,200));
    
    float velx=((random(0,1)>0.5)?1:-1) *random(10,20);
    float vely=((random(0,1)>0.5)?1:-1) *random(10,20);
    super.setVelocity(velx,vely);
  }
  void setSize(float x){
    sz=x;
  }
  void setColour(float r, float g, float b, float a){
    co=color(r,g,b,a);
  }
  void draw(){
    super.update();
    noStroke();
    fill(co);
    ellipse(position.x,position.y,sz,sz);
  }
}
