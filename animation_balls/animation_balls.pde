MovingEllipse e1;
MovingEllipse e2;

void setup() {
  size(480, 120);
  smooth();
  e1 = new MovingEllipse(width, height/2, 50, true);
  e2 = new MovingEllipse(width, height/2, 50, false);
}

void draw() {
  e1.move();
  e1.display();
  e2.move();
  e2.display();
  
  e1.collide(e2);
  
  
} 

class MovingEllipse {

  float x;
  float y;
  int diameter;
  float speed = 2.5;
  boolean direction;

  MovingEllipse(float tempX, float tempY, int tempDiameter, boolean direction) {
    x = tempX;
    y = tempY;
    this.direction=direction;
    diameter = tempDiameter;
  }

  void move() {
    if(direction==true)
    x +=2;
    else if(direction==false)
    x-=2;
//  y += 2;
    if(x>width-1)
      x=1;
    if(x<1)
      x=width;
  }

  void display() {
    ellipse(x, y, diameter, diameter);
  }
 int t=0;
 void collide(MovingEllipse e3) 
 {
   
   if((this.x+this.diameter/2==e3.x+e3.diameter/2))
   {
     t++;
     System.out.println("Ttthaa "+ t);
   }


 }
}
