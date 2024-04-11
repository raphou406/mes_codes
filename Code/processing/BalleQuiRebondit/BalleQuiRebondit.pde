float y;
float x;
int t=15;
int sensY=1;
int sensX=1;

void setup(){
  y=random(height-t/2);
  x=random(width-t/2);
  if(x<0){
    x=random(width-t/2);
  }
  if(y<0){
    y=random(height-t/2);
  }
  noStroke();
}

void draw(){
  fill(0,15);
  rect(0,0,width,height);
  
  fill(255);
  y+=sensY;
  x+=sensX;
  ellipse(x,y,t,t);
  if(y>height-t/2){
    sensY*=-1;
  }
  if(y<t/2){
    sensY*=-1;
  }
    if(x>width-t/2){
    sensX*=-1;
  }
  if(x<t/2){
    sensX*=-1;
  }
}
