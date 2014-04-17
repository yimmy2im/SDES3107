size(100,100);
background(10,1
30,130);


fill(255);
strokeWeight(2);
for (int y = 30; y <= 70; y +=10){
  for (int x = 20; x <= 80; x+=5){
  if ((x % 10) == 0) { 
    line(x, y, x+3, y-3);
} else {
    line(x, y, x+3, y+3);
  }
 }
}

