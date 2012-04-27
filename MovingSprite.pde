class MovingSprite{
  PVector initial;
  PVector position;
  PVector velocity;        //direction is which way object is moving
                           //magnitude is how fast
  PVector acceleration;   
  
  float angle=0;
  float angularSpeed;
  float lastUpdate;
  float rotation;
  int edgeReaction;       //reaction of sprite when it hits the edge
                          //0 is bouncing
                          //1 is resetting at its initial position
                          //2 is resetting to opposite edge (if it disappears off bottom, reappears at top
                          //  etc.)
                          
  MovingSprite(float posX,float posY,int er){
    velocity=new PVector(0,0);
    acceleration=new PVector(0,0);
    angularSpeed=0;
    lastUpdate=millis();
    position=new PVector(posX,posY);
    initial=new PVector(posX,posY);
    edgeReaction=er;
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
    lastUpdate=now;
    if(edgeReaction==0){
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
    }
    else if(edgeReaction==1){
      if(position.x<-100){
        position.x=initial.x;
      }
      if(position.y<-100){
        position.y=initial.y;
      }
      if(position.x>width+100){
        position.x=initial.x;
      }
      if(position.y>height+100){
        position.y=initial.y;
      }
    }
    else if(edgeReaction==2){
      if(position.x<-100){
        position.x=width-10;
      }
      if(position.y<-100){
        position.y=height-10;
      }
      if(position.x>width+100){
        position.x=10;
      }
      if(position.y>height+100){
        position.y=10;
      }
    }
  }  
}

