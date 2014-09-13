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

public class Space3D_2 extends PApplet {

float camX;
float camY;

public int screenX(double x) //scaling of x
{
  return (int)((x*8));
}

public int screenY(double y) //scaling of y
{
  return (int)(-1*(y*8));
}

public int screenZ(double z) //scaling of z
{
  return (int)((z*8));
}


public void setup() {
  size(500, 500, P3D);
  fill(204);
  smooth();
  
  camX=-90;
  camY=-90;
}

public void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  
  camera(camX+30, camY+0, 220.0f, // eyeX, eyeY, eyeZ
  0.0f, 0.0f, 0.0f, // centerX, centerY, centerZ
  camX, camY, camY); // upX, upY, upZ
  /*
  //30 0 220
  camera(mouseX, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
    */  
    
  line(screenX(-20), screenY(0), screenZ(0),
     screenX(20), screenY(0), screenZ(0));
  line(screenX(0), screenY(-20), screenZ(0),
     screenX(0), screenY(20), screenZ(0));
  line(screenX(0), screenY(0), screenZ(-20),
     screenX(0), screenY(0), screenZ(20));
  
 
  stroke(55,255,25);  
  for(int i=-10; i<11; i++)
  {
  line(screenX(-10), screenY(i), 0, screenX(10), screenY(i), 0);
  line(screenX(i), screenY(-10), 0, screenX(i), screenY(10), 0);
  
  line(screenX(-10), screenY(0), screenZ(i),
  screenX(10), screenY(0), screenZ(i));
  line(screenX(0), screenY(-10), screenZ(i),
  screenX(0), screenY(10), screenZ(i));
  
  }
  
  camX=camX+1;
  camY=camY+0.5f;
  if(camX>90)
    camX=-90;
  if(camY>90)
    camY=-90;
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "Space3D_2" });
  }
}
