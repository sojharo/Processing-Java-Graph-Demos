MyPoint []p=new MyPoint[10];

void setup()
{
  size(800,600);
  for(int i=0; i<p.length; i++)
  {
    p[i]=new MyPoint(0.,0. , random(0,255), random(0,255), random(0,255));
  }
}

void draw()
{
  for(int i=0; i<p.length; i++)
  {
    p[i].plot();
    p[i].move(random(1,10),random(1,10));
  }
}





class MyPoint {
  float x, y, cX, cY, cZ; // members of class

  // Constructor
  public MyPoint(float xin, float yin, float cX, float cY, float cZ){
    x = xin;
    y = yin;
    this.cX=cX;
    this.cY=cY;
    this.cZ=cZ;
  }
  
  //Method1
   public void plot(){
     fill(cX, cY, cZ);
     rect(x,y,5,5);
  }
  
  // Method2
  void move(float xoff, float yoff){
    x = x + xoff;
    y = y + yoff; 
    
    if(x>width)
    x=0;
    
    if(y>height)
    y=0;
  }
}

