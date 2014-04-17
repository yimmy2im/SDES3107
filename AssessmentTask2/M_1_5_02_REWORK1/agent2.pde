// M_1_5_02_TOOL_REWORK1.pde

class Agent {
  PVector p, pOld;
  float stepSize, angle;
  boolean isOutside = false;

  Agent() {
    p = new PVector(random(width),random(height));
    pOld = new PVector(p.x,p.y);
    stepSize = random(1,12);
  }

  void update1(){
    angle = noise(p.x*1,p.y*1) * noiseStrength*2;

    p.x += cos(angle) * stepSize*2;
    p.y += sin(angle) * stepSize*2;

    if(p.x<-20) isOutside = true;
    else if(p.x>width+20) isOutside = true;
    else if(p.y<-10) isOutside = true;
    else if(p.y>height+20) isOutside = true;

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

  void update2(){
    angle = noise(p.x/noiseScale,p.y/noiseScale) * 24;
    angle = (angle - int(angle)) * noiseStrength;

    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;

    if(p.x<-10) isOutside = true;
    else if(p.x>width+10) isOutside = true;
    else if(p.y<-10) isOutside = true;
    else if(p.y>height+10) isOutside = true;

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



