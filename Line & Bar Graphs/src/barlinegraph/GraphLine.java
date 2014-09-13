
package barlinegraph;

import java.applet.Applet;
import java.awt.AWTEvent;
import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Canvas;
import java.awt.Color;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Panel;
import java.awt.TextField;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.TextEvent;
import java.util.Random;




public class GraphLine extends Applet {

    GraphArea area;
    GraphControls controls;

    public void init()
    {

        setLayout(new BorderLayout());

        area=new GraphArea();

 //      add("Center", area);

 //       add("South", controls=new GraphControls(area));


 
        Frame f = new Frame("Bar and Line Graph");
        
        f.add(area);
        f.add("South", controls=new GraphControls(area));
        f.setSize(450, 420);

        f.setVisible(true);

    }
/*
    public static void main(String args[]) {
	Frame f = new Frame("Bar and Line Graph");
	GraphLine graph = new GraphLine();

	graph.init();
	graph.start();

	f.add("Center", graph);
	f.setSize(600, 420);
        f.show();
    }
*/
    public void destroy() {
        remove(controls);
        remove(area);
    }

    public void start() {
	controls.setEnabled(true);
    }

    public void stop() {
	controls.setEnabled(false);
    }

}

class GraphArea extends Canvas
{
    int inputLength;

    int graphOption=1;

    int []y=new int[10];

    boolean generateData=false;

    Random r=new Random();

    final int GAP=2;
    
    public int screenX(int x)   //scaling of x
    {
        return 30+(x*20);
    }

    public int screenY(int y)   //scaling of y
    {
        return 330-(y*20);
    }

    public void randomData()
    {
        for(int i=0; i<10; i++)
        {
            y[i]=r.nextInt(15);
        }
    }

    public void redraw(int inputLength, int graphOption, boolean generateData) {

        this.generateData=generateData;
        if(this.generateData==true)
        {
            randomData();
            this.generateData=false;
        }

        this.inputLength=inputLength;
        this.graphOption=graphOption;
        
	repaint();
    }

    public void paint(Graphics g)
    {

        g.drawRect(29, 29, 301, 301);

        g.setColor(Color.blue);

        g.fillRect(30, 30, 300, 300);

        g.setColor(Color.black);

        for(int i=1; i<15; i++)g.drawLine(screenX(i), 30, screenX(i), 330);
        for(int i=1; i<15; i++)g.drawLine(30, screenY(i), 330, screenY(i));



        if(graphOption==1 && inputLength<=7)
        {
             g.setColor(Color.white);

             for(int d=1, i=0; d<=inputLength; d++, i++)
                g.fillRect(screenX(d+1+i), screenY(y[i]), 20, screenY(0));
        }
        else if(graphOption==2 && inputLength<=7)
        {
             g.setColor(Color.yellow);

             //intial line
             if(inputLength!=0)
                g.drawLine(screenX(0), screenY(0), screenX(GAP),
                    screenY(y[0]));

              //This will draw the line of the line Graph
             for(int i=0, j=GAP; i<inputLength; i++, j=j+GAP)
             {
                 if(i<inputLength-1)
                     g.drawLine(screenX(j), screenY(y[i]), screenX(j+2),
                         screenY(y[i+1]));
             }
        }
        else if(graphOption==3 && inputLength<=7)
        {
            g.setColor(Color.white);

             for(int d=1, i=0; d<=inputLength; d++, i++)
                g.fillRect(screenX(d+1+i), screenY(y[i]), 20, screenY(0));

            g.setColor(Color.yellow);

             //intial line
             if(inputLength!=0)
                g.drawLine(screenX(0), screenY(0), screenX(GAP),
                    screenY(y[0]));

              //This will draw the line of the line Graph
             for(int i=0, j=GAP; i<inputLength; i++, j=j+GAP)
             {
                 if(i<inputLength-1)
                     g.drawLine(screenX(j), screenY(y[i]), screenX(j+2),
                         screenY(y[i+1]));
             }
        }
        else
        {
             
        }

        

        g.setColor(Color.black);
        g.drawLine(30, 330, 310, 330);

        // this is to give the numbers on the axis of the graph
        g.setColor(Color.black);
        for(int i=0; i<=15; i++)g.drawString(Integer.toString(i), screenX(i), 352);
        for(int i=0; i<=15; i++)g.drawString(Integer.toString(i), 10, screenY(i));

   }
}

class GraphControls extends Panel implements ActionListener
{
    IntegerTextField inputUser;
    GraphArea area;
    Button b1;
    Button b2;
    Button b3;
    Button b4;
    public GraphControls(GraphArea area)
    {

        b4=new Button("Generate Random Data");
        b4.addActionListener(this);
        add(b4);

        this.area = area;
	add(inputUser = new IntegerTextField("6", 4));
       
	b1 = new Button("Bar Graph");
	b1.addActionListener(this);
	add(b1);
	b2 = new Button("Line Graph");
	b2.addActionListener(this);
	add(b2);
        b3 = new Button("Both");
        b3.addActionListener(this);
	add(b3);
    }

    public void actionPerformed(ActionEvent e) {
        int start, graphOption=0;
        boolean generateData=false;

        try {
            start = Integer.parseInt(inputUser.getText().trim());
        } catch (NumberFormatException nfe) {
            start = 0;
        }

        if(e.getSource() == b1)
        {
            graphOption=1;
        }
        else if(e.getSource() == b2)
        {
            graphOption=2;
        }
        else if(e.getSource() == b3)
        {
            graphOption=3;
        }
        else if(e.getSource() == b4)
        {
            generateData=true;
        }
        
        area.redraw(start, graphOption, generateData);
        
    }
}





class IntegerTextField extends TextField {

    String oldText = null;

    public IntegerTextField(String text, int columns) {
        super(text, columns);
        enableEvents(AWTEvent.KEY_EVENT_MASK | AWTEvent.TEXT_EVENT_MASK);
        oldText = getText();
    }

    protected void processEvent(AWTEvent evt) {
        int id = evt.getID();
        if (id != KeyEvent.KEY_TYPED) {
            super.processEvent(evt);
            return;
        }

        KeyEvent kevt = (KeyEvent) evt;
        char c = kevt.getKeyChar();

        // Digits, backspace, and delete are okay
        // Note that the minus sign is allowed, but not the decimal
        if (Character.isDigit(c) || (c == '\b') || (c == '\u007f') ||
            (c == '\u002d')) {
            super.processEvent(evt);
            return;
        }

        Toolkit.getDefaultToolkit().beep();
        kevt.consume();
    }

    // Should consume TextEvents for non-integer Strings
    // Store away the text in the tf for every TextEvent
    // so we can revert to it on a TextEvent (paste, or
    // legal key in the wrong location) with bad text
    //
    protected void processTextEvent(TextEvent te) {
        // The empty string is okay, too
        String newText = getText();
        if (newText.equals("") || textIsInteger(newText)) {
            oldText = newText;
            super.processTextEvent(te);
            return;
        }

        Toolkit.getDefaultToolkit().beep();
        setText(oldText);
    }

    // Returns true for Integers (zero and negative
    // values are allowed).
    // Note that the empty string is not allowed.
    //
    private boolean textIsInteger(String textToCheck) {
        int value = -1;

        try {
            value = Integer.parseInt(textToCheck, 10);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }
}
