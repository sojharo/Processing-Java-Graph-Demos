double x;
double x2;
double y1;
double y2;
double t;
PFont fontA;

public int screenX(double x) //scaling of x
{
  return (int)(250+(x*80));
}

public int screenY(double y) //scaling of y
{
  return (int)(250-(y*80));
}

public int screenX(int x) //scaling of x
{
  return 250+(x*80);
}

public int screenY(int y) //scaling of y
{
  return 250-(y*80);
}

void setup()
{
  size(500,500);
  smooth();
  x=0;
  x2=0;
  y1=0;
  y2=0;
  t=-33;
  fontA=loadFont("ArialMT-12.vlw");
}


void draw()
 {
 fill(249,245,34);
 rect(0, 0, 500, 500);
 stroke(25,24,254,50);
 for(int i=-3; i<4; i++)
 line(screenX(i), -500, screenX(i), 500);
 for(int i=-3; i<4; i++)
 line(-500, screenY(i), 500, screenY(i));
 noStroke();
 
 for(double tt=-33.01; tt<33.99; tt++)
 {
 x=Math.sin(tt);
 x2=Math.sin(tt+0.1);
 y1=Math.sin(tt)*Math.sin(tt);
 y2=Math.sin(tt+0.1)*Math.sin(tt+0.1);
 
 
 stroke(206,199,248);
 strokeWeight(4);
 
 line(screenX(x), screenY(y1), screenX(x2), screenY(y2));
 strokeWeight(1);
 }
 t=t+0.01;
 if(t>33)
 t=-33;
 x=Math.sin(t);
 x2=Math.sin(t+0.01);
 y1=Math.sin(t)*Math.sin(t);
 y2=Math.sin(t+0.01)*Math.sin(t+0.01);
 
 
 stroke(129,109,239);

 strokeWeight(1);
 
 double varx=x-10;
 double lny1=((y2-y1)/(x2-x))*(varx-x2)+y2;
 double lny2=((y2-y1)/(x2-x))*(varx+20-x2)+y2;
 line(screenX(varx), screenY(lny1), screenX(varx+20), screenY(lny2));

 
  fill(5);
  textFont(fontA, 16);
  text("Parametric Equation: (with no orientation)", 25, 23);
  text("Parameter (T) = " + Float.toString((float)t), 25, 25+20);
  text("X = " + Float.toString((float)x), 25, 25+40);
  text("Y = " + Float.toString((float)y1), 25, 25+60);
  text("Instantaneous rate of change (Derivative) = " 
  + Float.toString((float)((y2-y1)/(x2-x))), 25, 25+80);
  strokeWeight(1);
 
 }
 
