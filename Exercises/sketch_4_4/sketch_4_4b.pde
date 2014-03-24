size(300,300);
int randomPos = int(random(300.0));
fill(100);
noStroke();
rect(randomPos,randomPos+10,50,50);

size(600,600);
float v=0.0;
float inc=0.1;
noStroke();
fill(0);
noiseSeed(0);

for(int i=0;i<
width; i=i+4){
  float n=noise(v)*
  70.0;
  rect(i,10+n,3,
  20);
  v=v+inc;
}

