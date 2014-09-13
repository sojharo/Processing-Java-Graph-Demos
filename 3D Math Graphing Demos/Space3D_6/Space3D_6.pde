double x;
double x2;
double y;
double y2;
double z;
double z2;


float camX;
float camY;




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
  for(y=-10.35; y<=10; y=y+0.35)
  {
    for(x=-10.35; x<=10; x=x+0.35)
    {
      
      x2=x+1;
      y2=y+1;
    
     z=sin((float)x) + cos((float)y);
     z2=sin((float)x2) + cos((float)y2);
     
     
     line((float)x, (float)y, (float)z, 
     (float)x2, (float)y2, (float)z2);
    }
  
  }

  camX=camX+1;
  camY=camY+1;
  if(camX>90)
    camX=-90;
  if(camY>90)
    camY=-90;
}
