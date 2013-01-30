import processing.serial.*;
import cc.arduino.*;
Arduino arduino; //Use the StandardFirmata on the Arduino (IDE Arduino 1.0.2)

import java.awt.Robot;
import java.awt.Color;
Robot PixelBot;      //Robot class
Color pixelColor;    //Color class

//Current RGB player 1
int pixelColor_r;
int pixelColor_g;
int pixelColor_b;

//Previous RGB player 1
int PrevpixelColor_r;
int PrevpixelColor_g;
int PrevpixelColor_b;

//Current RGB player 2
int pixelColor_r2;
int pixelColor_g2;
int pixelColor_b2;

//Previous RGB player 2
int PrevpixelColor_r2;
int PrevpixelColor_g2;
int PrevpixelColor_b2;


//Pixel position on 800x600 screen resolution for player 1
int originalX1 = 181;
int originalY1 = 514;

//Pixel position on 800x600 screen resolution for player 2
int originalX2 = 581;
int originalY2= 514;

//Variable to store "reel" pixel position after calculation made on the setup part
int reelX1 = 0;
int reelY1 = 0;
int reelX2 = 0;
int reelY2 = 0;

PVector player1;
PVector player2;

void setup() 
{  
  arduino = new Arduino(this, Arduino.list()[0], 57600);
	size (400,300);
	background(0);
	PrevpixelColor_r = 0;	
	PrevpixelColor_g = 0;
	PrevpixelColor_b = 0;
	PrevpixelColor_r2 = 0;
	PrevpixelColor_g2 = 0;
	PrevpixelColor_b2 = 0;

	println("screen.width ="+ screen.width);
	println("screen.height ="+ screen.height);

        //Caluculation for "reel" pixel position
	reelX1 = (int) (((float)screen.width/(float)800) * (float)originalX1);
	reelX2 = (int) (((float)screen.width/(float)800) * (float)originalX2);
	reelY1 = (int) (((float)screen.height/(float)600) * (float)originalY1);
	reelY2 = (int) (((float)screen.height/(float)600) * (float)originalY2);
	
        player1=new PVector(reelX1,reelY1); // player 1 pixel position
	player2=new PVector(reelX2,reelY2); // player 2 pixel position
  
	println("Pixel 1 = "+ reelX1 +"," + reelY1);
	println("Pixel 2 = "+ reelX2 +"," + reelY2);
	
	try
	{
		PixelBot = new Robot();         
		pixelColor = new Color(0,0,0);  
	}
	catch (Exception e)
	{
		println("Robot class not supported");
		exit();
	}
}


void checkColor (int player)
{
  int redPB [] = {209,0,0}; // color in puzzle bobble (RGB format)
  int redPB2 [] = {208,0,0};
  int Ared[] = {255,0,0}; // color send to Arduino (RGB format)

  int orangePB [] = {247,115,0};
  int orangePB2 [] = {246,114,0};
  int Aorange[] = {255,100,0};

  int greenPB [] = {0,171,0};
  int greenPB2 [] = {0,170,0};
  int Agreen[] = {0,255,0};
  
  int bluePB [] = {0,39,246};
  int bluePB2 [] = {0,37,245};
  int Ablue[] = {0,0,255};
  
  int yellowPB [] = {210,172,0};
  int yellowPB2 [] = {209,171,0};
  int Ayellow[] = {255,255,0};
   
  int violetPB [] = {122,0,170};
  int violetPB2 [] = {121,0,169};
  int Aviolet[] = {255,0,255};
  
  int greyPB [] = {115,114,152};
  int greyPB2 [] = {114,113,151};
  int Agrey[] = {50,70,90};
    
  if (player == 1)
  {
	if (((pixelColor_r == redPB[0]) &&   (pixelColor_g == redPB[1]) && (pixelColor_b == redPB[2]))
	||((pixelColor_r == redPB2[0]) &&   (pixelColor_g == redPB2[1]) && (pixelColor_b == redPB2[2])))
    {
		rect(100,200,100,100);
		fill(Ared[0],Ared[1],Ared[2]);
		println("Red P1");
		arduino.analogWrite(3, Ared[0]);
		arduino.analogWrite(5, Ared[1]);
		arduino.analogWrite(6, Ared[2]); 
    }
  
	else if (((pixelColor_r == greenPB[0]) &&   (pixelColor_g == greenPB[1]) && (pixelColor_b == greenPB[2]))
	||((pixelColor_r == greenPB2[0]) &&   (pixelColor_g == greenPB2[1]) && (pixelColor_b == greenPB2[2])))
    {
		rect(100,200,100,100);
		fill(Agreen[0],Agreen[1],Agreen[2]);
		println("Green  P1");
		arduino.analogWrite(3, Agreen[0]);
		arduino.analogWrite(5, Agreen[1]);
		arduino.analogWrite(6, Agreen[2]); 
     }
  
    else if (((pixelColor_r == bluePB[0]) &&   (pixelColor_g == bluePB[1]) && (pixelColor_b == bluePB[2]))
	||((pixelColor_r == bluePB2[0]) &&   (pixelColor_g == bluePB2[1]) && (pixelColor_b == bluePB2[2])))
    {
		rect(100,200,100,100);
		fill(Ablue[0],Ablue[1],Ablue[2]);
		println("Blue P1");
		arduino.analogWrite(3, Ablue[0]);
		arduino.analogWrite(5, Ablue[1]);
		arduino.analogWrite(6, Ablue[2]); 
    }
    
    else if (((pixelColor_r == yellowPB[0]) &&   (pixelColor_g == yellowPB[1]) && (pixelColor_b == yellowPB[2]))
	||((pixelColor_r == yellowPB2[0]) &&   (pixelColor_g == yellowPB2[1]) && (pixelColor_b == yellowPB2[2])))
    {
		rect(100,200,100,100);
		fill(Ayellow[0],Ayellow[1],Ayellow[2]);
		println("Yellow P1");
		arduino.analogWrite(3, Ayellow[0]);
		arduino.analogWrite(5, Ayellow[1]);
		arduino.analogWrite(6, Ayellow[2]); 
    }
  
    else if (((pixelColor_r == violetPB[0]) &&   (pixelColor_g == violetPB[1]) && (pixelColor_b == violetPB[2]))
    ||((pixelColor_r == violetPB2[0]) &&   (pixelColor_g == violetPB2[1]) && (pixelColor_b == violetPB2[2])))
    {
		rect(100,200,100,100);
		fill(Aviolet[0],Aviolet[1],Aviolet[2]);
		println("Violet P1");
		arduino.analogWrite(3, Aviolet[0]);
		arduino.analogWrite(5, Aviolet[1]);
		arduino.analogWrite(6, Aviolet[2]); 
    }
  
    else if (((pixelColor_r == greyPB[0]) &&   (pixelColor_g == greyPB[1]) && (pixelColor_b == greyPB[2]))
	||((pixelColor_r == greyPB2[0]) &&   (pixelColor_g == greyPB2[1]) && (pixelColor_b == greyPB2[2])))
    {
		rect(100,200,100,100);
		fill(Agrey[0],Agrey[1],Agrey[2]);
		println("Grey P1");
		arduino.analogWrite(3, Agrey[0]);
		arduino.analogWrite(5, Agrey[1]);
		arduino.analogWrite(6, Agrey[2]); 
    }
  
    else if (((pixelColor_r == orangePB[0]) &&   (pixelColor_g == orangePB[1]) && (pixelColor_b == orangePB[2]))
    || ((pixelColor_r == orangePB2[0]) &&   (pixelColor_g == orangePB2[1]) && (pixelColor_b == orangePB2[2])))    
    {
		rect(100,200,100,100);
		fill(Aorange[0],Aorange[1],Aorange[2]);
		println("Orange P1");
		arduino.analogWrite(3, Aorange[0]);
		arduino.analogWrite(5, Aorange[1]);
		arduino.analogWrite(6, Aorange[2]); 
    }

    else
    {
		rect(100,200,100,100);
		fill(255,255,255);
		println("Unknown P1");
		arduino.analogWrite(3, 0);
		arduino.analogWrite(5, 0);
		arduino.analogWrite(6, 0); 
    }
  }
  
  if (player == 2)
  {
    if (((pixelColor_r2 == redPB[0]) &&   (pixelColor_g2 == redPB[1]) && (pixelColor_b2 == redPB[2]))
    ||((pixelColor_r2 == redPB2[0]) &&   (pixelColor_g2 == redPB2[1]) && (pixelColor_b2 == redPB2[2])))
    {
		rect(200,200,100,100);
		fill(Ared[0],Ared[1],Ared[2]);
		println("Red P2");
		arduino.analogWrite(9, Ared[0]);
		arduino.analogWrite(10, Ared[1]);
		arduino.analogWrite(11, Ared[2]); 
    }

    else if (((pixelColor_r2 == greenPB[0]) &&   (pixelColor_g2 == greenPB[1]) && (pixelColor_b2 == greenPB[2]))
    ||((pixelColor_r == greenPB2[0]) &&   (pixelColor_g == greenPB2[1]) && (pixelColor_b == greenPB2[2])))
    {
		rect(200,200,100,100);
		fill(Agreen[0],Agreen[1],Agreen[2]);
		println("Green P2");
		arduino.analogWrite(9, Agreen[0]);
		arduino.analogWrite(10, Agreen[1]);
		arduino.analogWrite(11, Agreen[2]); 
     }
  
    else if (((pixelColor_r2 == bluePB[0]) &&   (pixelColor_g2 == bluePB[1]) && (pixelColor_b2 == bluePB[2]))
	||((pixelColor_r2 == bluePB2[0]) &&   (pixelColor_g2 == bluePB2[1]) && (pixelColor_b2 == bluePB2[2])))
    {
		rect(200,200,100,100);
		fill(Ablue[0],Ablue[1],Ablue[2]);
		println("Blue P2");
		arduino.analogWrite(9, Ablue[0]);
		arduino.analogWrite(10, Ablue[1]);
		arduino.analogWrite(11, Ablue[2]); 
    }
    
    else if (((pixelColor_r2 == yellowPB[0]) &&   (pixelColor_g2 == yellowPB[1]) && (pixelColor_b2 == yellowPB[2]))
	||((pixelColor_r2 == yellowPB2[0]) &&   (pixelColor_g2 == yellowPB2[1]) && (pixelColor_b2 == yellowPB2[2])))

    {
		rect(200,200,100,100);
		fill(Ayellow[0],Ayellow[1],Ayellow[2]);
		println("Yellow P2");
		arduino.analogWrite(9, Ayellow[0]);
		arduino.analogWrite(10, Ayellow[1]);
		arduino.analogWrite(11, Ayellow[2]); 
    }
  
    else if (((pixelColor_r2 == violetPB[0]) &&   (pixelColor_g2 == violetPB[1]) && (pixelColor_b2 == violetPB[2]))
    ||((pixelColor_r2 == violetPB[0]) &&   (pixelColor_g2 == violetPB[1]) && (pixelColor_b2 == violetPB[2])))
    {
		rect(200,200,100,100);
		fill(Aviolet[0],Aviolet[1],Aviolet[2]);
		println("Violet P2");
		arduino.analogWrite(9, Aviolet[0]);
		arduino.analogWrite(10, Aviolet[1]);
		arduino.analogWrite(11, Aviolet[2]); 
    }
  
    else if (((pixelColor_r2 == greyPB[0]) &&   (pixelColor_g2 == greyPB[1]) && (pixelColor_b2 == greyPB[2]))
	||((pixelColor_r2 == greyPB2[0]) &&   (pixelColor_g2 == greyPB2[1]) && (pixelColor_b2 == greyPB2[2])))
    {
		rect(200,200,100,100);
		fill(Agrey[0],Agrey[1],Agrey[2]);
		println("Grey P2");
		arduino.analogWrite(9, Agrey[0]);
		arduino.analogWrite(10, Agrey[1]);
		arduino.analogWrite(11, Agrey[2]); 
    }
  
    else if (((pixelColor_r2 == orangePB[0]) &&   (pixelColor_g2 == orangePB[1]) && (pixelColor_b2 == orangePB[2]))
    || ((pixelColor_r2 == orangePB2[0]) &&   (pixelColor_g2 == orangePB2[1]) && (pixelColor_b2 == orangePB2[2])))
    {
		rect(200,200,100,100);
		fill(Aorange[0],Aorange[1],Aorange[2]);
		println("Orange P2");
		arduino.analogWrite(9, Aorange[0]);
		arduino.analogWrite(10, Aorange[1]);
		arduino.analogWrite(11, Aorange[2]); 
    }

    else
    {
		rect(200,200,100,100);
		fill(255,255,255);
		println("Unknown P2");
		arduino.analogWrite(9, 0);
		arduino.analogWrite(10, 0);
		arduino.analogWrite(11, 0); 
    }
  }
}



void draw() 
{
	pixelColor = PixelBot.getPixelColor((int)player1.x,(int)player1.y);  //get player 1 pixel position
	pixelColor_r = pixelColor.getRed();
	pixelColor_g = pixelColor.getGreen();
	pixelColor_b = pixelColor.getBlue();
	rect(100,100,100,100);
	fill(pixelColor_r,pixelColor_g,pixelColor_b);
	if (pixelColor_r != PrevpixelColor_r || pixelColor_g != PrevpixelColor_g || pixelColor_b != PrevpixelColor_b) // if new
	{
		print("1 - Red " + pixelColor_r + " Green " + pixelColor_g + " blue " + pixelColor_b + "  ==>");
		checkColor(1);
		PrevpixelColor_r = pixelColor_r;
		PrevpixelColor_g = pixelColor_g;
		PrevpixelColor_b = pixelColor_b;
	}

	pixelColor = PixelBot.getPixelColor((int)player2.x,(int)player2.y); //get player 2 pixel position
	pixelColor_r2 = pixelColor.getRed();
	pixelColor_g2 = pixelColor.getGreen();
	pixelColor_b2 = pixelColor.getBlue();
	rect(200,100,100,100);
	fill(pixelColor_r2,pixelColor_g2,pixelColor_b2);
	if (pixelColor_r2 != PrevpixelColor_r2 || pixelColor_g2 != PrevpixelColor_g2 || pixelColor_b2 != PrevpixelColor_b2)// if new
	{
		print("2 - Red " + pixelColor_r2 + " Green " + pixelColor_g2 + " Blue " + pixelColor_b2+ "  ==>");
		checkColor(2);
		PrevpixelColor_r2 = pixelColor_r2;
		PrevpixelColor_g2 = pixelColor_g2;
		PrevpixelColor_b2 = pixelColor_b2;
	}
}
