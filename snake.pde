import java.util.*;
//import java.lang.Math;

public class snakeBody
{
  Random rand = new Random();
  
  protected int height = 700, width = 700;
  protected int squareSize = 25;
  protected color snakeColor = color(255, 0, 0);
  protected color activeColor = snakeColor;


  protected int xpos = -25;
  protected int ypos = -25;
  protected int tempX;
  protected int tempY;
  
  //Index [0] = X coord, [1] = Y coord, [2] = Previous X, [3] = Previous Y
  protected int [] topLeftCorner = new int[4];
  protected int [] topRightCorner = new int[4];
  protected int [] bottomLeftCorner = new int[4];
  protected int [] bottomRightCorner = new int[4];
  
  public snakeBody(){}
  
  public snakeBody(color c)
  {
    snakeColor = c;
    activeColor = c;
  }

  public void setSnakeColor(color c)
  {
    this.snakeColor = c;
    this.activeColor = c;
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
  
  public color getSnakeColor()
  {
    return activeColor;
  }
  
  public int getSnakeSize()
  {
    return squareSize;
  }
  
  public int getPreviousXpos()
  {
    return topLeftCorner[2];
  }
  
  public int getPreviousYpos()
  {
    return topLeftCorner[3];
  }
  
  public int getTopLeftCornerX()
  {
    return topLeftCorner[0];
  }
  
  public int getTopLeftCornerY()
  {
    return topLeftCorner[1];
  }
  
  public int getTopRightCornerX()
  {
    return topRightCorner[0];
  }
  
  public int getTopRightCornerY()
  {
    return topRightCorner[1];
  }
  
  public int getBottomLeftCornerX()
  {
    return bottomLeftCorner[0];
  }
  
  public int getBottomLeftCornerY()
  {
    return bottomLeftCorner[1];
  }
  
  public int getBottomRightCornerX()
  {
    return bottomRightCorner[0];
  }
  
  public int getBottomRightCornerY()
  {
    return bottomRightCorner[1];
  }
  
  public void drawSnake(int xpos, int ypos)
  {
    fill(activeColor);
    square(xpos, ypos, squareSize);
  }

  public void storePosition()
  {
    tempX = xpos;
    tempY = ypos;
    
    topLeftCorner[2] = xpos;
    topLeftCorner[3] = ypos;
    //topRightCorner[2] = xpos + squareSize;
    //topRightCorner[3] = ypos;
    //bottomLeftCorner[2] = xpos;
    //bottomLeftCorner[3] = ypos + squareSize;
    //bottomRightCorner[2] = xpos + squareSize;
    //bottomRightCorner[3] = ypos + squareSize;
  }
  
  public void updatePosition()
  {
    topLeftCorner[0] = xpos;
    topLeftCorner[1] = ypos;
    //topRightCorner[0] = xpos + squareSize;
    //topRightCorner[1] = ypos;
    //bottomLeftCorner[0] = xpos;
    //bottomLeftCorner[1] = ypos + squareSize;
    //bottomRightCorner[0] = xpos + squareSize;
    //bottomRightCorner[1] = ypos + squareSize;
  }
  
  public void updatePosition(int xpos, int ypos)
  {
    topLeftCorner[0] = xpos;
    topLeftCorner[1] = ypos;
    //topRightCorner[0] = xpos + squareSize;
    //topRightCorner[1] = ypos;
    //bottomLeftCorner[0] = xpos;
    //bottomLeftCorner[1] = ypos + squareSize;
    //bottomRightCorner[0] = xpos + squareSize;
    //bottomRightCorner[1] = ypos + squareSize;
  }
  
  public void setPos(int x, int y)
  {
    xpos = x;
    ypos = y;
  }
  
  public void debugShowCurrentPos()
  {
    fill(0);
    textSize(25);
    text("(" + (topLeftCorner[0] - squareSize) + ", " + (topLeftCorner[1] - squareSize) + ")", 450, 300);
    text("(" + (topRightCorner[0] - squareSize) + ", " + (topRightCorner[1] - squareSize) + ")", 600, 300); 
    text("(" + (bottomLeftCorner[0] - squareSize) + ", " + (bottomLeftCorner[1] - squareSize) + ")", 450, 425);
    text("(" + (bottomRightCorner[0] - squareSize) + ", " + (bottomRightCorner[1] - squareSize) + ")", 600, 425);
    text("Current\nPos", 530, 350);
  }
  
  public void debugShowPreviousPos()
  {
    fill(0);
    textSize(25);
    text("[" + (topLeftCorner[2] - squareSize) + ", " + (topLeftCorner[3] - squareSize) + "]", 175, 875);
    text("(" + (topLeftCorner[2] - squareSize) + ", " + (topLeftCorner[3] - squareSize) + ")", 450, 500);
    text("(" + (topRightCorner[2] - squareSize) + ", " + (topRightCorner[3] - squareSize) + ")", 600, 500); 
    text("(" + (bottomLeftCorner[2] - squareSize) + ", " + (bottomLeftCorner[3] - squareSize) + ")", 450, 625);
    text("(" + (bottomRightCorner[2] - squareSize) + ", " + (bottomRightCorner[3] - squareSize) + ")", 600, 625);
    text("Previous\nPos", 530, 550);
  }
    
  public void drawUnit()
  {
    fill(activeColor);
    square(xpos, ypos, squareSize);
  }
}

class snakeHead extends snakeBody
{
  private char direction;
  private char move;
  
  public snakeHead()
  {
    setXpos((rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25);
    setYpos((rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25);
  }
  
  public void setSnakeColorHeadCall(color c)
  {
    setSnakeColor(c);
  }
  
  public void resetDirection()
  {
    direction = '\0';
  }
  
  public void moveRight()
  {
    if((keyPressed && key == 'd'))// || (key == CODED && keyCode == RIGHT))
    {
      move = 'e';
    }
  }
  
  public void moveLeft()
  {
    if(keyPressed && key == 'a')// || (key == CODED && keyCode == LEFT)))
    {
      move = 'w';
    }
  }
  
  public void moveUp()
  {
    if(keyPressed && key == 'w')// || (key == CODED && keyCode == UP))
    {
      move = 'n';
    }
  }
  
  void moveDown()
  {
    if(keyPressed && key == 's')// || (key == CODED && keyCode == DOWN))
    {
      move = 's';
    }
  }  
  
  public boolean wallCollision()
  {
    boolean crashed = false; 
    
    //if((topLeftCorner[1] == 0 && getDirection() == 'n') || 
    //   (topLeftCorner[0] == 0 && getDirection() == 'w') ||
    //   (bottomRightCorner[1] == height && getDirection() == 's') ||
    //   (bottomRightCorner[0] == width && getDirection() == 'e'))
   if(topLeftCorner[0] == 0 || topLeftCorner[1] == 0 || topLeftCorner[0] == width - squareSize || topLeftCorner[1] == height - squareSize)
    {
      crashed = true;
      System.out.println("died");
    }
    
    return crashed;
  }
  
  public void move()
  {
    moveUp();
    moveDown();
    moveRight();
    moveLeft();
    
    char newDirection = move;
    
    switch (move) 
    {
      case 'n': 
          if (direction == 's') { // Cannot move up if moving down
              newDirection = 's';
          }
          break;
      case 's': 
          if (direction == 'n') { // Cannot move down if moving up
              newDirection = 'n';
          }
          break;
      case 'w': 
          if (direction == 'e') { // Cannot move left if moving right
              newDirection = 'e';
          }
          break;
      case 'e': 
          if (direction == 'w') { // Cannot move right if moving left
              newDirection = 'w';
          }
          break;
    }
    
    // Update position based on the new direction
    switch (newDirection) {
        case 'n':
            ypos -= squareSize;
            break;
        case 's':
            ypos += squareSize;
            break;
        case 'e':
            xpos += squareSize;
            break;
        case 'w':
            xpos -= squareSize;
            break;
    }

    // Update the direction to the new direction if it's valid
    if (newDirection != move) {
        direction = newDirection;
    }
  }
  
  public char getDirection()
  {
    textSize(50);
    if(xpos > tempX)
    {
      direction = 'e';
    }
    else if(xpos < tempX)
    {
      direction = 'w';
    }
    if(ypos > tempY)
    {
      direction = 's';
    }
    else if(ypos < tempY)
    {
      direction = 'n';
    }
    
    return direction;
  }
  
  void resetVelocity()
  {
    move = '0';
  }
  
  public void setColorWhite() //out of bounds
  {
    activeColor = color(255);
  }
  
  public void setColorIB() //in bounds
  {
    activeColor = snakeColor;
  }
  
  public void reset()
  {
    xpos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
    ypos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
    resetVelocity();
    resetDirection();
    setColorIB();
  }
  
  public boolean foodCollision(food f)
  {
    boolean eaten = false; 
    
    if(getXpos() == f.getXpos() && getYpos() == f.getYpos())
    {
      System.out.println("Food eaten )");
      eaten = true;
    }
    return eaten;
  }
  
  public boolean selfCollision(snakeBody s)
  {
    boolean collided = false;
    
    if(getXpos() == s.getXpos() && getYpos() == s.getYpos())
    {
      collided = true;
      System.out.println("hit himself (");
    }
    
    return collided;
  }
}
