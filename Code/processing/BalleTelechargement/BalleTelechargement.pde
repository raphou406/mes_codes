int x=50;
void setup(){
  size(500,500);
  frameRate(237);
}
void draw(){
  background(235);
  colorMode(HSB,width+150,height,width+height);
  x++;
  if(x>=width+150){
    x=-150;
  }
  fill(abs(x),x,x);
  ellipse(x,height/2,150,150);
  fill(abs(x-75));
  ellipse(width/2,x,150,150);
  if(x>(width/2)-130 && x<(width/2)+130){
    fill(0,255,255);
      line(50, 18, 61, 37);
      line(61, 37, 83, 43);
      line(83, 43, 69, 60);
      line(69, 60, 71, 82);
      line(71, 82, 50, 73);
      line(50, 73, 29, 82);
      line(29, 82, 31, 60);
      line(31, 60, 17, 43);
      line(17, 43, 39, 37);
      line(39, 37, 50, 18);  
  }
  colorMode(RGB,255,255,255);
}
