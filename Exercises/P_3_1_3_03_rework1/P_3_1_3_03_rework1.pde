// I reworked P_3_1_3_03.pde

/**
 * analysing and sorting the letters of a text (Bruno Mars' song -Just the way you are) 
 * drawing the letters frequency with lines and ellipses
 * Bruno mars is singing his song with you while you are moving your mouse
 
 
 * MOUSE
 * position x          : random angle
 * position y          : line length, size of ellipses, tracking
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
int tracking = 2;
int maxCount = 10000;//max count of the ellipse and lines
    

boolean drawAlpha = true;
boolean drawLines = true;
boolean drawEllipses = true;
boolean drawText = false;

PImage alphaImg;//load transpency bg image-bruno_head


void setup() {
  size(1100, 700);//set a smaller screen
  lines = loadStrings("bruno_mars.txt");//change the text file to bruno mars lyrics
  joinedText = join(lines, " ");

  font = loadFont("HillHouse-50.vlw");//Create and load new font "HillHouse"
  alphaImg = loadImage("bruno_head.png");//load image for the cursor
  countCharacters();
  
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  
  colorMode(RGB,360,100,100,100);//change the colour mode to RGB
  textFont(font);
  background(255);
  noStroke();
  smooth();
  textSize(40);//change the font size to 40
  
   int ix = mouseX - alphaImg.width/2;  //load the img to cursor
   int iy = mouseY - alphaImg.height/2;
   image(alphaImg,ix, iy);
 
  
  posX = 90;
  posY = 300;


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
    stroke(200, 23, 21, charAlpha);//change the stroke to red
    strokeWeight(5);//add strokeweight for the lines and ellipse
    if (drawLines) line(0,0, mouseX/10, newPosY);// lines move when mouseX move
    fill(52, 100, 71, charAlpha);//change the ellipse colour to green
    if (drawEllipses) ellipse(0, 0, mouseX/10,mouseY/10);//size changes while you move the mouse around
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


    for (int i = 0; i < joinedText.length(); i++) {
      // again, find the index of the current letter in the alphabet 
      String s = str(joinedText.charAt(i)).toUpperCase();
      char uppercaseChar = s.charAt(0);
      int index = alphabet.indexOf(uppercaseChar);
      if (index < 0) continue;

      // ------ calculate parameters ------
      float charAlpha = 100;
      if (drawAlpha) charAlpha = counters[index];

      float my = map(mouseY/2, 50,height-50, 0,1);//depends on how you move the cursor
      my = constrain(my, 0, 1);
      float charSize = counters[index] * my * 9;

      float mx = map(mouseX/2, 50,width-50, 0,1);//depends on how you move the cursor
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























