noStroke();
smooth();
int radius = 38;
for (int deg = 0; deg < 360; deg += 12) { 
float angle = radians(deg);
float x = 50 + (cos(angle) * radius);
float y = 50 + (sin(angle) * radius); ellipse(x, y, 6, 6);
}



size(700, 100); noStroke(); smooth(); fill(0);
float offset = 50.0; 
float scaleVal = 35.0; 
float angleInc = PI/28.0; 
float angle = 0.0; 
for (int x = 0; x <= width;
x += 5) {
float y = offset + (sin(angle) * scaleVal);
rect(x, y, 2, 4); angle += angleInc; }

//this comment is draw for circles and arcs
arc(50, 55, 60, 60, HALF_PI, PI);

