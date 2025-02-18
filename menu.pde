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
  
  public boolean mainMenu()
  {
    //public Button(float width, float height, float xPos, float yPos, int R, int G, int B, String buttonText)
    int bwidth = 150;
    int bheight = 50;
    boolean playGame = false;
    Button play = new Button(bwidth, bheight, (width/2 - bwidth/2), (height/2 - bheight/2), 0, 255, 0, 'p', "PLAY");
    Button exit = new Button(bwidth, bheight, (width/2 - bwidth/2), (height/2 - bheight/2) + (bheight + bheight / 4), 255, 0, 0, 'e', "EXIT");
      
    background(128);
    textAlign(CENTER);
    textSize(125);
    fill(0);
    text("SNAKE", width/2, height/8);
    textAlign(BASELINE);
    
    if (play.keyboardButtonClicked() || (play.mouseHoveringOverButton() && play.buttonClicked()))
    {
      playGame = true;
    } 
    else if (play.mouseHoveringOverButton()) 
    {
      play.darkenButton();
    } 
    else 
    {
      play.restoreButton();
    }
    
    if (exit.keyboardButtonClicked() || (exit.mouseHoveringOverButton() && exit.buttonClicked()))
    {
      exit();
    } 
    else if (exit.mouseHoveringOverButton()) 
    {
      exit.darkenButton();
    } 
    else 
    {
      exit.restoreButton();
    }
    play.drawButton();
    exit.drawButton();
    return playGame;
  }
  
  public void lossScreen(ArrayList<snakeBody> snake, food f)
  {
    List<snakeBody> bodySublist = snake.subList(1, snake.size());
    snakeHead head = (snakeHead)snake.get(0);

    //Out of bounds
    fill(128);
    //fill(32);
    square(0, 0, width);
    //Inner square 
    fill(196);
    //fill(96);
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
