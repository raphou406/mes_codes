float lockX;
float lockY;
float targetsRadius = 10;
float shootZonePercentage = 20;
import java.util.*;
Dart currentDart;
Target currentTarget;
float power = 2;
boolean mustDeleteDart = false;
Dart globDart = new Dart(200, 200,power,-power); 
ArrayList<Dart> dartList = new ArrayList<Dart>();
ArrayList<Target> targetList = new ArrayList<Target>();
void setup() {
  size(1800, 1000);
}

void draw() {
  background(255);
  fill(255,150,150);
  rect(width*shootZonePercentage/100, 0, width*(100-shootZonePercentage)/100, height);
  for (Iterator<Target> k = targetList.iterator(); k.hasNext();) { 
    currentTarget = k.next();
    currentTarget.update();
  }
  for (Iterator<Dart> i = dartList.iterator(); i.hasNext();) { 
    mustDeleteDart = false;
    currentDart = i.next();
    if(currentDart.posX<0 || currentDart.posX>width || currentDart.posY<0 || currentDart.posY>height){
      mustDeleteDart = true;
    }else{
      for (Iterator<Target> j = targetList.iterator(); j.hasNext();) { 
        currentTarget = j.next();
        print(dist(currentDart.posX, currentDart.posY, currentTarget.posX, currentTarget.posY), "\n");
        if(dist(currentDart.posX, currentDart.posY, currentTarget.posX, currentTarget.posY)<= currentTarget.Radius){
          mustDeleteDart = true;
          j.remove();
        }
      }
      }
    if(mustDeleteDart){
      i.remove();
    }
    
    currentDart.update();
  }
  
  if (mousePressed && (mouseButton == LEFT)) {
    if(lockX<(width*shootZonePercentage/100)){
      line(lockX, lockY, mouseX, mouseY); 
    }
  }

}



void mousePressed() {
  if (mouseButton == LEFT) {
    lockX = mouseX;
    lockY = mouseY;
  }

}


void mouseReleased() {
  if (mouseButton == LEFT) {
    if(lockX<(width*shootZonePercentage/100)){
      Dart dart = new Dart(lockX, lockY,(lockX-mouseX)*power/100,(lockY-mouseY)*power/100); 
      dartList.add(dart);
    }
  }else if(mouseButton == RIGHT){
      Target target = new Target(mouseX,mouseY,targetsRadius); 
      targetList.add(target);
  }
}
class Target{
  float posX, posY, Radius;
  Target(float x, float y, float r){
    posX = x;
    posY = y;
    Radius = r;
  }
  void update() { 
    ellipseMode(RADIUS);
    fill(255,0,0);
    ellipse(posX, posY, Radius, Radius);
  } 



}
class Dart { 
  float posX, posY, velX, velY;
  PVector velocityVector;
  PVector normalizedVelocityVector;
  float airPenetration = 0.9;
  float weight = 0.05;
  Dart (float x, float y, float vx, float vy) {  
    posX = x; 
    posY = y; 
    velocityVector = new PVector(vx,vy);
  } 
  void update() { 
    normalizedVelocityVector = new PVector(velocityVector.x, velocityVector.y,0);
    normalizedVelocityVector.normalize();
    line(posX, posY, posX-normalizedVelocityVector.x*7, posY-normalizedVelocityVector.y*7); 
    velocityVector.y += weight;
    posX += velocityVector.x; 
    posY += velocityVector.y; 
  } 
} 
