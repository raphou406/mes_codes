int posPoissonX;
int posPoissonY;
int posBateauX;
int posBateauY;
int posHameconX;
int posHameconY;
int score=0;
int direction=1;
int vPoisson=1;
float taille;
boolean jour=true;
boolean poissonPecher=false;
boolean pause=true;
boolean menuSettings=false;
boolean deplacementSouris=false;
boolean tutoriel=true;
boolean secret=false;
PImage poissonClement;
color couleurFil ;
color couleurPoisson;

void setup(){
//  fullScreen(1);
  size(1000,700);
  
  posBateauX=posBateauY=25*height/100;
  apparitionPoisson();
  println(posBateauX+35);
  poissonClement=loadImage("poissonClement.png");
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
  
  if(!jour || secret){
    affichePoissonQuiFaitPeur(taille);
  }else{
    affichePoisson(taille);
  }
  
  if(!pause){
    mouvementPoisson();
  }else{
    tuto();
    textSize(26);
    textAlign(CENTER);
    text("Jeux en pause..",width/2, height/2);
  }
  mouvementSouris();
  afficheBateau();
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
