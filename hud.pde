import java.util.*;

public class hud
{
  final private int width = 700, height = 900;
  
  private int squareSize = 25;
  private int borderHeight = width;
  private int inBounds = width - squareSize * 2;
  
  private int inBoundsColor = 196;
  private int outOfBoundsColor = 128;
  
  private int textColor = 1;
  
  public hud () {}
  
  public int getIBColor()
  {
    return inBoundsColor;
  }
  
  public int getOBColor()
  {
    return outOfBoundsColor;
  }
  
  public int getTextColor()
  {
    return textColor;
  }
  
  ///*
  public void setInBoundsColor(color c)
  {
    inBoundsColor = c;
    if(red(c) < 40 && green(c) < 40 && blue(c) < 40)
    {
      textColor = 196;
    }
    else
    {
      textColor = 1;
    }
  }
  
  public void setOutOfBoundsColor(color c)
  {
    outOfBoundsColor = c;
  }
  
  public void drawArena()
  {
    fill(outOfBoundsColor);
    square(0, 0, width);
    fill(inBoundsColor);
    square(0 + squareSize, 0 + squareSize, inBounds);
  }
  
  public void drawHUDframe()
  {
    fill(inBoundsColor);
    rect(3*width/5, borderHeight, 2*width/5, height - borderHeight);
    fill(inBoundsColor);
    rect(0, borderHeight, width/5, height - borderHeight);
    fill(outOfBoundsColor);
    rect(0, borderHeight, width/5, (height - borderHeight)/5);
    fill(inBoundsColor);
    rect(width/5, borderHeight, 2*width/5, height - borderHeight);
  }
  
  public void refreshScreen(int snakeX, int snakeY, color snakeColor, int foodX, int foodY, color foodColor, int bestSize, int snakeSize, char snakeDirection)
  {
    drawArena();
    drawHUDframe();
    showHUD(snakeX, snakeY, snakeColor, foodX, foodY, foodColor, bestSize, snakeSize, snakeDirection);
  }
  
  public void displayBestSize(int bestSize)
  {
    fill(textColor);
    textSize(25);
    textAlign(BASELINE);
    text("Best: " + bestSize, 500, 825);
  }
  
  public void displaySize(int snakeSize)
  {
    fill(textColor);
    textSize(25);
    textAlign(BASELINE);
    text("Size: " + snakeSize, 500, 775);
  }
  
  public void displayDirection(char d)
  {
    char direction = d;
    
    fill(textColor);
    textSize(25);
    textAlign(BASELINE);
    text("Direction", 10, 725);
    if(direction == 'n')
    {
      text("Heading\nNorth", 25, 775);
    }
    else if(direction == 's')
    {
      text("Heading\nSouth", 25, 775);
    }
    else if(direction == 'e')
    {
      text("Heading\nEast", 25, 775);
    }
    else if(direction == 'w')
    {
      text("Heading\nWest", 25, 775);
    }
    else
    {}
  }
  
  public void showFoodPos(int xPos, int yPos, color c)
  {
    int xpos = xPos;
    int ypos = yPos;
    
    fill(c);
    square(315, 775, 50);
    fill(textColor);
    circle(315, 775, 5);
    textSize(20);
    text("[" + (xpos - squareSize) + ", " + (ypos - squareSize)+ "]", 300, 850);
  }
  
  public void showSnakePos(int xPos, int yPos, color c)
  {
    int xpos = xPos;
    int ypos = yPos;
    
    fill(c);
    square(200, 775, 50);
    fill(textColor);
    circle(200, 775, 5);
    textSize(20);
    textAlign(BASELINE);
    text("[" + (xpos - squareSize) + ", " + (ypos - squareSize)+ "]", 185, 850);
  }
  
  private void showHUD(int snakeX, int snakeY, color snakeColor, int foodX, int foodY, color foodColor, int bestSize, int snakeSize, char snakeDirection)
  {
    showSnakePos(snakeX, snakeY, snakeColor);
    showFoodPos(foodX, foodY, foodColor);
    displayBestSize(bestSize);
    displaySize(snakeSize);
    displayDirection(snakeDirection);
  }  
}
