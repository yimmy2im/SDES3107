void setup() {
  size(400,400);
  background(100,300,300);
  smooth();
  noLoop();
  stroke(255);
  noFill();
  rectMode(CORNERS);
}

void draw() {
myFunction(200,200,200,200);
myFunction(300,300,400,400);
}


void myFunction(int size, int number, int x, int y) { 
  for(int counter = number; counter > 0; counter-=10) {
    rect(x,y,size,size);
size-=10; }
}
