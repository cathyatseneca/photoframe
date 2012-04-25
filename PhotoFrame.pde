int numPhotos=16;

PolkaDot [] dots=new PolkaDot[20];
Tri [] tri=new Tri[20];
PImage [] img=new PImage[16];
Organizer album;
void setup(){
  album=new Organizer();

  size(1000,700);
//  size(window.innerWidth,window.innerHeight);
  for(int i=0;i<20;i++){
    float velx=((random(0,1)>0.5)?1:-1) *random(10,20);
    float vely=((random(0,1)>0.5)?1:-1) *random(10,20);
    dots[i]=new PolkaDot(random(0,width),random(0,height));
    dots[i].setVelocity(velx,vely);


    velx=((random(0,1)>0.5)?1:-1) *random(10,20);
    vely=((random(0,1)>0.5)?1:-1) *random(10,20);
    tri[i]=new Tri(random(0,width),random(0,height));
    tri[i].setVelocity(velx,vely);
    tri[i].setAngularSpeed(random(-1,1));
  }
}
void draw(){
  background(0);
  for(int i=0;i<20;i++){
    dots[i].draw();
    tri[i].draw();
  }
  album.draw();
  
 }
