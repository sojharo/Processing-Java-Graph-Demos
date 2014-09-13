float x;
float x2;
float y;
float y2;
float z;
float z2;
float camX;
float camY;

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


  for(y=-10.0; y<=10.9; y=y+1)
  {
    for(x=-10.0; x<=10.9; x=x+1)
    {

      x2=x+1;
      y2=y+1;

      z=sin(x) + cos(y);
      z2=sin(x2) + cos(y2);

      rect(x, y, z, 1,1,1);
      //line((float)x, (float)y, (float)z, 
      //(float)x2, (float)y2, (float)z2);
    }
  }
  camX=camX+1;
  camY=camY+3;
  if(camX>50)
    camX=-50;
  if(camY>50)
    camY=-50;
}

