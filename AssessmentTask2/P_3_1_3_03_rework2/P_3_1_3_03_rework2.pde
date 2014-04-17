// I reworked P_3_1_3_03.pde

/**
 * analysing and sorting the letters of a text 
 * drawing the letters frequency with two types of ellipses
 *
 * MOUSE
 * position x          : random angle
 * position y          : size of ellipses, tracking
 *
 * KEYS
 * 1                   : toggle alpha mode
 * 2                   : toggle drawing of ellipses2
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

String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ,.;:!?/\1234 ";
int[] counters = new int[alphabet.length()];

int posX, posY;
int tracking = 27;//change the tracking to 27

int actRandomSeed = 0;

boolean drawAlpha = true;
boolean drawEllipses2 = true;
boolean drawEllipses = true;
boolean drawText = false;


void setup() {
  size(1100, 700);//change into smaller size
  lines = loadStrings("count_on_me.txt");//change the txt file again
  joinedText = join(lines, " ");

  font = createFont("Courier", 10);

  countCharacters();
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100, 100);//Back to HSB mode
  textFont(font);
  background(20,30,10);//change the background to darker blue
  noStroke();
  smooth();
  textSize(40);//change the font size to 40

  posX = 80;
  posY = 30;//change the position y to 30
  randomSeed(actRandomSeed);

  // ------ draw two types of ellipses ------  
  for (int i = 0; i < joinedText.length(); i++) {
    // again, find the index of the current letter in the alphabet 
    String s = str(joinedText.charAt(i)).toUpperCase();
    char uppercaseChar = s.charAt(0);
    int index = alphabet.indexOf(uppercaseChar);
    if (index < 0) continue;

    // ------ calculate parameters ------
    float charAlpha = 10;
    if (drawAlpha) charAlpha = counters[index];

    float my = map(mouseY-10,height,10, 0,1);//change the mouseY position to 10
    my = constrain(my, 0, 1);
    float charSize = counters[index] * my; 

    float mx = map(mouseX, 10,height-10, 0,1);//change the mouseX position to 10 and height to -10
    mx = constrain(mx, 0, 1);
    float lineLength = charSize;
    float lineAngle = random(-PI, PI) * mx - HALF_PI;
    float newPosX = lineLength * cos(lineAngle);
    float newPosY = lineLength * sin(lineAngle);

    // ------ draw elements ------
    pushMatrix();
    translate(posX, posY);
    stroke(220, 73, 51, charAlpha);
    fill(220, 73, 51);
    if (drawEllipses2) ellipse(3, 3, newPosX*2, newPosY);//change the ellipse2 position to 3,3
    noStroke();
    fill(52, 10, 101, charAlpha);
    if (drawEllipses) ellipse(0, 0, newPosX, newPosY*2);
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
  if (key == '2') drawEllipses2 = !drawEllipses2;
  if (key == '3') drawEllipses = !drawEllipses;
  if (key == '4') drawText = !drawText;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}






















