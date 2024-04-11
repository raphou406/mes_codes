//compréhension de colorMode

void setup(){
  size(400, 400);
  //noStroke();
}

void draw(){
  colorMode(HSB,width,height,height+width);
  fill(mouseX,mouseY,mouseX+mouseY);
  rect(0,0,width,height);
}

void mousePressed(){
  colorMode(RGB,width,height,height+width);
  fill(mouseX,mouseY,mouseX+mouseY);
  rect(0,0,399,399);
}
