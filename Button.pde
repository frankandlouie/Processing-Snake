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
    darkenColor = butColor;
    
    if(R == 0 && G == 0)
    {
      butColor = color(150, 150, B);
    }
    if(G == 0 && B == 0)
    {
      butColor = color(R, 150, 150);
    }
    if(R == 0 && B == 0)
    {
      butColor = color(150, G, 150);
    }
    
    currentColor = butColor;
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
  
  public boolean keyboardButtonClicked(char c)
  {
    boolean pressed = false; 
    if(keyPressed && key == c)
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
