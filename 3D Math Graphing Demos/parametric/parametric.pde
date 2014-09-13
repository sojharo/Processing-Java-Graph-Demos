float x;
float x2;
float y;
float y2;
float z;
float z2;
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
  x=-10.0;
  y=-10.0;
  x2=0;
  y2=0;
  z=0;
  z2=0;

  camX=-50;
  camY=-50;
}

void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  //30 0 220
  camera(camX+30, camY+0, 20.0, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  camX, camY, camY); // upX, upY, upZ
  
  line(-20, 0, 0,
     20, 0, 0);
  line(0, -20, 0,
     0, 20, 0);
  line(0, 0, -20,
     0, 0, 20);
  
 
  stroke(55,255,25);
  
  
/*
  for(y=-10.27; y<=10.9; y=y+0.50)
  {
    for(x=-10.27; x<=10.9; x=x+0.50)
    {

      x2=x+1;
      y2=y+1;

      z=sin((float)x);// * sin((float)y);
      z2=sin((float)x2);// * sin((float)y2);

      line((float)x, (float)y, (float)z, 
      (float)x2, (float)y2, (float)z2);
    }
  }
*/
  
  for(double t=-10.1; t<=10.9; t=t+0.1)
   {
   double t2=t+1;
   
   x=cos((float)t);    
   y=sin((float)t);
   z=(float)(t);
   
   x2=cos((float)t2);    
   y2=sin((float)t2);
   z2=(float)(t2);
   
   line((float)x, (float)y, (float)z, 
   (float)x2, (float)y2, (float)z2);
   
   
   }
  camX=camX+0.20;
  camY=camY+0.20;
  if(camX>50)
    camX=-50;
  if(camY>50)
    camY=-20;
}

