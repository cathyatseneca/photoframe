class Organizer{
  PImage [] pictures=new PImage[numPhotos];
  int current;
  float lastUpdate;
  Organizer(){
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
    image(pictures[current],width/2,height/2);
  }
}
