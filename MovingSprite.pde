class MovingSprite{
  PVector position;
  PVector velocity;        //direction is which way object is moving
                           //magnitude is how fast
  PVector acceleration;   
  
  float angle=0;
  float angularSpeed;
  float lastUpdate;
  MovingSprite(float posX,float posY){
    float [] zerovec={0,0};
    float [] initial={posX,posY};
    velocity.set(zerovec);
    acceleration.set(zerovec);
    angularSpeed=0;
    lastUpdate=millis();
    position.set(initial);
  }
  void update(){
    float delta=millis()-lastUpdate;
    PVector dv=velocity;
    dv.mult(delta);
    position.add(dv);
  }  
}
class PolkaDot extends MovingSprite{
  float sz;
  color co;
  
  PolkaDot(){
    sz=random(3,5);
    co=color(random(0,255),random(0,255),random(0,255));
  }
  draw(){
    super.update();
    pushStyle();
    stroke(co);
    fill(co);
    ellipse(posX,posY,sz,sz);
    popStyle();
  }
}
