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

