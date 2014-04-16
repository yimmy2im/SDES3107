float x = 0.0;

void setup(){
  size(100,100);
  smooth();
  fill(0);
}

void draw(){
  background(204);
  ellipse(x,50,70,70);
  x+=0.5;
  if(x>150){
    x=-50.0;
   
  }
}
