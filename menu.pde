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
    
    return mode;
  }

  public int changeThemeMenu()
  {
    int bwidth = 150;
    int bheight = 50;
    int mode = 4;
    Button defaultTheme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, height/4, 225, 255, 32, 'd', "Default");
    Button cmgTheme = new Button((float)bwidth, (float)bheight, width/2 - bwidth / 2, height/4 + bheight + bheight / 10, 255, 64, 64, 'c', "CMG");

    background(128);
    textAlign(CENTER);
    textSize(100);
    fill(0);
    text("Change Theme", width/2, height/8);
    textAlign(BASELINE);

    //default theme
    if (defaultTheme.keyboardButtonClicked() || (defaultTheme.mouseHoveringOverButton() && defaultTheme.buttonClicked()))
    {
      h.setInBoundsColor(196);
      h.setOutOfBoundsColor(128);
      head.setSnakeColorHeadCall(color(255, 0, 0));
      food.setFoodColor(color(225, 255, 32));
    }
    else if (defaultTheme.mouseHoveringOverButton())
    {
      defaultTheme.darkenButton();
    }
    else
    {
      defaultTheme.restoreButton();
    }

    //cool math games inspire theme
    if (cmgTheme.keyboardButtonClicked() || (cmgTheme.mouseHoveringOverButton() && cmgTheme.buttonClicked()))
    {
      h.setInBoundsColor(16);
      h.setOutOfBoundsColor(64);
      head.setSnakeColorHeadCall(color(96, 255, 96));
      food.setFoodColor(color(255, 0, 0));
    }
    else if (cmgTheme.mouseHoveringOverButton())
    {
      cmgTheme.darkenButton();
    }
    else
    {
      cmgTheme.restoreButton();
    }

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

  public void lossScreen(ArrayList<snakeBody> snake, food f, int ib, int ob, int tc)
  {
    List<snakeBody> bodySublist = snake.subList(1, snake.size());
    snakeHead head = (snakeHead)snake.get(0);

    fill(ob);
    square(0, 0, width);
    fill(ib);
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
    fill(tc);
    text("Game Over!", width/2, width/4);
    textSize(50);
    text("Play again?", width/2, 3*width/8);
  }
}
