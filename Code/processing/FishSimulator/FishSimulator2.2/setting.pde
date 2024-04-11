void boutonSettings() {
  initialisation();
  rectMode(CORNERS);
  fill(175);
  rect(90*width/100, 0, width, 5*height/100);
  textAlign(LEFT);
  fill(0);
  text("Paramètres", 92*width/100, 2.7*height/100);
  menu();
}

void menu() {
  //Les valeurs sont en pourcentage de l'écran
  initialisation();
  if (menuSettings) {
    rectMode(CORNERS);
    rect(20*width/100, 10*height/100, 80*width/100, 70*height/100);

    fill(195);
    boutton(25*width/100, 15*height/100, 40*width/100, 20*height/100, 33*width/100, 18*height/100, "Mode Nuit");

    fill(195);
    boutton(50*width/100, 15*height/100, 65*width/100, 20*height/100, 58*width/100, 18*height/100, "Mode Jour");

    textAlign(LEFT);
    text("changer la couleur du fils :", 25*width/100, 23*height/100);

    fill(255, 0, 0);
    boutton(25*width/100, 25*height/100, 30*width/100, 30*height/100, 27*width/100, 27*height/100, "Rouge");

    fill(0, 255, 0);
    boutton(33*width/100, 25*height/100, 38*width/100, 30*height/100, 35*width/100, 27*height/100, "Vert");

    fill(255, 255, 0);
    boutton(41*width/100, 25*height/100, 46*width/100, 30*height/100, 43*width/100, 27*height/100, "jaune");
    pause=true;

    fill(195);
    boutton(25*width/100, 35*height/100, 40*width/100, 40*height/100, 33*width/100, 38*height/100, "Jouer avec la souris");

    fill(195);
    boutton(50*width/100, 35*height/100, 65*width/100, 40*height/100, 58*width/100, 38*height/100, "Jouer avec le clavier");
  }
}

void boutton(int x1, int y1, int x2, int y2, int txtX, int txtY, String txt) {
  rect(x1, y1, x2, y2);
  textAlign(CENTER);
  fill(0);
  text(txt, txtX, txtY);
}

void mousePressed() {
  //permet de cliquer sur tout les bouttons des parametres
  if (mouseX>90*width/100 && mouseY>0 && mouseX<width && mouseY<5*height/100) {
    menuSettings=!menuSettings;
  }
  if (mouseX>25*width/100 && mouseY>15*height/100 && mouseX<40*width/100 && mouseY<20*height/100 && menuSettings ) {
    jour=false;
  }
  if (mouseX>50*width/100 && mouseY>15*height/100 && mouseX<65*width/100 && mouseY<20*height/100 && menuSettings ) {
    jour=true;
  }
  if (mouseX>25*width/100 && mouseY>25*height/100 && mouseX<30*width/100 && mouseY<30*height/100 && menuSettings ) {
    bateau.couleur=color(255, 0, 0);
  }
  if (mouseX>33*width/100 && mouseY>25*height/100 && mouseX<38*width/100 && mouseY<30*height/100 && menuSettings ) {
    bateau.couleur=color(0, 255, 0);
  }
  if (mouseX>41*width/100 && mouseY>25*height/100 && mouseX<46*width/100 && mouseY<30*height/100 && menuSettings ) {
    bateau.couleur=color(255, 255, 0);
  }
  if (mouseX>25*width/100 && mouseY>35*height/100 && mouseX<40*width/100 && mouseY<40*height/100 && menuSettings ) {
    deplacementSouris=true;
  }
  if (mouseX>50*width/100 && mouseY>35*height/100 && mouseX<65*width/100 && mouseY<40*height/100 && menuSettings ) {
    deplacementSouris=false;
  }


  //active le mode hard si on click sur la tete du pecheur
  if (mouseX>bateau.getBatX()+27 && mouseY<bateau.getBatY()-27 && mouseX<bateau.getBatX()+43 && mouseY>bateau.getBatY()-43) {
    secret=true;
    for (int i=0; i<poisson.length; i++) {
      poisson[i].setVitesse(2);
    }
  }
}
