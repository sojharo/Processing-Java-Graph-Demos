double x;
double x2;
double y1;
double y2;
double py1;
double py2;
double px;
double px2;
PFont fontA;

public int screenX(double x) //scaling of x
{
  return (int)(250+(x*12));
}

public int screenY(double y) //scaling of y
{
  return (int)(250-(y*12));
}

public int screenX(int x) //scaling of x
{
  return 250+(x*12);
}

public int screenY(int y) //scaling of y
{
  return 250-(y*12);
}

void setup()
{
  size(500,500);
  smooth();
  x=-22;
  x2=0;
  y1=0;
  y2=0;
  py1=0;
  py2=0;
  px=-22;
  px2=0;
  fontA=loadFont("ArialMT-12.vlw");
}

void draw()
{
  fill(249,245,34);
  rect(0, 0, 500, 500);
  stroke(25,24,254,50);
  for(int i=-22; i<22; i++)
    line(screenX(i), -500, screenX(i), 500);
  for(int i=-22; i<22; i++)
    line(-500, screenY(i), 500, screenY(i));
  noStroke();
  
  for(double x=-22, px=-22; px<22; x++, px++)
  {
    x2=x+1;
    px2=px+1;
 
    
    y1=Math.sin(x);
    y2=Math.sin(x2);
    
    py1=Math.cos(x);
    py2=Math.cos(x2);

    stroke(1);
    strokeWeight(2);
    
    line(screenX(x), screenY(y1), screenX(x2), screenY(y2));
    
    stroke(141,85,244);
    
    line(screenX(px), screenY(py1), screenX(px2), screenY(py2));
    
    strokeWeight(1);
  }
 
  x=x+0.05;
  px=px+0.05;

  if(x>22)
    x=-22;
  if(px>22)
    px=-22;  
  
  x2=x+0.01;  
  y1=Math.sin(x); 
  y2=Math.sin(x2); 
  
  px2=px+0.01;
  py1=Math.cos(px);
  py2=Math.cos(px2);
  
  stroke(129,109,239);
  
  strokeWeight(8);
  
  point(screenX(x), screenY(y1));
/*  
  double varx=x-10;
  double lny1=((y2-y1)/(x2-x))*(varx-x2)+y2;
  double lny2=((y2-y1)/(x2-x))*(varx+20-x2)+y2;
  line(screenX(varx), screenY(lny1), screenX(varx+20), screenY(lny2));
  */
  stroke(1);
  point(screenX(px), screenY(py1));
  
  fill(5);
  textFont(fontA, 16);
  text("Sine Function:", 25, 23);
  text("X = " + Float.toString((float)x), 25, 25+20);
  text("Y = " + Float.toString((float)y1), 25, 25+40);
  text("Instantaneous rate of change (Derivative) = " 
  + Float.toString((float)((y2-y1)/(x2-x))), 25, 25+60);
  strokeWeight(1);
 
  text("Cosine Function:", 25, 320);
  text("X = " + Float.toString((float)x), 25, 320+20);
  text("Y = " + Float.toString((float)y1), 25, 320+40);
  text("Instantaneous rate of change (Derivative) = " 
  + Float.toString((float)((py2-py1)/(px2-px))), 25, 320+60);
  strokeWeight(1);
  
}

