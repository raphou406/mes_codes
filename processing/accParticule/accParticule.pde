//-0.04 (x-400)^(2)+500

int x=0;
float posY=0;
float v=0;
float acc=.02;

void setup(){
  size(500,500);
}

void draw(){
  background(250);
  for(int j=0;j<width;j++){
    line(j,f(j),j+1,f(j+1));
  }
 
  fill(0);
  ellipse(x,posY,50,50);
  posY+=v;
  v+=acc;
  
  while(posY>f(x)){
    x++;
  }
  println(x);
  if(x>width){
    x=1;
    posY=0;
  }
}

float f(float x){
  x=82*log(x);
  return(x);
}
