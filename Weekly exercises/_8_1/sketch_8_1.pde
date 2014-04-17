//i is number 0 to 100

background(255);
size(400,400);
for (int x=0; x<100; x++) {
  // change to black
  stroke(0);
  float n = norm(x,0.0, 100.0);
  float y = pow(n, 4);
  y *=100;
  point(x,y);
}
  
