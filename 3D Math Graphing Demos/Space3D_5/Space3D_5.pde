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


void setup() {
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

void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  //30 0 220
  camera(mouseX, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
     
     
  
  line(screenX(-20), screenY(0), screenZ(0),
     screenX(20), screenY(0), screenZ(0));
  line(screenX(0), screenY(-20), screenZ(0),
     screenX(0), screenY(20), screenZ(0));
  line(screenX(0), screenY(0), screenZ(-20),
     screenX(0), screenY(0), screenZ(20));
  
 
  stroke(55,255,25);    
  for(y=-10.65; y<=10; y=y+0.65)
  {
    for(x=-10.65; x<=10; x=x+0.65)
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
  
  animX=animX+0.65;
  
  if(animX>10.0)
  {
    animX=-10.0;
    animY=animY+0.65;
  }
  
  if(animY>10.0)
    animY=-10.0;
    
  animZ=animX*animX+animY;
  
  point(screenX(animY), screenY(animZ), screenZ(animX));
  
  strokeWeight(2);
}
