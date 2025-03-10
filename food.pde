import java.util.*;

public class food
{
  Random rand = new Random();
  
  private int height = 700, width = 700;
  
  private int squareSize = 25;
  private int xpos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
  private int ypos = (rand.nextInt(((height - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;;
  private color foodColor = color(225, 255, 32);

  
  private int [] topLeftCorner    = {xpos, ypos};
  private int [] topRightCorner   = {xpos + squareSize, ypos};
  private int [] bottomLeftCorner = {xpos, ypos + squareSize};
  private int [] bottomRightCorner= {xpos + squareSize, ypos + squareSize};
  
  
  public color getColor()
  {
    return foodColor;
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
  
  public void setFoodColor(color c)
  {
    foodColor = c;
  }
  
  public void display(int xpos, int ypos)
  {
    fill(foodColor);
    square(xpos, ypos, squareSize);
  }
  
  public color getFoodColor()
  {
    return foodColor;
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
  
  public boolean inSnake (ArrayList<snakeBody> s, int x, int y)
  {
    for(snakeBody segment : s)
    {
      if((segment.getXpos() == x && segment.getYpos() == y))
      {
        return true;
      }
    } 
    return false;
  }
  
  public void updatePos(ArrayList<snakeBody> s)
  {
    int x;
    int y;
    
    do
    {
      x = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
      y = (rand.nextInt(((height - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
    }
    while(inSnake(s, x, y));
    
    xpos = x;
    ypos = y;
    
    topLeftCorner[0] = xpos;
    topLeftCorner[1] = ypos;
    // topRightCorner[0] = xpos + squareSize;
    // topRightCorner[1] = ypos;
    // bottomLeftCorner[0] = xpos;
    // bottomLeftCorner[1] = ypos + squareSize;
    // bottomRightCorner[0] = xpos + squareSize;
    // bottomRightCorner[1] = ypos + squareSize;
  }
  
  public void updatePos()
  {
    xpos = (rand.nextInt(((width - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
    ypos = (rand.nextInt(((height - 50 - squareSize) / squareSize) + 1) * squareSize) + 25;
    
    topLeftCorner[0] = xpos;
    topLeftCorner[1] = ypos;
    //topRightCorner[0] = xpos + squareSize;
    //topRightCorner[1] = ypos;
    //bottomLeftCorner[0] = xpos;
    //bottomLeftCorner[1] = ypos + squareSize;
    //bottomRightCorner[0] = xpos + squareSize;
    //bottomRightCorner[1] = ypos + squareSize;
  }
  
  public void debug()
  {
    fill(255);
    textSize(25);
    text("(" + (topLeftCorner[0] - squareSize) + ", " + (topLeftCorner[1] - squareSize) + ")", 100, 400);
    text("(" + (topRightCorner[0] - squareSize) + ", " + (topRightCorner[1] - squareSize) + ")", 250, 400); 
    text("(" + (bottomLeftCorner[0] - squareSize) + ", " + (bottomLeftCorner[1] - squareSize) + ")", 100, 525);
    text("(" + (bottomRightCorner[0] - squareSize) + ", " + (bottomRightCorner[1] - squareSize) + ")", 250, 525);
  }
  
  public void display()
  {
    fill(foodColor);
    square(xpos, ypos, squareSize);        
  }
}
