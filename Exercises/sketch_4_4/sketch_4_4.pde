PFont myFont;
size(500,500);
background(240,250,20);
myFont = loadFont("CFOldPhotographCredit-Regular-48.vlw");
textFont(myFont);
fill(240, 30, 40);
text("  # YOLO # ", 30, 170);
text(" this is life ", 0, 210);

PFont font;
font = loadFont("AmericanTypewriter-Light-6.vlw");
textFont(myFont);
fill(0);
char c = 'A';
float cw = textWidth (c);
text(c, 22 ,40);
rect(22,42,cw,5);
String s = "whole new";
float sw = textWidth(s);
text(s, 22, 77);
rect(22,78,sw,5);
String g = "World";
float gw = textWidth(g);
text(g, 22, 115);
rect(44,78,gw,5);

noStroke();
smooth();
float radius = 1.0;
//0 11 22 33 44 ... 360*6
for (int deg = 0; deg < 360*15; deg += 11) {
float angle = radians(deg);
float x = 250 + (cos(angle) * radius); 
float y = 250 + (sin(angle) * radius); 
ellipse(x, y, 6, 6);
text(":", x, y);
radius += 0.29;
}



