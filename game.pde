import java.util.*;

public class game
{
  private int width = 700, borderHeight = 700, inBounds = 650, height = 900;
  private int squareSize = 25;
  private int score = 0;
  private int snakeSize = 1;
  private boolean gameLost = false;
  
  private int buttonWidth = 200;
  private int buttonHeight = 75;
  //parallel array for button coords. [0] = Yes (Game Over Menu), [1] = No (GOM)
  private int [] buttonXpos =     {width/2 - buttonWidth/2 - 5*buttonWidth/8, width/2 - buttonWidth/2 + 5*buttonWidth/8};
  private int [] buttonYpos =     {                    3*height/8           ,             3*height/8                   };
  private int [] buttonTextXpos = {      buttonXpos[0] + buttonWidth/4      ,       buttonXpos[1] + 5*buttonWidth/18   };
  private int [] buttonTextYpos = {      buttonYpos[0] + 5*buttonHeight/6   ,       buttonYpos[1] + 5*buttonHeight/6   };
  private color noBut = color(255, 150, 150);
  private color yesBut = color (150, 255, 150);
  
  Button yes = new Button(200, 75, ((700/2)-(200/2)-(5*200/8)), (3*900/8), 75, 0, 255, 0);
  Button no = new Button(200, 75, ((700/2)-(200/2)+(5*200/8)), (3*900/8), 75, 255, 0, 0);
  
  //snakeHead head = new snakeHead ();
  food food = new food ();
  ArrayList<snakeBody> snake = new ArrayList<snakeBody>();
  
  public game()
  {
    snake.add(new snakeHead());
  }
  
  public void displayYesButton()
  {
    fill(yesBut);
    rect(buttonXpos[0], buttonYpos[0], buttonWidth, buttonHeight);
    fill(0);
    textSize(75);
    textAlign(BASELINE);
    text("Yes", buttonTextXpos[0], buttonTextYpos[0]);
  }
  
  public void displayNoButton()
  {
    fill(noBut);
    rect(buttonXpos[1], buttonYpos[1], buttonWidth, buttonHeight);
    fill(0);
    textSize(75);
    textAlign(BASELINE);
    text("No", buttonTextXpos[1], buttonTextYpos[1]);
  }
  
  public boolean detectYesButtonClicked()
  {
    boolean clicked = false; 
    if(keyPressed && key == 'y')
    {
      clicked = true;
    }
    else if((mouseX >= buttonXpos[0] && mouseX <= buttonXpos[0] + buttonWidth && mouseY >= buttonYpos[0] && mouseY <= buttonYpos[0] + buttonHeight))
    {
      yesBut = color(0, 255, 0);
      if(mousePressed)
      {
        clicked = true;
      }
    }
    else
    {
      yesBut = color(150, 255, 150);
    }
    return clicked;
  }
  
  public boolean detectNoButtonClicked()
  {
    
    boolean clicked = false; 
    if(keyPressed && key == 'n')
    {
      clicked = true;
    }
    else if((mouseX >= buttonXpos[1] && mouseX <= buttonXpos[1] + buttonWidth && mouseY >= buttonYpos[1] && mouseY <= buttonYpos[1] + buttonHeight))
    {
      noBut = color(255, 0, 0);
      if(mousePressed)
      {
        clicked = true;
      }
    }
    else
    {
      noBut = color(255, 150, 150);
    }
    return clicked;
  }
  
  public void lossScreen()
  {
    drawArena();
    snake.get(0).drawSnake(snake.get(0).getXpos(), snake.get(0).getYpos());
    food.redrawFood(food.getXpos(), food.getYpos());
    snake.get(0).setColorOOB();
    fill(0);
    textSize(100);
    textAlign(CENTER);
    stroke(10);
    text("Game Over!", width/2, width/4);
    fill(32);
    textSize(50);
    text("Play again?", width/2, 3*width/8);
  }
  
  public void drawArena()
  {
    //Out of bounds
    fill(128);
    square(0, 0, width);
    //Inner square 
    fill(196);
    square(0 + squareSize, 0 + squareSize, inBounds);
  }
  
  public void drawHUD()
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
    drawHUD();
  }
  
  public void refreshScreen()
  {
    drawScreenFrame();
  }
  
  public void scoreIncrement()
  {
    score++;
  }
  
  public void resetScore()
  {
    score = 0 ;
  }
  
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
  
  public void displayScore()
  {
    fill(0);
    textSize(25);
    text("Score: " + score, 500, 800);
  }
  
  public void displayDirection()
  {
    char direction = snake.get(0).getDirection();
    
    textSize(25);
    fill(0);
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
  }
  
  public void showFoodPos()
  {
    int xpos = food.getXpos();
    int ypos = food.getYpos();
    
    fill(225, 255, 32);
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
    
    fill(255, 0, 0);
    square(200, 775, 50);
    fill(0);
    circle(200, 775, 5);
    textSize(20);
    text("[" + (xpos - squareSize) + ", " + (ypos - squareSize)+ "]", 185, 850);
  }
  
  public void resetGame()
  {
    resetScore();
    food.updatePos();
    snake.get(0).resetSnake();
  }
  
  public void increaseSnakeSize()
  {
    snakeSize++;
    snake.add(new snakeBody());
  }
  
  public void runGame()
  {
    if(!gameLost)
    {
      delay(50);
      for(snakeBody s : snake)
      {
        s.storePosition();
      }
      snake.get(0).move();
      for(snakeBody s : snake)
      {
        s.updatePosition();
      }
      if(snake.get(0) instanceof snakeHead)
      {
        snakeHead head = (snakeHead) snake.get(0);
        if(head.foodCollision(food))
        {
          food.updatePos();
          scoreIncrement();
          //increaseSnakeSize();
        }
      }
      if(snake.get(0).wallCollision())
      {
        gameLost = true;
      }
      refreshScreen();
      for(snakeBody s : snake)
      {
        s.drawUnit();
      }
      food.display();
      showSnakePos();
      showFoodPos();
      displayScore();
      displayDirection();
    }
    else
    {
      lossScreen();
      if (yes.keyboardButtonClicked('y') || (yes.mouseHoveringOverButton() && yes.buttonClicked()))
      {
        gameLost = false;
        resetGame();
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
