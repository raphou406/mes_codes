int score=0;

PImage poissonClement;

Bateau bateau;
Environnement decor;
ArrayList<Poisson> poisson = new ArrayList();

void setup() {
  int nombrePoisson = 50;
  //  fullScreen(1);
  size(1000, 700);
  poissonClement =loadImage("poissonClement.png");
  for (int i = 0; i < nombrePoisson; i++) {
    poisson.add(new Poisson());
  }
  bateau=new Bateau();
  decor = new Environnement();
}

void draw() {
  background(250);
  decor.initialisation();
  decor.eau();
  colorMode(RGB, 255);
  noStroke();
  decor.arrierePlan();

  for (int i=0;i<poisson.size();i++) {
    Poisson dorade = poisson.get(i);
    dorade.affichagePoisson();
    if (!decor.getPause()) {
      dorade.mouvementPoisson();
      
      dorade.pecher();
    }
  }
  
  poisson.removeIf(p -> p.hitBoxPoisson());

  bateau.mouvementSouris();
  bateau.afficheBateau();
  boutonSettings();

  if (decor.getPause()) {
    decor.jeuPause();
  }
  textAlign(LEFT);
  textSize(12);
  fill(255);
  text("score : "+score, 5, 19);
}

void keyPressed() {
  if (key==CODED && !decor.getDeplacementSouris() && !decor.getPause()) {
    if (keyCode==UP) {
      bateau.posHamY-=5;
    } else if (keyCode==DOWN) {
      bateau.posHamY+=5;
    }
    if (keyCode==LEFT) {
      bateau.posBatX-=5;
    } else if (keyCode==RIGHT) {
      bateau.posBatX+=5;
    }
  }
  if (key==32 && !decor.getMenuSettings()) {
    decor.pause=!decor.pause;
    decor.tutoriel=false;
  }
}
