void setup() {
size(100,100); 
smooth(); 
noStroke();
} 

void draw() {
background(204,200,30);
if (mousePressed == true) {
   fill(255,20,30);
} else {
  fill(0);
}
rect(25,25,50,50);
}
