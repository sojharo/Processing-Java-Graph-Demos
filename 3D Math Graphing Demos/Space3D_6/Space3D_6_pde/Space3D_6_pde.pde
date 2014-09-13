float x;
float x2;
float y;
float y2;
float z;
float z2;


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

}

void draw() {
  lights();
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  //30 0 220
  camera(mouseX, mouseY, 10.0, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  0.0, 1.0, 0.0); // upX, upY, upZ

  for(y=-10.27; y<=10.9; y=y+0.27)
  {
    for(x=-10.27; x<=10.9; x=x+0.27)
    {

      x2=x+1;
      y2=y+1;

      z=sin((float)x) + cos((float)y);
      z2=sin((float)x2) + cos((float)y2);

      line((float)x, (float)y, (float)z, 
      (float)x2, (float)y2, (float)z2);
    }
  }

/*
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
*/
}

