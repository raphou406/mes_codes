class Bateau {

  int posBatX, posBatY, posHamX, posHamY;
  color couleur;

  Bateau() {
    this.posBatX=25*height/100;
    this.posBatY=25*height/100;
    this.posHamY=0;
    this.couleur=color(255, 255, 0);
  }
  void PosHamY(int x) {
    posHamY=x;
  }

  int getHamY() {
    return posHamY;
  }
  int getBatX() {
    return posBatX;
  }
  int getBatY(){
    return posBatY;
  }

  void afficheBateau() {
    initialisation();
    barque();
    pecheur();
    hamecon();
    posBatX=constrain(posBatX, 15, width-65);
    posHamY=constrain(posHamY, posBatY-25, height);
  }

  void barque() {
    fill(156, 66, 29);
    quad(posBatX, posBatY, posBatX+50, posBatY, posBatX+65, posBatY-15, posBatX-15, posBatY-15);
  }
  void pecheur() {
    fill(255);
    circle(posBatX+35, posBatY-35, 10);
    line(posBatX+35, posBatY-15, posBatX+35, posBatY-30);
    line(posBatX+35, posBatY-15, posBatX+80, posBatY-30);
  }
  void hamecon() {
    stroke(couleur);
    line(posBatX+80, posBatY-30, posBatX+80, posHamY);
  }
  void mouvementSouris() {
    if (deplacementSouris && !pause) {
      if (mouseX>posBatX) {
        posBatX+=2;
        posBatX=constrain(posBatX, 0, mouseX);
      } else if (mouseX<posBatX) {
        posBatX-=2;
        posBatX=constrain(posBatX, mouseX, width);
      }

      if (mouseY>posHamY) {
        posHamY+=2;
        posHamY=constrain(posHamY, 0, mouseY);
      } else if (mouseY<posHamY) {
        posHamY-=2;
        posHamY=constrain(posHamY, mouseY, width);
      }
    }
  }
}
