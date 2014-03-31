PImage img;
PImage zoom;
color pixelColor;

void setup() {
  size(400, 400);
  img = loadImage("cat.jpeg");  
}

void draw(){
  image(img, 0, 0, width, height);
  zoom = get(mouseX-10, mouseY-10, 20, 20);
  image(zoom, mouseX+60, mouseY, 70, 70);
  pixelColor = get(mouseX, mouseY);
  fill(pixelColor);
  ellipse(mouseX+30, mouseY, 50, 50);
}




