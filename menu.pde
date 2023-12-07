import java.util.*;

public class menu
{
  final private int width;
  final private int height;
  final private int inBounds;
  
  public menu(int w, int h, int ib)
  {
    width = w;
    height = h;
    inBounds = ib;
  }
  
  public void mmContinue()
  {
    
  }
  
  public void mainMenu()
  {
    background(196, 132, 255);
    textSize(125);
    textAlign(CENTER);
    fill(0);
    text("SNAKE", width/2, height/8);
    textAlign(BASELINE);
  }
  
  public void lossScreen(ArrayList<snakeBody> snake, food f)
  {
    List<snakeBody> bodySublist = snake.subList(1, snake.size());
    snakeHead head = (snakeHead)snake.get(0);

    //Out of bounds
    fill(128);
    square(0, 0, width);
    //Inner square 
    fill(196);
    square(0 + head.getSnakeSize(), 0 + head.getSnakeSize(), inBounds);
    
    for(snakeBody s : bodySublist)
    {
      s.drawUnit();
    }
    f.display(f.getXpos(), f.getYpos());
    head.setColorWhite();
    head.drawSnake(head.getXpos(), head.getYpos());
    
    fill(0);
    textSize(100);
    textAlign(CENTER);
    stroke(10);
    text("Game Over!", width/2, width/4);
    fill(32);
    textSize(50);
    text("Play again?", width/2, 3*width/8);
  }
  
}
