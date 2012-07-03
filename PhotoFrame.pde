PolkaDot [] dots=new PolkaDot[20];
Tri [] tri=new Tri[20];
Flower [] flowers=new Flower[10];
Organizer album;
FireWorks [] fireworks=new FireWorks[3];
Poem p;
void setup(){
  size(window.innerWidth,window.innerHeight);
  p=new Poem();
  album=new Organizer();
  for(int i=0;i<3;i++){
    fireworks[i]=new FireWorks();
  }
  for(int i=0;i<20;i++){
    dots[i]=new PolkaDot(random(0,width),random(0,height));
    tri[i]=new Tri(random(0,width),random(0,height));
  }
  for(int i=0;i<10;i++){
    flowers[i]=new Flower(random(10,width), random(10,height/2));
 
  }
  p.setPosition(100,20);
}
void draw(){
  background(0,0,0);
  for(int i=0;i<20;i++){
    dots[i].draw();
    tri[i].draw();
  }
  for(int i=0;i<10;i++){
    flowers[i].draw();
  }
  for(int i=0;i<3;i++){
    fireworks[i].draw();
  }
  p.draw();
  album.draw();
 }
