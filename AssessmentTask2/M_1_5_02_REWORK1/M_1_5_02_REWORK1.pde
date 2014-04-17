// I rework M_1_5_02_TOOL.pde
//change the strokeWidth to 1 so the lines look like bacteria under microscope

/**
 * noise values (noise 2d) are used to animate a bunch of agents.
 * 
 * KEYS
 * `/~                 : toogle menu open/close
 * 1-2                 : switch noise mode
 * space               : new noise seed
 * backspace           : clear screen
 * s                   : save png
 */

import controlP5.*;
import java.util.Calendar;


// ------ agent2s ------
Agent[] agents = new Agent[100000]; // create more ... to fit max slider agentsCount
int agentsCount = 400;
float noiseScale = 30, noiseStrength = 10; 
float overlayAlpha = 100, agentsAlpha = 90, strokeWidth = 1;//heavy stroke
int drawMode = 1;

// ------ ControlP5 ------
ControlP5 controlP5;
boolean showGUI = false;
Slider[] sliders;
PImage img;//load the wallpaper of bacteria

void setup(){
  

  size(794,794,P2D);//change to smaller size
  
  smooth();

  for(int i=0; i<agents.length; i++) {
    agents[i] = new Agent();
  }

  setupGUI();
}


void draw(){
  noStroke();
 img = loadImage("bacteria.jpeg");
 image(img, 0, 0);

  stroke(1, agentsAlpha);//set the stroke to 1
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
  if(key=='`' || key=='~') { //change to "`","`"
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








