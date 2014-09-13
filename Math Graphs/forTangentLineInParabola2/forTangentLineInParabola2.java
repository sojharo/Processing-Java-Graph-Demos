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

public class forTangentLineInParabola2 extends PApplet {


double py1;
double py2;
double px;
double px2;


public int screenX(double x) //scaling of x
{
  return (int)(250+(x*8));
}

public int screenY(double y) //scaling of y
{
  return (int)(250-(y*8));
}

public int screenX(int x) //scaling of x
{
  return 250+(x*8);
}

public int screenY(int y) //scaling of y
{
  return 250-(y*8);
}

public void setup()
{
  size(500,500);
  smooth();

  py1=0;
  py2=0;
  px=-16;
  px2=0;
}

public void draw()
{
  fill(249,245,34);
  rect(0, 0, 500, 500);
  stroke(25,24,254,50);
  for(int i=-33; i<33; i++)
    line(screenX(i), -500, screenX(i), 500);
  for(int i=-33; i<33; i++)
    line(-500, screenY(i), 500, screenY(i));
  noStroke();
  
  for(double px=-16.01f; px<9.99f; px++)
  {
    px2=px+1;
    
    
    py1=(0.4f*px*px)+(2*px)-8;
    py2=(0.4f*px2*px2)+(2*px2)-8;
    
    stroke(141,85,244);
    
    line(screenX(px), screenY(py1), screenX(px2), screenY(py2));
    
    strokeWeight(1);
  }
 
  px=px+0.05f;

  px2=px+0.01f;

  if(px>9)
    px=-16;
  
  py1=(0.4f*px*px)+(2*px)-8;
  
  py2=(0.4f*px2*px2)+(2*px2)-8;
  
  strokeWeight(1);
 
  stroke(1);
  double pvarx=px-10;
  double plny1=((py2-py1)/(px2-px))*(pvarx-px2)+py2;
  double plny2=((py2-py1)/(px2-px))*(pvarx+20-px2)+py2;
  line(screenX(pvarx), screenY(plny1), screenX(pvarx+20), screenY(plny2));
    
 
  
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "forTangentLineInParabola2" });
  }
}
