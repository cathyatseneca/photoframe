class MovingSprite{
  PVector position;
  PVector velocity;        //direction is which way object is moving
                           //magnitude is how fast
  PVector acceleration;   
  
  float angle=0;
  float angularSpeed;
  float lastUpdate;
  float rotation;
  MovingSprite(float posX,float posY){
    velocity=new PVector(0,0);
    acceleration=new PVector(0,0);
    angularSpeed=0;
    lastUpdate=millis();
    position=new PVector(posX,posY);
  }
  void setVelocity(float x, float y){
    float [] v={x,y};
    velocity.set(v);
  }
  void setAngularSpeed(float x){
    angularSpeed=x;
  }
  void update(){
    float now=millis();
    float delta=now-lastUpdate;
    float x=velocity.x*delta/1000;
    float y=velocity.y*delta/1000;
    rotation=rotation+angularSpeed*(delta/1000);
    position.add(x,y,0);
    if(position.x<0){
      velocity.x=abs(velocity.x);
    }
    if(position.y<0){
      velocity.y=abs(velocity.y);
    }
    if(position.x>width){
      velocity.x=-1*abs(velocity.x);
    }
    if(position.y>height){
      velocity.y=-1*abs(velocity.y);
    }
    lastUpdate=now;
  }  
}

