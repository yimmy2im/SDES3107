size(400,400);

for (int y = 30; y <= 200; y += 10){
  for(int x = 30; x <=200; x += 10){
    if (x <=60){
      line(x,y,x-3,y-3);
    }else{
      line(x,y,x-3,y+3);
    }
  }
}
