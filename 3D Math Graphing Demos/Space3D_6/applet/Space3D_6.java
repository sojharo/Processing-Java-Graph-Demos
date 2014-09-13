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

public class Space3D_6 extends PApplet {

double x;
double x2;
double y;
double y2;
double z;
double z2;


float camX;
float camY;




public void setup() {
  size(500, 500, P3D);
  fill(204);
  smooth();
  x=-10;
  y=-10;
  x2=0;
  y2=0;
  z=0;
  z2=0;
  

  
  camX=-90;
  camY=-90;
}

public void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  
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
  for(y=-10.35f; y<=10; y=y+0.35f)
  {
    for(x=-10.35f; x<=10; x=x+0.35f)
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
  camY=camY+1;
  if(camX>90)
    camX=-90;
  if(camY>90)
    camY=-90;
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "Space3D_6" });
  }
}
