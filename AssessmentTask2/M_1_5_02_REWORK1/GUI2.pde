// i rework for M_1_5_02_TOOL.pde

void setupGUI(){
  color activeColor = color(200,330,64);//change to neon green
  controlP5 = new ControlP5(this);
  //controlP5.setAutoDraw(false);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(255));//change to white background
  controlP5.setColorForeground(color(50));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu",15,25,35);
  ctrl.setColorLabel(color(0));//change the menu's word to black
  ctrl.close();

  sliders = new Slider[10];

  int left = 0;
  int top = 5;
  int len = 300;

  int si = 0;
  int posY = 0;

  sliders[si++] = controlP5.addSlider("agentsCount",1,10000,left,top+posY+0,len,15);
  posY += 30;

  sliders[si++] = controlP5.addSlider("noiseScale",1,1000,left,top+posY+0,len,15);
  sliders[si++] = controlP5.addSlider("noiseStrength",0,100,left,top+posY+20,len,15);
  posY += 50;

  sliders[si++] = controlP5.addSlider("strokeWidth",0,10,left,top+posY+0,len,15);
  posY += 30;

  sliders[si++] = controlP5.addSlider("agentsAlpha",0,255,left,top+posY+0,len,15);
  sliders[si++] = controlP5.addSlider("overlayAlpha",0,255,left,top+posY+20,len,15);

  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].captionLabel().toUpperCase(true);
    sliders[i].captionLabel().style().padding(4,3,3,3);
    sliders[i].captionLabel().style().marginTop = -4;
    sliders[i].captionLabel().style().marginLeft = 0;
    sliders[i].captionLabel().style().marginRight = -14;
    sliders[i].captionLabel().setColorBackground(0x99ffffff);
  }

}

void drawGUI(){
  controlP5.show();
  controlP5.draw();
}




