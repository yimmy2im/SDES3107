// I reworked for P_3_1_3_03.pde

/**
 * analysing and sorting the letters of a text 
 * drawing the letters frequency with lines, ellipses and background colour changing
 *
 * MOUSE
 * position x          : random angle
 * position y          : line length, size of ellipses, tracking and colour background
 *
 * KEYS
 * 1                   : toggle alpha mode
 * 2                   : toggle drawing of lines
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

String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ,.;:!? ";
int[] counters = new int[alphabet.length()];

int posX, posY;
int tracking = 29;//change the tracking to 29

int actRandomSeed = 0;

boolean drawAlpha = true;
boolean drawLines = true;
boolean drawEllipses = true;
boolean drawText = false;


void setup() {
  size(700, 700);//change to smaller size
  lines = loadStrings("bruno_mars.txt");//changed the text to bruno mars lyrics
  joinedText = join(lines, " ");

  font = loadFont("dDAFTt-UPPERcase-48.vlw");//also load the new font

  countCharacters();
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100, 100);
  textFont(font);
  background(mouseY/4, 100,100,100);//changing colour by moving the cursor
  noStroke();
  smooth();
  textSize(mouseX/20);//changing text size by moving the cursor 

  posX = 40;
  posY = 100;
  randomSeed(actRandomSeed);

  // ------ draw lines and ellipses ------  
  for (int i = 0; i < joinedText.length(); i++) {
    // again, find the index of the current letter in the alphabet 
    String s = str(joinedText.charAt(i)).toUpperCase();
    char uppercaseChar = s.charAt(0);
    int index = alphabet.indexOf(uppercaseChar);
    if (index < 0) continue;

    // ------ calculate parameters ------
    float charAlpha = 100;
    if (drawAlpha) charAlpha = counters[index];

    float my = map(mouseY, 50,height-50, 0,1);
    my = constrain(my, 0, 1);
    float charSize = counters[index] * my * 3;

    float mx = map(mouseX, 50,width-50, 0,1);
    mx = constrain(mx, 0, 1);
    float lineLength = charSize;
    float lineAngle = random(-PI, PI) * mx - HALF_PI;
    float newPosX = lineLength * cos(lineAngle);
    float newPosY = lineLength * sin(lineAngle);

    // ------ draw elements ------
    pushMatrix();
    translate(posX, posY);
    stroke(mouseX/3,100,50,100);//changing color when the cursor moves
    strokeWeight(2);//add stroke weight to the lines
    if (drawLines) line(0, 0, newPosX, newPosY);
    noStroke();//no stroke for ellipses
    fill(mouseY/2, 50,100,100);//changing color when the cursor moves
    
    if (drawEllipses) ellipse(0, 0, charSize/2-10, charSize/2-10);
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
    posY = 100;
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

      float my = map(mouseY, 10,height-10, 0,1);
      my = constrain(my, 0, 1);
      float charSize = counters[index] * my * 2;

      float mx = map(mouseX, 50,width-50, 0,1);
      mx = constrain(mx, 0, 1);
      float lineLength = charSize;
      float lineAngle = random(-PI, PI) * mx - HALF_PI;
      float newPosX = lineLength * cos(lineAngle);
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
  if (key == '2') drawLines = !drawLines;
  if (key == '3') drawEllipses = !drawEllipses;
  if (key == '4') drawText = !drawText;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}























