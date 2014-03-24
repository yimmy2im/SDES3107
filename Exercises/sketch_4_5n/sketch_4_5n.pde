void setup() {
               size(100, 100);
               smooth();
               strokeWeight(4);
}

void draw() {
if ((keyPressed == true) && (key == 'P')) {
  image(img, 0, 0, img.width /2, img.height/2);
  image(img2,mouseX-(img2.width/4),mouseY-(img2.height/4),img2.width/2,img2/height/2);
  
 }
}
