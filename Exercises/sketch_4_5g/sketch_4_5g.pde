// Draw with an image sliver
 PImage lineImage;
void setup() {
size(800, 800);


// This image is 100 pixels wide, but one pixel tall 
lineImage = loadImage("lollipop.jpeg");
}

void draw() {
image(lineImage, mouseX-lineImage.width/2, mouseY);
}
