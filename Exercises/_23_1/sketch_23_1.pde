
void setup() {
size(500,500); 
smooth(); 
noStroke();
}

void draw() {
background(216,110,200);
ellipse(mouseX,width - mouseY * 2,22,22);
ellipse(mouseX,mouseY * 2,11,11);
rect(mouseX,mouseY,22,22);
}

