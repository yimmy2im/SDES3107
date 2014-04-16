PFont font;
float x1 = 0;
float x2 = 30;
void setup() {
  size(400, 400);
  font = loadFont("ACaslonPro-Bold-20.vlw");
  textFont(font);
  fill(250,80,240);
}
void draw() {
  background(40,20,40);
  text("NOUN: walk", x1, 50);
  text("ADJ: wakable", x2, 100);
  x1 += 1.0;
  if (x1 > 100) { x1 = -100; }
  x2 -= 0.8;
  if (x2 < -150) { x2 = 100; }
}
