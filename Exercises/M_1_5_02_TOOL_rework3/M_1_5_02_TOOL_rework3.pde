// i reworked for M_1_5_02_TOOL.pde
// Agent.pde, GUI.pde
// Dark background then mouse pressed, 3 shapes appeal and shown an orange colour background
//see through the lines run inside the 3 orange colour shapes

/**
 * noise values (noise 2d) are used to animate a bunch of agents.
 * 
 * KEYS
 * m                   : toogle menu open/close
 * 1-2                 : switch noise mode
 * space               : new noise seed
 * backspace           : clear screen
 * s                   : save png
 */

import controlP5.*;
import java.util.Calendar;


// ------ agents ------
Agent[] agents = new Agent[10000]; // create more ... to fit max slider agentsCount
int agentsCount = 4000;
float noiseScale = 300, noiseStrength = 10; 
float overlayAlpha = 10, agentsAlpha = 90, strokeWidth = 0.3;
int drawMode = 1;

// ------ ControlP5 ------
ControlP5 controlP5;
boolean showGUI = false;
Slider[] sliders;


void setup(){
  size(1280,800,P2D);//change to bigger size 1280,800
  background(0);//black colour background
  smooth();

  for(int i=0; i<agents.length; i++) {
    agents[i] = new Agent();
  }

  setupGUI();
}


void draw(){
  fill(0, overlayAlpha);//black colour background

  noStroke();
  if (mousePressed == true) {
  fill(250,100,20); } else { //pressed to be orange colour
     fill(10); }//dark gray colour for the shapes
  rect(60,210,350,350); //left hand rectangle
  ellipse(645,400,350,350);//ellipse
  rect(880,210,350,350); //right hand rectangle

  stroke(0, agentsAlpha);
  //draw agents
  if (drawMode == 1) {
    for(int i=0; i<agentsCount; i++) agents[i].update1();
  } 
  else {
    for(int i=0; i<agentsCount; i++) agents[i].update2();
  }
  drawGUI();
}


void keyReleased(){
  if(key=='m' || key=='M') {
    showGUI = controlP5.group("menu").isOpen();
    showGUI = !showGUI;
  }
  if (showGUI) controlP5.group("menu").open();
  else controlP5.group("menu").close();

  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key=='s' || key=='S') saveFrame(timestamp()+".png");
  if (key == ' ') {
    int newNoiseSeed = (int) random(100000);
    println("newNoiseSeed: "+newNoiseSeed);
    noiseSeed(newNoiseSeed);
  }
  if (key == DELETE || key == BACKSPACE) background(255);
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}








