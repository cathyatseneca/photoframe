class Flower extends MovingSprite{
  float sz;
  color co;
  int numPetals;
  
  Flower(float x, float y){
    super(x,y,2);
    sz=random(40,60);
    //change the next line of code to change the color of the dots
    //color(r,g,b,a);
    //r is red, g is green, b is blue and a is alpha (opacity)
    co=color(random(0,255),random(0,255),random(0,255), random(50,200));
    numPetals=int(random(5,8));
    super.setVelocity(0,random(10,20));
    super.setAngularSpeed(random(-2,2));   
  }
  void setNumPetals(int np){
    numPetals=np;
  }
  void setSize(float x){
    sz=x;
  }
  void setColour(float r,float g, float b, float a){
    co=color(r,g,b,a);
  }
  void draw(){
    super.update();
    noStroke();
    fill(co);
    float j=0;
    for(float i = 0; i < numPetals;i++){
      pushMatrix();
      translate(position.x,position.y);
      rotate(j+rotation);
      j=j+(2.0f/numPetals)*PI;
      ellipse(sz/2,0, sz,sz);
      popMatrix();
   }
  }
}
