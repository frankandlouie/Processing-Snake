import java.util.*;

public class theme
{
  private color snakeColor;
  private color foodColor;
  private color outOfBoundsColor;
  private color inBoundsColor;
  private color textColor;
  
<<<<<<< HEAD
  public theme(){}
  
  public void defaultTheme(snakeBody s, food f, game g)
  {
    //snakeColor = color(255, 0, 0);
    //foodColor = color(225, 255, 32);
    //outOfBoundsColor = color(128);
    //inBoundsColor = color(196);
    //textColor = color(0);
    
    s.setSnakeColor(color(255, 0, 0));
    f.setFoodColor(color(225, 255, 32));
    g.setOutOfBoundsColor(color(128));
    g.setInBoundsColor(color(196));
=======
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
>>>>>>> master
    textColor = color(0);
  }
  
  
<<<<<<< HEAD
  public void coolMathGamesTheme(snakeBody s, food f, game g)
  {
    //snakeColor = color(96, 255, 96);
    //foodColor = color(255, 0, 0);
    //outOfBoundsColor = color(32);
    //inBoundsColor = color(96);
    //textColor = color(255);
    
    s.setSnakeColor(color(96, 255, 96));
    f.setFoodColor(color(255, 0, 0));
    g.setOutOfBoundsColor(color(32));
    g.setInBoundsColor(color(96));
    textColor = color(0);
  }
  
  public color getSnakeColor()
  {
    return snakeColor;
  }
  
  public color getFoodColor()
  {
    return foodColor;
  }
  
  public color getOutOfBoundsColor()
  {
    return outOfBoundsColor;
  }
  
  public color getInBoundsColor()
  {
    return inBoundsColor;
  }
  
  public color getTextColor()
  {
    return textColor;
=======
  public void coolMathGamesTheme()
  {
    snakeColor = color(96, 255, 96);
    foodColor = color(255, 0, 0);
    outOfBoundsColor = color(32);
    inBoundsColor = color(96);
    textColor = color(255);
>>>>>>> master
  }
}
