class Environnement {

  boolean jour=true;
  boolean deplacementSouris=false;
  boolean tutoriel=true;
  boolean secret=false;
  boolean pause=true;
  boolean menuSettings=false;
  boolean poissonPecher=false;

  Environnement() {
  }

  boolean getJour() {
    return jour;
  }
  boolean getTutoriel() {
    return tutoriel;
  }
  boolean getSecret() {
    return secret;
  }
  boolean getPause() {
    return pause;
  }
  boolean getMenuSettings() {
    return menuSettings;
  }
  boolean getDeplacementSouris() {
    return deplacementSouris;
  }
  boolean getPoissonPecher() {
    return poissonPecher;
  }

  void initialisation() {
    stroke(0);
    fill(255);
    strokeWeight(1);
    colorMode(RGB, 255);
    rectMode(CORNER);
    textSize(12);
  }

  void arrierePlan() {
    initialisation();
    if (this.jour) {
      jour();
    } else {
      nuit();
    }
    if (this.secret) {
      initialisation();
      bloodMoon();
    }
  }

  void jeuPause() {
    tuto();
    textSize(26);
    textAlign(CENTER);
    text("Jeux en pause..", width/2, height/2);
  }
  void jour() {
    int blue=200;
    int alpha=255;
    rect(0, 0, width, 25*height/100);
    for ( int ciel = 0; ciel<25*height/100; ciel++) {
      fill(0, 0, blue, alpha);
      noStroke();
      rect(0, ciel, width, 1);
      alpha=blue--;
    }
  }

  void nuit() {
    colorMode(25*height/100);
    int gris=0;
    for ( int ciel = 0; ciel<25*height/100; ciel++) {
      fill(gris);
      noStroke();
      rect(0, ciel, width, 1);
      gris++;
    }
  }

  void bloodMoon() {
    int rouge=255;
    int alpha=255;
    rect(0, 0, width, 25*height/100);
    for ( int ciel = 0; ciel<25*height/100; ciel++) {
      fill(rouge, 0, 0, alpha);
      noStroke();
      rect(0, ciel, width, 1);
      alpha--;
    }
  }

  void eau() {
    colorMode(RGB, 25*height/100);
    int blue=height;
    int alpha=height/2;
    for ( int i = 0; i<height; i++) {
      fill(0, 0, blue, alpha);
      noStroke();
      rect(0, i, width, 1);
      blue--;
      alpha++;
    }
  }


  void tuto() {
    initialisation();
    if (tutoriel) {
      textSize(32);
      textAlign(CENTER);
      text("Utilise les flèches pour te déplacer et Espace pour retirer/mettre en pause", width/2, height/3);
    }
  }
}
