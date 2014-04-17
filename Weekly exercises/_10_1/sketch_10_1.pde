//load 2 pictures on one screen

size(900,4000);
PImage img;
img= loadImage("Cat.jpeg");
image(img, 0,0);
tint(212,130,30);

img= loadImage("Dog.jpeg");
image(img, 0, 800);
tint(210,130,40);
