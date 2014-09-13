double x;
double x2;
double y;
double y2;
double z;
double z2;

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
  
  camX=-90;
  camY=-90;
  
}

void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
/*  //30 0 220
  camera(mouseX, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
         */
  camera(camX+30, camY+0, 220.0, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  camX, camY, camY); // upX, upY, upZ
  
  line(screenX(-10), screenY(0), screenZ(0),
     screenX(10), screenY(0), screenZ(0));
  line(screenX(0), screenY(-10), screenZ(0),
     screenX(0), screenY(10), screenZ(0));
  line(screenX(0), screenY(0), screenZ(-10),
     screenX(0), screenY(0), screenZ(10));
   stroke(55,255,25);       
  for(x=-10.0; x<=10.0; x++)
  {
    for(y=-10.0; y<=10.0; y++)
    {
      
      x2=x+1;
      y2=y+1;
    
      z=x;
      z2=x2;
     
     line(screenX(x), screenY(y), screenZ(z),
     screenX(x2), screenY(y2), screenZ(z2));
     
     //line(screenX(i), screenY(-2), screenZ(j),
     //screenX(i), screenY(2), screenZ(j));
    }
  
  }
  camX=camX+1;
  camY=camY+0.5;
  if(camX>90)
    camX=-90;
  if(camY>90)
    camY=-90;
}
