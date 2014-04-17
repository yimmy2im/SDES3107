//once
void setup() {
size(300,300); 
fill(100); 
noStroke();
frameRate(2);
}

void draw() {
  background(255);
int randomPos = int(random(300.0));
rect(randomPos,randomPos+10,50,50);
}
