class Particle{
  private PVector startPos;
  private PVector endPos;
  private PVector currPos;
  color co;
  Particle(){
    startPos = new PVector();
    endPos = new PVector();
    currPos = new PVector();
    co=color(random(0,255),random(0,255),random(0,255));
  }
  void resetParticle(float x, float y){
    this.startPos.set(x,y,0);
    this.currPos.set(x,y,0);
  }
  void setStartPos(float x, float y){
    startPos.set(x,y,0);
    currPos.set(x,y,0);
  }
  
  void setEndPos(float x, float y){
    endPos.set(x,y,0);
  }
  
  void setColour(float r,float g, float b, float a){
    co=color(r,g,b,a);
  }
  void setColour(color c){
   co=c;
  }
  void update(float normalizedValue){
    currPos.x = currPos.x + (endPos.x * normalizedValue);
    currPos.y = currPos.y + (endPos.y * normalizedValue);
  }
  
  void draw(){
    strokeWeight(3);
    stroke(co);
    point(currPos.x, currPos.y);
  }
}
class FireWorks{
  ArrayList points;
  float lastUpdate;
  PVector position;
  float explosionDuration;
  float lastExplosion;
  color co;
  boolean isRandomColour;
  FireWorks(){
    points=new ArrayList();
    for(float i = 0; i < PI * 2; i += 0.05){
      Particle p = new Particle();
      points.add(p);
    }
    explosionDuration=random(5000,8000);
    isRandomColour=true;
    reset();
  }
  void reset(){
    float x=random(100, width-100);
    float y=random(100, height-100);
    float j=0;
    if(isRandomColour)
      co=color(random(0,255),random(0,255),random(0,255));
    for(int i=0;i<points.size();i++){
      Particle p=(Particle)points.get(i);
      p.setColour(co);
      p.setStartPos(x + cos(j) * 5.0f, y + sin(j) * 5.0f);
      float v=min(width,height)/2;
      v=random(20,v);
      p.setEndPos(cos(j)*v,sin(j)*v);
      j+=0.05;
    }
    lastUpdate=millis();
    lastExplosion=millis();
  }
  void setColour(float r,float g, float b){
    co=color(r,g,b);
    isRandomColour=false;
  }
  void draw(){
    float now=millis();
    float dv=lastUpdate-now;
    lastUpdate=now;
    for(int i = 0; i < points.size(); i++){
      Particle p = (Particle)points.get(i);
      p.update(dv/1000);
      p.draw();
    }
    if(now-lastExplosion > explosionDuration){
      reset();
    }
  }
}

  

