import java.util.*;

public class Button
{
  private float width = 0;
  private float height = 0;
  private float xPos = 0;
  private float yPos = 0;
  private String text = " ";
  private int textSize = 30;
  private int colorR = 0;
  private int colorG = 0;
  private int colorB = 0;
  private color currentColor; 
  private color butColor;
  private color darkenColor;

  
  public Button(float width, float height, float xPos, float yPos, int textSize, int R, int G, int B)
  {
    this.width = width;
    this.height = height;
    this.xPos = xPos;
    this.yPos = yPos;
    this.textSize = textSize;
    butColor = color(R, G, B);
    currentColor = butColor;
    
    if(R == 150)
    {
      darkenColor = color(0, G, B);
    }
    if(G == 150)
    {
      darkenColor = color(R, 0, B);
    }
    if(B == 150)
    {
      darkenColor = color(R, G, 0);
    }
  }
  
  public void drawButton()
  {
    fill(currentColor);
    rect(xPos, yPos, this.width, this.height);
  }
  
  public boolean mouseHoveringOverButton()
  {
    boolean isHovering = false;
    if(mouseX >= xPos && mouseX <= xPos + width && mouseY >= yPos && mouseY <= yPos + height)
    {
      isHovering = true;
    }
    return isHovering;
  }
  
  public boolean buttonClicked()
  {
    boolean clicked = false;
    if(mousePressed)
    {
      clicked = true;
    }
    return clicked;
  }
  
  public boolean keyboardButtonClicked()
  {
    boolean pressed = false; 
     if(keyPressed && key == 'y')
     {
       pressed = true;
     }
     return pressed;
  }
  
  public void darkenButton()
  {
    currentColor = darkenColor;
  }
  
  public void restoreButton()
  {
    currentColor = butColor;
  }
}
