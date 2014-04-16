//i is number 0 to 100
for (int x=0; x<100; x++) {
  // change to black
  stroke(0);
  float n = norm(x,0.0, 100.0);
  float y = pow(n, 8);
  y *=100;
  point(x,y);
}
  
float y;

// is is number 0 to 100
for (int i=0; i<500; i++){
  // change to black
  stroke(0);
  y = map(i,0,500, 40, 200);
  point(i,y);
}
