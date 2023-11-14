import java.util.*;
//import java.lang.Math;

public class snakeBody
{
  Random rand = new Random();
  
  /*private*/ int height = 700, width = 700;
  /*private*/ int squareSize = 25;
  /*private*/ color snakeColor = color(255, 0, 0);
  /*private*/ int xpos;
  /*private*/ int ypos; // = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
  /*private*/ int tempX;
  /*private*/ int tempY;
  /*private*/ char direction;
  //int snakeSize = 1;
  //private int [] squareCenter = {(int)(xpos + (squareSize / 2) + 0.5), (int)(ypos + (squareSize / 2) + 0.5)};
  
  private char move;
  
  //Index [0] = X coord, [1] = Y coord, [2] = Previous X, [3] = Previous Y
  /*private*/ int [] topLeftCorner = new int[4];
  /*private*/ int [] topRightCorner = new int[4];
  /*private*/ int [] bottomLeftCorner = new int[4];
  /*private*/ int [] bottomRightCorner = new int[4];
  
  public void resetSnake()
  {
    xpos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
    ypos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
    resetVelocity();
    setColorIB();
  }

  public void setXpos(int xpos)
  {
    this.xpos = xpos;
  }
  
  public void setYpos(int ypos)
  {
    this.ypos = ypos;
  }

  public int getXpos()
  {
    return xpos;
  }
  
  public int getYpos()
  {
    return ypos;
  }
  
  public void drawSnake(int xpos, int ypos)
  {
    fill(snakeColor);
    square(xpos, ypos, squareSize);
  }

  public void storePosition()
  {
    tempX = xpos;
    tempY = ypos;
    
    topLeftCorner[2] = xpos;
    topLeftCorner[3] = ypos;
    topRightCorner[2] = xpos + squareSize;
    topRightCorner[3] = ypos;
    bottomLeftCorner[2] = xpos;
    bottomLeftCorner[3] = ypos + squareSize;
    bottomRightCorner[2] = xpos + squareSize;
    bottomRightCorner[3] = ypos + squareSize;
  }
  
  public void updatePosition()
  {
    topLeftCorner[0] = xpos;
    topLeftCorner[1] = ypos;
    topRightCorner[0] = xpos + squareSize;
    topRightCorner[1] = ypos;
    bottomLeftCorner[0] = xpos;
    bottomLeftCorner[1] = ypos + squareSize;
    bottomRightCorner[0] = xpos + squareSize;
    bottomRightCorner[1] = ypos + squareSize;
  }
  
  //public void debugShowCurrentPos()
  //{
  //  fill(255, 0, 0);
  //  square(200, 775, 50);
  //  textSize(25);
  //  text("[" + topLeftCorner[0] + ", " + topLeftCorner[1] + "]", 175, 875);
  //  //text("(" + topLeftCorner[0]+", " + topLeftCorner[1] + ")", 450, 300);
  //  //text("(" + topRightCorner[0]+", " + topRightCorner[1] + ")", 600, 300); 
  //  //text("(" + bottomLeftCorner[0]+", " + bottomLeftCorner[1] + ")", 450, 425);
  //  //text("(" + bottomRightCorner[0]+", " + bottomRightCorner[1] + ")", 600, 425);
  //  //text("Current\nPos", 530, 350);
  //}
  
  //public void debugShowPreviousPos()
  //{
  //  fill(255, 0 ,0);
  //  square(525, 500, 100);
  //  fill(255);
  //  textSize(25);
  //  text("(" + topLeftCorner[2]+", " + topLeftCorner[3] + ")", 450, 500);
  //  text("(" + topRightCorner[2]+", " + topRightCorner[3] + ")", 600, 500); 
  //  text("(" + bottomLeftCorner[2]+", " + bottomLeftCorner[3] + ")", 450, 625);
  //  text("(" + bottomRightCorner[2]+", " + bottomRightCorner[3] + ")", 600, 625);
  //  text("Previous\nPos", 530, 550);
  //}
  
  public void drawUnit()
  {
    fill(snakeColor);
    square(xpos, ypos, squareSize);
  }
  
  public void setColorOOB() //out of bounds
  {
    snakeColor = color(255);
  }
  
  public void setColorIB() //in bounds
  {
    snakeColor = color(255, 0, 0);
  }
  
  public void moveRight()
  {
    if((keyPressed && key == 'd'))// || (key == CODED && keyCode == RIGHT))
    {
      if(xpos != width - squareSize)
      {
        //xpos += squareSize;
        move = 'e';
      }
    }
  }
  
  public void moveLeft()
  {
    if(keyPressed && key == 'a')// || (key == CODED && keyCode == LEFT)))
    {
      if(xpos != 0)
      {
        //xpos -= squareSize;
        move = 'w';
      }
    }
  }
  
  public void moveUp()
  {
    if(keyPressed && key == 'w')// || (key == CODED && keyCode == UP))
    {
      if(ypos != 0)
      {
        //ypos -= squareSize;
        move = 'n';
      }
    }
  }
  
  void moveDown()
  {
    if(keyPressed && key == 's')// || (key == CODED && keyCode == DOWN))
    {
      if(ypos != height - squareSize)
      {
        //ypos += squareSize;
        move = 's';
      }
    }
  }
  
  public void move()
  {
    moveUp();
    moveDown();
    moveRight();
    moveLeft();
    
    if(move == 'n')
    {
      if(direction == 's')
      {
        move = 's';
      }
      else
      {
        ypos -= squareSize;
      }
    }
    if(move == 's')
    {
      if(direction == 'n')
      {
        move = 'n';
      }
      else
      {
      ypos += squareSize;
      }
    }
    if(move == 'e')
    {
      if(direction == 'w')
      {
        move = 'w';
      }
      else
      {
        xpos += squareSize;
      }
    }
    if(move == 'w')
    {
      if(direction == 'e')
      {
        move = 'e';
      }
      else
      {
        xpos -= squareSize;
      }
    }
    if(move == ' ')
    {
    }
  }
  
  void resetVelocity()
  {
    move = ' ';
  }
  
  
  
  public boolean wallCollision()
  {
    boolean crashed = false; 
    
    if((topLeftCorner[1] == 0 && getDirection() == 'n') || 
       (topLeftCorner[0] == 0 && getDirection() == 'w') ||
       (bottomRightCorner[1] == height && getDirection() == 's') ||
       (bottomRightCorner[0] == width && getDirection() == 'e'))
    {
      crashed = true;
    }
    
    return crashed;
  }
  
  public char getDirection()
  {
    textSize(50);
    if(xpos > tempX)
    {
      //text("Traveling East", 5, 45);
      direction = 'e';
    }
    else if(xpos < tempX)
    {
      //text("Traveling West", 5, 45);
      direction = 'w';
    }
    if(ypos > tempY)
    {
      //text("Traveling South", 5, 45);
      direction = 's';
    }
    else if(ypos < tempY)
    {
      //text("Traveling North", 5, 45);
      direction = 'n';
    }
    
    return direction;
  }
  
  //public void startMenu()
  //{
  //  background(78, 106, 84);
  //  fill(255);
  //  textSize(100);
  //  text("SNAKE", width/75, height/6);
  //}  
}

class snakeHead extends snakeBody
{
  //squareSize = 25;
  //xpos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
  //ypos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;  
  
  //public void poo()
  //{
  //  System.out.println("This is the head");
  //}
  
  public snakeHead()
  {
    setXpos((rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25);
    setYpos((rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25);
  }
  
  public boolean foodCollision(food f)
  {
    boolean eaten = false; 
    
    if(topLeftCorner[0] == f.getTopLeftCornerX() && topLeftCorner[1] == f.getTopLeftCornerY())
    {
      if(topRightCorner[0] == f.getTopRightCornerX() && topRightCorner[1] == f.getTopRightCornerY())
      {
        if(bottomLeftCorner[0] == f.getBottomLeftCornerX() && bottomLeftCorner[1] == f.getBottomLeftCornerY())
        {
          if(bottomRightCorner[0] == f.getBottomRightCornerX() && bottomRightCorner[1] == f.getBottomRightCornerY())
          {
            textSize(50);
            text("Food eaten", 400, 400);
            eaten = true;
          }
        }
      }
    }
    return eaten;
  }
}
