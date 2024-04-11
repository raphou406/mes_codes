Obstacle[] cercles = new Obstacle[6];
void setup() {
  size(200, 200);
  windowResizable(true);
  for(int i=0; i<cercles.length-1; i++){
    cercles[i]= new Obstacle(random(0, width), random(0, height));
  }
  cercles[5] = new Obstacle(width/2, height/2, 40);
}

void draw() {
  int r = 7;
  float x=mouseX, y=mouseY;
  background(250);
  fill(255);
  for(int i=0; i<cercles.length; i++){
    if (cercles[i].collision()) {
      PVector vect = cercles[i].creationVect();
      x = vect.x + cercles[i].getX();
      y = vect.y + cercles[i].getY();
    }
    cercles[i].affiche();
  }
  circle(x, y, r*2);
}
