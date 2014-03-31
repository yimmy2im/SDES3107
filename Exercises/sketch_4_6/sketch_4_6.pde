//String[] friends = { "Jim",
//"Sam", "Geofrey", "Laura",
//"Oliver", "Ernest"};

//String[] friends;
//friends = new String[6];
//friends[0] = "Jim";
//friends[1] = "Sam";
//friends[2] = "Geofrey";
//friends[3] = "Laura";
//friends[4] = "Oliver";
//friends[5] = "Ernest";

//println(friends[5]);


//String[][] friends = {
//{"Jim","Strawberry"},
//{"Sam","Chololate"},
//{"Geogrey", "Vanilla"},
//{"Laura","Rocky Road"},
//{"Oliver","Nougat"},
//{"Ernest","Cherry"}};

//0 1 2 3 4 5 
//for (int i = 0; i < friends.
//length; i++) {
 // println(friends[i][0] +  " likes "  + friends[i][1]);
//}




int numFrames = 15; 
int frame = 0; 
int xCoordinate = 0; 
PImage[] images = new PImage[numFrames]; 
void setup() {
size(600, 100);
frameRate(20); 
images[0] = loadImage("00.jpg"); 
images[1] = loadImage("01.jpg"); 
images[2] = loadImage("02.jpg"); 
images[3] = loadImage("03.jpg"); 
images[4] = loadImage("04.jpg"); 
images[5] = loadImage("05.jpg"); 
images[6] = loadImage("06.jpg"); 
images[7] = loadImage("07.jpg"); 
images[8] = loadImage("08.jpg"); 
images[9] = loadImage("09.jpg"); 
images[10] =loadImage("10.jpg"); 
images[11] = loadImage("11.jpg");
images[12] =  loadImage("12.jpg");
images[13] =  loadImage("13.jpg");
images[14] =  loadImage("14.jpg");

}
void draw() {
frame++;
xCoordinate+=3;
if (xCoordinate >width) {
    xCoordinate = -40;
}
if (frame == numFrames) {
frame = 0;
}
image(images[frame], xCoordinate , 0);
}






