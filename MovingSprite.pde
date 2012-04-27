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

  /*sets Velocity of the sprite.  Think of the values as forming an arrow from 0,0 to x,y
    the arrow is the direction the object will travel, how long the arrow is determines
    how fast the sprite moves*/
  void setVelocity(float x, float y){
    float [] v={x,y};
    velocity.set(v);
  }

  /*sets the Angular Speed of the sprite. Positive values create a clockwise spin.
    Negative values create a counter clockwise spin*/
  void setAngularSpeed(float x){
    angularSpeed=x;
  }

  /*this function sets how the sprite behaves when it reaches the edge.
    0 means it bounces, 1 means it goes back to it's initial positon
    2 means it starts at the opposite edge from where it diappeared*/
  void setEdgeReaction(int er){
    edgeReaction=er;
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

