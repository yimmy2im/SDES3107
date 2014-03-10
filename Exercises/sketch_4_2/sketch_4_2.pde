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
ellipse(pos,pos,90,90);
pos = pos + 20; 






stroke(225, 0,0);
int drawPosition = 10;
int distanceBetweenLines = 50;

println(drawPosition);

float position = 10;
line(position, 0, position, height);
position = position * 2.5;
println(position);
line(position, 0, position, height);
position = position * 2.5;
println(position);line(position, 0, position, height);
position = position * 2.5;
println(position);


for (int counter = 0; counter < 5; counter += 1) 
{
  line(position, 0, position, height);
  position = position * 2.5;
  println(position);
}



print("This is some test text!"); 
println("This is some more test text!"); 
println("This is even more test text!");

