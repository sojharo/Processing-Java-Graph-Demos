int lastPosition=0;

//change them to set the size of the boxes
int defaultWidthOfBox=35;
int defaultHeightOfBox=12;

//change them to set columns per row and number of rows
int numOfRows=50;
int numPerRow=20;

//change it to hide the grid
boolean gridLine=true;

void setup()
{
  
  size(800,600);
  
  background(0,255,255);
  
  Color []colorBox=new Color[numOfRows];
  
  Box []boxNow=new Box[numOfRows];
  
  PrimeNumber prime=new PrimeNumber();
  
  int numberForDifference=1;
  
  int j;
  boolean firstNumberOfDecade=false;
  Color colorBoxFiller=new Color(1);
  for(int k=0, m=0, l=0; k<numOfRows; k++, m=m+numPerRow, l=l+defaultHeightOfBox)
  {
    int lastDifference=0;
    
    for(j=m; j<m+numPerRow; j++)
    {
      if(prime.checkPrimeNumber(j))
      {
        if(firstNumberOfDecade)
        {
          colorBox[k]=colorBoxFiller;
          firstNumberOfDecade=false;
        }
        else
        {
          colorBox[k]=new Color(j-numberForDifference);
        }
          boxNow[k]=new Box(j-numberForDifference, colorBox[k], l);
          println(prime.checkPrimeNumber(j) +"\t"+ j +"\t"+ (j-numberForDifference) +"\t"+ j +"\t"+ numberForDifference);
          boxNow[k].makeBox();
          numberForDifference=j; 
      }
    }

    if(numberForDifference<m+numPerRow+1)
    {
      int nextPrimeFound=0;
      for(int i=numberForDifference+1; i<numberForDifference+m+numPerRow+1; i++)
      {
        if(prime.checkPrimeNumber(i))
        {
          nextPrimeFound=i;
          break;
        }
      }
      println(nextPrimeFound +"\t"+ numberForDifference);
      lastDifference=(m+numPerRow)-numberForDifference;
      colorBoxFiller=new Color(nextPrimeFound-numberForDifference);
      Box boxNowFiller=new Box(lastDifference, colorBoxFiller, l);
      boxNowFiller.makeBox();
    }
    
    firstNumberOfDecade=true;   
    numberForDifference=m+numPerRow+1;
    lastPosition=0;
  }
  for(int i=0, k=0; i<numPerRow; i++)
  {        
    fill(0,0,0);
    text(i+1, k, 10);
    noFill();
    
    k=k+defaultWidthOfBox;
  }
  
}

/*
 * Draws a single box as a Grid Unit
 */
class GridUnit
{
  private final int height;
  
  private final int width;
  
  private int firstY;
  
  private Color colorForBox;
  
  public GridUnit(Color colorForBox, int firstY)
  {
    height=defaultHeightOfBox;
    
    this.width=defaultWidthOfBox;
    
    this.firstY=firstY;
    
    this.colorForBox=colorForBox;
    
  }
  // displays the box
  public void display(int initialPos)
  {
    fill(colorForBox.returnRed(), colorForBox.returnGreen(), colorForBox.returnBlue());
    if(!gridLine)
    {
      noStroke();
    }
    rect(initialPos, firstY, width, height);
    lastPosition=width+initialPos;
  }
  
  public int returnLastPosition()
  {
    return lastPosition;
  }
}

/*
 *showing the color key
 */
void draw()
{
  fill(0,0,0);
  text("1", 710, 30+12);
  noFill();
  
  Color colorBoxFiller=new Color(1);
  fill(colorBoxFiller.returnRed(), colorBoxFiller.returnGreen(), colorBoxFiller.returnBlue());
  rect(730, 30, 25, 20);
  
  for(int i=2, j=60; i<34; i=i+2, j=j+30)
  {
    fill(0,0,0);
    text(i, 710, j+12);
    noFill();
    
    colorBoxFiller=new Color(i);
    fill(colorBoxFiller.returnRed(), colorBoxFiller.returnGreen(), colorBoxFiller.returnBlue());
    rect(730, j, 25, 20);
    noFill();
    
  }
}


class Box
{
  private int width;
  
  private int firstY;
  
  private Color colorForBox;
  
  public Box(int width, Color colorForBox, int firstY)
  {
    this.firstY=firstY;
    
    this.width=width;
    
    this.colorForBox=colorForBox;
  }
  
  public void makeBox()
  {
    GridUnit grid=new GridUnit(colorForBox, firstY);
    
    int initialPos;
    
    for(int i=0; i<width; i++)
    {
      initialPos=grid.returnLastPosition();
      
      grid.display(initialPos);
    }
    
  }
}


class PrimeNumber
{
  public boolean checkPrimeNumber(int num)
  {
    int countDivisors=0;
    for(int i=1; i<=num; i++)
    {
      if(num%i==0)
      {
        countDivisors=countDivisors+1;
      }
    }
    if(countDivisors==2)
    {
      return true;
    }
    return false;
  }
}

class Color
{
  private int width;
  
  private int r;
  
  private int g;
  
  private int b;
  
  public Color(int width)
  {
    this.width=width;
    if(this.width%2!=0)
    {
      this.width=this.width+1;
    }
    if(width==1)
    {
      r=86; g=199; b=241;
    }
    if(width==2)
    {
      r=9; g=73; b=98;
    }
    if(width==4)
    {
      r=2; g=104; b=166;
    }
    if(width==6)
    {
      r=1; g=37; b=58;
    }
    if(width==8)
    {
      r=122; g=15; b=145;
    }
    if(width==10)
    {
      r=199; g=37; b=233;
    }
    if(width==12)
    {
      r=213; g=91; b=238;
    }
    if(width==14)
    {
      r=79; g=143; b=251;
    }
    if(width==16)
    {
      r=143; g=120; b=214;
    }
    if(width==18)
    {
      r=165; g=156; b=177;
    }
    if(width==20)
    {
      r=157; g=132; b=133;
    }
    if(width==22)
    {
      r=214; g=106; b=35;
    }
    if(width==24)
    {
      r=233; g=162; b=114;
    }
    if(width==26)
    {
      r=242; g=206; b=170;
    }
    if(width==28)
    {
      r=184; g=240; b=128;
    }
    if(width==30)
    {
      r=150; g=252; b=82;
    }
    if(width==32)
    {
      r=185; g=253; b=140;
    }
    if(width==34)
    {
      r=223; g=254; b=203;
    }
  }
  
  public int returnRed()
  {
    return r;
  }
  
  public int returnGreen()
  {
    return g;
  }
  
  public int returnBlue()
  {
    return b;
  }
}
