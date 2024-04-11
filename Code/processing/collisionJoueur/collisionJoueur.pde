float g = .08;
float vHauteur = 0;
float x, y;
int taille = 25;
float saut = -4;
boolean[] keys = new boolean[128];
float xP, yP;

void setup() {
  size(1000, 600);
  x = width/2;
  y = height/2;
  saut = -height*.8/100;
  xP = height - 100;
  yP = 100;
}

void draw() {
  background(244);

  rectMode(CENTER);
  rect(x, y, taille, taille);
  if ( keys['q']) {
    x -= 1.5;
  } else if ( keys['d']) {
    x += 1.5;
  }
  y += vHauteur;
  vHauteur += g;
  y = constrain(y, 0+ taille, height- taille/2);
}

boolean surSol(float y, int t) {
  return y+t/2 >= height;
}

void keyPressed() {
  if (key == ' ' && surSol(y, taille)) {
    vHauteur = saut;
  }
  keys[key] = true;
}

void keyReleased() {
  keys[key] = false;
}
