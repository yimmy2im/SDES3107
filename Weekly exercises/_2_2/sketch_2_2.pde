// This program creates one line and one ellipse
// http://www.processing.org/reference/line_.html
int screenWidth = 200;
int pos = 50; 
int ellipseSize = 100;

size(width, width*2);
background(155,30,20);


float floatie = 3.5;
size(screenWidth, screenWidth*2);

fill(10,203,25);
strokeWeight(2);
ellipse(width/2,height/2,width/5,width/5);
strokeWeight(10);
fill(20,155,23);
line(width,height,width/2,height/2);
