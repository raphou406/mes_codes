//-0.04 (x-400)^(2)+500
float p=120;
int y=120;
void setup(){
  size(500,500);
}

void draw(){
  background(250);
  f(y);
  fill(0);
  ellipse(y,p,50,50);
  y++;
  p++;
  if(y>370){
    y=120;
    p=120;
  }
}

void f(float x){
  x=0.04 * sq(x-250)+50;
  p=x;
}
