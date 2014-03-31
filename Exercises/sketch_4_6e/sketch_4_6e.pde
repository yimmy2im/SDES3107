PImage chipmuck;
PFont f;
int[] hues = {131, 300, 60, 5};

void setup() {
  size(760, 500);
  colorMode(HSB,360,100,100);
  chipmuck = loadImage("chipmuck.jpeg");
  f = createFont("Arial", 48);
  textFont(f);
  textAlign(CENTER);
  fill(0);
}
void draw() {
  image(chipmuck, 0, 0, width, height);
  fill(hues[0], 100, 200);
  text("WATCH OUT PEOPLE", width-mouseX,height-mouseY);
 
}
