int i=0;
while(i<10){
  println(i);
  i++;
}


for(int j=0;j<10;j+=2){
  println(j);
}

/*for(int k=0;k<100;k+=4){
  line(width/2,10,k,90);
  line(width/2,90,k,10);
}
*/
for(int carre=0;carre<100;carre+=2){
  int longueur=1;
  line(carre,0,carre,longueur);
  longueur*=longueur;
}
