// i reworked for M_1_5_02_TOOL.pde
// Agent.pde, GUI.pde
//the background colour changes in every single seconds.
//Bubbles rising up to the top instead of lines
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
Agent[] agents = new Agent[100000]; // create more ... to fit max slider agentsCount
int agentsCount = 6; // less agentsCount appear on the screen, turns out to be few bubble popping up to the top
float noiseScale = 30, noiseStrength = 10; 
float overlayAlpha = 40, agentsAlpha = 90, strokeWidth = 10;
int drawMode = 1;

// ------ ControlP5 ------
ControlP5 controlP5;
boolean showGUI = false;
Slider[] sliders;


void setup(){
 
  size(1080,700,P2D);//change to smaller size
 
  smooth();

  for(int i=0; i<agents.length; i++) {
    agents[i] = new Agent();
  }

  setupGUI();
}


void draw(){
  fill(0, overlayAlpha);
  background(random(100,255), random(100,255),random(100,255));//coluor flashing background

  stroke(90, agentsAlpha); //draw agents and add the stroke to 90
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
    int newNoiseSeed = (int) random(100);
    println("newNoiseSeed: "+newNoiseSeed);
    noiseSeed(newNoiseSeed);
  }
  if (key == DELETE || key == BACKSPACE) background(255);
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}








