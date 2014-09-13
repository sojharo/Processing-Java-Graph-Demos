

package barlinegraph;
/*
import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;




public class Main extends Applet{
    
public void init()
{
this.setSize(400, 400);
}
public int screenX(int x)   //scaling of x
{
return 10+(x*20);
}
public int screenY(int y)   //scaling of y
{
return 310-(y*20);
}
public void paint(Graphics g)
{
g.drawRect(9, 9, 301, 301);
g.setColor(Color.blue);
g.fillRect(10, 10, 300, 300);
g.setColor(Color.black);
for(int i=1; i<15; i++)g.drawLine(screenX(i), 10, screenX(i), 310);
for(int i=1; i<15; i++)g.drawLine(10, screenY(i), 310, screenY(i));
g.setColor(Color.white);
//g.drawLine(screenX(1), screenY(1), screenX(10), screenY(10));
/*   parabola
for(int x=0; x<15; x++)
{
int y=x*x;
int y2=(x+1)*(x+1);
g.drawLine(screenX(x), screenY(y), screenX(x+1), screenY(y2));
}
*/
//rectangle
/*
for(int d=1; d<15; d=d+2)
g.fillRect(screenX(d), screenY(d+2), 20, screenY(0));
g.setColor(Color.black);
g.drawLine(10, 310, 310, 310);
}
}



*/






import java.awt.Color;
import java.awt.Graphics;
import java.util.Random;
import javax.swing.JApplet;


public class Main extends JApplet {

    /**
     * To initialize the applet
     */

    public void init()
    {
        this.setSize(600, 400);
    }

    /**
     * To scale the x-coordinates of the screen. 20 pixels are taken
     * as one unit.
     * @param x the x-coordinate of the point
     * @return returns the scaled x-coordinate of the point
     */

  public int screenX(int x)   //scaling of x
    {
        return 30+(x*20);
    }

    /**
     * To scale the y-coordinates of the screen. 20 pixels are taken
     * as one unit.
     * @param y the x-coordinate of the point
     * @return returns the scaled y-coordinate of the point
     */

   public int screenY(int y)   //scaling of y
    {
        return 330-(y*20);
    }


        public void paint(Graphics g)
        {

            Random r=new Random();

            int inputLength=0;

            g.drawRect(29, 29, 301, 301);

            g.setColor(Color.blue);

            g.fillRect(30, 30, 300, 300);

            g.setColor(Color.black);

            for(int i=1; i<15; i++)g.drawLine(screenX(i), 30, screenX(i), 330);
            for(int i=1; i<15; i++)g.drawLine(30, screenY(i), 330, screenY(i));

            int []y=new int[10];
            for(int i=0; i<10; i++)
            {
                y[i]=r.nextInt(15);
            }

            g.setColor(Color.white);

            for(int d=1, i=0; d<=inputLength; d++, i++)
            g.fillRect(screenX(d+1+i), screenY(y[i]), 20, screenY(0));

            g.setColor(Color.black);
            g.drawLine(30, 330, 310, 330);

            g.setColor(Color.yellow);


            //intial line
            if(inputLength!=0)
            g.drawLine(screenX(0), screenY(0), screenX(2),
                screenY(y[0]));


            //all the 2's in the following chunk of code are connected


            //This will draw the line of the line Graph
            for(int i=0, j=2; i<inputLength; i++, j=j+2)
            {
                if(i<inputLength-1)
                {
                    g.drawLine(screenX(j), screenY(y[i]), screenX(j+2),
                        screenY(y[i+1]));
                }
            }


            // this is to give the numbers on the axis of the graph
            g.setColor(Color.black);
            for(int i=0; i<=15; i++)g.drawString(Integer.toString(i), screenX(i), 352);
            for(int i=0; i<=15; i++)g.drawString(Integer.toString(i), 10, screenY(i));

        }


}
