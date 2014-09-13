int lastPosition=0;

void setup()
{
  size(800, 600);
  
  Color []colorBox=new Color[50];
  
  Box []boxNow=new Box[50];
  
  PrimeNumber []prime=new PrimeNumber[50];
  
  for(int j=0, k=1, l=0; j<50; j++, k=k+50, l=l+12)
  {
    int i;
    prime[j]=new PrimeNumber(k, k+50-1);
    
    for(i=0; i<prime[j].getDifferenceArrayLength(); i++)
    {
      colorBox[j]=new Color(prime[j].getDifference(i));
      boxNow[j]=new Box(prime[j].getDifference(i), colorBox[j], l);
      boxNow[j].makeBox();    
    }
    println("\n\n"+ (prime[j].getDifference(i-2)));
    lastPosition=0;
  }
  
}


class GridUnit
{
  private final int height;
  
  private final int width;
  
  private int firstY;
  
  private Color colorForBox;
  
  public GridUnit(Color colorForBox, int firstY)
  {
    height=12;
    
    width=25;
    
    this.firstY=firstY;
    
    this.colorForBox=colorForBox;
    
  }
  
  public void display(int initialPos)
  {
    
    for(int i=initialPos; i<initialPos+width; i++)
    {
      stroke(colorForBox.returnRed(), colorForBox.returnGreen(), colorForBox.returnBlue());
      
      line(i, firstY, i, height+firstY);
      
      lastPosition=i;
    }
 
  }
  
  public int returnLastPosition()
  {
    return lastPosition;
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
  int []primeNums;
  
  int []primeNumDifference;
  
  public PrimeNumber(int initial, int terminal)
  {
    int countPrime=0;
    
    for(int i=initial; i<=terminal; i++)
    {
      int countDivisors=0;
      for(int j=1; j<=i; j++)
      {
        if(i%j==0)
        {
          countDivisors=countDivisors+1;
        }
      }
      if(countDivisors==2)
      {
        countPrime=countPrime+1;
      }
    }
   
    primeNums=new int[countPrime];
     
    int indexOfPrimeArray=0;
    for(int i=initial; i<=terminal; i++)
    {
      int countDivisors=0;
      for(int j=1; j<=i; j++)
      {
        if(i%j==0)
        {
          countDivisors=countDivisors+1;
        }
      }
      if(countDivisors==2)
      {
        primeNums[indexOfPrimeArray]=i;
        indexOfPrimeArray=indexOfPrimeArray+1;
      }
    }
    
    primeNumDifference=new int[primeNums.length];

    for(int i=1; i<primeNumDifference.length-1; i++)
    {
      primeNumDifference[i]=primeNums[i+1]-primeNums[i];
    }
  }
  
  public int getDifference(int index)
  {
    return primeNumDifference[index];
  }
  
  public int getDifferenceArrayLength()
  {
    return primeNumDifference.length;
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
