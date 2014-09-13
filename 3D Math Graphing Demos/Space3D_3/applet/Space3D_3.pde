float camX;
float camY;

public int screenX(double x) //scaling of x
{
  return (int)((x*14));
}

public int screenY(double y) //scaling of y
{
  return (int)(-1*(y*14));
}

public int screenZ(double z) //scaling of z
{
  return (int)((z*14));
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
  
  camera(camX+30, camY+0, 220.0, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  camX, camY, camY); // upX, upY, upZ
  /*
  //30 0 220
  camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
     */   
    
  line(screenX(-10), screenY(0), screenZ(0),
     screenX(10), screenY(0), screenZ(0));
  line(screenX(0), screenY(-10), screenZ(0),
     screenX(0), screenY(10), screenZ(0));
  line(screenX(0), screenY(0), screenZ(-10),
     screenX(0), screenY(0), screenZ(10));
  
 
  stroke(55,255,25); 
  for(int i=-4; i<5; i++)
  {
    for(int j=-4; j<5; j++)
    {
     line(screenX(-4), screenY(i), screenZ(j),
     screenX(4), screenY(i), screenZ(j));
     
     line(screenX(i), screenY(-4), screenZ(j),
     screenX(i), screenY(4), screenZ(j));
    }
  
  }
  
  camX=camX+1;
  camY=camY+0.9;
  if(camX>90)
    camX=-90;
  if(camY>90)
    camY=-90;
}
