//Simple beat detect to trigger black or white projection, aka a hackneyed clapper light for class.

import ddf.minim.*;
import ddf.minim.analysis.*;
int isOn = 0;
boolean isItOn = false;

Minim minim;
AudioInput in;

BeatDetect beat;

void setup()
{
  size(displayWidth, displayHeight);

  minim = new Minim(this);
  in = minim.getLineIn();
  
  // uncomment this line to *hear* what is being monitored, in addition to seeing it
  //in.enableMonitoring();
  
  beat = new BeatDetect();
  beat.setSensitivity(100);
}

void draw()
{
  background(isOn);
  stroke(255);
  
   beat.detect(in.mix);
  // On New Beat  
    if ( beat.isOnset() && isItOn == false) {      
      println("hi");
      isItOn = true;
    }
    else if(beat.isOnset() && isItOn == true){
      isItOn = false;
    }
    
    if (isItOn == false){
      isOn = 0;
    }
    else {
      isOn = 255;
    }
  }

  
