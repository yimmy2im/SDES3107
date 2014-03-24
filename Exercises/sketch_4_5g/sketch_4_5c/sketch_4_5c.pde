
void setup() { 
  size(600,600); 
  stroke(255,30,40);
}

void draw() {
if(mousePressed == true){
   line(mouseX, mouseY,
   pmouseX, pmouseY);
   }
}
