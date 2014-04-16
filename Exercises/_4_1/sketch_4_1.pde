// This program creates one line and one ellipse
// http://www.processing.org/reference/line_.html
int screenWidth = 400;
int pos = 50; 
int ellipseSize = 100;

size(width, width*2);
background(0);

float floatie = 3.5;
size(screenWidth, screenWidth*2);

ellipse(width/2,height/2,width/5,width/5);
pos = pos + 20; 
ellipse(pos,pos,90,90);
pos = pos + 20; 
ellipse(pos,pos,90,90);
pos = pos + 20; 

