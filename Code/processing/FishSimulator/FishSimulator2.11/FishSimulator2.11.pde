int score=0;

float taille;
boolean jour=true;
boolean poissonPecher=false;
boolean pause=true;
boolean menuSettings=false;
boolean deplacementSouris=false;
boolean tutoriel=true;
boolean secret=false;
PImage poissonClement;

Bateau bateau;
Poisson[] poisson = new Poisson[100];

void setup(){
//  fullScreen(1);
  size(1000,700);
  poissonClement =loadImage("poissonClement.png");
  for (int i = 0; i < poisson.length; i++) {
    poisson[i] = new Poisson();
  }
  bateau=new Bateau();
}

void draw(){
  background(250);
  initialisation();
  eau();
  colorMode(RGB, 255);
  noStroke();
  fill(255);
  
  if(jour){
    jour();
  }else if(!secret){
    nuit();
  }
  
  if(secret){
    bloodMoon();
  }
  
  
    for (int i = 0; i < poisson.length; i++) {
      if(!jour || secret){
   // affichePoissonQuiFaitPeur(taille);
  }else{
      poisson[i].affichePoisson();
  }
   }  
  
  if(!pause){
    for (int i = 0; i < poisson.length; i++) {
    poisson[i].mouvementPoisson();
   }
  }else{
    tuto();
    textSize(26);
    textAlign(CENTER);
    text("Jeux en pause..",width/2, height/2);
  }
  bateau.mouvementSouris();
  bateau.afficheBateau();
  boutonSettings();
  
  
  textAlign(LEFT);
  textSize(12);
  fill(255);
  text("score : "+score,5, 19);
}


void initialisation(){
  stroke(0);
  fill(255);
  strokeWeight(1);
  colorMode(RGB, 255);
  rectMode(CORNER);
  translate(0,0);
  textSize(12);
}

void eau(){
  colorMode(RGB, 25*height/100);
  int blue=height;
  int alpha=height/2;
  for( int i = 0;i<height;i++){
    fill(0,0,blue, alpha);
    noStroke();
    rect(0, i, width, 1);
    blue--;
    alpha++;
  }
}

void jour(){
  int blue=200;
  int alpha=255;
  rect(0,0,width, 25*height/100);
  for( int ciel = 0; ciel<25*height/100; ciel++){
    fill(0,0,blue, alpha);
    noStroke();
    rect(0, ciel, width, 1);
    alpha=blue--;
  }
}

void nuit(){
  colorMode(25*height/100);
  int gris=0;
  for( int ciel = 0;ciel<25*height/100;ciel++){
    fill(gris);
    noStroke();
    rect(0, ciel, width, 1);
    gris++;
  }
}

void bloodMoon(){
  int rouge=255;
  int alpha=255;
  rect(0,0,width, 25*height/100);
  for( int ciel = 0; ciel<25*height/100; ciel++){
    fill(rouge,0,0, alpha);
    noStroke();
    rect(0, ciel, width, 1);
    alpha--;
  }
}

void tuto(){
  initialisation();
  if(tutoriel){
    textSize(32);
    textAlign(CENTER);
    text("Utilise les flèches pour te déplacer et Espace pour retirer/mettre en pause",width/2, height/3);
  }
}

void pecher(){
  for (int i = 0; i < poisson.length; i++) {
    //score+=(3/taille)+2/(height/poisson.getPoissonY());
    poisson[i].apparitionPoisson();
  }
  bateau.PosHamY(25*height/100);
}

void keyPressed(){
  if(key==CODED && !deplacementSouris && !pause){
    if(keyCode==UP){
      bateau.posHamY-=5;
    }
    if(keyCode==DOWN){
      bateau.posHamY+=5;
    }
    if(keyCode==LEFT){
      bateau.posBatX-=5;
    }
    if(keyCode==RIGHT){
      bateau.posBatX+=5;
    }
  }
  if(key==32 && !menuSettings){
    pause=!pause;
    tutoriel=false;
  }
}
  
