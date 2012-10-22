class Poem{

  ArrayList poem;
  int runner;
  int start;
  float counter;
  float speed;
  color co;
  float posX;
  float posY;
  float rotation;
  int numLines;
  Poem(String filename){ 
    start=0;
    runner=0;
    counter=0;
    rotation=-PI/4;
    posX=50;
    posY=200;
    String lines[]=loadStrings(filename);
    numLines=lines.length;
    co=color(random(0,255),random(0,255),random(0,255));
    speed=random(10,20);
    poem = new ArrayList();
    for(int i=0;i<numLines;i++){
      poem.add(lines[i]);
    }
  }
  void setRotation(float r){
    rotation=r;
  }
  void setNumLines(int n){
    numLines=n;
  }
  void setPosition(float x, float y){
    posX=x;
    posY=y;
  }
  void setSpeed(float s){
    speed=s;
  }
  void setColour(float r,float g, float b, float a){
    co=color(r,g,b,a);
  }
  void draw(){
    counter++;

    if(counter > speed){
      runner++;
      counter = 0;
    }

    if(runner > numLines){
      runner = 0;
    }

    start=runner;
    for(int i=0; i < 5; i++, start++){
      if(start >= poem.size()){
        start = 0;
      }
      fill(red(co),green(co),blue(co), i*40);
      pushMatrix();
      translate(posX, posY+runner*15+i*15);
      rotate(rotation);
      text((String)poem.get(start), posX, posY+runner*15+i*15);
      popMatrix();
    }
  }
}
