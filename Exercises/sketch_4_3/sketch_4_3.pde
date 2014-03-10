smooth();
noFill(); 
background(249,200,90);
size(500,500);


beginShape(); 
curveVertex(20,80);
curveVertex(20,40); 
curveVertex(30,30); 
curveVertex(40,80); 
curveVertex(80,20); 
endShape();
stroke(200,340,200);
point(20,80);
point(20,40); 
point(30,30); 
point(40,80); 
point(80,80);

beginShape(TRIANGLE_FAN);
fill(204, 102, 0);
vertex(70, 70);
vertex(70, 30); 
vertex(92, 70); 
vertex(70, 85); 
vertex(50, 70); 
vertex(70, 30); 
endShape();

smooth();
noStroke();
beginShape();
vertex(290,80);
bezierVertex(200,140,104,87,86,103);
bezierVertex(86,103,140,190,180,198);
endShape();



//i is number 0 to 100
for (int x=0; x<100; x++) {
  // change to black
  stroke(0);
  float n = norm(x,0.0, 100.0);
  float y = pow(n, 4);
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

