void affichePoisson(float taille){
  initialisation();
  
  fill(couleurPoisson);
  quad(posPoissonX, posPoissonY, posPoissonX, posPoissonY-10*taille, posPoissonX+30*taille, posPoissonY, posPoissonX+30*taille, posPoissonY-10*taille);
  arc(posPoissonX+30*taille, (posPoissonY+posPoissonY-10*taille)/2, 25*taille, dist(posPoissonX+15*taille, posPoissonY, posPoissonX+15*taille, posPoissonY-10*taille), -PI/2, PI/2);
  fill(0);
  circle(posPoissonX+33*taille, posPoissonY-5*taille, 2*taille);
  hitBoxPoisson(taille);
}

void affichePoissonQuiFaitPeur(float taille){
  initialisation();
  
  image(poissonClement, posPoissonX, posPoissonY,45*taille, -10*taille);
  hitBoxPoisson(taille);
}

void mouvementPoisson(){
  posPoissonX+=direction;
  if(posPoissonX>=width || posPoissonX<=0){
    apparitionPoisson();
    }
  posPoissonX=constrain(posPoissonX,0, width);
}

void apparitionPoisson(){
  posPoissonX=int(random(0,width));
  posPoissonY=int(random((25*height/100)+50, height));
  direction=int(random(0,2));
  
  if(direction==0){
    direction=-1;
 }
 direction*=vPoisson;
  poissonPecher=false;
  taille=random(0.5,2.1);
  couleurPoisson=color(int(random(0,256)),int(random(0,256)),int(random(0,256)));
  
}

void afficheBateau(){
  initialisation();
  barque();
  pecheur();
  hamecon();
  posBateauX=constrain(posBateauX,15,width-65);
  posHameconY=constrain(posHameconY, posBateauY-25, height);
}

void barque(){
  fill(156,66,29);
  quad(posBateauX, posBateauY, posBateauX+50, posBateauY, posBateauX+65, posBateauY-15, posBateauX-15, posBateauY-15);
}
void pecheur(){
  fill(255);
  circle(posBateauX+35, posBateauY-35, 10);
  line(posBateauX+35, posBateauY-15, posBateauX+35, posBateauY-30); 
  line(posBateauX+35, posBateauY-15, posBateauX+80, posBateauY-30);
}
void hamecon(){
  stroke(couleurFil);
  line(posBateauX+80, posBateauY-30, posBateauX+80, posHameconY);
}

void keyPressed(){
  if(key==CODED && !deplacementSouris && !pause){
    if(keyCode==UP){
      posHameconY-=5;
    }
    if(keyCode==DOWN){
      posHameconY+=5;
    }
    if(keyCode==LEFT){
      posBateauX-=5;
    }
    if(keyCode==RIGHT){
      posBateauX+=5;
    }
  }
  if(key==32 && !menuSettings){
    pause=!pause;
    tutoriel=false;
  }
  posBateauX=constrain(posBateauX,15,width-65);
  posHameconY=constrain(posHameconY, posBateauY-25, height);
}


void mouvementSouris(){
  if(deplacementSouris && !pause){
    if(mouseX>posBateauX){
      posBateauX+=2;
      posBateauX=constrain(posBateauX,0, mouseX);  
    }else if(mouseX<posBateauX) {
      posBateauX-=2;
      posBateauX=constrain(posBateauX,mouseX, width);
    }
    
    if(mouseY>posHameconY){
      posHameconY+=2;
      posHameconY=constrain(posHameconY,0, mouseY);
    }else if(mouseY<posHameconY){
      posHameconY-=2;
      posHameconY=constrain(posHameconY,mouseY, width);
    }
    
  }
}

void hitBoxPoisson(float taille){
  initialisation();
  noFill();
  rectMode(CORNERS);
/* Affiche l'hit Box du poisson
fill(255,0,0);
rect(posPoissonX+15*taille, posPoissonY-10*taille, posPoissonX+40*taille, posPoissonY);
*/
  if(!poissonPecher && posBateauX+80>posPoissonX+15*taille && posHameconY>posPoissonY-10*taille && posBateauX+80<posPoissonX+40*taille && posHameconY<posPoissonY){
    poissonPecher=true;
    pecher();
  }
}
  
void pecher(){
  score+=(3/taille)+2/(height/posPoissonY);
  apparitionPoisson();
  posHameconY=25*height/100;
}
