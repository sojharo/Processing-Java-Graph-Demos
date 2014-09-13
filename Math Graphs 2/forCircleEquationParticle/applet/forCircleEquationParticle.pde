double x;
double nx;
double nx2;
double x2;
double y1;
double y2;
double radius;
PFont fontA;

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

void setup()
{
  size(500,500);
  smooth();
  radius=900;
  x=-30;
  nx=30;
  nx2=0;
  x2=0;
  y1=0;
  y2=0;
//  fontA=loadFont("ArialMT-12.vlw");
}

void draw()
{
  fill(249,245,34);
  rect(0, 0, 500, 500);
  stroke(25,24,254,50);
  for(int i=-33; i<33; i++)
    line(screenX(i), -500, screenX(i), 500);
  for(int i=-33; i<33; i++)
    line(-500, screenY(i), 500, screenY(i));
  noStroke();
  
  for(double x=-30; x<30; x++)
  {
    double x2=x+1;

    double y1=Math.sqrt(radius-(x*x));
    double y2=Math.sqrt(radius-(x2*x2));

    double ny1=-Math.sqrt(radius-(x*x));
    double ny2=-Math.sqrt(radius-(x2*x2));

    stroke(1);
    strokeWeight(2);
    
    line(screenX(x), screenY(y1), screenX(x2), screenY(y2));
    
    line(screenX(x), screenY(ny1), screenX(x2), screenY(ny2));
    strokeWeight(1);
  }
  
  x=x+0.1;
  nx=nx-0.1;
  
  x2=x+1;
  nx2=nx-1;
  
  if(x>30)
    x=-30;
  if(nx<-30)
    nx=30;
  
  y1=Math.sqrt(radius-(x*x));
  y2=Math.sqrt(radius-(x2*x2));

  double ny1=-Math.sqrt(radius-(nx*nx));
  double ny2=-Math.sqrt(radius-(nx2*nx2));
  
  stroke(129,109,239);
  strokeWeight(18);
  
  point(screenX(x), screenY(y1));
  
  point(screenX(nx), screenY(ny1));
  
  //line(screenX(x), screenY(y1), screenX(x2), screenY(y2));
    
  //line(screenX(nx), screenY(ny1), screenX(nx2), screenY(ny2));
    
  strokeWeight(1);
  
  fill(5);
  //textFont(fontA, 16);
  text("Circle (One Particle) A Mistake is here", 35, 173);
  text("X = " + Float.toString((float)x), 35, 173+20);
  text("Y = " + Float.toString((float)y1), 35, 173+40);
  text("Instantaneous rate of change (Derivative) = " 
  + Float.toString((float)((y2-y1)/(x2-x))), 35, 173+60);
  strokeWeight(1);
  
}

