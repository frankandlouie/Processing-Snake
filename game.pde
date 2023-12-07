import java.util.*;

public class game
{
  //private int width = 700, borderHeight = 700, inBounds = 650, height = 900;
  final private int width = 700, height = 900;
  
  private int squareSize = 25;
  private int bestSize = 0;
  private int snakeSize = 1;
  private boolean gameLost = false;
  
  private int borderHeight = width;
  private int inBounds = width - squareSize * 2;
  
  private int buttonWidth = 200;
  private int buttonHeight = 75;
  //parallel array for button coords. [0] = Yes (Game Over Menu), [1] = No (GOM)
  private int [] buttonXpos =     {width/2 - buttonWidth/2 - 5*buttonWidth/8, width/2 - buttonWidth/2 + 5*buttonWidth/8};
  private int [] buttonYpos =     {                    3*height/8           ,             3*height/8                   };
  private int [] buttonTextXpos = {      buttonXpos[0] + buttonWidth/4      ,       buttonXpos[1] + 5*buttonWidth/18   };
  private int [] buttonTextYpos = {      buttonYpos[0] + 5*buttonHeight/6   ,       buttonYpos[1] + 5*buttonHeight/6   };
  
  Button yes = new Button(buttonWidth, buttonHeight, buttonXpos[0], buttonYpos[0], 0, 255, 0, "YES");
  Button no = new Button(buttonWidth, buttonHeight, buttonXpos[1], buttonYpos[1], 255, 0, 0, "NO");

  //snakeHead head = new snakeHead ();
  food food = new food ();
  ArrayList<snakeBody> snake = new ArrayList<snakeBody>();
  menu menu = new menu(width, height, inBounds);
  
  public game()
  {
    snake.add(new snakeHead());
  }
  
  //public void lossScreen()
  //{
  //  List<snakeBody> bodySublist = snake.subList(1, snake.size());
  //  snakeHead head = (snakeHead)snake.get(0);

  //  drawArena();
  //  for(snakeBody s : bodySublist)
  //  {
  //    s.drawUnit();
  //  }
  //  food.display(food.getXpos(), food.getYpos());
  //  head.setColorWhite();
  //  head.drawSnake(head.getXpos(), head.getYpos());
    
  //  fill(0);
  //  textSize(100);
  //  textAlign(CENTER);
  //  stroke(10);
  //  text("Game Over!", width/2, width/4);
  //  fill(32);
  //  textSize(50);
  //  text("Play again?", width/2, 3*width/8);
  //}
  
  public void drawArena()
  {
    //Out of bounds
    fill(128);
    square(0, 0, width);
    //Inner square 
    fill(196);
    square(0 + squareSize, 0 + squareSize, inBounds);
  }
  
  public void drawHUDframe()
  {
    //Score area
    fill(196);
    rect(3*width/5, borderHeight, 2*width/5, height - borderHeight);
    //Direction sub heading
    fill(196);
    rect(0, borderHeight, width/5, height - borderHeight);
    //Direction area
    fill(164);
    rect(0, borderHeight, width/5, (height - borderHeight)/5);
    //Snake pos area
    fill(196);
    rect(width/5, borderHeight, 2*width/5, height - borderHeight);
  }
  
  public void drawScreenFrame()
  {
    drawArena();
    drawHUDframe();
    showHUD();
  }
  
  public void refreshScreen()
  {
    drawScreenFrame();
  }
  
  //public void scoreIncrement()
  //{
  //  score++;
  //}
  
  public void bestSizeCalculator()
  {
    if(snakeSize > bestSize)
    {
      bestSize = snakeSize;
    }
  }
  
  //public void resetScore()
  //{
  //  score = 0 ;
  //}
  
  //public void loseGame()
  //{
  //  //lossMenu();
  //  //boolean restartGame = false;
  //  //if(!restartGame)
  //  //{
  //  //  one.setXpos(one.getXpos());
  //  //  one.setYpos(one.getYpos());
  //  //  food.setXpos(food.getXpos());
  //  //  food.setYpos(food.getYpos());
  //  //  one.redrawSnake(one.getXpos(), one.getYpos());
  //  //  food.redrawFood(food.getXpos(), food.getYpos());
  //  //  drawScreenFrame();
  //  //  //noLoop();
  //  //}
  //}
  
  //public void displayScore()
  //{
  //  fill(0);
  //  textSize(25);
  //  textAlign(BASELINE);
  //  text("Score: " + score, 500, 775);
  //}
  
  public void displayBestSize()
  {
    fill(0);
    textSize(25);
    textAlign(BASELINE);
    text("Best: " + bestSize, 500, 825);
  }
  
  public void displaySize()
  {
    fill(0);
    textSize(25);
    textAlign(BASELINE);
    text("Size: " + snakeSize, 500, 775);
  }
  
  public void displayDirection()
  {
    snakeHead head = (snakeHead)snake.get(0);
    
    char direction = head.getDirection();
    
    fill(0);
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
  
  public void showFoodPos()
  {
    int xpos = food.getXpos();
    int ypos = food.getYpos();
    
    fill(food.getFoodColor());
    square(315, 775, 50);
    fill(0);
    circle(315, 775, 5);
    textSize(20);
    text("[" + (xpos - squareSize) + ", " + (ypos - squareSize)+ "]", 300, 850);
  }
  
  public void showSnakePos()
  {
    int xpos = snake.get(0).getXpos();
    int ypos = snake.get(0).getYpos();
    
    fill(snake.get(0).getSnakeColor());
    square(200, 775, 50);
    fill(0);
    circle(200, 775, 5);
    textSize(20);
    textAlign(BASELINE);
    text("[" + (xpos - squareSize) + ", " + (ypos - squareSize)+ "]", 185, 850);
  }
  
  private void showHUD()
  {
    showSnakePos();
    showFoodPos();
    displayBestSize();
    displaySize();
    displayDirection();
  }
  
  public void resetGame(snakeHead head)
  {
    //resetScore();
    snakeSize = 1;
    food.updatePos();
    head.reset();
    resetSnakeSize();
    refreshScreen();
  }
  
  public void increaseSnakeSize()
  {
    for(int i = 0; i < 4; i++)
    {
      snakeSize++;
      snake.add(new snakeBody());
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
    if(true)
    {
      menu.mainMenu();
    }
    else
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
        //for(snakeBody s : snake)
        //{
        //  s.updatePosition();
        //}
        head.updatePosition();
        for (int i = snake.size() - 1; i > 0; i--) 
        {
          snake.get(i).setXpos(snake.get(i-1).getPreviousXpos());
          snake.get(i).setYpos(snake.get(i-1).getPreviousYpos());
        }
        if(head.foodCollision(food))
        {
          for(snakeBody s : snake)
          {
            food.updatePos(s);
          }
          //scoreIncrement();
          increaseSnakeSize();
        }
        if(snake.size() > 5)
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
        
        refreshScreen();
        
        for(snakeBody s : snake)
        {
          s.drawUnit();
        }
        food.display();
      }
      else
      {
        bestSizeCalculator();
        //lossScreen();
        menu.lossScreen(snake, food);
        if (yes.keyboardButtonClicked('y') || (yes.mouseHoveringOverButton() && yes.buttonClicked()))
        {
          gameLost = false;
          resetGame(head);
        } 
        else if (yes.mouseHoveringOverButton()) 
        {
          yes.darkenButton();
        } 
        else 
        {
          yes.restoreButton();
        }
        if(no.keyboardButtonClicked('n') || (no.mouseHoveringOverButton() && no.buttonClicked()))
        {
          exit();
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
