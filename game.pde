import java.util.*;

public class game
{
  //private int width = 700, borderHeight = 700, inBounds = 650, height = 900;
  final private int width = 700, height = 900;
  
  private int squareSize = 25;
  private int bestSize = 0;
  private int snakeSize = 1;
  private boolean gameLost = false;
  // 1 = playgame; 2 = settings menu; >2 = more settings stuff
  private int mode = 0;
  
  private int borderHeight = width;
  private int inBounds = width - squareSize * 2;
  private color inBoundsColor;
  private color outOfBoundsColor;
  
  private int buttonWidth = 200;
  private int buttonHeight = 75;
  //parallel array for button coords. [0] = Yes (Game Over Menu), [1] = No (GOM)
  private int [] buttonXpos =     {width/2 - buttonWidth/2 - 5*buttonWidth/8, width/2 - buttonWidth/2 + 5*buttonWidth/8};
  private int [] buttonYpos =     {                    3*height/8           ,             3*height/8                   };
  private int [] buttonTextXpos = {      buttonXpos[0] + buttonWidth/4      ,       buttonXpos[1] + 5*buttonWidth/18   };
  private int [] buttonTextYpos = {      buttonYpos[0] + 5*buttonHeight/6   ,       buttonYpos[1] + 5*buttonHeight/6   };
  
  Button yes = new Button(buttonWidth, buttonHeight, buttonXpos[0], buttonYpos[0], 0, 255, 0, 'y', "YES");
  Button no = new Button(buttonWidth, buttonHeight, buttonXpos[1], buttonYpos[1], 255, 0, 0, 'n', "NO");

  hud hud = new hud ();
  food food = new food ();
  ArrayList<snakeBody> snake = new ArrayList<snakeBody>();
  
  public game()
  {
    snake.add(new snakeHead());
  }
  
  public void setInBoundsColor(color c)
  {
    inBoundsColor = c;
  }
  
  public void setOutOfBoundsColor(color c)
  {
    outOfBoundsColor = c;
  }
  
  public void refreshScreen(int snakeX, int snakeY, color snakeColor, int foodX, int foodY, color foodColor, int bestSize, int snakeSize, char snakeDirection)
  {
    //drawScreenFrame();
    hud.refreshScreen(snakeX, snakeY, snakeColor, foodX, foodY, foodColor, bestSize, snakeSize, snakeDirection);
  }
  
  public void bestSizeCalculator()
  {
    if(snakeSize > bestSize)
    {
      bestSize = snakeSize;
    }
  }
  
  public void resetGame(snakeHead head)
  {
    //resetScore();
    snakeSize = 1;
    food.updatePos();
    head.reset();
    resetSnakeSize();
    refreshScreen(head.getXpos(), head.getYpos(), head.getSnakeColor(), food.getXpos(), food.getYpos(), food.getColor(), bestSize, snake.size(), head.getDirection());
  }
  
  public void increaseSnakeSize(snakeHead sh)
  {
    for(int i = 0; i < 4; i++)
    {
      snakeSize++;
      snake.add(new snakeBody(sh.getSnakeColor()));
    }
  }
  
  public void resetSnakeSize()
  {
    // Create a sublist from index 1 to the end
    List<snakeBody> bodySublist = snake.subList(1, snake.size());

    // Clear the sublist
    bodySublist.clear();
  }
  
  public void runGame()
  {
    menu menu = new menu(width, height, inBounds, (snakeHead)snake.get(0), food, hud);
    //if(!menu.mainMenu())
    if(mode == 0)
    {
      mode = menu.mainMenu();
    }
    else if (mode == 2)
    {
      mode = menu.settingsMenu();
    }
    else if (mode == 3)
    {
      mode = menu.htpMenu();
    }
    else if (mode == 4)
    {
      mode = menu.changeThemeMenu();
    }
    else if (mode == 1)
    {
      snakeHead head = (snakeHead)snake.get(0);
      if(!gameLost)
      {
        delay(50);
        head.storePosition();
        for(snakeBody s : snake)
        {
          s.storePosition();
        }
        head.move();
        head.updatePosition();
        for (int i = snake.size() - 1; i > 0; i--) 
        {
          snake.get(i).setXpos(snake.get(i-1).getPreviousXpos());
          snake.get(i).setYpos(snake.get(i-1).getPreviousYpos());
        }
        if(head.foodCollision(food))
        {
          food.updatePos(snake);
          increaseSnakeSize((snakeHead)snake.get(0));
        }
        if(snake.size() > 1)
        {
          List<snakeBody> bodySublist = snake.subList(1, snake.size());
          for(snakeBody s : bodySublist)
          {
            if(head.selfCollision(s))
            {
              gameLost = true;
            }
          }
        }
        if(head.wallCollision())
        {
          gameLost = true;
        }
        
        refreshScreen(snake.get(0).getXpos(), snake.get(0).getYpos(), snake.get(0).getSnakeColor(), food.getXpos(), food.getYpos(), food.getColor(), bestSize, snake.size(), ((snakeHead)snake.get(0)).getDirection());
        
        for(snakeBody s : snake)
        {
          s.drawUnit();
        }
        food.display();
      }
      else
      {
        bestSizeCalculator();
        menu.lossScreen(snake, food, hud.getIBColor(), hud.getOBColor(), hud.getTextColor());
        if (yes.keyboardButtonClicked() || (yes.mouseHoveringOverButton() && yes.buttonClicked()))
        {
          resetGame(head);
          gameLost = false;
        } 
        else if (yes.mouseHoveringOverButton()) 
        {
          yes.darkenButton();
        }
        else 
        {
          yes.restoreButton();
        }
        if(no.keyboardButtonClicked() || (no.mouseHoveringOverButton() && no.buttonClicked()))
        {
          resetGame(head);
          mode = 0;
          gameLost = false;
        }
        else if (no.mouseHoveringOverButton())
        {
          no.darkenButton();
        }
        else
        {
          no.restoreButton();
        }
        yes.drawButton();
        no.drawButton();
      }
    }
  }
}
