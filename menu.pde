import java.util.*;

public class menu
{
  final private int width;
  final private int height;
  final private int inBounds;
  private snakeHead head;
  private food food;
  private hud h;
  //hard coded fix later
  Button goBack = new Button((float)50, (float)50, (float)0 + 10, (float)900 - 60, 216, 216, 216, 'g', "goBack");

  public menu(int w, int h, int ib, snakeHead s, food f, hud hd)
  {
    width = w;
    height = h;
    inBounds = ib;
    head = s;
    food = f;
    this.h = hd;
  }

  public void mmContinue()
  {
  }

  public int mainMenu()
  {
    int bwidth = 150;
    int bheight = 50;
    // 1 = playgame; 2 = settings menu
    int mode = 0;
    Button play = new Button(bwidth, bheight, (width/2 - bwidth/2), (height/2 - bheight/2), 96, 255, 96, 'p', "PLAY");
    Button exit = new Button(bwidth, bheight, (width/2 - bwidth/2), (height/2 - bheight/2) + (bheight + bheight / 4), 255, 96, 96, 'e', "EXIT");
    //hard coded fix later
    Button settings = new Button((float)50, (float)50, (float)0 + 10, (float)900 - 60, 216, 216, 216, 's', "Settings");

    background(128);
    textAlign(CENTER);
    textSize(125);
    fill(0);
    text("SNAKE", width/2, height/8);
    textAlign(BASELINE);

    if(play.interaction())
    {
      mode = 1;
    }
    
    if(exit.interaction())
    {
      exit();
    }
    
    if(settings.interaction())
    {
      mode = 2;
    }
    
    play.drawButton();
    exit.drawButton();
    settings.drawButton();

    return mode;
  }

  public int settingsMenu()
  {
    int bwidth = 160;
    int bheight = 50;

    Button htp = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, height/4, 216, 216, 216, 'h', "How to play!");
    Button changeTheme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, height/4 + bheight + bheight / 10, 216, 216, 216, 'c', "Change Theme");

    background(128);
    textAlign(CENTER);
    textSize(125);
    fill(0);
    text("Settings", width/2, height/8);
    textAlign(BASELINE);

    //0 = main menu; 1 = play game; 2 = settings; > 2 = more settings
    int mode = 2;

    if(goBack.interaction())
    {
      mode = 0;
    }
    
    if(changeTheme.interaction())
    {
      mode = 4;
    }
    
    if(htp.interaction())
    {
      mode = 3;
    }

    goBack.drawButton();
    htp.drawButton();
    changeTheme.drawButton();

    return mode;
  }

  public int htpMenu()
  {
    int mode = 3;
    
    background(128);
    textAlign(CENTER);
    textSize(100);
    fill(0);
    text("How To Play", width/2, height/8);
    textAlign(BASELINE);
    
    textSize(45);
    text("'W' key = Move North", width / 10, 2 * height / 10);
    text("'A' key = Move West", width / 10, 3 * height / 10);
    text("'S' key = Move East", width / 10, 4 * height / 10);
    text("'D' key = Move South", width / 10, 5 * height / 10);
    text("Collect the food to grow!", width / 10, 6 * height / 10);
    text("Get to your highest size!", width / 10, 7 * height / 10);
    
    if(goBack.interaction())
    {
      mode = 2;
    }
    
    goBack.drawButton();
    
    return mode;
  }

  public int changeThemeMenu()
  {
    int bwidth = 150;
    int bheight = 50;
    float button1y = height / 4;
    float nextButtonY = bheight + bheight / 10;
    float button2y = button1y + nextButtonY;
    float button3y = button2y + nextButtonY;
    int mode = 4;
    Button defaultTheme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, button1y, 225, 255, 32, 'd', "Default");
    Button cmgTheme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, button2y, 255, 64, 64, 'c', "CMG");
    Button cmg2Theme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, button3y, 0, 255, 255, '2', "CMG2");

    background(128);
    textAlign(CENTER);
    textSize(100);
    fill(0);
    text("Change Theme", width/2, height/8);
    textAlign(BASELINE);
    
    if(defaultTheme.interaction())
    {
      h.setInBoundsColor(196);
      h.setOutOfBoundsColor(128);
      head.setSnakeColorHeadCall(color(255, 0, 0));
      food.setFoodColor(color(225, 255, 32));
    }
    
    if(cmgTheme.interaction())
    {
      h.setInBoundsColor(16);
      h.setOutOfBoundsColor(64);
      head.setSnakeColorHeadCall(color(96, 255, 96));
      food.setFoodColor(color(255, 0, 0));
    }
    
    if(cmg2Theme.interaction())
    {
      h.setInBoundsColor(16);
      h.setOutOfBoundsColor(64);
      head.setSnakeColorHeadCall(color(0, 255, 255));
      food.setFoodColor(color(255, 0, 0));
    }
    
    if(goBack.interaction())
    {
      mode = 2;
    }

    goBack.drawButton();
    defaultTheme.drawButton();
    cmgTheme.drawButton();
    cmg2Theme.drawButton();
    return mode;
  }

  public int lossScreen(ArrayList<snakeBody> snake, food f, int ib, int ob, int tc)
  {
    int buttonWidth = 200;
    int buttonHeight = 75;
    int [] buttonXpos =     {width/2 - buttonWidth/2 - 5*buttonWidth/8, width/2 - buttonWidth/2 + 5*buttonWidth/8};
    int [] buttonYpos =     {                    3*height/8           ,             3*height/8                   };
    //private int [] buttonTextXpos = {      buttonXpos[0] + buttonWidth/4      ,       buttonXpos[1] + 5*buttonWidth/18   };
    //private int [] buttonTextYpos = {      buttonYpos[0] + 5*buttonHeight/6   ,       buttonYpos[1] + 5*buttonHeight/6   };
    
    Button yes = new Button(buttonWidth, buttonHeight, buttonXpos[0], buttonYpos[0], 0, 255, 0, 'y', "YES");
    Button no = new Button(buttonWidth, buttonHeight, buttonXpos[1], buttonYpos[1], 255, 0, 0, 'n', "NO");
    List<snakeBody> bodySublist = snake.subList(1, snake.size());
    snakeHead head = (snakeHead)snake.get(0);
    
    if(yes.interaction())
    {
      return 1;
    }
    if(no.interaction())
    {
      return 2;
    }

    for (snakeBody s : bodySublist)
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
    fill(tc);
    text("Game Over!", width/2, width/4);
    textSize(50);
    text("Play again?", width/2, 3*width/8);
    
    yes.drawButton();
    no.drawButton();
    
    return 0;
  }
}
