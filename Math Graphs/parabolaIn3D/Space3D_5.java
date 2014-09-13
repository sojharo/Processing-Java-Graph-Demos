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

public class Space3D_5 extends PApplet {

double x;
double x2;
double y;
double y2;
double z;
double z2;
double animX;
double animY;
double animZ;

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
  x=-10;
  y=-10;
  x2=0;
  y2=0;
  z=0;
  z2=0;
  
  animX=-10;
  animY=-10;
  animZ=0;
}

public void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  //30 0 220
  camera(mouseX, mouseY, 220.0f, // eyeX, eyeY, eyeZ
         0.0f, 0.0f, 0.0f, // centerX, centerY, centerZ
         0.0f, 1.0f, 0.0f); // upX, upY, upZ
     
     
  
  line(screenX(-20), screenY(0), screenZ(0),
     screenX(20), screenY(0), screenZ(0));
  line(screenX(0), screenY(-20), screenZ(0),
     screenX(0), screenY(20), screenZ(0));
  line(screenX(0), screenY(0), screenZ(-20),
     screenX(0), screenY(0), screenZ(20));
  
 
  stroke(55,255,25);    
  for(y=-10.65f; y<=10; y=y+0.65f)
  {
    for(x=-10.65f; x<=10; x=x+0.65f)
    {
      
      x2=x+1;
      y2=y+1;
    
      z=x*x+y;
      z2=x2*x2+y2;
     
     //In this x-coordinate of screen is y-coordinate
     //and y-coordinate is z-coordinate and x-coordinate
     //is z-coordinate
     line(screenX(y), screenY(z), screenZ(x),
      screenX(y2), screenY(z2), screenZ(x2));
     //line((float)x, (float)y, (float)z, 
     //(float)x2, (float)y2, (float)z2);
    }
  
  }
  
  strokeWeight(8);
  stroke(171,255,79);
  
  animX=animX+0.65f;
  
  if(animX>10.0f)
  {
    animX=-10.0f;
    animY=animY+0.65f;
  }
  
  if(animY>10.0f)
    animY=-10.0f;
    
  animZ=animX*animX+animY;
  
  point(screenX(animY), screenY(animZ), screenZ(animX));
  
  strokeWeight(2);
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "Space3D_5" });
  }
}
