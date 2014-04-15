//I reworked for  M_1_5_02_TOOL.pde
// Agent.pde, GUI.pde
// 
//Change the lines to be little fishes and swim from the top to the bottom
//add three ellispes go with the cursor
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
int agentsCount = 1000;//less agentscount
float noiseScale = 300, noiseStrength = 10; //increase noiseScale
float overlayAlpha = 70, agentsAlpha = 90, strokeWidth = 0.9;//change the strokewidth
int drawMode = 1;

// ------ ControlP5 ------
ControlP5 controlP5;
boolean showGUI = false;
Slider[] sliders;


void setup(){
  size(1080,700,P2D);//smaller screen
  smooth();

  for(int i=0; i<agents.length; i++) {
    agents[i] = new Agent();
  }

  setupGUI();
}


void draw(){
  fill(30,150,150, overlayAlpha);//change the background to aquablue
  noStroke();

  stroke(0, agentsAlpha);//no stroke
  //draw agents
  if (drawMode == 1) {
    for(int i=0; i<agentsCount; i++) agents[i].update1();
  } 
  else {
    for(int i=0; i<agentsCount; i++) agents[i].update2();
  }
  drawGUI();
  
  rect(0,0,width,height);
   fill(50,100,300);
   ellipse(mouseX,mouseY,15,15);//add three ellipse go with the cursor
   fill(25,140,100);
   ellipse(mouseX,mouseY *2,10,10);
   fill(205,140,300);
   ellipse(mouseX*2,mouseY,20,20);
   
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








