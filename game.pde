public class game
{
  private int width = 700, borderHeight = 700, inBounds = 650, height = 900;
  private int squareSize = 25;
  private int score = 0;
  private boolean gameLost = false;
  
  private int buttonWidth = 200;
  private int buttonHeight = 75;
  //parallel array for button coords. [0] = Yes (Game Over Menu), [1] = No (GOM)
  private int [] buttonXpos =     {width/2 - buttonWidth/2 - 5*buttonWidth/8, width/2 - buttonWidth/2 + 5*buttonWidth/8};
  private int [] buttonYpos =     {                    3*height/8           ,             3*height/8                   };
  private int [] buttonTextXpos = {      buttonXpos[0] + buttonWidth/4      ,       buttonXpos[1] + 5*buttonWidth/18   };
  private int [] buttonTextYpos = {      buttonYpos[0] + 5*buttonHeight/6   ,       buttonYpos[1] + 5*buttonHeight/6   };
  
  snake one = new snake ();
  food food = new food ();
  
  public void displayYesButton()
  {
    fill(0, 255, 0);
    rect(buttonXpos[0], buttonYpos[0], buttonWidth, buttonHeight);
    fill(0);
    textSize(75);
    textAlign(BASELINE);
    text("Yes", buttonTextXpos[0], buttonTextYpos[0]);
  }
  
  public void displayNoButton()
  {
    fill(255, 0, 0);
    rect(buttonXpos[1], buttonYpos[1], buttonWidth, buttonHeight);
    fill(0);
    textSize(75);
    textAlign(BASELINE);
    text("No", buttonTextXpos[1], buttonTextYpos[1]);
  }
  
  public boolean detectYesButtonClicked()
  {
    boolean clicked = false; 
    if(((mouseX >= buttonXpos[0] && mouseX <= buttonXpos[0] + buttonWidth && mouseY >= buttonYpos[0] && mouseY <= buttonYpos[0] + buttonHeight) && mousePressed) || (keyPressed && key == 'y'))
    {
      clicked = true;
      //background(0);
    }
    
    return clicked;
  }
  
  public boolean detectNoButtonClicked()
  {
    boolean clicked = false; 
    if(((mouseX >= buttonXpos[1] && mouseX <= buttonXpos[1] + buttonWidth && mouseY >= buttonYpos[1] && mouseY <= buttonYpos[1] + buttonHeight) && mousePressed) || (keyPressed && key == 'n'))
    {
      clicked = true;
      background(0);
    }
    
    return clicked;
  }
  
  public void lossScreen()
  {
    drawArena();
    one.drawSnake(one.getXpos(), one.getYpos());
    food.redrawFood(food.getXpos(), food.getYpos());
    one.setColorOOB();
    fill(0);
    textSize(100);
    textAlign(CENTER);
    stroke(10);
    text("Game Over!", width/2, width/4);
    fill(64);
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
    char direction = one.getDirection();
    
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
    int xpos = one.getXpos();
    int ypos = one.getYpos();
    
    fill(255, 0, 0);
    square(200, 775, 50);
    fill(0);
    circle(200, 775, 5);
    textSize(20);
    text("[" + (xpos - squareSize) + ", " + (ypos - squareSize)+ "]", 185, 850);
  }
  
  public void runGame()
  {
    if(!gameLost)
    {
      delay(50);
      one.storePosition();
      one.move();
      one.updatePosition();
      if(one.foodCollision(food))
      {
        food.updatePos();
        scoreIncrement();
      }
      if(one.wallCollision())
      {
        gameLost = true;
      }
      refreshScreen();
      one.drawUnit();
      food.display();
      //one.debugShowPreviousPos();
      //food.debug();
      showSnakePos();
      showFoodPos();
      //one.getDirection();
      displayScore();
      displayDirection();
    }
    else
    {
      lossScreen();
      displayYesButton();
      displayNoButton();
      if(detectYesButtonClicked())
      {
        gameLost = false;
        resetScore();
        one.resetSnake();
        one.resetVelocity();
      }
      if(detectNoButtonClicked())
      {
        gameLost = true;
      }
    }
  }
}