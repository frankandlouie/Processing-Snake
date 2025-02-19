import java.util.*;

public class menu
{
  final private int width;
  final private int height;
  final private int inBounds;
  private int mode = 0;
  Button goBack = new Button((float)50, (float)50, (float)0 + 10, (float)900 - 60, 216, 216, 216, 'g', "goBack");

  public menu(int w, int h, int ib)
  {
    width = w;
    height = h;
    inBounds = ib;
  }

  public void mmContinue()
  {
  }

  public int mainMenu()
  {
    //public Button(float width, float height, float xPos, float yPos, int R, int G, int B, String buttonText)
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

    if (play.keyboardButtonClicked() || (play.mouseHoveringOverButton() && play.buttonClicked()))
    {
      mode = 1;
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

    if (settings.keyboardButtonClicked() || (settings.mouseHoveringOverButton() && settings.buttonClicked()))
    {
      mode = 2;
    } 
    else if (settings.mouseHoveringOverButton())
    {
      settings.darkenButton();
    } 
    else
    {
      settings.restoreButton();
    }

    play.drawButton();
    exit.drawButton();
    settings.drawButton();

    return mode;
  }

  public int settingsMenu()
  {
    //public Button(float width, float height, float xPos, float yPos, int R, int G, int B, String buttonText)
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

    //textSize(25);
    //textAlign(LEFT);
    //text("Change Theme", width/20, height/4);
    
    //2 = settings; >2 = more settings
    int mode = 2;

    if (goBack.keyboardButtonClicked() || (goBack.mouseHoveringOverButton() && goBack.buttonClicked()))
    {
      mode = 0;
    } 
    else if (goBack.mouseHoveringOverButton())
    {
      goBack.darkenButton();
    } 
    else
    {
      goBack.restoreButton();
    }
    
    if (changeTheme.keyboardButtonClicked() || (changeTheme.mouseHoveringOverButton() && changeTheme.buttonClicked()))
    {
      //changeThemeMenu();
      mode = 4;
    } 
    else if (changeTheme.mouseHoveringOverButton())
    {
      changeTheme.darkenButton();
    } 
    else
    {
      changeTheme.restoreButton();
    }
    
    if (htp.keyboardButtonClicked() || (htp.mouseHoveringOverButton() && htp.buttonClicked()))
    {
      //htpMenu();
      mode = 3;
    } 
    else if (htp.mouseHoveringOverButton())
    {
      htp.darkenButton();
    } 
    else
    {
      htp.restoreButton();
    }

    goBack.drawButton();
    htp.drawButton();
    changeTheme.drawButton();

    return mode;
  }

  public int htpMenu()
  {
    return 3;
  }
  
  public int changeThemeMenu()
  {
    int bwidth = 150;
    int bheight = 50;
    int mode = 4;
    Button defaultTheme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, height/4, 225, 255, 32, 'd', "Default");
    Button cmgTheme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, height/4 + bheight + bheight / 10, 255, 64, 64, 'd', "CMG");
    
    background(128);
    textAlign(CENTER);
    textSize(125);
    fill(0);
    text("Change Theme", width/2, height/8);
    textAlign(BASELINE);
    
    if (goBack.keyboardButtonClicked() || (goBack.mouseHoveringOverButton() && goBack.buttonClicked()))
    {
      mode = 2;
    } 
    else if (goBack.mouseHoveringOverButton())
    {
      goBack.darkenButton();
    } 
    else
    {
      goBack.restoreButton();
    }

    goBack.drawButton();
    defaultTheme.drawButton();
    cmgTheme.drawButton();
    return mode;
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
    text("Game Over!", width/2, width/4);
    fill(32);
    textSize(50);
    text("Play again?", width/2, 3*width/8);
  }
}
