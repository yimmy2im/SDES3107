// M_1_5_02_TOOL.pde
// Agent.pde, GUI.pde
// 


class Agent {
  PVector p, pOld;
  float stepSize, angle;
  boolean isOutside = false;

  Agent() {
     p = new PVector(0,20);//no running randomly
    pOld = new PVector(2.1,8.1);//also set the accurate location
    stepSize = random(1);//thinner stepsize
  }

  void update1(){
    angle = noise(p.x/noiseScale,p.y/noiseScale) * noiseStrength;

    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;

    if(p.x<-1) isOutside = true;
    else if(p.x>width+1) isOutside = true;
    else if(p.y<-1) isOutside = true;
    else if(p.y>height+1) isOutside = true;

    if (isOutside) {
      p.x = random(width);
      p.y = random(height);
      pOld.set(p);
    }

    strokeWeight(strokeWidth*stepSize);
    line( pOld.y,pOld.y,p.x,p.y);

    pOld.set(p);

    isOutside = false;
  }

  void update2(){
    angle = noise(p.x/noiseScale,p.y/noiseScale); //angles changes to be more settle

    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;

    if(p.x<-10) isOutside = true;
    else if(p.x>width+1) isOutside = true;
    else if(p.y<-1) isOutside = true;
    else if(p.y>height+1) isOutside = true;

    if (isOutside) {
      p.x = random(width);
      p.y = random(height);
      pOld.set(p);
    }

    strokeWeight(strokeWidth*stepSize);
    line(pOld.x,pOld.y, p.x,p.y);

    pOld.set(p);

    isOutside = false;
  }
}



