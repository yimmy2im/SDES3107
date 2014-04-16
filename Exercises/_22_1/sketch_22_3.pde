int x = 20;
int u = 14;
float a = -0.12;

void setup(){
  size(200,200);
  stroke(0,153);
  smooth();
  noLoop();
}

void draw(){
  background(204);
  tail(x,u,a);
}

void tail(int xpos, int units, float angle){
  pushMatrix();
  translate(xpos, 0);
  for(int i = units; i>0; i--){
   strokeWeight(i);
   line(10,20,30,30);
   translate(4,8);
   rotate(angle);
  }
  popMatrix();
}
