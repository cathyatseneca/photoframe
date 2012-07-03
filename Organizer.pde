class Organizer{
  PImage [] pictures;
  int numPhotos;
  int current;
  float lastUpdate;
  Organizer(){
    numPhotos=20;
    pictures=new PImage[numPhotos];
    lastUpdate=millis();
    current=0;
    for(int i=0;i<numPhotos;i++){
      pictures[i]=loadImage("data/photo"+(i+1)+".jpg");
    }
  }
  void draw(){
    float now=millis();
    if(now-lastUpdate >3000){
      lastUpdate=now;
      current=(current+1)%numPhotos;
    }
    imageMode(CENTER);
    float picWidth=pictures[current].width;
    float picHeight=pictures[current].height;
    
    if(picWidth>width){
      float ratio=(0.6*width)/picWidth;
      picHeight=ratio*picHeight;
      picWidth=0.6*width;
    }
    if(picHeight>height){
      float ratio=(0.6*height)/picHeight;
      picWidth=ratio*picWidth;
      picHeight=0.6*height;
    }
    image(pictures[current],width/2,height/2,picWidth,picHeight);
  }
}
