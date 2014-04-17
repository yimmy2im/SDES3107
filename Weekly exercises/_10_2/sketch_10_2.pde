//load 3 pictures on one screen with different tint.

size(170,510);
color yellow=color(220, 214, 41);
color green = color(110, 164, 32);
color tan = color(180, 177, 132);

PImage img;
img= loadImage("1.jpg");
tint(yellow);
image(img, 0,0);


img= loadImage("2.jpg");
image(img, 0, 170);
tint(green);

img= loadImage("3.jpg");
image(img, 0, 340);
tint(tan);
