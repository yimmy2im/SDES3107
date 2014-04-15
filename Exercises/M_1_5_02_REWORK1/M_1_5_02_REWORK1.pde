// I rework M_1_5_02_TOOL.pde
//add a white rectangle in the centre
//change the size of the screen to 1080x720
//change the stroke to 3
//also the gui background to neon green
//stepSize to 40

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


// ------ agent2s ------
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
  size(1080,700,P2D);//change to smaller size
  smooth();

  for(int i=0; i<agents.length; i++) {
    agents[i] = new Agent();
  }

  setupGUI();
}


void draw(){
  fill(255, overlayAlpha);//change the background to aquablue
  noStroke();
  rect(30,30,1020,640);//add the rectangle 

  stroke(3, agentsAlpha);//set the stroke to 3
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








