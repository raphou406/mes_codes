float posY=0;
float v=0;
float acc=.3;
int rebond=0;

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  posY=constrain(posY,0,height-25);
  ellipse(width/2,posY,50,50);
  posY+=v;
  v+=acc;
  if(posY>height-25){
    v*=-.5;
    rebond++;
  }
  if (rebond>7){
    v=constrain(v,0,0);
  }
  
}
