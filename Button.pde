import java.util.*;

public class Button
{
  private float width = 0;
  private float height = 0;
  private float xPos = 0;
  private float yPos = 0;
  private float xTextPos;
  private float yTextPos;
  private char activatingButton;
  private String text = " ";
  private color currentColor; 
  private color butColor;
  private color darkenColor;
  
  public Button(float width, float height, float xPos, float yPos, int R, int G, int B, char c, String buttonText)
  {
    this.width = width;
    this.height = height;
    this.xPos = xPos;
    this.yPos = yPos;
    //this.textSize = textSize;
    butColor = color(R, G, B);
    darkenColor = butColor;
    activatingButton = c;
    text = buttonText;
    
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
    fill(0);
    textSize(this.height);
    textAlign(CENTER);
    text(text, xPos + this.width/2, yPos + 13 * this.height/16); // + 5 * this.height/6);
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
    if(keyPressed && key == activatingButton)
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
  
  public void setTextPos()
  {
    float textAscent = textAscent();
    float textDescent = textDescent();
    
    yTextPos = (height - textAscent - textDescent) / 2 + textAscent;
  }
}
