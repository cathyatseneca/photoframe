class Poem{

  ArrayList poem;
  int runner;
  int start;
  float counter;
  float speed;
  color co;
  Poem(){ 
    start=0;
    runner=0;
    counter=0;
    co=color(random(0,255),random(0,255),random(0,255));
    speed=random(10,20);
    poem = new ArrayList();
    poem.add("void setup(){");
    poem.add("  album=new Organizer();");
    poem.add("  size(1000,700);");
    poem.add("  for(int i=0;i<3;i++){");
    poem.add("   fireworks[i]=new FireWorks();");
    poem.add("  }");
    poem.add("  for(int i=0;i<20;i++){");
    poem.add("    float velx=((random(0,1)>0.5)?1:-1) *random(10,20);");
    poem.add("    float vely=((random(0,1)>0.5)?1:-1) *random(10,20);");
    poem.add("    dots[i]=new PolkaDot(random(0,width),random(0,height));");
    poem.add("    dots[i].setVelocity(velx,vely);");
    poem.add("    velx=((random(0,1)>0.5)?1:-1) *random(10,20);");
    poem.add("    vely=((random(0,1)>0.5)?1:-1) *random(10,20);");
    poem.add("    tri[i]=new Tri(random(0,width),random(0,height));");
    poem.add("    tri[i].setVelocity(velx,vely);");
    poem.add("    tri[i].setAngularSpeed(random(-1,1));");
    poem.add("  }");
    poem.add("  for(int i=0;i<10;i++){");
    poem.add("    flowers[i]=new Flower(random(0,width), 10);");
    poem.add("    flowers[i].setVelocity(0,random(10,20));");
    poem.add("    flowers[i].setAngularSpeed(random(-2,2));    ");
    poem.add("  }");
    poem.add("}");
    poem.add("void draw(){");
    poem.add("  background(0);");
    poem.add("  for(int i=0;i<20;i++){");
    poem.add("    dots[i].draw();");
    poem.add("    tri[i].draw();");
    poem.add("  }");
    poem.add("  for(int i=0;i<10;i++){");
    poem.add("    flowers[i].draw();");
    poem.add("  }");
    poem.add("  for(int i=0;i<3;i++){");
    poem.add("    fireworks[i].draw();");
    poem.add("  }");
    poem.add("  album.draw();");
    poem.add(" }");
  }
  void setSpeed(float s){
    speed=s;
  }
  void setColor(color c){
    co=c;
  }
  void draw(){
   counter++;

    if(counter > speed){
      runner++;
      counter = 0;
    }

    if(runner > 35){
      runner = 0;
    }

    start=runner;
    for(int i=0; i < 5; i++, start++){
      if(start >= poem.size()){
        start = 0;
      }
      fill(red(co),green(co),blue(co), i*20);
      text((String)poem.get(start), 5, runner*15+i*15);
    }
  }
}
