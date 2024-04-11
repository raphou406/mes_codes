class Obstacle{
  float x, y;
  float r ;
  
  Obstacle(float x, float y, float r){
   this.x=x;
   this.y=y;
   this.r=r;
  }
  Obstacle(float x, float y){
   this.x=x;
   this.y=y;
   this.r = random(2, 30);
  }
  
  void affiche(){
    circle(this.x, this.y, this.r *2);
  }
  
  float getX(){
    return this.x;
  }
  float getY(){
    return this.y;
  }
  
  boolean collision(){
   if (dist(mouseX, mouseY, this.x, this.y) < this.r + 7){
     return true;
   }
    return false;
  }
  
  PVector creationVect(){
    PVector vect = new PVector(mouseX - this.x, mouseY - this.y);
    vect.normalize();
    vect.mult(this.r + 7);
    return vect;
  }
}
