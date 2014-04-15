// i reworked for P_3_1_3_03.pde

/**
 * analysing and sorting the letters of a text 
 * drawing the letters frequency with rectangles and ellipses
 *
 * MOUSE
 * position x          : random angle
 * position y          : size of rectangles and ellipses, tracking
 *
 * KEYS
 * 1                   : toggle alpha mode
 * 2                   : toggle drawing of rectangles
 * 3                   : toggle drawing of ellipses
 * 4                   : toggle drawing of text
 * s                   : save png
 * p                   : save pdf
 */



import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

PFont font;
String[] lines;
String joinedText;

String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ,.;:!? ";//change the alphabet
int[] counters = new int[alphabet.length()];

int posX, posY;
int tracking = 29;//change the tracking again to 29

int actRandomSeed = 0;

boolean drawAlpha = true;
boolean drawRectangles = true;
boolean drawEllipses = true;
boolean drawText = false;


void setup() {
  size(1040, 560);

  lines = loadStrings("bruno_mars.txt");//change the text file (check data file)
  joinedText = join(lines, " ");

  font = createFont("Courier", 10);

  countCharacters();
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100, 100);//keep in HSB MODE
  
  PImage img;
  img= loadImage("mars.jpeg"); //background load bruno mars wallpaper
  image(img,0,0);//set the position
  
  textFont(font);
  noStroke();
  smooth();
  textSize(45);//change the font size to 45

  posX = 80;
  posY = 100;
  randomSeed(actRandomSeed);

  // ------ draw rectangles and ellipses ------  
  for (int i = 0; i < joinedText.length(); i++) {
    // again, find the index of the current letter in the alphabet 
    String s = str(joinedText.charAt(i)).toUpperCase();
    char uppercaseChar = s.charAt(0);
    int index = alphabet.indexOf(uppercaseChar);
    if (index < 0) continue;

    // ------ calculate parameters ------
    float charAlpha = 100;
    if (drawAlpha) charAlpha = counters[index];

    float my = map(mouseY,1,height-1, 0,1);//change the position follow by cursor
    my = constrain(my, 0, 1);
    float charSize = counters[index] * my * 2;

    float mx = map(mouseX,1,width-1, 0,1);//chang the position follow by cursor
    mx = constrain(mx, 0, 1);
    float lineLength = charSize;
    float lineAngle = random(-PI, PI);
    float newPosX = random(lineLength * sin(lineAngle));
    float newPosY = random(lineLength * sin(lineAngle));

    // ------ draw elements ------
    pushMatrix();
    translate(posX, posY);
    stroke(27, 193, 51, charAlpha);
    strokeWeight(20);//add stroke weight 20 to all the rectangles
    fill(27, 173, 151, charAlpha);//change the colour to brown
    if (drawRectangles) rect(20, 20, newPosX * 2, newPosY * 2);
    noStroke();//no stroke for ellipse
    fill(202, 100, 201, charAlpha);//change the colour to blue
    if (drawEllipses) ellipse(20, 20, charSize, charSize);//location to 20,20
    popMatrix();

    posX += textWidth(joinedText.charAt(i));
    if (posX >= width-200 && uppercaseChar == ' ') {
      posY += int(tracking*my+30);
      posX = 80;
    }
  }

  // ------ draw letters ------
  if (drawText) {
    posX = 80;
    posY = 300;
    randomSeed(actRandomSeed);

    for (int i = 0; i < joinedText.length(); i++) {
      // again, find the index of the current letter in the alphabet 
      String s = str(joinedText.charAt(i)).toUpperCase();
      char uppercaseChar = s.charAt(0);
      int index = alphabet.indexOf(uppercaseChar);
      if (index < 0) continue;

      // ------ calculate parameters ------
      float charAlpha = 100;
      if (drawAlpha) charAlpha = counters[index];

      float my = map(mouseY, 1,height-1, 0,1);
      my = constrain(my, 0, 1);
      float charSize = counters[index] * my * 10;

      float mx = map(mouseX, 1,width-1, 0,1);
      mx = constrain(mx, 0, 1);
      float lineLength = charSize;
      float lineAngle = random(-PI, PI) * mx - HALF_PI;
      float newPosX = lineLength * sin(lineAngle);
      float newPosY = lineLength * sin(lineAngle);

      // ------ draw elements ------
      pushMatrix();
      translate(posX, posY);
      fill(0, charAlpha);
      text(joinedText.charAt(i), newPosX, newPosY);
      popMatrix();

      posX += textWidth(joinedText.charAt(i));
      if (posX >= width-200 && uppercaseChar == ' ') {
        posY += int(tracking*my+30);
        posX = 80;
      }
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void countCharacters(){
  for (int i = 0; i < joinedText.length(); i++) {
    // get one char from the text, convert it to a string and turn it to uppercase
    String s = str(joinedText.charAt(i)).toUpperCase();
    // convert it back to a char
    char uppercaseChar = s.charAt(0);
    // get the position of this char inside the alphabet string
    int index = alphabet.indexOf(uppercaseChar);
    // increase the respective counter
    if (index >= 0) counters[index]++;
  }
}



void mousePressed() {
  actRandomSeed = (int) random(100000);
}



void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;

  if (key == '1') drawAlpha = !drawAlpha;
  if (key == '2') drawRectangles = !drawRectangles;
  if (key == '3') drawEllipses = !drawEllipses;
  if (key == '4') drawText = !drawText;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}























