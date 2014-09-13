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

public class forTangentLineInParabola extends PApplet {

double x;
double x2;
double y1;
double y2;



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
  x=-7;
  x2=0;
  y1=0;
  y2=0;

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
  
  for(double x=-7.01f; x<9.99f; x++)
  {
    x2=x+1;
    
    
    y1=(x*x*x)+(6*x*x)+(3*x)+1;
    y2=(x2*x2*x2)+(6*x2*x2)+(3*x2)+1;
    
    

    stroke(1);
    strokeWeight(2);
    
    line(screenX(x), screenY(y1), screenX(x2), screenY(y2));
    
    
  }
 
  x=x+0.03f;
 
  
  x2=x+0.01f;
  

  if(x>7)
    x=-7;
  
    
  y1=(x*x*x)+(6*x*x)+(3*x)+1;  
  
  
  
  y2=(x2*x2*x2)+(6*x2*x2)+(3*x2)+1;  
  
 
  
  stroke(129,109,239);
  
  strokeWeight(1);
  
  double varx=x-10;
  double lny1=((y2-y1)/(x2-x))*(varx-x2)+y2;
  double lny2=((y2-y1)/(x2-x))*(varx+20-x2)+y2;
  line(screenX(varx), screenY(lny1), screenX(varx+20), screenY(lny2));
  
 
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "forTangentLineInParabola" });
  }
}
