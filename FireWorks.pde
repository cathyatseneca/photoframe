class Particle{
  private PVector startPos;
  private PVector endPos;
  private PVector currPos;
  private float red;
  boolean done;
  Particle(){
    startPos = new PVector();
    endPos = new PVector();
    currPos = new PVector();
    red = 255;
    done=false;
  }
  void resetParticle(float x, float y){
    this.startPos.set(x,y,0);
    this.currPos.set(x,y,0);
    done=false;
  }
  void setStartPos(float x, float y){
    startPos.set(x,y,0);
    currPos.set(x,y,0);
  }
  
  void setEndPos(float x, float y){
    endPos.set(x,y,0);
    
  }
  
  void update(float normalizedValue){
    currPos.x = currPos.x + (endPos.x * normalizedValue);
    currPos.y = currPos.y + (endPos.y * normalizedValue);
    red = 255.0 * normalizedValue;
    if(currPos.x<0 || currPos.x > width || currPos.y<0 || currPos.y>height)
      done=true;
  }
  
  void draw(){
    if(done==false){
      strokeWeight(2);
      stroke(red, 255-red, 0);
      point(currPos.x, currPos.y);
    }
  }
}
class FireWorks{
  ArrayList points;
  float lastUpdate;
  PVector position;
  FireWorks(){
    points=new ArrayList();
    for(float i = 0; i < PI * 2; i += 0.01){
      Particle p = new Particle();
      points.add(p);
    }
    reset();
  }
  void reset(){
    float x=random(100, width-100);
    float y=random(100, height-100);
    x=500;
    y=500;
    for(int i=0;i<points.size();i++){
      Particle p=(Particle)points.get(i);
      p.setStartPos(x + cos(i) * 10.0f, y + sin(i) * 10.0f);
      p.setEndPos(random(-width/2, width/2),random(-height/2, height/2));
    }
    lastUpdate=millis();
  }
  void draw(){
    float now=millis();
    float dv=lastUpdate-now;
    lastUpdate=now;
    int numDone=0;
    for(int i = 0; i < points.size(); i++){
      Particle p = (Particle)points.get(i);
      p.update(dv/1000);
      p.draw();
      if(p.done==true){
        numDone++;
      }
    }
    println(points.size() + " " + numDone);
    if(numDone==points.size()){
      reset();
    }
  }
}

  

