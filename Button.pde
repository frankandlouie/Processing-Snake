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
  
  private boolean mousePreviouslyPressed = false;
  private boolean keyPreviouslyPressed = false;

  
  public Button(float width, float height, float xPos, float yPos, int R, int G, int B, char c, String buttonText)
  {
    this.width = width;
    this.height = height;
    this.xPos = xPos;
    this.yPos = yPos;
    butColor = color(R, G, B);
    darkenColor = butColor;
    activatingButton = c;
    text = buttonText;
    xTextPos = xPos + this.width/2;
    yTextPos = yPos + 13 * this.height/16;
    butColor = color(R, G, B);
    currentColor = butColor;
  }
  
  public boolean interaction()
  {
    if (keyboardButtonClicked() || (mouseHoveringOverButton() && buttonClicked()))
    {
      return true;
    } 
    else if (mouseHoveringOverButton()) 
    {
      darkenButton();
    }
    else 
    {
      restoreButton();
    }
    
    return false;
  }
  
  public void drawButton()
  {
    fill(currentColor);
    rect(xPos, yPos, this.width, this.height);
    fill(0);
    textSize(this.height);
    if(text == "Settings")
    {
      drawSettingsCog();
    }
    else if(text == "goBack")
    {
      drawGoBack();
    }
    else
    {
      if(text.length() > 10)
      {
        textSize(this.height / 2);
        yTextPos = yPos + 10 * this.height/16;
      }
      textAlign(CENTER);
      text(text, xTextPos, yTextPos); // + 5 * this.height/6);
    }
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
    if ((mouseX >= xPos && mouseX <= xPos + width && mouseY >= yPos && mouseY <= yPos + height) && mousePressed)
    {
      if (!mousePreviouslyPressed)
      { 
        mousePreviouslyPressed = true; // Prevent multiple detections
        return true; 
      }
    }
    else
    {
      mousePreviouslyPressed = false; // Reset when the mouse button is released
    }
  
    return false;
    
    //return ((mouseX >= xPos && mouseX <= xPos + longSide && mouseY >= yPos && mouseY <= yPos + shortSide) && mousePressed) ? true : false;

  }
  
  public boolean keyboardButtonClicked()
  {
    //boolean pressed = false; 
    //if(keyPressed && key == activatingButton)
    //{
    //  pressed = true;
    //}
    
    //return pressed;
    if (keyPressed && key == activatingButton)
    {
      if (!keyPreviouslyPressed)
      { 
        keyPreviouslyPressed = true; // Mark as pressed to prevent multiple triggers
        return true; 
      }
    }
    else
    {
      keyPreviouslyPressed = false; // Reset when key is released
    }    
    return false;
  }
  
  public void darkenButton()
  {
    int r = int(red(butColor) * 0.65);
    int g = int(green(butColor) * 0.65);
    int b = int(blue(butColor) * 0.65);
    darkenColor = color(r, g, b);
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
  
  public void drawSettingsCog()
  {
    float x = xTextPos;
    float y = yTextPos - height / 3;
    float radius = 15;
    float toothSize = 5;
    int teeth = 10;
    float angleStep = TWO_PI / (teeth * 2);
  
    beginShape();
    for (int i = 0; i < teeth * 2; i++) {
      float r = (i % 2 == 0) ? radius + toothSize : radius;
      float angle = i * angleStep;
      float vx = x + cos(angle) * r;
      float vy = y + sin(angle) * r;
      vertex(vx, vy);
    }
    endShape(CLOSE);
  
    // Draw the inner circle
    fill(216);
    ellipse(x, y, radius, radius);
  }
  
  
  public void drawGoBack()
  {
    float x = xTextPos;
    float y = yTextPos - height / 3;
    float legnth = 20;
    
    stroke(0);
    strokeWeight(4);
    noFill();
    
    // Draw the main arrow line
    line(x + legnth, y, x - legnth, y);
    
    // Draw the arrowhead (two diagonal lines)
    line(x - legnth, y, x - 10, y - 15);
    line(x - legnth, y, x - 10, y + 15); 
    strokeWeight(1);
  }
}
