import java.util.*;

public class theme
{
  private color snakeColor;
  private color foodColor;
  private color outOfBoundsColor;
  private color inBoundsColor;
  private color textColor;
  
  public theme()
  {
    snakeColor = color(255, 0, 0);
    foodColor = color(225, 255, 32);
    outOfBoundsColor = color(128);
    inBoundsColor = color(196);
    textColor = color(0);
  }
  
  public void defaultTheme()
  {
    snakeColor = color(255, 0, 0);
    foodColor = color(225, 255, 32);
    outOfBoundsColor = color(128);
    inBoundsColor = color(196);
    textColor = color(0);
  }
  
  
  public void coolMathGamesTheme()
  {
    snakeColor = color(96, 255, 96);
    foodColor = color(255, 0, 0);
    outOfBoundsColor = color(32);
    inBoundsColor = color(96);
    textColor = color(255);
  }
}
