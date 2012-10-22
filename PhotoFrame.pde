Organizer album;
void setup(){
  size(window.innerWidth,window.innerHeight);
  album=new Organizer();
}
void draw(){
  background(255,255,255);
  album.draw();
}
