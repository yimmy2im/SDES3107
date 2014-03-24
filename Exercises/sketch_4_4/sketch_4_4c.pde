size(500,500);
background(280,200,190);
int x = 50;
int y = 50;

colorMode(HSB, 100);
for (int i =0; i<100; i++) {
 
  x = round(random(width));
  y = round(random(height));
  //hue, saturation, brightness
  fill(random(0,100),100,100);
  ellipse(x, y, 30, 30);
} 
