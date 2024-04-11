class Poisson{
  int posX, posY, v, direction;
  color couleur;
  float taille;
  
  Poisson(){
    this.posX=int(random(0,width));
    this.posY=int(random((25*height/100)+50, height));
    this.couleur=color(int(random(0,256)),int(random(0,256)),int(random(0,256)));
    this.v=1;
    this.taille=random(0.5,2.1);
    this.direction=int(random(0,2));
    if(direction==0){
      direction=-1;
    }
  }
  
  int getPoissonY(){
    println(posY);
    return posX;  
 }
  
  void affichePoisson(){
  initialisation();
  
  fill(couleur);
  quad(posX, posY, posX, posY-10*taille, posX+30*taille, posY, posX+30*taille, posY-10*taille);
  arc(posX+30*taille, (posY+posY-10*taille)/2, 25*taille, dist(posX+15*taille, posY, posX+15*taille, posY-10*taille), -PI/2, PI/2);
  fill(0);
  circle(posX+33*taille, posY-5*taille, 2*taille);
  this.hitBoxPoisson();
  }
  
  void mouvementPoisson(){
  posX+=direction;
  if(posX>=width || posX<=0){
    apparitionPoisson();
    }
  posX=constrain(posX,0, width);
 }
 
 void apparitionPoisson(){
  posX=int(random(0,width));
  posY=int(random((25*height/100)+50, height));
  direction=int(random(0,2));
  
  if(direction==0){
    direction=-1;
 }
  direction*=v;
  poissonPecher=false;
  taille=random(0.5,2.1);
  couleur=color(int(random(0,256)),int(random(0,256)),int(random(0,256))); 
 }
 
 void hitBoxPoisson(){
  initialisation();
  noFill();
  rectMode(CORNERS);
/* Affiche l'hit Box du poisson
fill(255,0,0);
rect(posPoissonX+15*taille, posPoissonY-10*taille, posPoissonX+40*taille, posPoissonY);
*/
  if(!poissonPecher && bateau.getBatX()+80>posX+15*taille && bateau.getHamY()>posY-10*taille && bateau.getBatX()+80<posX+40*taille && bateau.getHamY()<posY){
    poissonPecher=true;
    pecher();
  }
 }
 
 void pecher(){
  score+=(3/taille)+2/(height/this.getPoissonY());
  this.apparitionPoisson();
  bateau.PosHamY(25*height/100);
}

}
