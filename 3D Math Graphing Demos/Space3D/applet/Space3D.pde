float camX;
float camY;

public int screenX(double x) //scaling of x
{
  return (int)((x*8));
}

public int screenZ(double z) //scaling of z
{
  return (int)((z*8));
}

public int screenY(double y) //scaling of y
{
  return (int)(-1*(y*8));
}



void setup() {
  size(500, 500, P3D);
  fill(204);
  smooth();
  
  camX=-90;
  camY=-90;
}

void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  //30 0 220
  camera(camX+30, camY+0, camX+180.0, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  camX, camY, camY); // upX, upY, upZ
  
  line(screenX(-12), screenY(0), screenZ(0),
     screenX(12), screenY(0), screenZ(0));
  line(screenX(0), screenY(-12), screenZ(0),
     screenX(0), screenY(12), screenZ(0));
  line(screenX(0), screenY(0), screenZ(-12),
     screenX(0), screenY(0), screenZ(12));
  
 
  stroke(55,255,25);
  
         
  for(int i=-10; i<11; i++)
  {
  line(screenX(-10), screenY(i), 0, screenX(10), screenY(i), 0);
  line(screenX(i), screenY(-10), 0, screenX(i), screenY(10), 0);
  }
  
  camX=camX+1;
  camY=camY+0.5;
  if(camX>90)
    camX=-90;
  if(camY>90)
    camY=-90;
}
