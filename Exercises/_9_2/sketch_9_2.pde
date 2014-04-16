colorMode(HSB, 360,100,100);
for(int i = 0; i<100; i++){
  float newhue = 200 - (i*1.1);
  stroke(newhue, 300, 330);
  line(i,0,i,100);
}
