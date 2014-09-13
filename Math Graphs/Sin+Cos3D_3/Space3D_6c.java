import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class Space3D_6c extends PApplet {

float x;
float x2;
float y;
float y2;
float z;
float z2;
float camX;
float camY;


public void setup() {
  size(500, 500, P3D);
  fill(204);
  smooth();
  x=-10.0f;
  y=-10.0f;
  x2=0;
  y2=0;
  z=0;
  z2=0;
  
  camX=-50;
  camY=-50;
}

public void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  //30 0 220
  camera(camX+30, camY+0, 20.0f, // eyeX, eyeY, eyeZ
  0.0f, 0.0f, 0.0f, // centerX, centerY, centerZ
  camX, camY, camY); // upX, upY, upZ



  line(-20, 0, 0,
     20, 0, 0);
  line(0, -20, 0,
     0, 20, 0);
  line(0, 0, -20,
     0, 0, 20);
  
 
  stroke(55,255,25); 

  for(y=-10.27f; y<=10.9f; y=y+0.27f)
  {
    for(x=-10.27f; x<=10.9f; x=x+0.27f)
    {

      x2=x+1;
      y2=y+1;

      z=sin((float)x) + cos((float)y);
      z2=sin((float)x2) + cos((float)y2);

      line((float)x, (float)y, (float)z, 
      (float)x2, (float)y2, (float)z2);
    }
  }
  camX=camX+1;
  camY=camY+3;
  if(camX>50)
    camX=-50;
  if(camY>50)
    camY=-50;
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "Space3D_6c" });
  }
}
